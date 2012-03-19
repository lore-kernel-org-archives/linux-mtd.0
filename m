Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9Yuv-0001CI-5Y
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 09:30:18 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1S9Yui-0002aF-5O
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 10:30:04 +0100
Received: from 212.177.102.37 ([212.177.102.37])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2012 10:30:04 +0100
Received: from matteo.mattei by 212.177.102.37 with local (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2012 10:30:04 +0100
To: linux-mtd@lists.infradead.org
From: Matteo Mattei <matteo.mattei@gmail.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
Date: Mon, 19 Mar 2012 09:28:01 +0000 (UTC)
Message-ID: <loom.20120319T102527-948@post.gmane.org>
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matteo Mattei <matteo.mattei <at> gmail.com> writes:

> 
> Hi guys,
> 
> I am working hard on UBIFS to make it works on 2.6.32 and OMAP3530.
> 
> I already posted some requests to TI forum but I have no answers up to now:
> http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#627875
> 
> The error I get is this:
> 
> UBI: attaching mtd6 to ubi0
> UBI: physical eraseblock size: 131072 bytes (128 KiB)
> UBI: logical eraseblock size: 126976 bytes
> UBI: smallest flash I/O unit: 2048
> UBI: VID header offset: 2048 (aligned 2048)
> UBI: data offset: 4096
> UBI: max. sequence number: 1621513
> UBI: attached mtd6 to ubi0
> UBI: MTD device name: "FileSystem"
> UBI: MTD device size: 847 MiB
> UBI: number of good PEBs: 6769
> UBI: number of bad PEBs: 7
> UBI: number of corrupted PEBs: 0
> UBI: max. allowed volumes: 128
> UBI: wear-leveling threshold: 4096
> UBI: number of internal volumes: 1
> UBI: number of user volumes: 1
> UBI: available PEBs: 0
> UBI: total number of reserved PEBs: 6769
> UBI: number of PEBs reserved for bad PEB handling: 134
> UBI: max/mean erase counter: 2417/239
> UBI: image sequence number: 0
> UBI: background thread "ubi_bgt0d" started, PID 587
> UBIFS: recovery needed
> UBIFS error (pid 590): ubifs_scan: corrupt empty space at LEB 997:116771
> UBIFS error (pid 590): ubifs_scanned_corruption: corruption at LEB 997:116771
> UBIFS error (pid 590): ubifs_scan: LEB 997 scanning failed
> UBIFS error (pid 590): do_commit: commit failed, error -117
> UBIFS warning (pid 590): ubifs_ro_mode: switched to read-only mode, error -117
> UBIFS: recovery completed
> UBIFS: mounted UBI device 0, volume 0, name "ROOTFS"
> UBIFS: file system size: 839819264 bytes (820136 KiB, 800 MiB, 6614 LEBs)
> UBIFS: journal size: 33521664 bytes (32736 KiB, 31 MiB, 264 LEBs)
> UBIFS: media format: w4/r0 (latest is w4/r0)
> UBIFS: default compressor: none
> UBIFS: reserved for root: 4952683 bytes (4836 KiB)
> 
> I already saw that in kernel 3.2.x a similar problem has been reported.
> Investigating I saw that the error occurred during the journal commit.
> 
> Do you have any hints where to investigate further or where to apply
> some changes to the sources to fix this issue?
> One more question, I saw that in scan.c of UBI driver the policy to
> handle corrupted blocks is to distinguish between powercuts and other
> reasons.
> In the latter case the block is put in corrupted list and no more
> recovered. A comment in the sources says that the block is left there
> for manual inspection.
> However my system is unattended... do you see anything bad to add also
> this kind of blocks to the erase list?
> 
> Thanks,
> 
> Matteo
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 



I have one more information about the problem...
Commenting the goto corrupted line in scan.c (inside ubifs) I was able
to recover a board with the previously reported error:


--- linux-2.6.32/fs/ubifs/scan.c        (revision 1892)
+++ linux-2.6.32/fs/ubifs/scan.c        (working copy)
@@ -339,7 +339,7 @@
                       if (!quiet)
                               ubifs_err("corrupt empty space at LEB %d:%d",
                                         lnum, offs);
-                       goto corrupted;
+                       //goto corrupted;
               }

       return sleb;


In this way I saw that the UBI layer has been able to recover later
the corrupted empty space.
What do you think about this workaround? Do you have a better way to do this?

Could it be an idea to mark this LEB to be erased and to search for
another LEB? However I understand that it is rather complex to do...
Has anybody an hint on this?

Thanks,

Matteo
