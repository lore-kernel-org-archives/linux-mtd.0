Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6LFj-0007ia-34
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2015 16:36:36 +0000
Subject: Re: [PATCH v9 2/3] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1449144142-24004-1-git-send-email-harvey.hunt@imgtec.com>
 <1449144142-24004-3-git-send-email-harvey.hunt@imgtec.com>
 <20151208151436.11ce72f4@bbrezillon> <5666FF6B.5090309@imgtec.com>
 <20151208172641.4e1f935a@bbrezillon>
CC: <linux-mtd@lists.infradead.org>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, <linux-kernel@vger.kernel.org>, Alex Smith
 <alex.smith@imgtec.com>, Brian Norris <computersforpeace@gmail.com>, "David
 Woodhouse" <dwmw2@infradead.org>
From: Harvey Hunt <harvey.hunt@imgtec.com>
Message-ID: <566706FC.9020606@imgtec.com>
Date: Tue, 8 Dec 2015 16:36:12 +0000
MIME-Version: 1.0
In-Reply-To: <20151208172641.4e1f935a@bbrezillon>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 08/12/15 16:26, Boris Brezillon wrote:
> On Tue, 8 Dec 2015 16:03:55 +0000
> Harvey Hunt <harvey.hunt@imgtec.com> wrote:
>
>>>
>>> static void jz4780_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
>>> 				 unsigned int ctrl)
>>> {
>>> 	struct jz4780_nand_chip *nand = to_jz4780_nand_chip(mtd);
>>> 	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(nand->chip.controller);
>>> 	struct jz4780_nand_cs *cs;
>>>
>>> 	if (WARN_ON(nfc->selected < 0))
>>> 		return;
>>>
>>> 	cs = &nfc->cs[nfc->selected];
>>>
>>> 	if (ctrl & NAND_CTRL_CHANGE) {
>>> 		if (cmd != NAND_CMD_NONE) {
>>> 			if (ctrl & NAND_ALE)
>>> 				writeb(cmd, cs->base + OFFSET_ADDR);
>>> 			else if (ctrl & NAND_CLE)
>>> 				writeb(cmd, cs->base + OFFSET_CMD);
>>> 		}
>>>
>>> 		jz4780_nemc_assert(nfc->dev, cs->bank, ctrl & NAND_NCE);
>>> 	}
>>> }
>>>
>>
>> Okay, I understand your point now. I would also have to implement the
>> read/write functions to replace the defaults, correct? If so, it feels
>> strange to add functions to reimplement the default ones.
>>
>
> Actually it should be something like this, because NAND_CTRL_CHANGE is
> cleared after the first address cycle.
>
> static void jz4780_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
>   				 unsigned int ctrl)
> {
> 	struct jz4780_nand_chip *nand = to_jz4780_nand_chip(mtd);
> 	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(nand->chip.controller);
> 	struct jz4780_nand_cs *cs;
>
> 	if (WARN_ON(nfc->selected < 0))
> 		return;
>
> 	cs = &nfc->cs[nfc->selected];
>
> 	jz4780_nemc_assert(nfc->dev, cs->bank, ctrl & NAND_NCE);
>
>   	if (cmd == NAND_CMD_NONE)
> 		return;
>
> 	if (ctrl & NAND_ALE)
> 		writeb(cmd, cs->base + OFFSET_ADDR);
>   	else if (ctrl & NAND_CLE)
>   		writeb(cmd, cs->base + OFFSET_CMD);
> }
>

Thanks for the example code, I'll try it out for the next version.
