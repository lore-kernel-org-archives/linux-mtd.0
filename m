Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSJwG-0006od-43
	for linux-mtd@lists.infradead.org; Thu, 11 Nov 2004 13:44:57 -0500
Received: from [192.168.37.21] (sauron.oktetlabs.ru [192.168.37.21])
	by shelob.oktetlabs.ru (Postfix) with ESMTP id 38C7D229E8
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Nov 2004 21:44:20 +0300 (MSK)
Message-ID: <4193B304.1010009@yandex.ru>
Date: Thu, 11 Nov 2004 21:44:20 +0300
From: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: spin_lock() needed ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

In JFFS2 I have mentioned the following:

When new node is successfully written to the flash, its node_ref is 
insert to the correspondent inode's node_ref list. Tis is done as following:

jffs2_add_physical_node_ref(c, raw);
raw->next_in_ino = f->inocache->nodes;
f->inocache->nodes = raw;



For example, see functions jffs2_write_dirent() and jffs2_write_dnode() 
in the write.c file.

I am not sure, but it seems there is a race here. The f->inocache->nodes 
may be obsolete node which is in the block pending for erase. So, this 
node may be removed when the correspondent block is erased.



I mean the following.

Suppose we have inode with two nodes. The first node is obsolete and is 
physically located to the block (say block number A), which is currently 
in the c->erase_pending_list. So, suppose:


jffs2_add_physical_node_ref(c, raw);
raw->next_in_ino = f->inocache->nodes; /* We save the address of the 
first obsolete node */

/* Suppose we are preempted here and the another process calls the 
jffs2_erase_pending_blocks() function, which erases the block A. Before 
erasing, it removes all the node_ref structures corresponding to nodes 
in this block A (see the implementation of jffs2_erase_pending_blocks(), 
i.e., the call to jffs2_free_all_node_refs()). Thus, the first node will 
be removed from list */

f->inocache->nodes = raw;
/* Now the first node_ref corresponds to new (3rd) node, but 
f->inocache->nodes->next_in_ino points to wrong place */



So, I think we should hold the c->erase_completion_lock here. I mean:

jffs2_add_physical_node_ref(c, raw);
spin_lock(&c->erase_completion_lock); /* <--------- this */
raw->next_in_ino = f->inocache->nodes;
f->inocache->nodes = raw;
spin_unlock(&c->erase_completion_lock); /* <--------- and this */


Can anybody comment this please?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
