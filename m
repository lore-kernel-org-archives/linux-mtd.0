Received: from smtp-vbr4.xs4all.nl ([194.109.24.24])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KqTwo-0007uP-MW
	for linux-mtd@lists.infradead.org; Thu, 16 Oct 2008 14:35:32 +0000
Message-ID: <48F75131.9040002@cs.vu.nl>
Date: Thu, 16 Oct 2008 16:35:29 +0200
From: Rutger Hofman <rutger@cs.vu.nl>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Question on how NAND flash BBT is stored in the chip
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Good afternoon list,

I have a question how the BBT (bad block table) is stored in MTD NAND 
devices. I googled for a while, and browsed the code, but I am still not 
sure.

The question:
Is the BBT stored/retrieved using a spare layout? Is ECC 
generation/correction done for it?

This question derives from the question above: is the BBT marker pattern 
stored within a spare layout (with slots for ECC, bad block markers 
etc)? Or is it written verbatim (raw and unmangled) into the spare area?

If no ECC is used for the BBT, is that for a reason?

Thanks for the information,

Rutger Hofman
VU Amsterdam
