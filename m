Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15uYXa-0000SS-00
	for <linux-mtd@lists.infradead.org>; Fri, 19 Oct 2001 13:14:18 +0100
Received: from dwmw2 by passion.cambridge.redhat.com with local (Exim 3.16 #2)
	id 15uYgW-0001ki-00
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2001 13:23:32 +0100
Message-ID: <25D13BA49CC6D31193040040953309CE7F9F@MICSERV>
From: Gareth Williams <gareth@microm-electronics.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: "'lists-mtd@lists.infradead.org'" <lists-mtd@lists.infradead.org>
Subject: RE: Quick question. 
Date: Fri, 19 Oct 2001 13:36:40 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi David.

Thankyou for the advice you gave me earlier last week.

I wonder if you would take a couple of minutes to look over the following
message the kernel gave me on booting and give your advice.

I managed to finally get the 2.4.12 linux kernel configured & compiled,
after much pratting about with upgrades to gcc & bin utils etc, here is my
kernel config which I specified for the MTD stuff:

(where I have not listed something then I have not included that in the
kernel build)

* Mem tech device support
* NFTL support
* Write support for NFTL (BETA)
NOTE: Mapping drivers for chip access menu has NO SUBMENU!! (pressing enter
on it has no effect).
*	Self contained MTD device drivers>>>>
	*M-Systems DOC & Millennium
	*Advanced detection options for DOC
	*0 - Physical address
	*Probe for 0x55 & 0xAA
	*NAND flash device drivers>>>>>
		*NAND device support
		*Enable ECC

On booting the kernel your stuff correctly detects that I have a DOC2000
with 8MB but fails to create any device special file in /dev, here is a
transcript:

DiskOnChip 2000 found at address 0xD4000
Flash Chip Found: Manufacturer ID: EC, Chip ID: E6 (Samsung KM29U64000)
1 Flash chips found.  Total DiskOnChip size: 8MiB
NFTL Driver: nftlcore.c $ Revision: 1.82 $, nftlmount.c $Revision: 1.23$
ANAND header found @ 0xC000 in mtd0, but ECC read failed (err 1)
ANAND header found @ 0xE000 in mtd0, but ECC read failed (err 1)
Could not find valid boot record.
Could not mount NFTL device.

I hope you can give some advice on this matter, it is probably just a
mistake on my behalf in configuring the kernel.

Thanks in advance.

Gareth Williams.
