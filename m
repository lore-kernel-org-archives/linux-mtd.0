Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Klgpi-0004eb-Sd
	for linux-mtd@lists.infradead.org; Fri, 03 Oct 2008 09:20:23 +0000
Subject: Re: gluebi char vs block devices
From: Artem Bityutskiy <dedekind@infradead.org>
To: Monte Copeland <catboatmonte@gmail.com>
In-Reply-To: <1fc50b580810010750g5e817923of9a43f1caaa807da@mail.gmail.com>
References: <1fc50b580810010750g5e817923of9a43f1caaa807da@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Fri, 03 Oct 2008 12:19:56 +0300
Message-Id: <1223025596.8051.70.camel@sauron>
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

On Wed, 2008-10-01 at 09:50 -0500, Monte Copeland wrote:
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

Monte,

I am not sure if you satisfied with my answer. But you may
glance at 'ubi_create_gluebi()' function and play with what
we assign to mtd->size.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
