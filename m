Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19FUOO-0000o3-Oh
	for <linux-mtd@lists.infradead.org>; Tue, 13 May 2003 08:40:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Dharm <mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIEEHGDAAA.mdharm@momenco.com>
References: <NEBBLJGMNKKEEMNLHGAIEEHGDAAA.mdharm@momenco.com>
Message-Id: <1052811622.10222.42.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 13 May 2003 08:40:22 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DiskOnChip 2000 128Mb problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-05-13 at 02:42, Matthew Dharm wrote:
> Well, I found at least one part of the problem.
> 
> The Linux driver doc2001.c assumes that addresses (in DoC_Address) are
> 23 bits max.  On some parts, the max is 31, so an extra write of the
> address component is needed.

Interesting. If we make this change, does it still work with the older
units?

>                                              ... the string "ANAND" is
> somewhat rare -- the string "BNAND" is significantly more common.
> 
> I'm starting to wonder if M-Systems has changed their on-chip data
> format from NFTL to something else....

Definitely looks that way. Some reverse-engineering (or hopefully
perhaps assistance from M-Systems) is required. A lot of the format
looks the same as 'normal' NFTL; it may just be the MediaHeader block
which has changed. 

Alternatively, given that it's just a bunch of NAND flash chips, we
could fix up the incompatibility between the DiskOnChip driver and the
normal NAND drivers, then you could use JFFS2 or YAFFS on it. Real file
systems directly on the flash make a whole lot more sense than this
pretending-to-be-a-block-device nonsense anyway.

-- 
dwmw2
