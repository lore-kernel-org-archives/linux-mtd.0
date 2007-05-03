Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HjY2v-00089A-9J
	for linux-mtd@lists.infradead.org; Thu, 03 May 2007 05:56:23 -0400
Subject: Re: RO jffs2 implementation for bootloader
From: Artem Bityutskiy <dedekind@infradead.org>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <loom.20070503T102421-36@post.gmane.org>
References: <loom.20070503T102421-36@post.gmane.org>
Content-Type: text/plain; charset=utf-8
Date: Thu, 03 May 2007 12:56:03 +0300
Message-Id: <1178186163.7539.62.camel@sauron>
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

On Thu, 2007-05-03 at 08:40 +0000, Matthieu CASTET wrote:
> I need to mount a jffs2 partition in a bootloader. I tried u-boot that su=
pport
> jffs2, but it is very slow (2 minutes for mounting a 64MB partition).
> Do you know if there are other (fast) implemenation of jffs2 suitable for=
 a
> bootloader ?

Not sure about any existing "fast" implementation, but mounting a JFFS2
partition is about scanning whole partition. You may optimize some
thing, but you have to scan anyway.

> I want to avoid to use raw partition on NAND :
> - because the bootloader need to access several files (kernel, boot data,=
 rescue
> images, some configuration).
> - nand scrubbing (on read) is not possible to handle (jffs2 don't handle =
it
> either if it is a read only partition)

I would suggest to create a small JFFS2 partition with kernel so that it
is mounted quickly by the bootloader. Then you could mount it to /boot
of your "main" partition.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
