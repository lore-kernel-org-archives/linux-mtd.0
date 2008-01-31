Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JKezC-00056G-I5
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 19:22:17 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: JFFS2: file contents in case of data CRC error
Date: Thu, 31 Jan 2008 22:19:58 +0300
Message-ID: <523F3D8D8C97554AA47E53DF1A05466A01880831@nnsmsx411.ccr.corp.intel.com>
In-Reply-To: <47A1FD3F.2020102@dave-tech.it>
References: <47A1FD3F.2020102@dave-tech.it>
From: "Korolev, Alexey" <alexey.korolev@intel.com>
To: "llandre" <r&d2@dave-tech.it>,
	<linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi=20
Could you please give information about how you can get this error? I
need to know use case.=20

>I have a JFFS2 partition on 32MByte NAND device.
>When reading a specific file - see below for details - JFFS2 reports a=20
>Data CRC error but function nand_correct_data never returns -1, so I=20
>assume ECC algorithm is able to correct errors.
>However the file is not equal to the original one that has been written

>to NAND. In fact, in the middle of the file, I see a 4-kByte "hole"=20
>where all bytes are 0.

It is Ok. NAND error correction could return that data is correct even
if it is not correct. It finds the issues with guarantee only in case of
1 or 2 bits errors. =20

>Anybody can help me about understanding if this is the expected=20
>behaviour of JFFS2?
>Thanks in advance.


>bash-2.05# mount -t jffs2 -o ro /dev/mtdblock0 /mnt/nand0
>mtdblock_open
>ok
>bash-2.05# cp -v /mnt/nand0/f.img /tmp/
>jffs2_get_inode_nodes(): Data CRC failed on node at 0x01d55544: Read=20
>0x80b8997f, calculated 0x57f0ea8e
>`/mnt/nand0/f.img' -> `/tmp/f.img'

This is a bad error! How obtained you this? What you did before getting
this?

Alexey
--------------------------------------------------------------------
Closed Joint Stock Company Intel A/O
Registered legal address: 125252, Moscow, Russian Federation,=20
Chapayevsky Per, 14.

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
