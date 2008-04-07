Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JilsR-0005KE-7z
	for linux-mtd@lists.infradead.org; Mon, 07 Apr 2008 07:34:52 +0000
Subject: Re: issues with Nand tests
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ram <vshrirama@gmail.com>
In-Reply-To: <8bf247760804050842q5407de1bq8400fcea75d1e875@mail.gmail.com>
References: <8bf247760804050842q5407de1bq8400fcea75d1e875@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Apr 2008 10:34:21 +0300
Message-Id: <1207553661.8040.54.camel@sauron>
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


On Sat, 2008-04-05 at 21:12 +0530, Ram wrote:
> Hi,
> Im testing nand device using fs-tests package that comes with mtd-git.
> I am using linux 2.6.23.
>=20
> Right now, i am facing a few issues, i would appreciate your advice in
> this regard.
>=20
> !) All the the tests passes except that the stress test ./stress00.sh
> throws up the message as shown below.
> during the test, However the test passes successfully.
>=20
> mtd->read(0x3c8 bytes from 0x59725c) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059725c: Read
> 0x32e9ab7f, calculated 0xb1b6afa0
> mtd->read(0x3dc bytes from 0x597764) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x00597764: Read
> 0x70c076f0, calculated 0x2d5d9d38
> mtd->read(0x99c bytes from 0x59849c) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059849c: Read
> 0xa2908a1a, calculated 0x364b837f
> mtd->read(0x1044 bytes from 0x598eb4) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x00598eb4: Read
> 0xb882b629, calculated 0x5e66e5b0
> mtd->read(0x1044 bytes from 0x599ef8) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x00599ef8: Read
> 0x8819eb58, calculated 0x83e2d097
> mtd->read(0x1044 bytes from 0x59af3c) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059af3c: Read
> 0xe9c03ff1, calculated 0xd85bc634
> mtd->read(0x1044 bytes from 0x59bf80) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059bf80: Read
> 0xebcbe14f, calculated 0xa3f6ce10
> mtd->read(0x1044 bytes from 0x59cfc4) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059cfc4: Read
> 0xd8533cde, calculated 0x5130dbf6
> mtd->read(0x1044 bytes from 0x59e008) returned ECC error
> Data CRC failed on REF_PRISTINE data node at 0x0059e008: Read
> 0xe6f84772, calculated 0x30f06f3d
>=20
>=20
> My question is what can one conclude on the above - can i say the nand
> drivers/linux mtd are working
> perfectly!. -;)
I would not say this. These ECC errors suggest you still have some
driver-level issues, may be even hardware. I recommend you to run our
"torture" test which you may find at
git://infradead.org/~ahunter/nand-tests.git

But beware it may wear-out your flash. Please, carefully look at the
code and realize what it is doing before running. Find out the best
parameters.

We found few bugs which did not normally show up with help of this
tests. It just stress the flash much stronger then what you would have
if you did this via JFFS2.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
