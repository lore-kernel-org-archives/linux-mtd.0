Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QHkIV-0007z7-5K
	for linux-mtd@lists.infradead.org; Wed, 04 May 2011 22:11:55 +0000
Received: by vxd2 with SMTP id 2so2070846vxd.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 May 2011 15:11:54 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 May 2011 18:11:54 -0400
Message-ID: <BANLkTinZP-F0GG1Jx0fib6CpGyLX21L0ug@mail.gmail.com>
Subject: [PATCH v2 0/3] Free space fixup on first mount
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
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


Changes since v1: implemented Artem's suggestions:
- Renamed "LEB fixup" to "Free space fixup" for clarity
- Remap LEBs with free space regardless of flags/type
- Unmap completely free/empty (but currently taken) LEBs

-- 
Matthew L. Creech
