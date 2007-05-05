Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HkIby-00089V-TF
	for linux-mtd@lists.infradead.org; Sat, 05 May 2007 07:39:40 -0400
Subject: Re: UBI: Cannot create static volumes when FTL is enabled
From: Artem Bityutskiy <dedekind@infradead.org>
To: John Smith <john@arrows.demon.co.uk>
In-Reply-To: <Pine.LNX.4.33.0705042249130.30496-100000@arrows.demon.co.uk>
References: <Pine.LNX.4.33.0705042249130.30496-100000@arrows.demon.co.uk>
Content-Type: text/plain; charset=utf-8
Date: Sat, 05 May 2007 14:39:29 +0300
Message-Id: <1178365169.3659.76.camel@sauron>
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

On Fri, 2007-05-04 at 23:22 +0100, John Smith wrote:
> Probably not a major bug, but here it is....
>=20
> I have a slightly muddled kernel using MTD and UBI from a recent snapshot
> from kernel.org, and the rest of the kernel from a derivative of 2.6.18.
>=20
> I accidentally enabled the CONFIG_FTL as well as MTD and UBI.
>=20
> When trying to create a static UBI volume with the command
>=20
>   # ubimkvol -d 0 -n 1 -N ubi-volume --type=3Dstatic -s 123000
>=20
> I trigger a kernel stack dump. It arises from the ubi_assert
>=20
>    ubi_assert(vol->vol_type !=3D UBI_STATIC_VOLUME);
>=20
> in function ubi_eba_read_leb() of file  drivers/mtd/ubi/eba.c

Yeah, you have found a flaw. We actually assume that mtd devices are
emulated _only_ for dynamic volumes, but we do not disable the MTD
device emulation for static volumes. This should we fixed.

The reason why only dynamic volumes may have emulated MTD devices is
that they have "stable" size. I mean, if you create dynamic volume of
size N, you can always read N bytes from it. And it does not depend on
how many bytes of data you have on them.

In case of static volumes the situation is different. When you create an
empty static volume, it contains no data, and a read operation returns
EOF immediately. Then you write put some data to it using the "volume
update" operation. In this case you'll be able to read that amount of
data back.

Here is an example:
1. Create static volume A of size Sa.
2. Create dynamic volume B of size Sb.
3. Read whole A - 0 bytes are read.
4. Read whole B - Sb bytes are read, all of them contain 0xFFs.
5. Update A with Xa bytes of data (Xa <=3D Sa).
6. Update B with Xb bytes of data (Xb <=3D Sb).
7. Read whole A - Sa bytes are read.
8. Read whole B - Xb bytes are read.

See the difference in semantics? In case of dynamic volumes we always
read Sb bytes. If there is only Xb bytes of data, the rest will be 0xFF
bytes.

So you see that dynamic volumes are mapped to the MTD device model quite
nicely: mtd device size =3D volume size.

Size of static volumes depends on how much data you put there. And since
MTD infrastructure assumes that MTD device sizes are stable, there is no
good and nice way to emulate MTD devices on top of static volumes,
unless MTD subsystem is somehow re-designed.

But anyway, you have found a bug. I am going to disable MTD device
emulation for static volumes.

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
