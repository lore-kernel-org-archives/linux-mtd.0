Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14qChj-0006pb-00
	for mtd-list@infradead.org; Thu, 19 Apr 2001 12:34:31 +0100
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14qChh-0006pV-00
	for mtd@infradead.org; Thu, 19 Apr 2001 12:34:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.21.0104191118570.11552-100000@godzilla.axis.se> 
References: <Pine.LNX.4.21.0104191118570.11552-100000@godzilla.axis.se> 
To: Bjorn Wesen <bjorn.wesen@axis.com>
Cc: mtd@infradead.org
Subject: Re: cramfs and mtd 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 19 Apr 2001 12:33:37 +0100
Message-ID: <1991.987680017@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


bjorn.wesen@axis.com said:
> When using cramfs directly on a ROM chip like below.. can we make
> cramfs/inode.c talk to mtd to find a chip maybe instead of using
> direct pointers like I do in my small patch below ? That is, would it
> mess up inode.c to the degree that it would not be accepted in the
> mainline kernel ? :) Or is there a better way to do this ? 

See the evil hack in jffs and jffs2 which uses the minor number of the 
mtdblock device to get a handle on the underlying MTD device. Copy that and 
then use the MTD device directly for read/write.

The real advantage of cramfs-on-mtd comes when you can set 
CONFIG_BLK_DEV=n, though - which means the above evil hack is no longer 
possible. We need to remove FS_REQUIRES_DEV from JFFS{,2} and pass the name 
or number of the MTD device as a mount option instead. If you're doing the 
same thing for cramfs, it's probably better to copy the cramfs code to a 
new filesystem (cmtdfs?) and hack it there. 

There are also vague plans to provide an 'xipfs', which has page-aligned 
data, for the benefit of those with more flash space than sense.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
