Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141x4G-0004VI-00
	for mtd-list@infradead.org; Fri, 01 Dec 2000 20:46:04 +0000
From: "Levi Khatskevitch" <lkhatskevitch@hotmail.com>
To: dwmw2@infradead.org
Cc: linuxbios@lanl.gov, mtd@infradead.org
Subject: blk_dev[93].request_fn == NULL bug is gone
Date: Fri, 01 Dec 2000 15:45:28 -0500
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <LAW-F62tjnupAK6FGBV00006ece@hotmail.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

>Ah. Sorry, I'd misread it and hadn't noticed the difference.
>Now I'm confused. Did it not complain about failing to register the blkdev?
>
>--
>dwmw2
>
>

David,

Good news! The bug was gone after I reloaded original 2.2.17 code, applied 
patches/mtd-patch-2.2.17-20001130 and replaced all mtd files with the latest 
ones from cvs. I still have the old kernel source tree and on Monday I'll 
try to diff them and see what was causing the problem. But good news is that 
the BUG IS GONE.

Thanks,
- Levi
_____________________________________________________________________________________
Get more from the Web.  FREE MSN Explorer download : http://explorer.msn.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
