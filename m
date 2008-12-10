Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LAMuB-0002VQ-80
	for linux-mtd@lists.infradead.org; Wed, 10 Dec 2008 11:06:59 +0000
Subject: Re: Ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: =?UTF-8?Q?=D0=96=D0=B5=D0=BA=D0=B0?= <vortexx@ukr.net>
In-Reply-To: <003401c95aa6$078be750$3503200a@head.local>
References: <003401c95aa6$078be750$3503200a@head.local>
Content-Type: text/plain; charset=utf-8
Date: Wed, 10 Dec 2008 13:04:52 +0200
Message-Id: <1228907092.13686.252.camel@sauron>
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

On Wed, 2008-12-10 at 11:02 +0200, =D0=96=D0=B5=D0=BA=D0=B0 wrote:
> Hi all,
> I wanna have a try ubifs on nand, and do as written on
> http://www.linux-mtd.infradead.org/faq/ubifs.html
> 1. compile, install and boot the kernel (2.6.26-rc3)
> the configuration option for ubi and nand is default on as module.
> 2. make the mtd-utils.
> 3. create a ubi when I got the error
>=20
> # ubiattach /dev/ubi_ctrl -m 0
> UBI device number 0, total 2048 LEBs (31457280 bytes, 30.0 MiB), availabl=
e
> 2024
> LEBs (31088640 bytes, 29.6 MiB), LEB size 15360 bytes (15.0 KiB)
> # ubinfo
> UBI version:                    1
> Count of UBI devices:           1
> UBI control device major/minor: 10:63
> Present UBI devices:            ubi0
> # ubimkvol /dev/ubi0 -N test -s 30MiB
> ubimkvol: error!: "/dev/ubi0" is not an UBI device node

Hi, please check this:

cat /sys/class/ubi/ubi0_0/dev
and
ls -l /dev/ubi0_0
Major/minor should match. E.g., on my system I have:

[dedekind@gollum /]$ cat /sys/class/ubi/ubi0_0/dev
252:1
[dedekind@gollum /]$ ls -l /dev/ubi0_0
crw-rw---- 1 root root 252, 1 2008-12-08 17:11 /dev/ubi0_0

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
