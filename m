Received: from web11503.mail.yahoo.com ([216.136.172.35])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16l7RE-0000Kb-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 12:01:00 +0000
Message-ID: <20020313121226.8907.qmail@web11503.mail.yahoo.com>
Date: Wed, 13 Mar 2002 12:12:26 +0000 (GMT)
From: =?iso-8859-1?q?Ajit=20Anand?= <ajit_anand@yahoo.com>
Subject: Re: kernel oops loading Doc2000
To: dwmw2@infradead.org
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

i tried after applying the new cvs patches and now it
hangs as soon as i do "modprobe -a docprobe"
 the output of the same is 

Mar 13 23:39:10 test insmod: Note: /etc/modules.conf
is more recent than /lib/modules/2.4.18/modules.dep
Mar 13 23:39:10 test kernel: MTD_open
Mar 13 23:39:10 test kernel: MTD_open
Mar 13 23:39:19 test kernel: NFTL driver: nftlcore.c
$Revision: 1.86 $, nftlmount.c $Revision: 1.28 $
Mar 13 23:39:19 test insmod: Note: /etc/modules.conf
is more recent than /lib/modules/2.4.18/modules.dep
Mar 13 23:39:19 test kernel: Possible DiskOnChip with
unknown ChipID FF found at 0xc8000
Mar 13 23:39:19 test kernel: Possible DiskOnChip with
unknown ChipID FF found at 0xca000
Mar 13 23:39:19 test insmod: Note: /etc/modules.conf
is more recent than /lib/modules/2.4.18/modules.dep
Mar 13 23:39:23 test kernel: DiskOnChip 2000 found at
address 0xCC000
Mar 13 23:39:23 test kernel: Flash chip found:
Manufacturer ID: 98, Chip ID: 75 (Toshiba
TC58256FT/DC)
Mar 13 23:39:23 test kernel: 2 flash chips found.
Total DiskOnChip size: 64 MiB
Mar 13 23:39:23 test kernel: mtd: Giving out device 0
to DiskOnChip 2000
Mar 13 23:39:23 test kernel: NFTL: UnitSizeFactor 0x00
detected. This violates the spec but we think we know
what it means...
Mar 13 23:39:25 test kernel:  nftla:<0>Kernel panic:
unknown: request list destroyed

now i'm well and truly lost????????


ajit


---------------------------

ajit_anand@yahoo.com said:
> it modprobe's the docprobe without an oops but then
gives an error
> Could not find valid boot record Could not mount
nftl device  

OK. cvs up -A and try again.

--
dwmw2



__________________________________________________
Do You Yahoo!?
Everything you'll ever need on one web page
from News and Sport to Email and Music Charts
http://uk.my.yahoo.com
