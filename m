Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HQkJ0-00058i-1L
	for linux-mtd@lists.infradead.org; Mon, 12 Mar 2007 13:11:19 +0000
Subject: Re: jffs2_gcd_mtd0 invoked oom-killer
From: Artem Bityutskiy <dedekind@infradead.org>
To: Igor Marnat <marny@rambler.ru>
In-Reply-To: <16125243125.20070312152801@rambler.ru>
References: <16125243125.20070312152801@rambler.ru>
Content-Type: text/plain; charset=utf-8
Date: Mon, 12 Mar 2007 15:10:53 +0200
Message-Id: <1173705053.5493.28.camel@sauron>
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

On Mon, 2007-03-12 at 15:28 +0300, Igor Marnat wrote:
> Dear Sirs!
>=20
> I work with the embedded system based on PowerPC 405 EP with 16Mb RAM
> and 32 Mb NAND FLASH. Rootfs lives on NAND FLASH and is formatted
> using jffs2.
>=20
> A few months it worked just fine then suddenly the system became
> unusable. Since root fs locates on NAND flash, system became
> unloadable because of error. Anyway I can boot the
> system, loading the kernel by TFTP and having mounted root fs by NFS.
>=20
> When the system works with the kernel loaded by tftp and fs mounted by
> NFS, it all seems to be fine until the command
> "mount -t jffs2 /dev/mtdblock0 /mnt" issued. After this command system te=
lls me
> "f: wrong data CRC" and then "jffs2_gcd_mtd0 invoked
> oom-killer". Then it goes to reboot (see the log below). The problem occu=
rs with
> 2.6.18-rc4 kernel and with 2.6.19.2-1 (the latest one I can build for my
> board).

Well, in general it may happen since JFFS2 needs a lot of memory. But
16MiB for 32MiB flash looks enough. Does something else consume much
memory in your system so too few is left for JFFS2? Check how much RAM
do you have for JFFS2.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
