Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K33EV-0002Hm-GW
	for linux-mtd@lists.infradead.org; Mon, 02 Jun 2008 06:09:28 +0000
Subject: Re: ubifs, ubiblk(formatted with vfat) and yaffs2 test.
From: Artem Bityutskiy <dedekind@infradead.org>
To: KeunO Park <lastnite@gmail.com>
In-Reply-To: <5ed5c4730805300808v79f7fd7dpe3550cd8fc1b0db5@mail.gmail.com>
References: <5ed5c4730805292301m558dee30o66f5dd034d594390@mail.gmail.com>
	<1212129223.31023.106.camel@sauron>
	<5ed5c4730805300015o4f757dcbn394c770c2f92566a@mail.gmail.com>
	<1212148942.31023.135.camel@sauron> <1212149102.31023.138.camel@sauron>
	<5ed5c4730805300600v33e9c2d1hada32b24953cfaf7@mail.gmail.com>
	<1212155390.31023.140.camel@sauron>
	<5ed5c4730805300808v79f7fd7dpe3550cd8fc1b0db5@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Mon, 02 Jun 2008 09:10:34 +0300
Message-Id: <1212387034.31023.166.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, 2008-05-31 at 00:08 +0900, KeunO Park wrote:
> 2008/5/30, Artem Bityutskiy <dedekind@infradead.org>:
> > On Fri, 2008-05-30 at 22:00 +0900, KeunO Park wrote:
> > > > But I have to add that of course, YAFFS/JFFS2 are more light-weight
> > > > file-system, because they do not maintain the FS index on the flash
> > > > media. UBIFS does and this costs extra CPU cycles and extra I/O.
> > > >
> > >
> > > actually I did write & fsync the file during test. :-)
> > > anyway thank you for your comment.
> >
> > Could you please send your test? And how you measure the load average?
> >
>=20
> ok. here is my simple test.
>=20
> 1. make a random dumped file in sdram area.
> # cd /dev/shm/tmp
> # dd if=3D/dev/urandom of=3Dtest.out bs=3D1M count=3D10
> because ubifs uses compressor, I made a random data file for test.
>=20
> 2. make another shell script.
> # cat test_write.sh
> #!/bin/sh
> /bin/cp /dev/shm/tmp/test.out /nand_partition
> /bin/sync

In my previous mail, I described why the load will jump up when you do
like this, please refer to that mail again.

I suggest you to mount the file-system with '-o sync' option and measure
load average.

> 3. check that there is no other application running.
> write down the load avg using 'top'
>=20
> 4. just use 'time' utility to know how long it takes.
> # time ./test_write.sh
>=20
> 5. write down the load avg again using 'top'.
>=20
> using 'top' may be inadaquate choice. but, I think that
> this would be helpful more or less.

Yes, using top is not nice. But if the file is large enough, and you
watch 'top' for, say, several minutes, and then calculate the average
accurately, this should be good enough.=20

> 3.1 while I run 'cp test.out /nand_partition;sync' in ubifs partition
> with 6800 files, suddenly I cut off the power. then check the speed in
> next mount time.
> real 0m 3.64s
> user 0m 0.00s
> sys 0m 1.32s
> 3.2 while I run 'cp test.out /nand_partition;sync' in clean ubifs
> partition with a few files, suddenly I cut off the power. then check
> the speed in next mount time.
> real 0m 1.62s
> user 0m 0.00s
> sys 0m 0.45s

Mount time depends on how full is your journal, so it will be slightly
different each time you reboot uncleanly.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
