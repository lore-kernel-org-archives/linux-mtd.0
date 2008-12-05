Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L8d6c-0007u3-3E
	for linux-mtd@lists.infradead.org; Fri, 05 Dec 2008 16:00:38 +0000
Subject: Re: Support for NAND devices > 4GB
From: Artem Bityutskiy <dedekind@infradead.org>
To: "Maupin, Chase" <chase.maupin@ti.com>
In-Reply-To: <131E5DFBE7373E4C8D813795A6AA7F08025211EC67@dlee06.ent.ti.com>
References: <131E5DFBE7373E4C8D813795A6AA7F08025211EC67@dlee06.ent.ti.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 05 Dec 2008 17:58:06 +0200
Message-Id: <1228492686.13686.56.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-12-05 at 09:30 -0600, Maupin, Chase wrote:
> All,
>=20
> I have a Samsung NAND chip part number (K9WBG08U1M) which is a 32GB NAND =
chip with 4K page sizes.  It looks like it is actually 2 chips together as =
it is reported in the kernel as having "2 NAND chips detected".  The kernel=
 is properly detecting the 4K page size but it seems like there is a limita=
tion in the mtd_info structure of 4GB for the size of the NAND.  Can anyone=
 tell me if there is support in the Linux MTD system for NAND devices great=
er than 4GB?  Does anyone have a patch I could look at for this?
>=20
> I have tried changing the size element in the mtd_info structure to u_int=
64_t and then changing the code in YAFFS2 and in the add_mtd_partitions fun=
ction to use do_div for the division of the size element but still no succe=
ss.
>=20
> I am working in a 2.6.10 kernel (which I cannot update) and will back por=
t any patches people may have.
>=20
> Again, any help that could be offered here would be greatly appreciated.

Similar question was asked so many times. No, MTD does not support NANDs
> 4GiB. Just because nobody has implemented this. The main difficulty
here is that current user-space ABI cannot be extended, so we need to
invent new ABI.

However, Adrian Hunter sent a patch which changes in-kernel API and adds
> 4GiB support. For example, we successfully ran UBIFS on a 8GiB NAND
(well, not real NAND, but emulated by nandsim). You may try this patch.

But userspace API is still 32-bit. No-one changed it. Samsung guys tried
to send some patches, but the patches met some criticism and they did
not come up with better ones.

Please, find the 64-bit in-kernel API changes in this git tree:
git://git.infradead.org/users/dedekind/mtd-nandsim-2.6.git

Namely, you need the "MTD: update internal API to support 64-bit device
size" one. It works for us, and you are welcome to test it.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
