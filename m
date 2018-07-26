Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1figKY-0003os-CJ
 for linux-mtd@lists.infradead.org; Thu, 26 Jul 2018 13:29:25 +0000
Date: Thu, 26 Jul 2018 15:28:58 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: marvell: document a bit more the
 driver
Message-ID: <20180726152858.6950de5a@bbrezillon>
In-Reply-To: <20180725142754.2647-1-miquel.raynal@bootlin.com>
References: <20180725142754.2647-1-miquel.raynal@bootlin.com>
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

Hi Miquel,

On Wed, 25 Jul 2018 16:27:53 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> A stale document about the old pxa3cc_nand.c driver is available in
> Documentation/mtd/nand/. Rewrite the parts that explain the IP itself
> and some non-trivial choices made in the driver directly in
> marvell_nand.c to then be able to remove this file.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> 
> Changes since v1:
> =================
> * Corrected mistakes pointed by Boris.
> * Enlarged the documentation as suggested by Thomas to mention the
>   layouts as seen per the controller.
> * Added a mention about the maximum ECC size which is 2kiB.
> 
>  drivers/mtd/nand/raw/marvell_nand.c | 66 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index 218e09431d3d..de74ea18c539 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -5,6 +5,72 @@
>   * Copyright (C) 2017 Marvell
>   * Author: Miquel RAYNAL <miquel.raynal@free-electrons.com>
>   *
> + *
> + * This NAND controller driver handles two versions of the hardware,
> + * one is called NFCv1 and is available on PXA SoCs and the other is
> + * called NFCv2 and is available on almost all the Armada SoCs.

					      ^ s/all//

> + *
> + * The main visible difference is that the NFCv1 only has Hamming ECC

					  ^ s/the//

> + * capabilities, while NFCv2 also embeds a BCH ECC engine. Also, DMA
> + * is not used with NFCv2.
> + *
> + * The internal ECC operations are depicted in details in Marvell
> + * AN-379.

Actually, I'm not sure AN-379 describes how the ECC engines works, just
the different page layouts.

> + *
> + * When using the Hamming engine, the data is cut in 512B chunks

		 ^ s/the Hamming engine/Hamming/  ^ s/cut/split/


> + * (either 0, 1 or 2) and each chunk will have its own ECC "digest" of
> + * 6B at the beginning of the OOB area and eventually the remaining
> + * free OOB bytes. This engine corrects up to 1 bit per chunk and
> + * detects reliably an error if there are at most 2 bitflips. Here is
> + * the controller view:

"
Here the page layout used by the controller when Hamming is chosen:
"

> + *
> + * +-------------------------------------------------------------+
> + * | Data 1 | ... | Data N | ECC 1 | ... | ECCN | Free OOB bytes |
> + * +-------------------------------------------------------------+
> + *
> + * When using the BCH engine, the generic pattern is that the
> + * controller sees only up to 2kiB chunks of data, followed by free
> + * OOB bytes (if any) and then ECC bytes. This pattern is repeated as
> + * much as needed with the same length for each section, until arrives
> + * the last patter which has the same organization but each section

	       ^ pattern?

> + * may be of different length.

Hm, this paragraph is not clear.

> The layout presented to the user in the
> + * raw accessors is always: all the data, then in the OOB all the
> + * free OOB bytes and all the ECC digests.

Isn't that true for both algorithms?

> Here is the controller
> + * view:

Here the page layout used by the controller when BCH is chosen:

> + *
> + * +-----------------------------------------
> + * | Data 1 | Free OOB bytes 1 | ECC 1 | ...
> + * +-----------------------------------------
> + *
> + *      -------------------------------------------
> + *       ... | Data N | Free OOB bytes N | ECC N |
> + *      -------------------------------------------
> + *
> + *           --------------------------------------------+
> + *            Last Data | Last Free OOB bytes | Last ECC |
> + *           --------------------------------------------+
> + *
> + * The controller has certain limitations that are handled by the
> + * driver:
> + *   - It can only read 2k at a time. To overcome this limitation, the
> + *     driver makes use of 'naked' operations.
> + *   - The ECC strength in BCH mode cannot be tuned easily. It is a

								     ^ s/a//

> + *     fixed 16 bits. What can be tuned is the area on which this
> + *     correction occurs which is something between 512B and 2kiB based

	  What can be tuned in the ECC block size as long as it stays
	  between 512B and 2kiB. It's usually chosen based on the chip
	  ECC requirements.

> + *     on the chip's requirements. Hence, using 2kiB ECC chunks leads
> + *     to use a strength of 4b/512B.

	  For instance, using 2kiB ECC chunks provides 5b/512B
	  correctability.

> + *   - The controller will always treat data bytes, free OOB bytes
> + *     (also referred as "spare bytes") and ECC bytes in that order,
> + *     no matter the real factory layout (which is usually all data
> + *     then all OOB bytes).

The term "factory layout" is unfortunate. I guess you're talking about
"standard" layouts that place all data bytes at the beginning of a page
and all free-OOB/ECC bytes at the enf of the page (in the OOB section).

> But depending on the chosen layout, the
> + *     areas of each section may vary or be absent. The same
> + *     data/spare/ecc layout is repeated until the last chunk, were

								  ^ where

> + *     the data, spare and ECC sections may be different again. The
> + *     marvell_nfc_layouts array below contains the currently
> + *     supported layouts.

Again, it's not clear. How about saying you have N identical
data+spare+ecc sections and potentially an extra one to deal with
configurations where the chosen data+spare+ecc sizes do not align with
the page (data+oob) size.

> + *   - Because of these weird layouts, the Bad Block Markers can be
> + *     located in data. In this case, the NAND_BBT_NO_OOB_BBM option

			^ data section.

> + *     must be set.

		     to prevent scanning/writing bad block markers.

>   */
>  
>  #include <linux/module.h>

Regards,

Boris
