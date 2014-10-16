Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xedi5-00008v-2F
 for linux-mtd@lists.infradead.org; Thu, 16 Oct 2014 05:34:49 +0000
Received: by mail-ig0-f170.google.com with SMTP id hn15so471385igb.5
 for <linux-mtd@lists.infradead.org>; Wed, 15 Oct 2014 22:34:27 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 16 Oct 2014 07:34:27 +0200
Message-ID: <CACna6rxapt_J8qjMb37UnQ5iFE3DJ06U8nok_Fw=RO5UHs6Vsg@mail.gmail.com>
Subject: UBI: ignore/overwrite old data/PEBs after flashing
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Felix Fietkau <nbd@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I need some help with flashing UBI images.

I work with Broadcom ARM SoCs that use a CFE bootloader. In most cases
it doesn't provide a way to clear flash content before flashing the
firmware. It means that if I have 120 MiB of space for the firmware
and I flash 20 MiB firmware, the rest of flash (100 MiB) won't be
cleared. My partitioner driver will create 2 MiB partition for kernel
and 118 MiB partition for UBI.

So the result is that UBI partition contains 18 MiB of prebuilt
(ubinize-d) image and 100 MiB of rubbish. This will lead to problems
like:
UBI warning: scan_peb: valid VID header but corrupted EC header at PEB 17

UBI will find some old PEBs, try to use them, this may even lead to
situation where the data from previous install will be still
available!


Of course, I'm aware I should not upgrade my images this way all the
time. Normally I would simply use
$ ubiformat /dev/mtd0 -f ubi.img
, but I'm trying to handle some corner cases. Sometimes the firmware
may be broken and user may not be able to boot. In such case I need to
be able to re-flash the firmware using bootloader (and sacrifice the
wearing info).


Is there some way to tell UBI to ignore & overwrite all flash data
(including PEBs) that are placed after the flashed (ubinize-d) image?
Could we add some magic PEB that will tell UBI that all the flash
content after that single PEB is rubbish?

--=20
Rafa=C5=82
