From: David Woodhouse <dwmw2@infradead.org>
To: Manfred Gruber <gruber.m@utanet.at>
In-Reply-To: <200408201327.16211.gruber.m@utanet.at>
References: <200408201300.05579.gruber.m@utanet.at>
	<200408201315.01078.gruber.m@utanet.at>
	<1093000400.14552.3411.camel@hades.cambridge.redhat.com>
	<200408201327.16211.gruber.m@utanet.at>
Content-Type: text/plain
Message-Id: <1093002009.14552.3478.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 20 Aug 2004 12:40:10 +0100
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

On Fri, 2004-08-20 at 13:27 +0200, Manfred Gruber wrote:
> But the output of device size and erase size?
> When it should be then seen as one chips, why is  erase size 0x10000 and 
> device size 0x200000 ?? That for one chip ....

Yes, that's the debugging dump of the CFI table. You should find
different results in /proc/mtd

-- 
dwmw2
