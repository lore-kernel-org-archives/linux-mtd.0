Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtkGr-0006ay-9Q
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 15:10:04 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Tue, 14 Apr 2009 09:09:48 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB70305BEFB@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1239689500.3390.82.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Fri, 2009-04-10 at 12:33 -0600, Eric Holmberg wrote:
> > > On Fri, 2009-04-10 at 11:00 -0600, Eric Holmberg wrote:
> > > > Thank you very much for your help so far.=20
> > > NP, this is all I can do now without having real NOR and=20
> much time :-)
> > >=20
> > > >  I am going to do two things:
> > > >  1. Turn off write buffering which converts the NOR minimum=20
> > > I/O size from 1 to effectively 32 16-bit words (64 bytes) and=20
> > > re-run all of the tests.
> > >=20
> > > Err, which buffering? Is this something at the flash=20
> driver level?=20
> >=20
> > This is for the CFI flash interface.  The
> > drivers/mtd/chips/cfi_cmdset_0002.c driver has write=20
> buffers which is
> > uses to do a "block" write to the NOR flash which for my chip allows
> > writing up to 32 16-bit words.=20
>=20
> Oh, this is something from the CFI standard? Then we may just add this
> knowledge to UBIFS: if this is NOR, then UBIFS knows that the up to 64
> bytes may contain garbage.

The write-buffer command is part of the CFI standard, but the size of
the buffer is up to the chip manufacturer.  For example, we have two NOR
Flash chips on our board and one has a write buffer size of 1 word (2
bytes) and the other is 32 words (64 bytes).  CFI auto-detects the
maximum write-buffer size and places the value in the structure element
cfi_ident::MaxBufWriteSize (located in mtd/cfi.h).  That could always be
used to determine the size of writes to flash, but maybe a UBI
configuration value that is set manually would be a better option?

>=20
> >  This is what I used for the tests with
> > U-Boot and it is why you see patterns such as the one=20
> below.  The code I
> > used to write this pattern to flash wrote the entire block=20
> in 1 write.
> > The CFI driver then broke up the writes into 64-byte writes.
> > Apparently, it didn't do them in order (or the flash chip=20
> didn't), which
> > is why you have aa55aa0a values after ffffffff values. =20
> Turning off the
> > write buffering in the CFI driver by setting FORCE_WORD_WRITE to 1
> > should solve this (although it will now probably be=20
> somewhere between
> > 10x and 32x slower).
>=20
> Yes, it is worth disabling this and test. If it helps, we can add
> some CFI/NOR-awareness to UBIFS.
>=20
> > 30352250  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
> > 30352260  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
> > 30352270  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
> > 30352280  ffffffff ffffffff ffffffff ffffffff=20
> > 30352290  ffffffff ffffffff ffffffff ffffffff=20
> > 303522a0  ffffffff ffffffff ffffffff ffffffff=20
> > 303522b0  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
> > 303522c0  ffffffff ffffffff ffffffff ffffffff=20
> > 303522d0  ffffffff ffffffff ffffffff ffffffff=20
> >=20
> > Does that make sense now, or am I on the wrong path?
>=20
> Yes, makes perfect sense for me.


I ran a corruption test on 3 different boards which used an application
that writes to the flash continuously (doing read, write, and rename
operations on a UBIFS root file system) and then a script would randomly
remove power.

Here are the results for NOR flash with a block-size of 64 bytes -- the
data currently points to the block write size of 64 bytes being the
issue since changing it to 1 eliminated the corruption.  I'm going to
run one more test where I force it to 8 bytes (based upon your comment
that UBIFS allows up to 8-bytes to be garbage).  If fails, then there is
a different issue causing the problem.


Test #1 - FORCE_WORD_WRITE =3D 1
----------------------------------------------
cfi_cmdset_0002.c FORCE_WORD_WRITE is 1 (true) which disables block
writes to the NOR flash.  This fixed the problem as no corruption has
occurred after 96 hours of power cycling (over 6000 power cycles).=20

Test #2 - Corrupt Empty Block Recovery
-------------------------------------------------
cfi_cmdset_0002.c FORCE_WORD_WRITE is 0 (false) and added the code that
you graciously provided to correct the corrupt-empty space LEB.  This
worked great for recovery of the corrupt empty space, but then
additional corruption occurred at which point it looks like the
super-block got changed to an orphan node (type 11) - see below.

Corruption occurred after approximately 2 hours of operation
(approximately 130 power cycles).

