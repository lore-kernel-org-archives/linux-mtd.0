Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh4dJ-0005t8-Bn
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 17:53:34 +0000
Received: from [10.12.160.50] (ld-irv-0074.broadcom.com [10.12.160.50])
	by mail-irva-12.broadcom.com (Postfix) with ESMTP id D208F69CB0 for
	<linux-mtd@lists.infradead.org>; Thu, 5 Aug 2010 10:53:13 -0700 (PDT)
Message-ID: <4C5AFA88.3040009@broadcom.com>
Date: Thu, 5 Aug 2010 10:53:12 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: NAND ECC Layout, sysfs question
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I'm trying to replace the following structure (in mtd-abi.h) and its 
corresponding ioctl with a larger, dynamic form exported via sysfs. 
We're running out of room in the eccpos and oobfree arrays on larger chips:

#define MTD_MAX_OOBFREE_ENTRIES 8
/*
  * ECC layout control structure. Exported to userspace for
  * diagnosis and to allow creation of raw images
  */

struct nand_ecclayout {
         __u32 eccbytes;
         __u32 eccpos[64];
         __u32 oobavail;
         struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
};

First, is it a smart idea to use sysfs?

Second, if we go with sysfs, there seem to be many potential ways to 
structure the "eccpos" and "oobfree" arrays. Bearing in mind the 
convention of either one entry per file or a space-separated array of 
values as well as the file limit of PAGE_SIZE (approx. 4096 bytes?), 
there are several options with which I'm having difficulty. Formats 
could be as follows:
1) Single file: 0 1 2 3 6 7 10 12
2) Single file: 0-3 6-7 10 12
3) Multiple files:
     file 0: 0 3
     file 1: 6 7
     file 2: 10 10
     file 3: 12 12
It seemed to me like (3) was the cleanest while ensuring we fit under 
PAGE_SIZE even if the OOB gets to be 1000+ bytes, so no one ever has to 
come back and redo this :) Unfortunately, directories and a dynamic 
number of attributes/files aren't really straightforward, hence my next 
questions...

Third, if I were to create directories under the "mtdX" sysfs directory, 
what's the best way to do this? Explicitly creating and filling in a 
kobject? Or creating a new "device"? Or are there other, better options?

I've already coded parts of a few of these options, but they all have 
various difficulties and can easily become ugly pieces of code (at least 
with my limited skill at sysfs).

Thanks,
Brian
