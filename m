Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19EB2Z-0004cL-Qa
	for <linux-mtd@lists.infradead.org>; Fri, 09 May 2003 17:48:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Matthew Dharm <mdharm@momenco.com>
In-Reply-To: <NEBBLJGMNKKEEMNLHGAIGEGDDAAA.mdharm@momenco.com>
References: <NEBBLJGMNKKEEMNLHGAIGEGDDAAA.mdharm@momenco.com>
Message-Id: <1052498905.9960.8.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 09 May 2003 17:48:26 +0100
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

On Fri, 2003-05-09 at 17:40, Matthew Dharm wrote:
> Is it normal for a DoC 2000 to be detected as a Millenium?

No, but it's not normal for its contents to be read back as 0x01 0x02
0x03 etc. either: )

> I've already checked the bus width and timing.

And it's definitely not set to 16-bit? -ECONFUSED.


-- 
dwmw2
