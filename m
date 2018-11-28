Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gS0jx-0003eZ-L0
 for linux-mtd@lists.infradead.org; Wed, 28 Nov 2018 14:22:59 +0000
Date: Wed, 28 Nov 2018 15:22:45 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <Cyrille.Pitchen@microchip.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: parse SFDP 4-byte Address Instruction Table
Message-ID: <20181128152245.1bb0ccd8@bbrezillon>
In-Reply-To: <b1052dff-e1a9-2d3f-b921-661c72e0e137@microchip.com>
References: <20181120115512.15958-1-tudor.ambarus@microchip.com>
 <20181128085745.1ef607b3@bbrezillon>
 <b1052dff-e1a9-2d3f-b921-661c72e0e137@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 Nov 2018 14:17:12 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 11/28/2018 09:57 AM, Boris Brezillon wrote:
> > On Tue, 20 Nov 2018 11:55:21 +0000
> > <Tudor.Ambarus@microchip.com> wrote:
> >   
> >> +
> >> +	/*
> >> +	 * We set nor->addr_width here to skip spi_nor_set_4byte_opcodes()
> >> +	 * later because this latest function implements a legacy quirk for
> >> +	 * the erase size of Spansion memory. However this quirk is no longer
> >> +	 * needed with new SFDP compliant memories.
> >> +	 */
> >> +	nor->addr_width = 4;
> >> +	nor->flags |= SPI_NOR_4B_OPCODES;  
> > 
> > You mean SNOR_F_4B_OPCODES (the one introduced here [1]), because
> > SPI_NOR_4B_OPCODES should only be used for flash_info->flags and might
> > soon conflict with another SNOR_F_ flag?
> >   
> 
> yes, you're right.
> 
> > [1]http://patchwork.ozlabs.org/patch/991476/
> >   
> 
> Can you apply your patch? Will submit a new version afterwards.

Actually, I realized setting SNOR_F_4B_OPCODES when the BFPT advertises
4_BYTES_ONLY is incorrect as 4bytes only can mean "use the 3B opcodes
but pass address on 4 bytes". Here is a new version of this patch [1].
Feel free to pick it up and send it along with your "SFDP 4-byte Address
Instruction Table" patch (I have not reason to send it alone since the
problem I was trying to solve is no longer fixed by [1]).

[1]https://github.com/bbrezillon/linux-0day/commit/a953b6b435ec67bca00d6666f472db5f6dca4f63