[42949375.790000] UBIFS error (pid 1): ubifs_read_node: bad node type
(11 but expected 6)
[42949375.800000] UBIFS error (pid 1): ubifs_read_node: bad node at LEB
0:0
[42949375.810000] List of all partitions:
[42949375.810000] 1f00         16 mtdblock0 (driver?)
[42949375.820000] 1f01          8 mtdblock1 (driver?)
[42949375.820000] 1f02          8 mtdblock2 (driver?)
[42949375.830000] 1f03         32 mtdblock3 (driver?)
[42949375.830000] 1f04        960 mtdblock4 (driver?)
[42949375.840000] 1f05       2048 mtdblock5 (driver?)
[42949375.840000] 1f06       2048 mtdblock6 (driver?)
[42949375.850000] 1f07      28672 mtdblock7 (driver?)
[42949375.850000] No filesystem could mount root, tried:  ubifs
[42949375.860000] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)

LEB 0
316a0000: 23494255 00000001 00000000 01000000    UBI#............
316a0010: 40000000 80000000 00000000 00000000    ...@............
316a0020: 00000000 00000000 00000000 00000000    ................
316a0030: 00000000 00000000 00000000 889bc4d4    ................
316a0040: 21494255 00000101 00000000 00000000    UBI!............
316a0050: 00000000 00000000 00000000 00000000    ................
316a0060: 00000000 00000000 00000000 28000000    ...............(
316a0070: 00000000 00000000 00000000 cf33cc9a    ..............3.
316a0080: 06101831 6525e297 0000554e 00000000    1.....%eNU......
316a0090: 00000028 0000000b 00000007 80000000    (...............
316a00a0: 00000da6 00000000 06101831 7f52d274    ........1...t.R.
316a00b0: 00005741 00000000 00000028 0000000b    AW......(.......
316a00c0: 00000009 80000000 00000db6 00000000    ................
316a00d0: 06101831 52ecb032 00006def 00000000    1...2..R.m......
316a00e0: 00000028 0000000b 0000001c 80000000    (...............
316a00f0: 00000db3 00000000 ffffffff ffffffff    ................
316a0100: ffffffff ffffffff ffffffff ffffffff    ................
316a0110: ffffffff ffffffff ffffffff ffffffff    ................


Test #3 - Control
-------------------------------------------------
Stock kernel 2.6.27.  Corrupt empty-space failure occurred within 2
hours of running.

[42949375.720000] UBIFS: recovery needed
[42949375.780000] UBIFS error (pid 1): ubifs_scan: corrupt empty space
at LEB 6:14912, expected 0xFF, got 0x0
[42949375.790000] UBIFS error (pid 1): ubifs_scanned_corruption:
corrupted data at LEB 6:14912
[42949375.810000] UBIFS error (pid 1): ubifs_scan: LEB 6 scanning failed
[42949375.850000] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty
space at LEB 6:224
[42949375.860000] UBIFS error (pid 1): ubifs_scanned_corruption:
corrupted data at LEB 6:224
[42949375.890000] UBIFS error (pid 1): ubifs_recover_leb: LEB 6 scanning
failed
[42949375.900000] VFS: Cannot open root device "ubi0:rootfs" or
unknown-block(0,0)
[42949375.900000] Please append a correct "root=3D" boot option; here =
are
the available partitions:
[42949375.910000] 1f00         16 mtdblock0 (driver?)
[42949375.920000] 1f01          8 mtdblock1 (driver?)
[42949375.920000] 1f02          8 mtdblock2 (driver?)
[42949375.930000] 1f03         32 mtdblock3 (driver?)
[42949375.930000] 1f04        960 mtdblock4 (driver?)
[42949375.930000] 1f05       2048 mtdblock5 (driver?)
[42949375.940000] 1f06       2048 mtdblock6 (driver?)
[42949375.940000] 1f07      28672 mtdblock7 (driver?)
[42949375.950000] Kernel panic - not syncing: VFS: Unable to mount root
fs on unknown-block(0,0)



> Turning off the
> > write buffering in the CFI driver by setting FORCE_WORD_WRITE to 1
> > should solve this (although it will now probably be=20
> somewhere between
> > 10x and 32x slower).
>=20
> Yes, it is worth disabling this and test. If it helps, we can add
> some CFI/NOR-awareness to UBIFS.

Next Steps
----------
I'm going to run a test with the write-buffer size set to 8 bytes.  If
that works, then I think the next task is to see how to add the
CFI/NOR-awareness to UBIFS.

Thanks again -- we're making progress!

Eric Holmberg
