Received: from be1ssnxpe1.nxp.com ([57.67.164.69])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mji38-0000PX-Js
	for linux-mtd@lists.infradead.org; Fri, 04 Sep 2009 23:18:39 +0000
Received: from EU1RDCRDC1VW024.exi.nxp.com ([134.27.176.169])
	by be1ssnxpe1.nxp.com (8.14.3/8.14.3) with ESMTP id n84NIUA7021389
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Sat, 5 Sep 2009 01:18:30 +0200
From: Kevin Wells <kevin.wells@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Sat, 5 Sep 2009 01:18:28 +0200
Subject: 4GiB support and huge block (4K) page support
Message-ID: <083DF309106F364B939360100EC290F8041AB59EFD@eu1rdcrdc1wx030.exi.nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm new to the list, but have been looking at the NAND and MTD code for a w=
hile...

I have a 4G Micron FLASH organized as 8192 blocks * 128 pages * 4096/bytes =
per page (+218 spare bytes/page).

I've temporarily added an entry to nand_ids.c to use this device...
{"NAND 4GiB 3,3v 8-bit", 0xD7, 4096, 4096, (512 * 1024), LP_OPTIONS}

I've heard tell of some people having 4G NAND devices working under MTD 2.6=
.28, but there are overflows in the
nand_base, nand_bbt, and some of the MTD code when I used 4G. I looked at t=
he 2.6.30 code and things
look better, but still not quite right. I've been chaning the code to suppo=
rt 4G, but when I fix something in
one area, something further up in the code still needs some work.

I guess the question is am I fighting an uphill battle trying to get this t=
o work and has this been done by
someone else before? Are there currently 4G+ NAND devices to work correctly=
 under MTD? Would it make sense
to update the kernel version to 2.6.30 to get this needed support?

thanks much!
Kevin Wells
NXP Semiconductors
