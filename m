Received: from web20412.mail.yahoo.com ([216.136.227.10])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17PS5i-0004CZ-00
	for <linux-mtd@lists.infradead.org>; Tue, 02 Jul 2002 19:09:30 +0100
Message-ID: <20020702170051.34184.qmail@web20412.mail.yahoo.com>
Date: Tue, 2 Jul 2002 10:00:51 -0700 (PDT)
From: Roy Lauer <rlaor@yahoo.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: (no subject)
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

I'm using DOC 2000, and the latest mtd sw from the
CVS.

Following is what I get a boot time (I do NOT yet boot
from the flash):

> Using configured DiskOnChip probe address 0xf0400000
> DiskOnChip 2000 found at address 0xF0400000
> Flash chip found: Manufacturer ID: 98, Chip ID: 73
(Toshiba TH58V128DC)
> 4 flash chips found. Total DiskOnChip size: 64 MiB
> mtd: Giving out device 0 to DiskOnChip 2000
> NFTL driver: nftlcore.c $Revision: 1.86 $,
nftlmount.c $Revision: 1.28 $
> NFTL_notify_add for DiskOnChip 2000
> NFTL_setup
> NFTL: UnitSizeFactor 0x00 detected. This violates
the spec but we think we know what it means...
> Cannot calculate an NFTL geometry to match size of
0x1ed20.
> Using C:986 H:16 S:8 (== 0x1ed00 sects)
> Partition check:
>  nftla: nftla1

The main problem (which cannot be seen above) is a
delay of about 90 seconds after 
"Flash chip found: ...". The system seems to stuck and
only after a timeout 0f 90 seconds it continues 
with "4 flash chips found...". What can be the reason
for that?

Other problems are UnitSizeFactor=0x00 and the size of
0x1ed20. The driver seems to manage with that. Is this
ok?

Any help will be apreciated.

Roy


__________________________________________________
Do You Yahoo!?
Sign up for SBC Yahoo! Dial - First Month Free
http://sbc.yahoo.com
