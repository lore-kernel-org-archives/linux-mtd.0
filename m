Received: from smtp7.wanadoo.fr ([193.252.22.29] helo=mwinf0201.wanadoo.fr)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19crQR-0005kb-81
	for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2003 19:54:51 +0100
Received: from Bragon (ALille-208-1-14-173.w81-49.abo.wanadoo.fr
	[81.49.157.173])
	by mwinf0201.wanadoo.fr (SMTP Server) with ESMTP id A1CAA3000462
	for <linux-mtd@lists.infradead.org>;
	Wed, 16 Jul 2003 20:54:28 +0200 (CEST)
Date: Wed, 16 Jul 2003 20:54:06 +0200
From: Eric Laly <e.laly@wanadoo.fr>
To: linux-mtd@lists.infradead.org
Message-ID: <20030716185406.GA24813@Bragon>
Mime-Version: 1.0
Content-Disposition: inline
Content-Type: text/plain; format=flowed; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
Subject: mount a DOC2000 [newbie]
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

	Hello all,

I want to install a bootable system on a DOC2000 on a PC104 board 
without using Msys binaries drivers.
To do so, I've made a bootable floppy and I want to mount the DOC in 
order to "copy" the system.
I've used a 2.4.18 kernel.
The DOC2000 is recognized (when I make a 'cat /proc/mtd', the system 
says "mtd0: ... DiskOnChip2000".
But the  NFTL driver says "sorry, we don't support UnitSizeFactor of !
=1 yet", and I can't make a fdisk or mke2fs.

I've made some searchs and the conclusion is to make  a 'dformat' with 
the DOC42.EXB. Is this right ?
If so, could someone provide the DOC42.EXB (or a link) because I've 
only the DOC514.EXB and there is no trace of DOC42.EXB on msys site.
If no, could you point me my error(s) ? (I've even tried the latest CVS 
on ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/ but the modules 
don't compile...)

	Thanks in advance.
	Eric Laly.

	 
