Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KVUCq-0007kk-Sk
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 16:37:17 +0000
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KVUCm-00021t-VG
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 16:37:13 +0000
Received: from gw-c.sigma-chemnitz.de ([62.153.82.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2008 16:37:12 +0000
Received: from enrico.scholz by gw-c.sigma-chemnitz.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2008 16:37:12 +0000
To: linux-mtd@lists.infradead.org
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: Re: [U-Boot] U-Boot and UBI
Date: Tue, 19 Aug 2008 18:35:23 +0200
Message-ID: <ly8wut9d4k.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1218220016.2328.109.camel@localhost.localdomain>
	<200808112202.24363.sr@denx.de>
	<9c9fda240808120325va530f61q13b4836f9b8202b5@mail.gmail.com>
	<200808121311.27026.sr@denx.de>
	<9c9fda240808121634q7128ed30w40635e34d4a7fcf9@mail.gmail.com>
	<1218633636.10489.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh Boyer <jwboyer@linux.vnet.ibm.com> writes:

>> Yes, we should make a u-boot within one block size since flash
>> only guarantees the first one block as bad block free. e.g.,
>> exactly (128KiB - 2KiB) size if OneNAND case.
>> For this, we need to code or size optimization.  If this is
>> solved, we can use flash as bad block free device with UBI.
>
> An alternative to that is to have a very small IPL that loads
> U-Boot to DRAM as the SPL.

Yes; our implementation of such an IPL (for PXA320) can be found
at

   https://www.cvg.de/people/ensc/elito-mobm320-0.0.4.tar.bz2

This allows to jump into an image either located in a 'bootloader'
volume (which contains U-Boot) or in a 'kernel' image.

Latter is faster (by about 3-5 seconds plus the duplicate UBI
scan within U-Boot) which can make a difference as the IPL itself
needs 3.5 seconds to scan a 1GiB NAND :(


> That would require some relocatable support in U-Boot.

Depends on the system resp. how U-Boot was built (e.g. set its
TEXTADDR so that it does not conflict with the IPL).


Enrico
