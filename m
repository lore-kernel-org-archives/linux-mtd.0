Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KlfbM-0003yy-TY
	for linux-mtd@lists.infradead.org; Fri, 03 Oct 2008 08:01:29 +0000
Subject: Re: gluebi char vs block devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Monte Copeland <catboatmonte@gmail.com>
In-Reply-To: <1fc50b580810010750g5e817923of9a43f1caaa807da@mail.gmail.com>
References: <1fc50b580810010750g5e817923of9a43f1caaa807da@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 03 Oct 2008 11:00:52 +0300
Message-Id: <1223020852.8051.58.camel@sauron>
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

Hi,

On Wed, 2008-10-01 at 09:50 -0500, Monte Copeland wrote:
> Hi,
>=20
> What is expected (correct) behavior when reading content of static UBI vo=
lumes?
>=20
> / # cat /sys/class/ubi/ubi0_6/name
> kernel_0
> / # cat /sys/class/ubi/ubi0_6/data_bytes
> 3149958
> / # cat /dev/mtd/kernel_0 | wc -c
> 3149958
> / # cat /dev/mtdblock/kernel_0 | wc -c
> 3149824
>=20
> On my older UBI platform, the byte count from the
> mtdblock dev is truncated down to an even multiple
> of 512.

First of all, gluebi is kind of a hack. Gluebi is a small part of UBI
which is responsible for emulating MTD devices on top of UBI volumes.

Let me describe the situation a little.

* Dynamic UBI volumes have volume size parameter, which maps to
  MTD device size well. I mean, for dynamic volumes, gluebi reports
  MTD device size to be volume size. Everything is fine.

* Static volumes are characterized by 2 parameters - volume size
  and data size. Volume size is how many logical eraseblocks are
  reserved for this volume. Data size is how many bytes of data this
  static volume stores.

For static volumes gluebi reports _data size_ as MTD device size. MTD
model assume that device size is multiple of eraseblocks.But in case of
MTD device emulated on top of a static UBI volume this is not true. MTD
size is not multiple of eraseblock size. And this is what confuses
mtdblock I think.

We cannot report UBI volume size as MTD device size for static volumes,
because reading beyond data size is prohibited in UBI. It would cause
I/O errors for mtd device.

On the other hand, MTD device size which is not multiple of eraseblock
size does not make sense.

So I am not 100% sure how to fix this problem.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
