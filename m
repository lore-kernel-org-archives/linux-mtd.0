Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14ZuGz-00084j-00
	for mtd-list@infradead.org; Mon, 05 Mar 2001 12:39:33 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14ZuGx-00084d-00
	for mtd@infradead.org; Mon, 05 Mar 2001 12:39:32 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <002101c0a56c$5caf3090$3201a8c0@thinstuff.com> 
References: <002101c0a56c$5caf3090$3201a8c0@thinstuff.com> 
To: m.gibson@esesixtech.com
Cc: mtd@infradead.org
Subject: Re: Kernel panic DiskOnChip /Newbie question 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Mon, 05 Mar 2001 12:39:10 +0000
Message-ID: <15844.983795950@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


m.gibson@esesixtech.com said:
> " Didn´t read all bytes in flash_safe_read(). Returned 0 " 

The read/write/erase routines for the DiskOnChip hardware don't currently 
support reads/writes greater than one page, or erases greater than one 
eraseblock. You need to put a simple loop in to read/write multiple pages 
and erase multiple blocks when it's asked to do so.

The reason NFTL works OK is because it doesn't ask the hardware driver to 
do that.

Using JFFS on NAND flash isn't tested very aggressively yet.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
