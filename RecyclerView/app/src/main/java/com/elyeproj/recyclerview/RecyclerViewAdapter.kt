package com.elyeproj.recyclerview

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import java.lang.IllegalStateException

class RecyclerViewAdapter : RecyclerView.Adapter<ItemViewHolder>() {

    companion object {
        const val CELL_ID = 0
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ItemViewHolder {
        if (viewType == CELL_ID) {
            val view = LayoutInflater.from(parent.context).inflate(R.layout.item_recycler_view, parent, false)
            return ItemViewHolder(view)
        }

        throw IllegalStateException("Unknown Type")
    }

    override fun getItemCount(): Int {
        return 100
    }

    override fun getItemViewType(position: Int): Int {
        return CELL_ID
    }

    override fun onBindViewHolder(holder: ItemViewHolder, position: Int) {
        holder.bindView("Row $position")
    }
}