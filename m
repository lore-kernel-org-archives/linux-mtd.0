Received: from amdext2.amd.com ([163.181.251.1])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19nm4r-0007aO-0u
	for <linux-mtd@lists.infradead.org>; Fri, 15 Aug 2003 22:25:41 +0100
Received: from SAUSGW01.amd.com (sausgw01.amd.com [163.181.250.21])
	by amdext2.amd.com (8.12.8/8.12.8/AMD) with ESMTP id h7FLOZOI002927
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Aug 2003 16:24:47 -0500 (CDT)
Received: from txexmtab.amd.com (txexmtab.amd.com [163.181.3.203]) by
 amdint2.amd.com (8.12.8/8.12.8/AMD) with ESMTP id h7FLOVGV006557 for
 <linux-mtd@lists.infradead.org>; Fri, 15 Aug 2003 16:24:31 -0500 (CDT)
Message-ID: <BCBC9D21763E5C42BEF10DC3BF958C9E05924FC8@txexmtab.amd.com>
From: jon.hoekwater@spansion.com
To: linux-mtd@lists.infradead.org
Date: Fri, 15 Aug 2003 16:24:30 -0500
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Subject: cfi_cmdset_0002.c support for erase suspend and resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I noticed that support for erase suspend and resume
is present in cfi_cmdset_0001.c but not in cfi_cmdset_0002.c.
After reviewing the files, it seems like the same type
solution could be applied to cfi_cmdset_0002.c for AMD/"AMD 
like" devices.  Is this a correct assessment, or are there 
some pitfalls that I have failed to see ?

I am adding support for the Am29LV640M.

I will add support for the three byte device ID and buffered
writes.  Testing will be done on an Alchemy DbAU1500 using
MontaVista Linux.

What do I need to do to become a contributing developer?

Thanks,
Jon Hoekwater
jon.hoekwater@spansion.com
(512) 602-4252
 
