Subject: Re: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't
	work when flash-based bbt not enabled (fwd)
From: David Woodhouse <dwmw2@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0610230928360.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610230928360.25906@lnxricardw.se.axis.com>
Content-Type: text/plain
Date: Mon, 23 Oct 2006 10:52:21 +0100
Message-Id: <1161597141.19446.276.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-10-23 at 09:33 +0200, Ricard Wanderlof wrote:
> (As note, it seems to be that logically, it shouldn't be necessary to set 
> both length variables, as one appears to be for the main buffer, and 
> one for the oob buffer, but this is how it is done in several places, 
> including the code for the mtd character device MEMWRITEOOB and MEMREADOOB
> ioctls. I'm not sure if this is a temporary solution during some rework of 
> the mtd infrastructure, or whether there is a deeper thought here.)

Hm. That seems wrong to me. If we don't want to read or write the main
area, we should set ops.len to zero. And if that doesn't work, it should
probably be fixed.

I'd rather see a patch which fixes that.

-- 
dwmw2
