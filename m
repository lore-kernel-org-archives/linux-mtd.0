Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FRlHI-0007VI-TP
	for linux-mtd@lists.infradead.org; Fri, 07 Apr 2006 03:21:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id 3AB155E430A
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Apr 2006 09:21:03 +0200 (CEST)
Received: from lin01.mn-solutions.de (p54B2A041.dip0.t-ipconnect.de
	[84.178.160.65])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id C6E8B5E4103
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Apr 2006 09:21:01 +0200 (CEST)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id BE9831E0102
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Apr 2006 08:27:42 +0200 (CEST)
From: Holger Schurig <h.schurig@mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Fri, 7 Apr 2006 08:28:33 +0200
References: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>
In-Reply-To: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="big5"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200604070828.33546.h.schurig@mn-solutions.de>
Subject: Re: Problem of "JFFS2 summary"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at
> 0x00080000: 0x00b0 instead jffs2_scan_eraseblock(): Magic bitmask
> 0x1985 not found at 0x00080004: 0x00b0 instead

I got similar problems with stock kernel 2.6.16.1 and sumtool from 
mtd-utils, CVSDATE 2006-02-23.

After this, I thought "nice idea", recompiled my kernel without 
CONFIG_JFFS2_SUMMARY and flashed the normal jffs2 image to get a 
working system.

However, no one answered my question from 2006-04-03 about 
JFFS2/JFFS2+SUMMARY, so I guess not many people here are either willing 
to answer (e.g. no time, ignoring silly questions) or only a few are 
working with JFFS2+SUMMARY.
