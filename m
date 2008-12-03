Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L7o1I-000156-Gm
	for linux-mtd@lists.infradead.org; Wed, 03 Dec 2008 09:27:45 +0000
Subject: RE: UBIFS error CRC calculation on avr32 CPU
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eirik Aanonsen <eaa@wprmedical.com>
In-Reply-To: <2DE39384A09B744FA1E53FD4BF78D430535E64@dware1013.doorway.loc>
References: <f17812d70811301949s6dc4bcddt791822f8d4ff223c@mail.gmail.com>
	<2DE39384A09B744FA1E53FD4BF78D430535DE3@dware1013.doorway.loc>
	<1228207463.5029.15.camel@sauron>
	<2DE39384A09B744FA1E53FD4BF78D430535E42@dware1013.doorway.loc>
	<1228230933.13686.8.camel@sauron>
	<2DE39384A09B744FA1E53FD4BF78D430535E64@dware1013.doorway.loc>
Content-Type: text/plain; charset=utf-8
Date: Wed, 03 Dec 2008 11:25:25 +0200
Message-Id: <1228296325.13686.24.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: kernel@avr32linux.org, linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-12-03 at 08:55 +0100, Eirik Aanonsen wrote:
> > It looks like you indeed have corrupted data. Where the 'wpr_004.wfp'
> > file comes from? You wrote it previously? Or you used mkfs.ubifs?
> >=20
> The file is a binary file from my system. And the file has been checked f=
or integrity before being copied over to the ubifs file system.

OK.

> Wpr_004.wfp originates from a vfat partition, and was moved along with 10=
 other files, and then when I try to move the file back out from ubifs the =
read error occurs.

OK, this means that the file had not been correctly written to UBIFS.
Your NAND driver may have problems. The fact that you use NAND flash
with 4KiB page size also suggests this, because AFAIK MTD does not
really support 4KiB per page NANDs. You probably have some custom MTD
diver/modifications.

Could you please verify your NAND driver before trying to use UBIFS?
Here you may get NAND tests which should do this:

git://git.infradead.org/users/ahunter/nand-tests.git

The tests are kernel modules. Compile them properly, then just insert
them, may be with some parameters. Use modinfo to see the parameters,
or look at the source code. All tests are harmless, except of torture
test - be careful with it.

Note, these tests has not been run on 4KiB-page NANDs, but they should
work fine anyway.

Could you please tell which NAND hardware you have? Is it SLC or MLC?

> > Also, did you try to enable UBIFS and UBI extra self-checks? Please,
> > try. Things will become very slow then, though, but this may give
> > some useful information.
>=20
> Here are the result after enabling these two options.

I see. Basically, you have broken nodes on your flash media, which means
your files have not been written correctly for some reasons. For now I
suspect buggy NAND driver.

> How do I do cleaning in ubifs?

Well, in _normal_ situations you should not need this at all, and UBIFS
is self-recoverable. In your case you have some severe problems so you
have data corruptions which you cannot recover anyway. You may only
delete the corrupted files.

But yes, an ckfs.ubifs user-space utility would be nice to have, and we
were thinking to create it. At the moment, it does not exist.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
