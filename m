From: David Woodhouse <dwmw2@infradead.org>
To: Manfred Gruber <gruber.m@utanet.at>
In-Reply-To: <200408201315.01078.gruber.m@utanet.at>
References: <200408201300.05579.gruber.m@utanet.at>
	<1092999456.14552.3387.camel@hades.cambridge.redhat.com>
	<200408201315.01078.gruber.m@utanet.at>
Content-Type: text/plain
Message-Id: <1093000400.14552.3411.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 20 Aug 2004 12:13:21 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Number of CFI chips ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-08-20 at 13:15 +0200, Manfred Gruber wrote:
> phys_mapped_flash: Found 2 x16 devices at 0x0 in 32-bit bank

It found two devices, in a pair. After that, it treats them as one
'chip' because they're interleaved and so they do everything together.

> number of CFI chips: 1

That really means one interleaved _pair_ of chips.

-- 
dwmw2
