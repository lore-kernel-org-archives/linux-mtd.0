Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QITyg-0004Dl-TW
	for linux-mtd@lists.infradead.org; Fri, 06 May 2011 22:58:31 +0000
Received: by iyb39 with SMTP id 39so3801943iyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 06 May 2011 15:58:29 -0700 (PDT)
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] UBIFS: Free space fixup on first mount
Date: Fri,  6 May 2011 18:58:21 -0400
Message-Id: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The following changes add a superblock option to UBIFS indicating that
it needs to be scanned for LEBs with empty pages the first time it's
mounted.  This is needed because images programmed using "nandwrite"
may contain empty pages, which UBIFS intends to be erased but which
may be programmed as real data.  This causes problems on some NAND
flashes, as described here:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat

When this flag is set, the FS is scanned for any in-use LEBs with one
or more free pages, and these LEBs are remapped (which erases the
blank pages).


Changes since v3 (Artem):
- Free buffer used for reading superblock
- Remove unnecessary buffer-length alignment
- Fixup the log area
