Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SbZO-0004Sn-00
	for mtd-list@infradead.org; Tue, 13 Feb 2001 09:16:22 +0000
Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14SbZL-0004Se-00
	for mtd@infradead.org; Tue, 13 Feb 2001 09:16:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3A886BED.9339AC4F@danielind.com> 
References: <3A886BED.9339AC4F@danielind.com> 
To: Vipin Malik <vmalik@danielind.com>
Cc: jffs-dev <jffs-dev@axis.com>, mtd <mtd@infradead.org>
Subject: Re: First cut at MTD/JFFS HOWTO 
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Date: Tue, 13 Feb 2001 09:15:47 +0000
Message-ID: <10792.982055747@redhat.com>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


vmalik@danielind.com said:
> Q. Why another file system. What was wrong with ext2? 
> A. 

Standard response - need journalling pseudo-filesystem to emulate a block 
device and to wear levelling. then need ext3 (note 3) on that. journalling 
fs on top of journalling fs - not efficient. Also, no way for ext[23] to 
mark blocks as _deleted_ and no longer cared about. Fill ext2 partition on 
NFTL, empty it again, and the NFTL will still carefully copy around the 
blocks containing old deleted data.

> Q. Do I have to have JFFS on MTD? 
> A. 

ATM yes. Once you could do it on a block device. People are talking about 
making me make it work on IDE devices (CF). But I don't want to :)

> Q. What is DOC (disk on chip)? A. 

Bunch of NAND flash chips connected together with a clever ASIC which does 
hardware ECC.

> Q. What File systems can I have on DOC? A. 

If you put NFTL on it to emulate a block device (the status quo) then any 
normal filesystem. JFFS ought to work too.

> Q. What is Flash memory? A. 
> Q. What is CFI Flash memory? A. 
> Q. What is JDEC Flash memory? A.
> Q. What is this "interleave" stuff? A.

If you have 16-bit chips, but a 32-bit processor, it makes sense to arrange 
them side-by-side to fill the CPU's bus. You drive them both 
simultaneously. That's the arrangement we refer to as 'interleave'. 

Other possibilities are... 4x 8-bit chips on 32-bit bus, 2x8-bit 
chips on 16-bit bus, ...


#include <compact_flash_is_not_flash.h>


--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
