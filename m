Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WEBt-0005Gp-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 10:11:37 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02013022481901.00763@thomas> 
References: <02013022481901.00763@thomas>  <15998.1007200283@redhat.com> 
To: gleixner@autronix.de
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on NAND flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 31 Jan 2002 10:22:43 +0000
Message-ID: <17832.1012472563@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

gleixner@autronix.de said:
>  I tried jffs2 on a NAND flash. Tracking down one ugly bug in fs/jffs2/
> write.c  i got it basicly working ! Thanks to all of you, who did his
> job on that jffs2/nand stuff obviously  without having access to a
> NAND device. 

Be careful. You have nothing there to make sure that it doesn't violate the 
constraints on the number of write cycles per page. You have no ECC, you 
have no real chance of it working in the wild.

Also note that the locking in jffs2_garbage_collect_deletion_dirent() is 
broken. We need to lock the erase_completion_lock while we go through the 
list, and drop the lock when we read the nodes. 

> jffs2_flash_writev calls mtd->writev, if available else it calls
> mtd_fake_writev. The nand driver supports writev and does not check if
> the  vecs[1] entry is empty. mtd_fake_writev takes care of this. I
> suggest to do the check in jffs_write_dnode (where the wrong count
> comes  from), although i will include a check in nand.c. This problem
> did not show up due to the fact, that obviously none of the  FLASH
> drivers supports writev. (I could not find one in mtd)

All the writev stuff was put there for the benefit of NAND flash - so yes,
nobody's used it yet. This problem had come up recently in the eCos port,
but the fix hadn't yet propagated to the main tree.

--
dwmw2
