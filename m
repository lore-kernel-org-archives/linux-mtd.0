Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Ddmo2-0004od-WB
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2005 06:20:10 -0400
Received: from dsl-213-023-243-025.arcor-ip.net ([213.23.243.25]:39720
	helo=zappa) by mail.ku-gbr.de with esmtpa (Exim 4.50 #1 (Debian))
	id 1Ddmnx-0006eB-Bg
	for <linux-mtd@lists.infradead.org>; Thu, 02 Jun 2005 12:20:01 +0200
Received: from konsti by zappa with local (Exim 3.36 #1 (Debian))
	id 1Ddmnv-00030P-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 Jun 2005 12:19:59 +0200
Date: Thu, 2 Jun 2005 12:19:59 +0200
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050602101959.GB11524@zappa>
References: <20050601134130.GA19482@synertronixx3>
	<429E87D5.5050906@thattiko.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429E87D5.5050906@thattiko.net>
Subject: Re: Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ratan Panneerselvam <ratan@thattiko.net> [Thu, Jun 02, 2005 at 12:15:17AM -0400]:

> However on the 2.6.12 from cvs@ftp.linux-mips.org, the same map driver
> gives an oops similar to yours.

He, weird...

at first, what I don't understand in my quoted code snippets is the
following:

Creating 5 MTD partitions on "scb9328_flash":             
0x00000000-0x00020000 : "U-boot"             
0x00020000-0x00040000 : "U-boot_env"
cfi_intelext_unlock: lock status before, ofs=0x00000000, len=0x00020000
cfi_intelext_unlock: lock status after, ret=-1070912512                
0x00040000-0x00240000 : "kernel"                       
cfi_intelext_unlock: lock status before, ofs=0x00000000, len=0x00200000
cfi_intelext_unlock: lock status after, ret=-1070913024                
0x00240000-0x00740000 : "root"                         
cfi_intelext_unlock: lock status before, ofs=0x00000000, len=0x00500000
cfi_intelext_unlock: lock status after, ret=-1070913536                
0x00740000-0x01000000 : "fs"                           
cfi_intelext_unlock: lock status before, ofs=0x00000000, len=0x008C0000
cfi_intelext_unlock: lock status after, ret=-1070914048

That comes from 
cfi_intelext_unlock(mtd, 0, mtd->size);
being called, the cfi_varsize_frob functions are all commented out,
only the DEBUG_LOCK_BITS are functional.

Why is cfi_intelext_unlock() called with ofs=0, is that correct?
Shouldn't there be hardware addresses?

Regards, Konsti
