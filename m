Received: from [217.109.194.170] (helo=intranet.mtp.eprocess.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17D5AF-0003nb-00
	for <linux-mtd@lists.infradead.org>; Wed, 29 May 2002 16:15:03 +0100
Message-ID: <3CF4F0ED.8040805@eprocess.fr>
Date: Wed, 29 May 2002 17:17:01 +0200
From: Frederic Marmond <fmarmond@eprocess.fr>
Reply-To: fmarmond@eprocess.fr
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: can't boot with DiskOnChip2000 / nftlmount UnitSizeFactor ????
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
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

well, sorry, in my last mail I titled about UnitSizeFactor != 1, but 
didn't speak about it.

So, i'm wondering about this check (in drivers/mtd/nftlmount.c in kernel 
2.4.x)
is there any info to make my nftlmount works, even if i have this 
message? ("Sorry, we don't support UnitSizeFactor of != 1 yet.")

here is my dmesg about DOC2000:
Possible DiskOnChip with unknown ChipID FF found at 0xc8000
Possible DiskOnChip with unknown ChipID FF found at 0xca000
Possible DiskOnChip with unknown ChipID FF found at 0xcc000
Possible DiskOnChip with unknown ChipID FF found at 0xce000
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: 75 (Toshiba TC58256FT/DC)
2 flash chips found. Total DiskOnChip size: 64 MiB
Ignoring DiskOnChip 2000 at 0xD2000 - already configured
Possible DiskOnChip with unknown ChipID FF found at 0xd4000
Possible DiskOnChip with unknown ChipID FF found at 0xd6000
Possible DiskOnChip with unknown ChipID FF found at 0xd8000
Possible DiskOnChip with unknown ChipID FF found at 0xda000
Possible DiskOnChip with unknown ChipID FF found at 0xdc000
Possible DiskOnChip with unknown ChipID FF found at 0xde000
Possible DiskOnChip with unknown ChipID 00 found at 0xe0000
Possible DiskOnChip with unknown ChipID 00 found at 0xe2000
Possible DiskOnChip with unknown ChipID 00 found at 0xe4000
Possible DiskOnChip with unknown ChipID 00 found at 0xe6000
Possible DiskOnChip with unknown ChipID 00 found at 0xe8000
Possible DiskOnChip with unknown ChipID 00 found at 0xea000
Possible DiskOnChip with unknown ChipID 00 found at 0xec000
Possible DiskOnChip with unknown ChipID 00 found at 0xee000
NFTL driver: nftlcore.c $Revision: 1.82 $, nftlmount.c $Revision: 1.25 $
Sorry, we don't support UnitSizeFactor of != 1 yet.
Could not find valid boot record
Could not mount NFTL device

I would really appreciate any help of any type, as i spent too much time 
on this, and my boss is very strong at aïkido, kick-boxing and all this 
stuff... ;-)

thanks in advance!

Fred
