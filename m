Received: from dns.uswo.net ([207.153.115.5] helo=mail.uswo.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vpGE-0003PW-00
	for <linux-mtd@lists.infradead.org>; Sat, 05 May 2001 00:45:23 +0100
From: "Jason Walker" <jasonw@uswo.net>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: "MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: RE: MTD and 2.4 
Date: Fri, 4 May 2001 19:46:12 -0400
Message-ID: <NEBBIDMHCLDPHDHEGDMLOEGKCBAA.jasonw@uswo.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
In-Reply-To: <29965.989011648@redhat.com>
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

ok, this appears to be working a little better. at least I get different
errors :)
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
DiskOnChip Millennium found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: E6 (Toshiba blah blah..)
same message 3 more times
4 flash chips found, Total DiskOnChip size: 32mbytes
mtd: Giving out device 0 to DiskOnChip Millennium
M-Systems NAND Flash Transition Layer driver. (C) 1999 MVHI
$Id blah blah blah
mtd->read = c0174410, size = 33554432, erasesize = 8192
NFTL_setup
Cannot calculate an NFTL geometry to match size of 0xfa60.
Using C:1001 H:16 S:4 (== 0xfa40 sects)
Partition check:
	nftla:<6>NFTL_request
NFTL Read request, from sector 0x000 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 0 (req->nr_sectors == 2)
NFTL read request completed OK
end_request(1)
	nftla1
...TCP junk...
request_module[block-major-100]: root fs not mounted
cannot open root device 6401 blah blah blah

So, it ends the same :P
as I mentioned before, it installs to fla1 before, on the 2.2.x kernel that
I don't have the source for...would this be a problem? Also, I am using
dLILO to boot this kernel. lilo.conf is using /dev/fla1...is that wrong? I
have NFTL support, but no FTL support.  I am going to try to make it boot
off of /dev/nftla1 and see what happens. I am not confident it will help
though. thanks for the time!

Jason

-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of David Woodhouse
Sent: Friday, May 04, 2001 5:27 PM
To: Jason Walker
Cc: MTD Mailing List
Subject: Re: MTD and 2.4



jasonw@uswo.net said:
>  I did as you said, enabled CONFIG_MTD_DOC2001 and checked out the
> #define in docprobe.c and it was already enabled.

> request_module[doc2000]: Root fs not mounted

Argh. Sorry, _disable_ DOC_SINGLE_DRIVER and use doc2001.
The less likely to work alternative is to leave it _enabled_ and use
doc2000. The message above is because it's trying to load the doc2000
driver, because DOC_SINGLE_DRIVER is enabled and the doc2000 option isn't
(only the doc2001 option).

This will be made less complex - the DOC_SINGLE_DRIVER is an attempt to
merge it all into one, but some people still find the doc2001 driver to be
more reliable.

--
dwmw2



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
