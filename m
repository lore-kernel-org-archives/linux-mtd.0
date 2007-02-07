Received: from svits26.main.ad.rit.edu ([129.21.18.136])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HEoJH-0004hU-Hk
	for linux-mtd@lists.infradead.org; Wed, 07 Feb 2007 10:02:13 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: re-formatting a Disk-on-Chip without going to DOS
Date: Wed, 7 Feb 2007 10:02:10 -0500
Message-ID: <06CCEA2EB1B80A4A937ED59005FA855101199C63@svits26.main.ad.rit.edu>
In-Reply-To: <1170844351.29759.1121.camel@pmac.infradead.org>
References: <06CCEA2EB1B80A4A937ED59005FA855101199C07@svits26.main.ad.rit.edu>
	<1170844351.29759.1121.camel@pmac.infradead.org>
From: "Christopher E Piggott" <cepasp@rit.edu>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>Hack drivers/mtd/nand/diskonchip.c to register the raw device even if =
it doesn't
>find the Media Header.

Cool, that part worked.

>Then write the original table back using nandwrite.

That part claimed to work, but what I read back from it didn't match =
what I wrote
>From the file.  I'm not sure if this even SHOULD work, but I did this:

    dd if=3Dneoware-backup of=3D/dev/mtd0 bs=3D8k

Which seemed to succeed.  Then I used 'cmp' to see if neoware-backup and =
/dev/mtd0 were identical - they were.  Then, as a final check, I did =
this:

    od -c /dev/mtd0 | grep "A   N   A   N   D"

Which found the media headers just like they used to be.

So this APPEARED to be a success, until I rebooted it.  At that point, =
the driver decided it needed
to reformat at the ntfl level:

	Formatting block 1
	Formatting Block 2

Etc. followed by:

	nftla: unknown partition table
	Creating 1 MTD partitions on "DiskOnChip Millennium":
	0x00010000-0x00800000 : " DiskOnChip BDTL partition"


This isn't a huge big deal, because I can reformat it and put the data =
back by copying the files.
It's just curious to me.

>We really ought to do something about how we expose devices to =
userspace

For now, I took the above "hack" and made it a module_param called =
"force_add_mtd_device" that
defaults to 0.  I did not do the other part where you sent nand->options =
to NAND_SKIP_BBTSCAN
yet, but I will take a look at the source and try to understand if it's =
necessary.

>For the CAF=C9 driver I've implemented a 'skipbbt' module option, but =
it's something
>we need to fix in generic code.

Oops, I don't know what the CAF=C9 driver is but your name for the =
parameter sounds better than mine.

Dunno ... I'm going to docfdisk it and proceed, and see how it goes.  =
Hopefully what I did restored the bad block table... Though I am =
obviously still finding my way through the fog here.

--Chris
