Received: from [213.97.115.166] (helo=madrid.hispafuentes.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UBUU-0007yb-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 19:22:07 +0100
Received: from hispafuentes.com (localhost [127.0.0.1])
	by madrid.hispafuentes.com (Postfix) with ESMTP id 64B5132588
	for <linux-mtd@lists.infradead.org>; Tue,  7 Aug 2001 20:28:01 +0200 (CEST)
Message-ID: <3B70332C.A9F3D944@hispafuentes.com>
Date: Tue, 07 Aug 2001 20:27:56 +0200
From: olea@hispafuentes.com
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: A question about FAT, FTL and MTD 
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

	The FTL related documentation I've read talks about a FAT interface to
flash chips but I'm confused because I didn't found any statement about
FAT is part of the FTL standard or not and because I didn't found a
reference to FAT in the MTD code/docs.

	Can anybody confirm me if FAT is part of the FTL standard? If yes, how
is it supposed to be used with MTD?

	If not, what can be needed to do that? As we have a flash NAND memory
on board, maybe it'd need a nftl driver similar to the DOC one. Correct
me if I'm wrong.

	I understood that JFFS2 is a better tuned option for FS than FAT, but
we had a legacy FAT system and it could be useful to maintain the DOS
media compatibility if possible, and we want to be sure what  design
options we have.

	Again, thanks for your time :-)

-- 
	A.Ismael Olea González
	tlf +(34) 914 575 330
	mailto:olea@hispafuentes.com
