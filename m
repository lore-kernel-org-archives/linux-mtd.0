From: David Woodhouse <dwmw2@infradead.org>
To: Komal Shah <komal_shah802003@yahoo.com>
In-Reply-To: <20050107092806.72155.qmail@web53604.mail.yahoo.com>
References: <20050107092806.72155.qmail@web53604.mail.yahoo.com>
Content-Type: text/plain
Date: Fri, 07 Jan 2005 12:31:14 +0000
Message-Id: <1105101074.11753.3.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Chip mapping AM29LV320D
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2005-01-07 at 01:28 -0800, Komal Shah wrote:
> 
> We are going to use the same chip on our custom board.
> As per the thread, I understood that we need to write
> "chip mapping driver" taking as example from physmap.c
> - with specifying related information of this chip. 
> 
> But, if anyone had developed the same mapping driver
> then they can share it with me.

But your board is a _custom_ board. How could anyone have written the
same mapping driver already? Nobody has a board the same as yours.

The mapping driver just sets things up correctly for access to the flash
chips, depending on the physical address and size etc. That's all
specific to _your_ board.

I think the AM29LV320D is CFI-compliant so you don't _need_ specific
support for it. It should just work with cfi_probe.

-- 
dwmw2
