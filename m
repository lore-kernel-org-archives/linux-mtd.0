Received: from av2.rz.fh-augsburg.de ([141.82.16.242] helo=FH-Augsburg.DE)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uU96-0003zp-00
	for <linux-mtd@lists.infradead.org>; Mon, 08 Apr 2002 09:05:00 +0100
Received: from wstefan (mail.bodmann.de [195.143.6.222])
	(authenticated (0 bits))
	by FH-Augsburg.DE (8.11.3/8.11.3) with ESMTP id g3884m802042
	for <linux-mtd@lists.infradead.org>; Mon, 8 Apr 2002 10:04:51 +0200 (MEST)
Content-Type: text/plain;
  charset="us-ascii"
From: Stefan Warmuth <hxos@rz.fh-augsburg.de>
To: linux-mtd@lists.infradead.org
Subject: Problems with writing on jffs2
Date: Mon, 8 Apr 2002 09:06:47 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200204080906.47847.hxos@rz.fh-augsburg.de>
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

Hi all

I have trouble with our custom-made arm platform. We use a Intel SA-1110=20
processor and Intel 28F640J3A Flash-Memory. We use 2.4.17-rmk5 kernel.

I made the image with,
mkfs.jffs2 -r source -o image.jffs2 -e 0x40000 -l -p
and flashed it into the memory and boot. All worked fine also on reboot.
Then i copied some files from the host into the flash and it workes also =
fine.
But on next reboot i got some errors and the system crashed.

jffs2_scan_dirent_node(): Name CRC failed on node at 0x00c00384: Read=20
0x088b1c33
jffs2_scan_inode_node(): Data CRC failed on node at 0x00c4000c: Read=20
0x2207d3bb3
jffs2_scan_dirent_node(): Name CRC failed on node at 0x00c821e0: Read=20
0xb5211fe6
jffs2_scan_dirent_node(): Name CRC failed on node at 0x00dd8a80: Read=20
0x9a7b54b2
jffs2_scan_inode_node(): Data CRC failed on node at 0x00e1e5e4: Read=20
0x46eb4974c

I don't know where I am doing any wrong.

Have anybody an idea?

Thanks
Stefan
