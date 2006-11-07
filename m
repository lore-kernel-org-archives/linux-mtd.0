Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhThF-0000Mx-7Q
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 11:21:13 -0500
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code: respin
From: Artem Bityutskiy <dedekind@infradead.org>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <20061103182038.f528d960.vwool@ru.mvista.com>
References: <20061103182038.f528d960.vwool@ru.mvista.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 07 Nov 2006 18:20:53 +0200
Message-Id: <1162916453.5628.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Vitaly,
On Fri, 2006-11-03 at 18:20 +0300, Vitaly Wool wrote:
> Hello folks,
>=20
> as was discussed between Ricard Wanderlof, David Woodhouse, Artem Bityuts=
kiy and me, the current API for reading/writing OOB is confusing. The thing=
 that introduces confusion is the need to specify ops.len together with ops=
.ooblen for reads/writes that concern only OOB not data area. So, ops.len i=
s overloaded: when ops.datbuf !=3D NULL it serves to specify the length of =
the data read, and when ops.datbuf =3D=3D NULL, it serves to specify the fu=
ll OOB read length.
> The patch inlined below is the slightly updated version of the previous p=
atch serving the same purpose, but with the new Artem's comments taken into=
 account.
> Artem, BTW, thanks a lot for your valuable input!

this patch does not apply to mtd-2.6.git:

patching file drivers/mtd/inftlcore.c
patching file drivers/mtd/nand/nand_base.c
Hunk #2 succeeded at 1006 (offset -1 lines).
Hunk #4 succeeded at 1260 (offset -1 lines).
Hunk #5 succeeded at 1282 (offset -2 lines).
Hunk #6 succeeded at 1300 (offset -1 lines).
Hunk #7 succeeded at 1321 (offset -2 lines).
Hunk #8 succeeded at 1343 (offset -1 lines).
Hunk #9 FAILED at 1665.
Hunk #10 succeeded at 1724 (offset -3 lines).
Hunk #11 succeeded at 1765 (offset -2 lines).
Hunk #12 succeeded at 1784 (offset -3 lines).
1 out of 12 hunks FAILED -- saving rejects to file
drivers/mtd/nand/nand_base.c.rej
patching file drivers/mtd/mtdchar.c
patching file drivers/mtd/mtdconcat.c
patching file drivers/mtd/nand/nand_bbt.c
patching file drivers/mtd/nftlcore.c
patching file drivers/mtd/ssfdc.c
patching file fs/jffs2/wbuf.c
patching file drivers/mtd/mtdpart.c
patching file include/linux/mtd/mtd.h

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
