Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aHEW6-0003fb-Vo
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 17:38:45 +0000
Received: by mail-pa0-x231.google.com with SMTP id uo6so245385989pac.1
 for <linux-mtd@lists.infradead.org>; Thu, 07 Jan 2016 09:38:09 -0800 (PST)
Date: Thu, 7 Jan 2016 09:38:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: linux-mtd@lists.infradead.org, boris.brezillon@free-electrons.com,
 alex@alex-smith.me.uk, Alex Smith <alex.smith@imgtec.com>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Message-ID: <20160107173806.GG109450@google.com>
References: <1451910884-18710-1-git-send-email-harvey.hunt@imgtec.com>
 <1451910884-18710-3-git-send-email-harvey.hunt@imgtec.com>
 <20160107011546.GT109450@google.com> <568E338E.7000506@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <568E338E.7000506@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 07, 2016 at 09:44:46AM +0000, Harvey Hunt wrote:
> On 07/01/16 01:15, Brian Norris wrote:
> >On Mon, Jan 04, 2016 at 12:34:43PM +0000, Harvey Hunt wrote:
> >>From: Alex Smith <alex.smith@imgtec.com>
> >>
> >>Add a driver for NAND devices connected to the NEMC on JZ4780 SoCs, as
> >>well as the hardware BCH controller. DMA is not currently implemented.
> >>
> >>While older 47xx SoCs also have a BCH controller, they are incompatible
> >>with the one in the 4780 due to differing register/bit positions, which
> >>would make implementing a common driver for them quite messy.
> >>
> >>Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> >>Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> >>Cc: David Woodhouse <dwmw2@infradead.org>
> >>Cc: Brian Norris <computersforpeace@gmail.com>
> >>Cc: linux-mtd@lists.infradead.org
> >>Cc: linux-kernel@vger.kernel.org
> >>Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> >>Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> >>---

[...]

> >I'd be OK taking this patch with the following appended diff squashed
> >in. Thoughts?
> 
> It'd be great if you could do that.

OK, squashed and applied to l2-mtd.git

Thanks,
Brian
