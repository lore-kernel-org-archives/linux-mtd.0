From: David Woodhouse <dwmw2@infradead.org>
To: liu zixing <liuzixing@hotmail.com>
In-Reply-To: <BAY7-F78Z0By6mGrV6R0003f439@hotmail.com>
References: <BAY7-F78Z0By6mGrV6R0003f439@hotmail.com>
Content-Type: text/plain
Message-Id: <1078996802.867.61.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 11 Mar 2004 09:20:02 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: ReadDOC and WriteDOC error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-03-11 at 17:09 +0800, liu zixing wrote:
> hello, would you please help me:
>     I use a DiskOnChip 2000 (MD2202-D32)  on a XScale IXP425 board.
>     There is one  8M flash which is selected by CS0, 
>      and  one DiskOnChip I mention above which is  selected by CS1.

Not enough information. Tell me precisely how it's wired up and how the
bus is configured.

Btw, you may be able to use your onchip DMA controllers with this. :)

-- 
dwmw2
