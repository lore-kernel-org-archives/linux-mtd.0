Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bcGre-00030T-P8
 for linux-mtd@lists.infradead.org; Tue, 23 Aug 2016 18:55:59 +0000
Message-ID: <57BC9C1D.4010402@codeaurora.org>
Date: Tue, 23 Aug 2016 11:55:25 -0700
From: Nikhilesh Reddy <reddyn@codeaurora.org>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: issue with ubi_wl_put_peb
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi


I am currently running into a hard to reproduce issue( takes upto a week 
to reproduce) with ubi_wl_put_peb.

I would appreciate any help you can give me.

In the following stack
-000|__list_del_entry()
-001|list_del()
-002|prot_queue_del()
-003|ubi_wl_put_peb()
-004|ubi_eba_unmap_leb()
-005|ubifs_leb_unmap()
-006|ubifs_gc_start_commit()
-007|do_commit()
-008|run_bg_commit(inline)
-008|ubifs_bg_thread()
-009|kthread()

This issue was seen with CONFIG_DEBUG_LIST=y

What we see is that the wl entry that is being put is not in the 
protection queue but seems to be in free/used trees.

In the code  below:
http://git.infradead.org/linux-ubifs.git/blob/HEAD:/drivers/mtd/ubi/wl.c#l1231 


We see that the the wl_entry is checked to be in used/scrub and 
erroneous trees .. and then it simply assumes that it is in the 
protection queue if it is not in any of the rb trees.

There appears to be a race where the  wl_entry is being put before it 
actually has a chance to be inserted into the protection queue.

This seems to occur when ubi_io_write_vid_hdr takes long to write the 
VID header.


I noticed that a check for a similar situation is 
http://git.infradead.org/linux-ubifs.git/blob/HEAD:/drivers/mtd/ubi/wl.c#l761

Is the same check needed in the case of ubi_wl_put_peb as well?

Can you please tell me if this sounds like a known issue?

I am a little lost on when |ubi_eba_unmap_leb would be called before the 
PEB has a chance to be inserted into a another tree from the free tree.

I would be grateful any pointers that you can give me so i can get to 
the root cause.


-- 
Thanks
Nikhilesh Reddy

Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.
