Received: from kynes.gatewest.net ([198.163.227.7]
	helo=10-10-1-6.gatewest.net)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19ux2j-0002QK-EZ
	for <linux-mtd@lists.infradead.org>; Thu, 04 Sep 2003 17:33:09 +0100
Received: from iders01.iders.ca (24-66-20-25.gatewest-shaw.ca [24.66.20.25])
	8.12.0.Beta19) with ESMTP id h84GV2s8023178
	for <linux-mtd@lists.infradead.org>; Thu, 4 Sep 2003 11:31:02 -0500
Received: from kilauea.iders.ca (kilauea.iders.ca [200.123.101.201])
	by iders01.iders.ca (8.12.6/8.12.8) with SMTP id h84GXKdA001125
	for <linux-mtd@lists.infradead.org>; Thu, 4 Sep 2003 11:33:20 -0500
From: Cam Mayor <cmayor@iders.ca>
To: a-linux-mtd <linux-mtd@lists.infradead.org>
Date: Thu, 4 Sep 2003 11:33:19 -0500
References: <03082711183400.19211@kilauea.iders.ca>
In-Reply-To: <03082711183400.19211@kilauea.iders.ca>
MIME-Version: 1.0
Message-Id: <03090411331900.25124@kilauea.iders.ca>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: C3 NOR flash /dev/mtd0 write only?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

For those googling later, here's some more info:
-snapshot from March 25/2003
-from utils directory:
	-unlock works
	-mtd_debug (write/read) works
	-erase fails.  (maybe broken driver erase fcn?)

On Wednesday 27 August 2003 11:18, Cam Mayor wrote:
> Hi all,
>
> I've been pounding on this problem for a while, but the answer has so far
> eluded me.  My /dev/mtd0 (NOR flash) that should be rw is acting as ro.
>
> I am using intel C3 NOR flash (two parallel 32Mbit x 16-B) on a guide A07
> (cs89712 processor, similar to the cdb89712 demo board).  It's been working
> fine for a couple of years, but now we want to do some direct writing of
> the flash from user space. (ie.  cat file > /dev/mtd0)
>
> I can accurately read the contents of the flash with 'cat /dev/mtd0 > file'
> and 'cat /dev/mtdr0 > file'.  /dev/mtd0 is supposed to be rw, but when i do
> cat file > /dev/mtd0, the error i get is:
> cat: write: Read-only file system
>
> I cannot find the reason this is happening.  I believe it is getting marked
> as read only somewhere in the kernel/driver, but i'm not sure where.  If
> you have any ideas, please pass them along.  Here's some system data:
>
> # cat /proc/mtd
> dev:    size   er  name
> mtd0: 00800000 00020000 "flash"
> mtd1: 0000c000 00000010 "SRAM"
> mtd2: 00000080 00010000 "BootROM"
> mtd3: 00800000 00020000 "Physically mapped flash"
> mtd4: 09000000 00004000 "guidenand"
>
> (the following was the output when i enabled DEBUG_CFI_FEATURES in the
> driver) Feature/Command Support: 0066
>      - Chip Erase:         unsupported
>      - Suspend Erase:      supported
>      - Suspend Program:    supported
>      - Legacy Lock/Unlock: unsupported
>      - Queued Erase:       unsupported
>      - Instant block lock: supported
>      - Protection Bits:    supported
>      - Page-mode read:     unsupported
>      - Synchronous read:   unsupported
>   Supported functions after Suspend: 01
>      - Program after Erase Suspend: supported
>   Block Status Register Mask: 0003
>      - Lock Bit Active:      yes
>      - Valid Bit Active:     yes
>   Vcc Logic Supply Optimum Program/Erase Voltage: 0.3 V
>   Vpp Programming Supply Optimum Program/Erase Voltage: 12.0 V
>
> when using the 'erase' command that comes in mtd/utils/erase.c, it provided
> the following output:
> # ./erase /dev/mtd0
> Erase Total 1 Units
> Region 0 is at 0 of 8 sector and with sector size 4000
> Region 1 is at 131072 of 63 sector and with sector size 20000
> Performing Flash Erase of length 16384 at offset 0x0
> MTD Erase failue: Read-only file system
>
> Some of my debug code in the driver to tell me what's what says that the
> flash says the following two flags are defined:
> MTD_CLEAR_BITS defined
> MTD_ERASEABLE defined
> and that the erase, unlock, and write functions exist (they have fcn
> pointer locations, not just NULL)
>
> my relevant /dev entries are as follows:
> # ll /dev/mtd*
> crw-------    1 root     root      90,   0 Aug 26 21:57 /dev/mtd0
> crw-------    1 root     root      90,   2 Aug 26 21:57 /dev/mtd1
> crw-------    1 root     root      90,   4 Aug 26 21:57 /dev/mtd2
> crw-------    1 root     root      90,   6 Aug 26 21:57 /dev/mtd3
> crw-------    1 root     root      90,   8 Aug 26 21:57 /dev/mtd4
> brw-------    1 root     root      31,   0 Aug 26 21:57 /dev/mtdblock0
> brw-------    1 root     root      31,   1 Aug 26 21:57 /dev/mtdblock1
> brw-------    1 root     root      31,   2 Aug 26 21:57 /dev/mtdblock2
> brw-------    1 root     root      31,   3 Aug 26 21:57 /dev/mtdblock3
> crw-------    1 root     root      90,   1 Aug 26 21:57 /dev/mtdr0
> crw-------    1 root     root      90,   3 Aug 26 21:57 /dev/mtdr1
> crw-------    1 root     root      90,   5 Aug 26 21:57 /dev/mtdr2
> crw-------    1 root     root      90,   7 Aug 26 21:57 /dev/mtdr3
> crw-------    1 root     root      90,   9 Aug 26 21:57 /dev/mtdr4
>
> I am using linux 2.4.19-rmk7 with an MTD version that i can't confirm the
> exact date (another developer downloaded an arbitrary version from the mtd
> cvs and added it to ours) ...it is approximately from 2003/03/26.
>
> thanks in advance for any tips/help.
>
> cheers,
> cam

-- 
Cameron Mayor
Iders Incorporated
600A Clifton Street
Winnipeg, MB Canada R3G 2X6
http://www.iders.ca
tel: 204-779-5400 ext 29
fax: 204-779-5444

Legalese some customers need us to state for the record:
This message is intended solely for the use of the designated
recipient(s) and their appointed delegates, and may contain
confidential information.  Any unauthorized disclosure,
copying or distribution of its contents is strictly prohibited.
If you have received this message in error, please destroy it
and advise the sender immediately by phone, email or facsimile.
