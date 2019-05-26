package com.elyeproj.recyclerview

import android.view.View
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.item_recycler_view.view.*

class ItemViewHolder(view: View): RecyclerView.ViewHolder(view) {
    fun bindView(content: String) {
        itemView.txt_item.text = content

        itemView.txt_item.setOnClickListener {
            Toast.makeText(itemView.context, itemView.txt_item.text, Toast.LENGTH_SHORT).show()
        }
    }
}
