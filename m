Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Ry35k-0008P6-6P
 for linux-mtd@lists.infradead.org; Thu, 16 Feb 2012 15:17:56 +0000
Received: from localhost (localhost [127.0.0.1])
 by ra.se.axis.com (Postfix) with ESMTP id EA48F11EE6
 for <linux-mtd@lists.infradead.org>; Thu, 16 Feb 2012 16:17:49 +0100 (CET)
Received: from ra.se.axis.com ([127.0.0.1])
 by localhost (ra.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id FORj5TVfigNX for <linux-mtd@lists.infradead.org>;
 Thu, 16 Feb 2012 16:17:44 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
 by ra.se.axis.com (Postfix) with ESMTP id 98BDB11EE4
 for <linux-mtd@lists.infradead.org>; Thu, 16 Feb 2012 16:17:41 +0100 (CET)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
 by seth.se.axis.com (Postfix) with ESMTP id 8D18A3E0DA
 for <linux-mtd@lists.infradead.org>; Thu, 16 Feb 2012 16:17:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
 q1GFHfFa003454
 for <linux-mtd@lists.infradead.org>; Thu, 16 Feb 2012 16:17:41 +0100
Date: Thu, 16 Feb 2012 16:17:41 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: UBI/ubifs problem
Message-ID: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I posted this query yesterday, but the information I provided was rather=20
short, so here's another attempt with more info which hopefully will=20
trigger some response.

I have two ubifs images made with mkfs.ubifs:

-rw-rw-r-- 1 ricardw users 20256768 2012-02-16 11:12 rootfs.img
-rw-rw-r-- 1 ricardw users  2064384 2012-02-16 11:09 rwfs.img

On my target system I attach mtd5 to UBI and create two volumes:

ubiattach -m 5 /dev/ubi_ctrl
ubimkvol -N rootfs -n 4 -t static -s 25165824 /dev/ubi0
ubimkvol -N rwfs -n 5 -t dynamic -S 30 /dev/ubi0

30 LEBs in the flash I'm using is about 30 * 126 KiB =3D 3.7 MiB .

I then write the volumes with the image data

ubiupdatevol /dev/ubi0_4  ./rootfs.img
ubiupdatevol /dev/ubi0_5 ./rwfs.img

Now I mount ubi0:rootfs on /mnt/1:

mount -t ubifs ubi0:rootfs /mnt/1/

which results in

UBIFS: mounted UBI device 0, volume 4, name "rootfs"
UBIFS: mounted read-only
UBIFS: file system size:   23869440 bytes (23310 KiB, 22 MiB, 185 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)

All is well so far. Now I attempt to mount ubi0:rwfs on /mnt/2:

mount -t ubifs ubi0:rwfs /mnt/2

which results in

UBIFS error (pid 2965): validate_sb: bad superblock, error 8
mount: Mounting ubi0:rwfs on /mnt/2 failed: Invalid argument

If I now remove the rwfs volume using ubirmvol, and create a new one that=
=20
is 78 LEBs in size (smaller sizes yield the same error message), again=20
ubiupdatevol the same rwfs.img image, and attempt to mount it, I get:

UBIFS: reserved for root:  0 bytes (0 KiB)
UBIFS: mounted UBI device 0, volume 5, name "rwfs"
UBIFS: file system size:   8644608 bytes (8442 KiB, 8 MiB, 67 LEBs)
UBIFS: journal size:       9033728 bytes (8822 KiB, 8 MiB, 71 LEBs)
UBIFS: media format:       w4/r0 (latest is w4/r0)
UBIFS: default compressor: lzo
UBIFS: reserved for root:  0 bytes (0 KiB)

The thing that really puzzles me here is that the 2 MiB ubifs image shows=
=20
up as an 8 MiB 'file system size' when mounted. It does explain why 78=20
LEBs are required though.

Furthermore, df says:

ubi0:rootfs              21212     17652      3560  83% /mnt/1
ubi0:rwfs                 7228       432      6796   6% /mnt/2

which correlates with the statistics from ubifs above, but it seems odd=20
that I can't create a volume with more than 6% utilization. If I start to=
=20
fill the volume with files after mounting, I can get up to 100% use.

At any rate, the error message is odd, especially given that ubiupdatevol=
=20
didn't report any problems.

I've also tried using a static volume for rwfs, with the same results (and=
=20
of course I can't write to it so I can't put more files on it in that=20
case).

Even considering the overhead that the rootfs volume appears to need=20
(image size is 20256768 and ubifs reports a 'file system size' of=20
23869440), i.e. an overhead of 3612672 bytes), it doesn't add up; adding=20
3612672 to the rwfs.img image size of 2064384 would result in a total size=
=20
of 5677056, not 8644608.

Could there be compressed files in the rwfs.img image that somehow need to=
=20
be expanded in the flash?

It's not that we're pressed for space and need the size, but I'd like to=20
understand what is going on. I don't really think this is a bug, more=20
something that I don't understand. I can't find anything on the mtd=20
documentation pages that seem to relate to this though.

For the record, I'm using Linux 2.6.35 .

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
