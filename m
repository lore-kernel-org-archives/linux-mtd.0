Received: from [212.122.115.61] (helo=ia.mail)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BNVRM-0002Jt-81
	for linux-mtd@lists.infradead.org; Tue, 11 May 2004 12:28:52 +0100
Received: from josepascual by ia.mail
	with SMTP (MDaemon.PRO.v6.7.9.R)
	for <linux-mtd@lists.infradead.org>; Tue, 11 May 2004 13:37:40 +0200
From: "Jose Pascual" <josepascual@almudi.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 11 May 2004 13:37:19 +0200
Message-ID: <036d01c4374c$53563fa0$0319a8c0@dominio1.ingalmudi.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <035301c43733$643a7930$0319a8c0@dominio1.ingalmudi.com>
Subject: RE: symbolic link with jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

It seems as strlen of names in symbolic links is wrong or the '\0' is
forgotten at the len of name,
the symlink is correct until first ? appear. Shouln't be a '\0' instead
Where ? appear.

regards
=20
>=20
> Hi,
>=20
> I'm using kernel 2.4.25-vrs2 and my own patch for my specific=20
> board. I updated my kernel to 14/4/2004 MTD snapshot (cvs).
>=20
> I have mounted a jffs2 fs in mtdblock2 (nor in my case) but=20
> when I make symbolic link something doesn't work as you can=20
> se below, (appear some ? simbols in name, so symbolic links=20
> are broken)
>=20
> do you have seen this problem before? any suggestion?
>=20
> ----------------------------------------------------------------
> [root@IA-CPU-9200 lib]$ls -la
> total 1534
> drwxrwxrwx    1 root     root            0 Jan  1 00:18 .
> drwxr-xr-x    1 root     root            0 Jan  1 00:17 ..
> -rwxr-xr-x    1 root     root       116853 Dec 21  2003 ld-2.2.3.so
> lrwxrwxrwx    1 root     root           11 Jan  1 00:16=20
> ld-linux.so.2 ->
> ld-2.2.3.so?1?.so?
> -rwxr-xr-x    1 root     root      1348598 Dec 21  2003 libc-2.2.4.so
> lrwxrwxrwx    1 root     root           13 Jan  1 00:16 libc.so.6 ->
> libc-2.2.4.so?.so?
> -rwxr-xr-x    1 root     root        29479 Dec 21  2003
> libcrypt-2.2.3.so
> lrwxrwxrwx    1 root     root           13 Jan  1 00:16 libcrypt.so ->
> libcrypt.so.1?.so?
> lrwxrwxrwx    1 root     root           17 Jan  1 00:16=20
> libcrypt.so.1 ->
> libcrypt-2.2.3.so?
> -rwxrwxrwx    1 root     root        74712 Dec 21  2003
> libpthread-0.8.so
> lrwxrwxrwx    1 root     root           15 Jan  1 00:16=20
> libpthread.so ->
> libpthread.so.0?.2
> lrwxrwxrwx    1 root     root           17 Jan  1 00:18=20
> libpthread.so.0
> -> libpthread-0.8.so?
> lrwxrwxrwx    1 root     root           17 Jan  1 00:16
> libpthread.so.0.bad -> libpthread-0.8.so?
> [root@IA-CPU-9200 lib]$
> ----------------------------------------------------------------
>=20
> thank you in advanced
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list=20
> http://lists.infradead.org/mailman/listinfo/lin> ux-mtd/
>=20
>=20
>=20
> __________ Informaci=F3n de NOD32 1.755 (20040511) __________
>=20
> Este mensaje ha sido analizado con  NOD32 Antivirus System=20
http://www.nod32.com



__________ Informaci=F3n de NOD32 1.755 (20040511) __________

Este mensaje ha sido analizado con  NOD32 Antivirus System
http://www.nod32.com
