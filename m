Received: from fmfdns01.fm.intel.com ([132.233.247.10] helo=calliope1.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WEKz-0005Hb-00
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 10:21:02 +0000
Received: from fmsmsxvs041.fm.intel.com (fmsmsxv041-1.fm.intel.com [132.233.48.109])
	by calliope1.fm.intel.com (8.9.1a+p1/8.9.1/d: relay.m4,v 1.49 2002/01/25 02:16:58 root Exp $) with SMTP id KAA01549
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 10:32:07 GMT
Received: from fmsmsx29.FM.INTEL.COM ([132.233.42.29])
 by fmsmsxvs041.fm.intel.com (NAVGW 2.5.1.16) with SMTP id M2002013102330019254
 for <linux-mtd@lists.infradead.org>; Thu, 31 Jan 2002 02:33:00 -0800
Message-ID: <413FBB0BA5AED1119122000083234B1A01DD2963@alpha.igk.intel.com>
From: "Kolakowski, Mikolaj" <Mikolaj.Kolakowski@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Support for Intel 28F800B3B?
Date: Thu, 31 Jan 2002 11:31:44 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-2"
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

I have IXP1200 eval board equiped with two 28F800B3B. Flashes are 16bit
wide, data bus is 32 bit wide.
These configuration works fine in RedBoot. The problem is in linux kernel
booting, MTD doesn't recognize any flash.
Whole flash is 0x200000 big and mapped at 0x00000000. I have tried to
identify flashes using CFI and JEDEC probe but both failed.
 
I have done some additional tests, including raw writing and reading to the
flash, the result is that I have read always 0xfffff... instead of 
flash data. I think that I should at least read redboot image?
 
Anybody could help me?
 
Mikolaj
