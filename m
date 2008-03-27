Received: from mgw-fb01.nokia.com ([192.100.122.235])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JeqQO-0004PC-38
	for linux-mtd@lists.infradead.org; Thu, 27 Mar 2008 11:37:42 +0000
Received: from mgw-mx06.nokia.com (mgw-mx06.nokia.com [192.100.122.233])
	by mgw-fb01.nokia.com (Switch-3.2.6/Switch-3.2.6) with ESMTP id
	m2R78mRc010203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Thu, 27 Mar 2008 09:08:49 +0200
Subject: Re: UBI: about ubinize tool
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10803252102k373c5bddudda56bba12a0979f@mail.gmail.com>
References: <bae050c10803252102k373c5bddudda56bba12a0979f@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 27 Mar 2008 08:53:45 +0200
Message-Id: <1206600825.3856.25.camel@sauron>
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


On Wed, 2008-03-26 at 12:02 +0800, Nancy wrote:
> Hi,
>     As I know, ubinize can generate UBI images. I don't understand why
> its .cfg file need parameter "image=3Dubifs.img", why can't it collect
> the content
> from the defined vol_id automatically and output to file "ubi.img"?

You may want to create an UBI image with 3 UBI volumes. In this case you
may want to specify 3 different images as the contents of the UBI
volumes.

For example, you may want to have "/home" UBIFS volume, "/" UBIFS
volume, and "/boot" JFFS2 volume. In this case you prepare
"home.ubifs.img", "rootfs.ubifs.img" with mkfs.ubifs, and
"boot.jffs2.img" with mkfs.jffs2. Then you create a config file where
you ask ubinize to create an UBI image, add 3 volumes to it, the first
volume should have ID 5 (you specify vol_id=3D5), the second volume should
have ID 10, and the third volume ID 0, and so on.

This is the idea.

>     How to make the input image file? mkfs.ubifs can only generate
> ubifs image. If it was another filesystem eg. vfat, there's no tool.

ubinize does not care about the contents of the image you ask it to put
to the volume. It may be anything. I do not know how one can prepare
vfat image, there should be a tool or a way to do this.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
