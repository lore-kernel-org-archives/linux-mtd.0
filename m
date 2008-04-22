Subject: Re: [PATCH] mtd_dataflash use command allocated on stack
From: David Woodhouse <dwmw2@infradead.org>
To: Vitja Makarov <vitja.makarov@gmail.com>
In-Reply-To: <1207285360.10621.8.camel@vitja-laptop>
References: <1207285360.10621.8.camel@vitja-laptop>
Content-Type: text/plain
Date: Tue, 22 Apr 2008 21:20:38 +0100
Message-Id: <1208895638.9212.673.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-04-04 at 09:02 +0400, Vitja Makarov wrote:
> Hi!
> 
> 
> Currently mtd_dataflash driver has command in their private structure.
> That is only 4 bytes, sometimes actually 8 is needed.
> Also it could be accessed twice before lock is taken.
> 
> This patch moves command to stack.

Is that allowed? The SPI code might DMA from it, surely?

-- 
dwmw2
