Received: from zose-mta11.web4all.fr ([178.33.204.87])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkIge-0003lQ-1h
 for linux-mtd@lists.infradead.org; Wed, 05 Jun 2013 18:43:57 +0000
Date: Wed, 5 Jun 2013 20:37:58 +0200 (CEST)
From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
To: linux-mtd <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Message-ID: <2099899784.1693830.1370457478398.JavaMail.root@advansee.com>
In-Reply-To: <1476912797.1693715.1370457082122.JavaMail.root@advansee.com>
Subject: Re: Re: UBI fastmap updates
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Artem Bityutskiy,

On Fri Aug 3 04:47:17 EDT 2012, Artem Bityutskiy wrote:
> On Mon, 2012-07-09 at 14:18 +0200, Richard Weinberger wrote:
> > This is the next round of UBI fastmap updates.
> > It fixes all issues pointed out by Shmulik. :-)
> >=20
> > If you want to test fastmap you can use my git repo:
> > git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v17
>=20
> Richard,
>=20
> I've added 'stress-test.sh' script to the UBI tests. This script runs
> UBI tests on nandsim of different geometry. I plan to extend it
> further: add mtdram tests, test with bit-flips emulation enabled, may
> be something else.
>=20
> We need to make sure all the tests pass and fastmap does not introduce
> regressions.
>=20
> Feel free to send patches. I am going to extend the test today, so
> 'git pull' from time to time.
>=20
> The tests will run very long time, so for debugging you can always
> comment out unneeded things.
>=20
> ATM, I have only nandsim tests with different geometry: 64MiB to 1GiB
> total size, 2KiB and 512 byte pages, 16-256KiB eraseblocks.
>=20
> Currently I am running this to unpatched UBI to check if they really
> pass.
>=20
> I tried to run it on the patched UBI and hit this issue:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 16MiB nandsim with 16KiB PEB, 512KiB NAND pages, fastmap enabled
> Loaded NAND simulator (16MiB, 16KiB eraseblock, 512 bytes NAND page)
> Running mkvol_basic /dev/ubi0
> Running mkvol_bad /dev/ubi0
> Running mkvol_paral /dev/ubi0
> Running rsvol /dev/ubi0
> Running io_basic /dev/ubi0
> [io_basic] test_basic():70: function write() failed with error 28 (No
> space left on device)
> [io_basic] test_basic():70: written =3D 15808000, ret =3D -1
> Error: io_basic failed
> FAILURE
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> On non-patched UBI it works. I think it is exactly what I was talking
> about yesterday - fastmap grows unexpectedly because you do not
> reserve the space.

I am having the same issue on Ubuntu 13.04 with UBI on nandsim. See my bug
report here:
https://bugs.launchpad.net/bugs/1187885

What is the status for this issue on your side as of now?

Thanks in advance for your help.

Best regards,
Beno=C3=AEt
