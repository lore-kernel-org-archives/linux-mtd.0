Received: from news.ti.com ([192.94.94.33] helo=dragon.ti.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVeXV-0006kU-RP
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 18:48:55 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Jun 2004 17:48:44 -0500
Message-ID: <BA2832125C3C994384FCC051CDFC73690F4197@dlee2k05.ent.ti.com>
From: "Zhang, Jian" <jzhang@ti.com>
To: "David Woodhouse" <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>
Cc: 
Subject: stable MTD snapshot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My reply to David's question has been bounced back twice. I still don't
know how to configure outlook to reply in the way the list server likes.
So I restart it.
=20
I have tried a few snapshots and encountered either compile failure or
run-time errors. Can someone point me to a daily MTD snapshot that is
known to pass compilation and do not have major issue with JFFS2 on
NAND?

I have patched the following snapshots to our 2.6.4 kernel by running
patchin.sh script:
=20
./patchin -j -c <kernel path>
=20
20040518:
I was able to mount an empty NAND partition. The partition was
erased/prepared by U-Boot. JFFS2 clean marker was programmed to OOB
area. I could mount it cleanly. But I got message "jffs2: No clean,
dirty _or_ erasable blocks to GC from! Where are they all" when I
created a file. A 192K file was truncated after umount/re-mount. Files
even disappeared after umount/re-mount.

20040526:
Kernel doesn't build because nand.c has compile error in
single_erase_cmd()

20040531:
Kernel builds but I got I/O error when mounting a partition. The
underlying MTD NAND driver works since I am able to read/write MTD
nodes.

Jian
