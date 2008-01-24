Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHxm2-00057u-CN
	for linux-mtd@lists.infradead.org; Thu, 24 Jan 2008 08:49:26 +0000
Subject: Re: Is there really need to build Block Device Emulation over UBI?
From: Artem Bityutskiy <dedekind@infradead.org>
To: Nancy <nancydreaming@gmail.com>
In-Reply-To: <bae050c10801240024y6bd84a2bj1c5c29037200ab24@mail.gmail.com>
References: <bae050c10801231913r43473c02r2d9093a205a00c87@mail.gmail.com>
	<1201159103.6934.36.camel@sauron>
	<bae050c10801240024y6bd84a2bj1c5c29037200ab24@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Thu, 24 Jan 2008 10:45:26 +0200
Message-Id: <1201164326.6934.39.camel@sauron>
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

On Thu, 2008-01-24 at 16:24 +0800, Nancy wrote:
> > The problem with mtdblock is that when it needs to change an eraseblock=
,
> > it reads it, erases, then writes new data to it, which would cause data
> > loss in case of an unclean reboot.
>=20
> If I can delay  the erase operation, then it perfect works?  when
> change a eraseblock, reads it(from old mapped PEB) , then writes new
> data to it(new mapped PEB), finally erase the old mapped PEB.
>=20
> How about that?

Yes, this is OK, but mtdblock does not do this. Here I wrote about how
to create a simple FTL layer over UBI:

http://lists.infradead.org/pipermail/linux-mtd/2008-January/020381.html

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
