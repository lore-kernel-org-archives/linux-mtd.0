Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19E8od-00041g-8M
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 15:25:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Dharm <mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIKEFKDAAA.mdharm@momenco.com>
References: <NEBBLJGMNKKEEMNLHGAIKEFKDAAA.mdharm@momenco.com>
Message-Id: <1052490354.23135.208.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 09 May 2003 15:25:54 +0100
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

On Thu, 2003-05-08 at 19:04, Matthew Dharm wrote:
> Well, now we may have found part of the problem -- the label on the
> chip says "DiskOnChip 2000" with a part number of MD2202-D128-V3
> 
> So is that a 2000 or Millennium?  If it's really a 2000, then the
> driver is detecting it incorrectly.

It's probably a Millennium.

> I presume nanddump works on the /dev/mtd0 node?

Yes.

-- 
dwmw2
