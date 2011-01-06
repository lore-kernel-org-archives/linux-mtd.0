Received: from mail-pz0-f49.google.com ([209.85.210.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Paeox-0007gT-Mp
	for linux-mtd@lists.infradead.org; Thu, 06 Jan 2011 01:39:20 +0000
Received: by pzk30 with SMTP id 30so3544607pzk.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Jan 2011 17:39:16 -0800 (PST)
From: Charles Manning <cdhmanning@gmail.com>
To: linux-mtd@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: [PATCH 0/2] Add optional mtd nand alignment for subpage reading
Date: Thu,  6 Jan 2011 14:39:00 +1300
Message-Id: <1294277942-1252-1-git-send-email-cdhmanning@gmail.com>
Cc: Charles Manning <cdhmanning@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Subpage reading already provides a certain degree of alignment in that it
aligns the reads to 16-bits if the bus is 16-bits wide.

For some situations this is not enough. For eample, the OMAP2 prefetch
engine only works with u32 aligned buffers and read sizes.

This patch set adds a mechanism to plug in an alignment function and
provides an example using the omap2 nand driver.

Comments welcome

-- Charles
