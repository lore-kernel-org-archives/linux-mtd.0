Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JFPdO-0002Q6-Uu
	for linux-mtd@lists.infradead.org; Thu, 17 Jan 2008 07:58:08 +0000
Subject: Re: Block Device Emulation over UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Yuri Tikhonov <yur@emcraft.com>
In-Reply-To: <200801141557.18349.yur@emcraft.com>
References: <200801141557.18349.yur@emcraft.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 17 Jan 2008 09:53:51 +0200
Message-Id: <1200556431.6934.16.camel@sauron>
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

Hi Yuri,

On Mon, 2008-01-14 at 15:57 +0300, Yuri Tikhonov wrote:
>  We are about to implement and then maintain a block device driver which =
is=20
> intended to work on the top of UBI and provide users with the block-devic=
e=20
> interface to the underlying Flash chips. The goal of this driver is to=20
> provide users with the possibility to easily organize reliable file stora=
ge=20
> in Flash memory chips (especially NAND Flash) using Flash-unaware=20
> file-systems like FAT, EXT2/3, etc (UBI is supposed to provide the necess=
ary=20
> reliability using its features of wear-leveling and bad blocks handling).
>=20
>  In many cases the ability to have the file-system formatted with, for=20
> example, FAT is a highly desirable feature of the embedded devices (e.g. =
for=20
> exporting the embedded storage via USB link to a Windows-based USB host),=
 so=20
> we guess our work will be usefull for the embedded world.
>=20
>  Any suggestions or comments as to possible issues we may run into on thi=
s=20
> road would be very appreciated.

You are welcome to implement a block device layer on top of UBI, I'd
call it ubiblk. Here is an idea of a very simple implementation which
belongs to Adrian Hunter.

Every block is mapped to permanent position P =3D blk_size * blk_number,
which is (P / leb_size):(P % leb_size) in LEB:offset terms. When you
change a block, you use the "atomic LEB change" operation
(ubi_leb_change()) and re-write whole LEB.

While it seems to be very inefficient, it might be not so bad because
Linux elevator should help. Indeed, it re-arranges block change requests
so that they go as consecutively as possible. So the result is that you
write many consecutive blocks which sit at the same LEB at one go in
many cases, not just one block. And we can hope this will be fast
enough, although not necessarily. But it anyway makes sense to try this
out before inventing anything more comprehensive.

Few notes you would also need to do:

1. Implement ubi_get_volume()/ubi_put_volume() interfaces which just
get/put a volume reference and return, thus preventing the volume go
away (e.g., be deleted) while ubiblk is keeping it. Current
open()/close() interfaces do not look quite appropriate.

2. Implement some notification mechanisms for volume re-size - ubiblk
has to be notified when this happens.

3. You might as well also separate gluebi out once you have the above 2
things done and make it a separate ubimtd module, instead of built-in
crap.

HTH.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
