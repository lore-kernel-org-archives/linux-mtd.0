Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pf7gi-0000az-H0
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2011 09:17:21 +0000
Received: by fxm19 with SMTP id 19so6949287fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2011 01:16:49 -0800 (PST)
Subject: Re: validate_sb: bad superblock, error 8 (Minimum UBI volume size
	for UBIFS image)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrew Murray <amurray@mpcdata.com>
In-Reply-To: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
References: <AANLkTikGddyMhxph92Dz7vpRNRKa2haQne7yxKBTKw3N@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 18 Jan 2011 11:16:40 +0200
Message-ID: <1295342200.2470.97.camel@koala>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-01-11 at 09:47 +0000, Andrew Murray wrote:
> Hello,
> 
> Is there a way to determine the minimum UBI volume size which will
> support a given UBIFS filesystem image?
> 
> I've read the infradead.org FAQ's and browsed the source - however can
> not find a suitable answer. My current conclusion is that the minimum
> UBI volume is somehow dependant on the filesystem size, the log and
> the journal. I'm working on an upgrade mechanism which uses UBI/UBIFS
> and only creates UBI volumes of the minimum size to support a UBIFS
> filesystem and thus struggling to determine the safest minimum size.
> 
> This is what I've attempted. In these examples UBIFS is claiming that
> the journal size is 71 LEB's - however the filesystem will only mount
> if my UBI volume is 77 LEB's - how do I account for this difference?

There are 5 (AFAIR) areas in UBIFS:

1. Superblock - always 1 LEB.
2. Log - depends on maximum flash size (-c mkfs.ubifs option) and LEB
   size
3. Lprops - depends on maximum flash size and LEB size.
3. Orphans - I think 1 LEB is enough 
4. Main area - used for various purposes:
   1. the FS index needs at least 3 LEBs for the FS index
   2. 1 LEB for GC
   3. 1 for deletions (because deleting stuff, e.g., file, needs
      writing deletion entries to flash, which also needs space,
      so we need to reserve it to make sure that if your FS is full,
      you still can delete your files).
   4. buds which are part of the journal - need at least 3

Note, Log + buds = the journal.

As you have already found out the journal size is configurable, so you
can make it to be of minimum size.

Also you have already found that there are some functions which try to
calculate default sizes.

In fs/ubifs/ubifs-media.h you can find constants and comments about
minimum required LEBs [1]

Anyway, the only way for the user to affect the minimum FS size is the
--jrn-size option of mkfs.ubifs. How to calculate what will be the
minimum? Not sure, probably UBIFS_MIN_JNL_LEBS = 5 LEBs or something
close to this.

I agree that this is a bit complex, feel free to contribute some piece
of documentation to the mtd web site - you'll find the web site source
here: http://git.infradead.org/mtd-www.git

Just clone it and send a patch.

> 
> # ubinfo -a
> UBI version:                    1
> Count of UBI devices:           1
> UBI control device major/minor: 10:63
> Present UBI devices:            ubi0
> ubi0
> Volumes count:                           1
> Logical eraseblock size:                 129024 bytes, 126.0 KiB
> Total amount of logical eraseblocks:     911 (117540864 bytes, 112.1 MiB)
> Amount of available logical eraseblocks: 401 (51738624 bytes, 49.3 MiB)
> Maximum count of volumes                 128
> Count of bad physical eraseblocks:       1
> Count of reserved physical eraseblocks:  9
> Current maximum erase counter value:     350
> Minimum input/output unit size:          2048 bytes
> Character device major/minor:            251:0
> Present volumes:                         0
> Volume ID:   0 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        497 LEBs (64124928 bytes, 61.2 MiB)
> State:       OK
> Name:        rootfs
> Character device major/minor: 251:1


> 
> # ls -l rootfs.ubifs
> -rw-r--r--    1 default  default   6838272 Jan 10  2011 rootfs.ubifs
> # ubimkvol /dev/ubi0 -N test -s 6838272
> Volume ID 1, size 53 LEBs (6838272 bytes, 6.5 MiB), LEB size 129024
> bytes (126.0 KiB), dynamic, name "test", alignment 1
> # ubiupdatevol /dev/ubi0_1 rootfs.ubifs

If you did not use mkfs.ubifs, then UBIFS is doing "auto-formatting" and
just picks some "reasonable" default journal size, which is not the
minimum possible. You can make it smaller with "mkfs.ubifs --jrn-size".

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
