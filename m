Received: from gw-eur4.philips.com ([161.85.125.10])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DEmLo-0001pw-OE
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 05:47:37 -0500
Received: from smtpscan-eur6.philips.com (smtpscan-eur6.mail.philips.com
	[130.144.57.169])
	by gw-eur4.philips.com (Postfix) with ESMTP id 6B36A49702
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 10:47:37 +0000 (UTC)
Received: from smtpscan-eur6.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 3C0947F
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 10:47:37 +0000 (GMT)
Received: from smtprelay-eur1.philips.com (smtprelay-eur1.philips.com
	[130.144.57.170])
	by smtpscan-eur6.philips.com (Postfix) with ESMTP id 1BD7479
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 10:47:37 +0000 (GMT)
Received: from beorn.natlab.research.philips.com
	(beorn.natlab.research.philips.com [130.145.139.38])
	by smtprelay-eur1.philips.com (Postfix) with ESMTP id EFB02212C
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 10:47:36 +0000 (GMT)
Received: from bard (bard [130.145.131.125])
	by beorn.natlab.research.philips.com (8.12.11/8.12.11) with ESMTP id
	j2PAlaHT011808
	for <linux-mtd@lists.infradead.org>; Fri, 25 Mar 2005 11:47:36 +0100
Message-ID: <001d01c53128$0f74e8a0$9c9c9182@ddns.htc.nl.philips.com>
From: "S. van Beek" <nlv11891@natlab.research.philips.com>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 25 Mar 2005 11:47:37 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: mtd_open errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Im using flash memory on a memec virtex II pro vp7 design board with
communications 2 module. I'm running Linux kernel 2.4.20 from Montavista
with mtd support compiled in the kernel. I have debugging set to 3.
I see the mtd partitions being created during boot and also my /proc/mtd
looks good.
But when I try to do anything with the devices I get errors:

# flash_unlock /dev/mtd/1
MTD_open
Could not open mtd device: /dev/mtd/1

# ftl_format /dev/mtd/1
MTD_open
open failed: Permission denied

My first partition is flagged read only in the partitions struct, the second
has no flags set so should be writeable?
I could use some clues on what could be wrong.

Kindest regards

Sander van Beek
