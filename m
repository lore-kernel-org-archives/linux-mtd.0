Received: from mxs2.siemens.at ([194.138.12.133])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FO8iw-0001xD-0I
	for linux-mtd@lists.infradead.org; Tue, 28 Mar 2006 02:34:45 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Mar 2006 09:34:11 +0200
Message-ID: <38F58D7B92CB20438DF49D28B572CC6F13C4B3@budgw09a.ww300.siemens.net>
References: <44283F31.31644.285825A@localhost>
From: "Selmeci, Tamas" <tamas.selmeci@siemens.com>
To: <igor.trevisan@bluewind.it>
Cc: linux-mtd@lists.infradead.org
Subject: RE: jffs2 fs overload
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

> Just another one: is it possible to have a single RFS that 's mounted
> read/write?

If you are talking about this layout: bootloader, kernel, rootfs =
partition,
then my answer is: yes. My board works very similarly (one more =
parameter
partition is added, but it could be left out).

If you want only one partition containing kernel, rootfs etc. then it's
a harder quiestion.
I've been wondering if it's possible to put only a root FS on the =
flash...=20
Currently I don't exactly know, although this would be useful for me =
too, because
I may need this kind of solution in the future. My theory is the =
following: let's assume=20
that I format the entire flash with JFFS2. If it's possible to put
some kind of kernel loader code in the very beginning of the flash,
then I think I can do. My S3C2410 is capable of loading the first
4 KB of the flash in autoboot mode, and then executes it. If other
processors are also capable of this, then probably it can be done.
But I'm not sure any filesystem provides such functionality (leaving
the first x KB intact where a kernel loader program should reside).

> Is it enough to specify r/w on the mtdparts section of the command=20
> line? (I'm using that way to define flash partitions).

Not likely... when the kernel finished booting and starts /sbin/init =
etc.,
then you should remount your partition in read/write mode. I'd prefer
this solution - of course, with a writable filesystem only.=20

> In this way I could have three partitions: bootloader, kernel and RFS
> with the rfs mounted rewritable but with the files that cannot be=20
> changed that don't have write permission.

Sounds good, I suggest you the remounting as r/w.

> In this way I could avoid the overload due to having two small =
partitions
> each one with its JFFS2 tables and structures and so on.
> Is it right?

Bootloader and kernel partitions don't have to be formatted with
any filesystem. I have simply downloaded bootloader and kernel images
to the corresponding partitions and they work - although I can't
overwrite them from the running Linux, only with the bootloader
command prompt or the board's builtin software. Think of filesystems in=20
case of root (data) partitions only!

Bye
--
Tamas Selmeci
