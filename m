Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GFhr-00089Q-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 09:39:07 +0000
Subject: Re: GRUB
From: Henrik Nordstrom <hno@marasystems.com>
To: Erik Smit <zoiah@zoiah.net>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20021122152105.20437.qmail@timmy.zylon.net>
References: <20021122152105.20437.qmail@timmy.zylon.net>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 25 Nov 2002 11:09:35 +0100
Message-Id: <1038218975.21459.3.camel@henrik.marasystems.com>
Mime-Version: 1.0
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

If you used doc_loadbios to install GRUB and the binary partition
(before the NFTL disk on the flash) was smaller than your GRUB image
then doc_loadbios overwrote the NFTL table of the DOC flash. 

The safest way to install the GRUB "bios" on a DOC is to use mSys
DFORMAT 5.x from DOS. But this requires a version of the GRUB DOC patch
which is compatible with DFORMAT 5.x (there is a small undocumented
difference in the NFTL header between DFORMAT 4.x and 5.x). The
grub-2002-10-08-doc.patch should work I think. Earlier GRUB patches
won't work. 


The alternative way is to use doc_loadbios and nftl_format from Linux
but you will then need to calculate all the offsets manually IIRC, and
there reportedly is critical issues if you have the NFTL Linux driver
loaded while doing this.

Regards
Henrik


fre 2002-11-22 klockan 16.21 skrev Erik Smit: 
> Hi Everybody, 
> 
> I just installed grub-0.92 on a DOC Millenium, however this appears to have 
> overwritten the original partition table: 
> 
> Could not find valid boot record
> Could not mount NFTL device 
> 
> Since the documentation states "DO NOT EVER USE THE nftl_format UTILITY 
> WITHOUT FIRST SEEKING ADVICE ON THE MAILING LIST. It will erase all blocks 
> on the device, potentially losing the factory-programmed information about 
> bad blocks. (Someone really ought to fix it one of these days - ed)", what 
> should I do? 
> 
> Thanks in Advance, 
> 
> Erik Smit 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
