Received: from imap.gmx.net ([213.165.64.20] helo=mail.gmx.net)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAzNW-0006A9-1p
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2004 19:21:27 -0400
Message-ID: <4154ABF8.4090203@gmx.de>
Date: Sat, 25 Sep 2004 01:21:28 +0200
From: Arik Funke <arik.funke@gmx.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41546333.50102@gmx.de>
	<20040924191930.965AD60A7@blood.actrix.co.nz>
In-Reply-To: <20040924191930.965AD60A7@blood.actrix.co.nz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: i386 Linux on USB pen drive
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Charles Manning wrote:
| Most likely, IMHO, these devices will be using a block swapping
strategy like
| that used in SmartMedia. This does not do explicite wear levelling,
but the
| block management does effect wear levelling.
|
| The biggest source of problems with these devices, IMHO, is FAT
corruption. I
| see you've taken steps too get rid of that.
|
| The flash file systems like JFFSx and YAFFS are really suited to raw
flash
| (SmartMedia and XD cards and soldered down chips) , not USB Mass storage
| devices (which look like hard disks). Dave might not share my opinion
on this.

If I understood you correctly I have done everything right without even
knowing about the possible technical traps? I do not need to worry about
dying sectors, etc. and ext3 was the right choice? Or should I chose a
journaling filesystem? (the system will run as minimal communication server)

As there seems to be extensibe knowledge here about linux on flash
devices, two other questions:
1. Is it correct to assume that systems on flash devices need to run
without swap partitions? (due to frequent writing on these)

2. Is there any easy advice which parts of the directory structure
should better not be mounted on the flash? Or in which directories in
the linux structure will typically occur frequent write accesses? (E.g.
log-files?)

Is there maybe a HOWTO or anything discussing linux on flash in general?
~ I guess these are fairly typical questions...

Cheers,
Arik
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBVKv4//PXyz2NiW8RAiSEAJ0RVMiYdN9gJzrskwX/xputQYhabwCfePZQ
QvOQ2jkuDsqcs1z5hk9lk4o=
=3JNo
-----END PGP SIGNATURE-----
