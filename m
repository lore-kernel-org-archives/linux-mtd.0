Received: from doorbell.lineo.com ([204.246.147.253] helo=thor.lineo.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tJAg-0006hq-00
	for <linux-mtd@lists.infradead.org>; Tue, 16 Oct 2001 02:37:31 +0100
Message-ID: <3BCB8F35.61CC1A8B@Rikers.org>
Date: Mon, 15 Oct 2001 19:36:53 -0600
From: Tim Riker <Tim@Rikers.org>
MIME-Version: 1.0
To: Jose =?gb2312?B?Um9kcu1ndWV6?= Argente <jradc@tid.es>
CC: linux-mtd@lists.infradead.org
Subject: Re: Read Only FS
References: <3BCAED35.3000309@tid.es>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

three main choices:

romfs, cramfs, jffs2

romfs is uncompressed and so does not need to decompress.

cramfs is compressed and indexed, and so has shorter boot time

jffs2 is compressed but must do a full scan on bootup. It can be
read/write.

Consider that flash reads may actually take longer than decompression
depending on your hardware. I'd recommend a single jffs2 partition for
most applications. This is the best use of a small amount of flash.
Mount it readonly most of the time if you like and have some way to
snapshot the current config data that remounts read-write, saves, and
then remounts read-only. I have often made /var ramfs with /tmp ->
/var/tmp, and /dev -> /var/dev so that writes can happen there. Then the
bootup script fully populate /var.

Jose Rodr=EDguez Argente wrote:
>=20
> Hello,
>=20
>    I am working on an Assabet platform. My application will have a
> significant part of the root filesystem mounted as read-only. I am
> thinking about installing it as romfs, which I think should be faster
> than JFFS2. Am I right?
>=20
> Another question is wether romfs runs over MTD or it has its own access
> layer.
>=20
> Thank you very much
>=20
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--=20
Tim Riker - http://rikers.org/ - short SIGs! <g>
All I need to know I could have learned in Kindergarten
... if I'd just been paying attention.
