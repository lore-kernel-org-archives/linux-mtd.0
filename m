Received: from gw-eur5.philips.com ([161.85.125.12])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEQOF-0002lH-6F
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 06:20:40 -0500
Received: from gw-eur4.philips.com (gw-eur4.philips.com [161.85.125.10])
	by gw-eur5.philips.com (Postfix) with ESMTP id DA9204AF79
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 10:55:13 +0000 (UTC)
Received: from smtpscan-eur6.philips.com (smtpscan-eur6.mail.philips.com
	[130.144.57.169])
	by gw-eur4.philips.com (Postfix) with ESMTP id A53BE49730
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 10:55:01 +0000 (UTC)
Received: from smtpscan-eur6.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 6737EA5
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 10:55:01 +0000 (GMT)
Received: from smtprelay-eur1.philips.com (smtprelay-eur1.philips.com
	[130.144.57.170])
	by smtpscan-eur6.philips.com (Postfix) with ESMTP id 2F8A662
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 10:55:01 +0000 (GMT)
Received: from beorn.natlab.research.philips.com
	(beorn.natlab.research.philips.com [130.145.139.38])
	by smtprelay-eur1.philips.com (Postfix) with ESMTP id 157F32539
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Mar 2005 10:55:01 +0000 (GMT)
Received: from bard (bard [130.145.131.125])
	by beorn.natlab.research.philips.com (8.12.11/8.12.11) with ESMTP id
	j2OAt048004558
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2005 11:55:00 +0100
Message-ID: <000f01c5305f$ed1cef50$9c9c9182@ddns.htc.nl.philips.com>
From: "S. van Beek" <nlv11891@natlab.research.philips.com>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 24 Mar 2005 11:55:00 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Flash chips detected?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there

Im a student working on embedded linux on a fpga board with powerpc core and
some flash.
I compiled my kernel (montavista linux 3.1 -> kernel 2.4.20) with mtd
support. During boot I see the following messages concerning flash / mtd:

physmap flash device: 400000 at 81000000
CFI: Found no phys_mapped_flash device at location zero
JEDEC: Found no phys_mapped_flash device at location zero

And:

Creating 2 MTD partitions on "phys_mapped_flash":
0x00000000-0x00080000 : "reserved"
ftl_cs: FTL header not found.
0x00080000-0x00400000 : "flashdisk"
ftl_cs: FTL header not found.

But this confuses me. First i see the message 'Found no phys_mapped_flash
device at location zero' but then still some partitions are created
Are there any flash chips detected or not?

If I look at my /proc/mtd, I do see those two partitions there, but trying
to unlock / format them gives me an errors:

# ftl_format /dev/mtd0
open failed: Permission denied

# flash_unlock  /dev/mtd0
Could not open mtd device: /dev/mtd0

The entries in the /dev dir do exist.
Any help would be appreciated

Regards
Sander van Beek
