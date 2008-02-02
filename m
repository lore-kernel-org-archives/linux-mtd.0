Received: from mail.transmode.se ([83.241.175.147] helo=tmnt04.transmode.se)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JLOIi-0006mP-S8
	for linux-mtd@lists.infradead.org; Sat, 02 Feb 2008 19:45:27 +0000
From: "Joakim Tjernlund" <joakim.tjernlund@transmode.se>
To: "'Nikhil Bansal \(nikbansa\)'" <nikbansa@cisco.com>,
	<linux-mtd@lists.infradead.org>
References: <47A1FD3F.2020102@dave-tech.it>
	<ED07EE9DB42A8945877C9794BA15040801A516FF@xmb-sjc-229.amer.cisco.com>
In-Reply-To: <ED07EE9DB42A8945877C9794BA15040801A516FF@xmb-sjc-229.amer.cisco.com>
Subject: SV: Jffss2_write_super erasing all the blocks
Date: Sat, 2 Feb 2008 20:30:08 +0100
Message-ID: <000001c865d2$06136110$123a2330$@tjernlund@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Language: sv
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a long standing issue that I tried to address fairly recently.
Please search the archive and you should find some posts/patch from
me about this.

 Jocke

> -----Ursprungligt meddelande-----
> Fr=E5n: linux-mtd-bounces@lists.infradead.org =
[mailto:linux-mtd-bounces@lists.infradead.org] F=F6r Nikhil
> Bansal (nikbansa)
> Skickat: den 31 januari 2008 20:22
> Till: linux-mtd@lists.infradead.org
> =C4mne: Jffss2_write_super erasing all the blocks
>=20
> Hi,
>=20
> I have a question about JFFS2 fs. In my setup, I am running JFFS2 on =
AMD
> Spansion flash (NOR flash). What I noticed was that whenever I erase a
> file from my flash, I see that jffs2_write_super function gets called
> which in turn calls jffs2_erase_pending_blocks(0) which goes ahead and
> deletes all the pending blocks. While this erase is going on super =
block
> is locked and we can not perform any other operation with JFFS2.
>=20
> Can someone please explain the logic behind this or if there is
> something I am missing here?
>=20
> Thanks,
> Nikhil
>=20
> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of llandre
> Sent: Thursday, January 31, 2008 8:54 AM
> To: linux-mtd@lists.infradead.org
> Subject: JFFS2: file contents in case of data CRC error
>=20
> I have a JFFS2 partition on 32MByte NAND device.
> When reading a specific file - see below for details - JFFS2 reports a
> Data CRC error but function nand_correct_data never returns -1, so I
> assume ECC algorithm is able to correct errors.
> However the file is not equal to the original one that has been =
written
> to NAND. In fact, in the middle of the file, I see a 4-kByte "hole"
> where all bytes are 0.
> Anybody can help me about understanding if this is the expected
> behaviour of JFFS2?
> Thanks in advance.
>=20
>=20
> bash-2.05# mount -t jffs2 -o ro /dev/mtdblock0 /mnt/nand0 =
mtdblock_open
> ok bash-2.05# cp -v /mnt/nand0/f.img /tmp/
> jffs2_get_inode_nodes(): Data CRC failed on node at 0x01d55544: Read
> 0x80b8997f, calculated 0x57f0ea8e `/mnt/nand0/f.img' -> `/tmp/f.img'
>=20
> --
> llandre
>=20
> DAVE Electronics System House - R&D Department
> web:   http://www.dave.eu
> email: r&d2@dave-tech.it
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20
