Received: from lion.vector.com.pl ([81.210.9.36])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BXPGb-00026o-Op
	for linux-mtd@lists.infradead.org; Mon, 07 Jun 2004 14:54:42 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 7 Jun 2004 20:54:36 +0200
Message-ID: <80908CC5B2C9DB47AAF8C77892FCB44315F7AD@lion.vector.com.pl>
From: "Andriy Korud" <a.korud@vector.com.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Unmarking bad blocks?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
after playing with mkfs.jffs2 and nandwrite a lot of blocks on my flash =
chip (Samsung 128Mb) become marked as bad (and I'm sure they were not =
bad at the beginning).
Is it possible to 'unmark' them or should this chip is unusble anymore?
flash_eraseall gives:

nand_erase: attempt to erase a bad block at page 0x00000000
nand_erase: attempt to erase a bad block at page 0x00000040
nand_erase: attempt to erase a bad block at page 0x00000080
nand_erase: attempt to erase a bad block at page 0x000000c0
...

Even I commented out bad block checking in nand_erase(), flash_eraseall =
comlete successfully however blocks remain marked as bad.

Any ideas?

Thanks in advance,

--

Andriy Korud
