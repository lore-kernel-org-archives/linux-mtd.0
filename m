Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SffZq-0004s0-BW
 for linux-mtd@lists.infradead.org; Fri, 15 Jun 2012 23:05:15 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1SffZf-0003IW-Rs
 for linux-mtd@lists.infradead.org; Sat, 16 Jun 2012 01:05:04 +0200
Received: from netrokpix001.spirentcom.com ([96.241.21.98])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Sat, 16 Jun 2012 01:05:03 +0200
Received: from aspam by netrokpix001.spirentcom.com with local (Gmexim 0.1
 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Sat, 16 Jun 2012 01:05:03 +0200
To: linux-mtd@lists.infradead.org
From: Joe Buehler <aspam@cox.net>
Subject: M28W320 incorrect chip ID?
Date: Fri, 15 Jun 2012 19:33:02 +0000 (UTC)
Message-ID: <loom.20120615T211822-727@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The following lines in drivers/mtd/chips/cfi_cmdset_0001.c are suspicious:

#if !FORCE_WORD_WRITE
	{ CFI_MFR_ANY, CFI_ID_ANY, fixup_use_write_buffers, NULL },
#endif
	{ CFI_MFR_ST, 0x00ba, /* M28W320CT */ fixup_st_m28w320ct, NULL },
	{ CFI_MFR_ST, 0x00bb, /* M28W320CB */ fixup_st_m28w320cb, NULL },

There are several issues:

1.  The documentation lists the chip ID as 0x88ba/0x88bb, not 0x00ba/0x00bb.  A
vendor based a patch for the M28W640 part on these lines and it was indeed
broken because of the zeroed high bytes.

2. The fixup_st_m28w320ct function zeroes cfi->cfiq->BufWriteTimeoutTyp, but
fixup_use_write_buffers tests it first because it is earlier in the array.  So
fixup_use_write_buffers should be moved to the end I think.

3. Knowing next to nothing about MTD, I am not clear on what "top" vs. "bottom"
parts are all about.  The card I am using does not have both.  Only one of the
M28W320 fixups is clearing cfi->cfiq->BufWriteTimeoutTyp -- should they both do
that?

Joe Buehler
