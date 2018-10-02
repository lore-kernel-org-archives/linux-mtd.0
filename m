Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7FKI-0007OL-9d
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 07:42:39 +0000
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 chris.packham@alliedtelesis.co.nz, stable@vger.kernel.org
References: <20180927071751.21513-1-daniel@zonque.org>
 <20181002004456.4694ac4d@bbrezillon>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <4a2dfd4b-a7a6-1832-3f2f-c32bbe5728c3@zonque.org>
Date: Tue, 2 Oct 2018 09:42:24 +0200
MIME-Version: 1.0
In-Reply-To: <20181002004456.4694ac4d@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 2/10/2018 12:44 AM, Boris Brezillon wrote:
> On Thu, 27 Sep 2018 09:17:51 +0200
> Daniel Mack <daniel@zonque.org> wrote:
> 
>> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR register
>> will only cause the IRQ to latch when the RDY lanes are changing, and not
>> in case they are already asserted.
>>
>> This means that if the controller finished the command in flight before
>> marvell_nfc_wait_op() is called, that function will wait for a change in
>> the bit that can't ever happen as it is already set.
>>
>> To address this race, check for the RDY bits after the IRQ was enabled,
>> and complete the completion immediately if the condition is already met.
>>
>> This fixes a bug that was observed with a NAND chip that holds a UBIFS
>> parition on which file system stress tests were executed. When
>> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mount
>> the filesystem read-only, reporting lots of warnings along the way.
>>
>> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller driver
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> 
> Can you try to replace your patch by the following one and let me know if
> it solves your problem?

Nope, this doesn't fix it. Same problem as before.


Thanks,
Daniel


> --->8---
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index e63f714f7639..295a86a5545f 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -1123,7 +1123,7 @@ static int marvell_nfc_hw_ecc_hmg_do_write_page(struct nand_chip *chip,
>                  memcpy(nfc->dma_buf, data_buf, lt->data_bytes);
>                  memcpy(nfc->dma_buf + lt->data_bytes, oob_buf, oob_bytes);
>                  marvell_nfc_xfer_data_dma(nfc, DMA_TO_DEVICE, lt->data_bytes +
> -                                         lt->ecc_bytes + lt->spare_bytes);
> +                                         oob_bytes);
>          } else {
>                  marvell_nfc_xfer_data_out_pio(nfc, data_buf, lt->data_bytes);
>                  marvell_nfc_xfer_data_out_pio(nfc, oob_buf, oob_bytes);
> 
