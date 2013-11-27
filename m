Received: from mail-in-16.arcor-online.net ([151.189.21.56])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VllK2-0000St-6V
 for linux-mtd@lists.infradead.org; Wed, 27 Nov 2013 20:02:55 +0000
Date: Wed, 27 Nov 2013 20:27:55 +0100
From: Albrecht =?iso-8859-1?b?RHJl3w==?= <albrecht.dress@arcor.de>
Subject: Re: JFFS2 Garbage collection issue
To: "Albrecht, Harald" <harald.albrecht@elreha.de>
In-Reply-To: <5295C538.6040207@elreha.de> (from harald.albrecht@elreha.de on
 Wed Nov 27 11:11:04 2013)
Message-Id: <1385580483.2836.0@deneb.(none)>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
 protocol="application/pgp-signature"; boundary="=-MRl+e67ZEjAK7Wb6Qizm"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-MRl+e67ZEjAK7Wb6Qizm
Content-Type: text/plain; charset=us-ascii; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Harald:

I had *exactly* the same issue with a board based on a MPC5200 (PPC).  I us=
e kernel 3.2, and the problematic file system is a jffs2 on a NVRAM which i=
s used to hold quickly changing logs and event buffers (before they are shi=
fted to flash or a CF card).  Apparently the scan process is triggered imme=
diately when the NVRAM is mounted by the startup script.  Apart from that I=
 had the same picture - the scan eats so much time that the hw wdt is trigg=
ered... (see my original post <http://lists.infradead.org/pipermail/linux-m=
td/2013-April/046632.html> - I unfortunately never got an answer to it).

My solution was to add a task to the startup script which monitors the scan=
 process (jffs2_gcd_mtd6 in my case) and waits until it apparently finished=
.  The main application (which in turn activates the hardware wdt) is launc=
hed only *afterwards*; then everything seems to run just fine, even if ther=
e is much "traffic" on the nvram.

The monitor application basically identifies the pid of the jffs2_gcd_mtd6,=
 and then repeatedly reads /proc/<pid>/stat as long as the sum of the utime=
, stime, cutime and cstime is still growing (of course with a maximum loop =
count, so the system doesn't deadlock).

Hope this helps,
Albrecht.


Am 27.11.13 11:11 schrieb(en) Albrecht, Harald:
> Hi all,
>=20
> we are currently facing a problem with the Garbage-collection on a JFFS2 =
file system.
>=20
> We have an embedded linux system based on an ARM9 AT91RM9200 processor wi=
th an Intel / Micron JS28F256 NOR-flash of 32MB in size.
> The Flash holds the U-Boot loader and its environment and in the main par=
t (30MB) of the chip a JFFS2-based root-file-system.
> Our Linux kernel version is 2.6.24.3
>=20
> Some minutes after startup of the system, the garbage collector (gc.c) do=
es a scan of the file system, gathering information for the garbage collect=
ion procedures that may be initiated based upon that data.
> On some file systems, especially such with long runtime and therefore man=
y file operations, this scan consumes a lot of time. On some systems it sta=
ys in that scan for more that 10 minutes. The problem with this behaviour i=
s the fact, that during the scan the file system is locked, and therefore a=
ll file operations are suspended. This leads to a crash of the system, when=
 the application program hangs for a long time, waiting for a file operatio=
n to return from a system call, and the watchdog is not triggered.
>=20
> In a test system without watchdog, after the scan, the system runs normal=
ly.
> The flash chip itself shows no errors, so it seems to be a problem of the=
 file system.
>=20
> Any idea or suggestion to solve the problem would be very welcome!
>=20
> Harald Albrecht
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>=20=

--=-MRl+e67ZEjAK7Wb6Qizm
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iD8DBQBSlkfDn/9unNAn/9ERAvWMAJ41wd1E+xKciojjAddMnMa2o1r9WACgpsy/
feroX/JUEyysZF7ICN2gZWc=
=OCiz
-----END PGP SIGNATURE-----

--=-MRl+e67ZEjAK7Wb6Qizm--
