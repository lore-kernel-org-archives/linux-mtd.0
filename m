Received: from marasystems.com ([213.15.252.90] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17lrXg-0005jG-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2002 14:47:00 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Henrik Nordstrom <hno@marasystems.com>
To: Mark Meade <mark@lakeshoremicro.com>
Subject: Re: 48meg DOC
Date: Mon, 2 Sep 2002 15:46:57 +0200
Cc: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0209011654210.31089-100000@filer.marasystems.com> <20020902132838.NFAO11061.sccrmhc01.attbi.com@there>
In-Reply-To: <20020902132838.NFAO11061.sccrmhc01.attbi.com@there>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200209021546.57583.hno@marasystems.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Mark Meade wrote:

> You shouldn't need to have GRUB on the DoC to support multiple partitions.
> Grub is simply the bootloader -- the MTD/DoC stuff should work the same
> regardless of the presence of GRUB/LILO/whatever.

I ask because the 5.1.2 M-Sys DOS firmware seems to crap out badly if there is 
multiple partitions in the DoC disk image.. and it is a bit hard to boot the 
system if the DoC firmware does not play..

WIth a single partition everithing works just fine.

If I add another partition to the DoC disk image then the DOS firmware no 
longer boots the OS from the DoC, and if I load GRUB or DOS via the netwok 
(PXE) then GRUB cannot read the partition table and finds yet another ghost 
harddrive in the system, and DOS does not find any partition table on the 
DoC.. Funny eh?

> Use the GRUB firmware if the DoC is the primary non-volatile storage in
> your system.  Off-topic, but if you have a MBR in your target system, what
> is the DoC used for?

I am referring to the MBR of the DoC, not any other device. The DoC emulates a 
harddrive and as such it has a MBR for the DOS partition table and OS 
bootstrap code.

> I have not found a reliable way to use DFORMAT to load the Grub firmware.

With the 5.1.2 version of DFORMAT GRUB installed just fine as a binary flash 
image using the DFORMAT dos tool.. only that it didn't like the NTFL 
complaining about UnitSizeFactor once booted..

  dformat /win:d600 /BDKF0:grub_firmware

Haven't yet had time to test the 4.2 DFORMAT utility. Expect to do so during 
the day.

Regards
Henrik
