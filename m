Received: from fmr01.intel.com ([192.55.52.18] helo=hermes.fm.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BN3J-00041T-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 22:56:49 +0100
Received: from petasus.fm.intel.com (petasus.fm.intel.com [10.1.192.37])
	by hermes.fm.intel.com (8.11.6/8.11.6/d: outer.mc,v 1.48 2002/05/24 00:39:04 root Exp $) with ESMTP id g4OLvMr16843
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 21:57:22 GMT
Received: from fmsmsxvs040.fm.intel.com (fmsmsxv040-1.fm.intel.com [132.233.48.108])
	by petasus.fm.intel.com (8.11.6/8.11.6/d: inner.mc,v 1.22 2002/05/24 00:38:22 root Exp $) with SMTP id g4OLso528695
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 21:54:50 GMT
Received: from fmsmsx26.fm.intel.com ([132.233.42.26])
 by fmsmsxvs040.fm.intel.com (NAVGW 2.5.1.16) with SMTP id M2002052414560817815
 for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 14:56:08 -0700
Message-ID: <2B4461BF89BAD511A86100508B66D538026D0D88@fmsmsx112.fm.intel.com>
From: "Conley, Christopher" <christopher.conley@intel.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Jedec probe for strange 28F800B3 chips (patch)
Date: Fri, 24 May 2002 14:56:44 -0700
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

I apologize for responding so late, 

the configuration is actually for the 5V bottom boot part.

Here is the datasheet for it:
ftp://download.intel.com/design/flcomp/datashts/29059907.pdf



Chris
---------
Disclaimer: These opinions are mine and mine alone, and do not reflect those
of my employer or its agents.



-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Colin Cross
Sent: Wednesday, May 08, 2002 2:06 PM
Subject: Jedec probe for strange 28F800B3 chips (patch)


I'm working on an embedded system that has two Flash chips labeled
28F800B3-10BD.  The Intel datasheets say they should have an identifier
of 0x8893 (which matches jedec_probe.c), but they report an identifier
of 0x889D.  I found one errata datasheet that says the correct
identifier for these chips is in fact 0x889D.  However, the block map of
this chip is completely different from the one described in the
datasheets.  It has 1 16kB block, 2 8kB blocks, 1 96kB, and 7 128kB
blocks.  This matches the block map for some other random Intel 8Mb
flash chip, but I can't find any datasheets that give this block map and
identifier together.  I've added these chips to jedec_probe.c, and they
work fine once added, but I'm at a loss as to why these chips don't
agree with the datasheets.  Can anyone offer any insight?  Does anyone
have 28F800B3 chips that follow the datasheet?  I've attached a patch
that adds support for them, but I'm not sure what to call them (Intel
28F800B3B version 2? for now).
