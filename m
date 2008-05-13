Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JvrDp-0007eT-L2
	for linux-mtd@lists.infradead.org; Tue, 13 May 2008 09:55:02 +0000
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10805122116g4295f202j40e1a8528be5220@mail.gmail.com>
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<bae050c10803040140q2d4801d5m4271cadcaa55579@mail.gmail.com>
	<1204623622.23706.22.camel@sauron>
	<bae050c10803040154t2f635dfewe1221c18255f7bda@mail.gmail.com>
	<1204624414.23706.26.camel@sauron>
	<bae050c10803040207odbaebe5vd85b619b370a16cd@mail.gmail.com>
	<bae050c10803040555y3a398fla89fe54c01908838@mail.gmail.com>
	<bae050c10805122116g4295f202j40e1a8528be5220@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 13 May 2008 12:53:11 +0300
Message-Id: <1210672391.5708.15.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-05-13 at 12:16 +0800, Nancy wrote:
> Hi all,
>        I think it is my final edition of ubi block device layer code
> based on UBI commit e442c48f84982d0fa10c6b292018241dafca4d65
>        Finally, it can support any filesystem based on block device layer=
.
>        eg: FAT, ext2....
>        #modprobe ubiblk
>        #mkfs.vfat /dev/ubiblock1
>        #mount -t vfat /dev/ubiblock1 /mnt/fat
>=20
>        I notice there many people need this function especially our
> Chinese. Hope this helpful :-)
>        Here's my implementation:

What is the reason you added this "generic" ubi mtd block stuff? What
for? Also, UBI should not have any explicit block device support - it
should be isolated. It is to ok to add some general support for devices
on top of UBI, like notification about volume size change and so on,
but not explicit block layer support. Gluebi should also get a separate
module, ideally.

Also, the patch suffers from too direct copy-pastes which is not
acceptable.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
