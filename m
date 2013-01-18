Received: from mail-da0-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TwFEE-0004Y1-VF
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2013 16:55:43 +0000
Received: by mail-da0-f48.google.com with SMTP id k18so1712540dae.21
 for <linux-mtd@lists.infradead.org>; Fri, 18 Jan 2013 08:55:41 -0800 (PST)
Message-ID: <50F97E6C.7030201@gmail.com>
Date: Fri, 18 Jan 2013 22:25:08 +0530
From: Vikram Narayanan <vikram186@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: UBIFS space consumption
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using UBIFS with the below partitioning layout.

<6m(bootloader)
512k(environment)
512k(redundant-environment)
5m(kernel),
170m(filesystem),
40m(user_data1),
-(user_data2)>

For the UBI volume 0 which has 170 MiB,
ubinfo reports 164.7 MiB, which is explained by:

(PEB size - LEB size) * (no of PEB's - reserved PEBs)
(256 - 248) * (680 - 6) = 5.392 MiB
Total size = 170 MiB - 5.39 = 164.6 MiB


root@BOX:/# ubinfo /dev/ubi0
ubi0
Volumes count:                           1
Logical eraseblock size:                 253952 bytes, 248.0 KiB
Total amount of logical eraseblocks:     680 (172687360 bytes, 164.7 MiB)
Amount of available logical eraseblocks: 0 (0 bytes)
Maximum count of volumes                 128
Count of bad physical eraseblocks:       0
Count of reserved physical eraseblocks:  6
Current maximum erase counter value:     5
Minimum input/output unit size:          4096 bytes
Character device major/minor:            253:0
Present volumes:                         0

But according to "df",  UBI volume 0 is sized 148.9 MiB. That's, 15.8 
MiB more in terms of consumption.

root@BOX:/# df -h
Filesystem                Size      Used Available Use% Mounted on
ubi0:rootfs             148.9M    132.8M     16.1M  89% /
root@BOX:/#

Can someone explain where this 15 MiB is getting lost?

Regards,
Vikram
