From: David Woodhouse <dwmw2@infradead.org>
To: Jonathan McDowell <noodles@earth.li>
In-Reply-To: <20060520141011.GJ7570@earth.li>
References: <20060518160940.GS7570@earth.li> <20060520141011.GJ7570@earth.li>
Content-Type: text/plain
Date: Sun, 21 May 2006 18:12:58 +0100
Message-Id: <1148231578.12285.5.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Add Amstrad Delta NAND support.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-05-20 at 15:10 +0100, Jonathan McDowell wrote:
> Ok, taking the comments on board let's try again.
> 
>  * Use ndelay(40) instead of udelay(0.04). This will involve a longer
>    delay, but works fine and will take advantage of ndelay once ARM
>    stops using the generic fallback.
>  * Fixup errant spacing.
>  * Make ams_delta_init static.

Applied; thanks.

-- 
dwmw2
