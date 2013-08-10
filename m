Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V83zi-0001JG-Le
 for linux-mtd@lists.infradead.org; Sat, 10 Aug 2013 07:53:51 +0000
Received: by mail-ob0-f169.google.com with SMTP id wc20so7349816obb.28
 for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2013 00:53:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130810074156.GB3467@norris.computersforpeace.net>
References: <1368607606-4344-1-git-send-email-b32955@freescale.com>
 <1368607606-4344-5-git-send-email-b32955@freescale.com>
 <20130810074156.GB3467@norris.computersforpeace.net>
Date: Sat, 10 Aug 2013 00:53:28 -0700
Message-ID: <CAN8TOE8NhcYBP_x26=KC2yBUSS3xzVjMg+PHnxNNRNJWWLeSeg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] mtd: gpmi: update the ecc step size for mtd_info{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 10, 2013 at 12:41 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, May 15, 2013 at 04:46:46PM +0800, Huang Shijie wrote:
>> update the ecc step size when we have already get the right value.
>>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>> ---
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> index 53180da..bc598e6 100644
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
>> @@ -1598,6 +1598,7 @@ static int gpmi_pre_bbt_scan(struct gpmi_nand_data  *this)
>>       /* Adjust the ECC strength according to the chip. */
>>       this->nand.ecc.strength = this->bch_geometry.ecc_strength;
>>       this->mtd.ecc_strength = this->bch_geometry.ecc_strength;
>> +     this->mtd.ecc_step = this->bch_geometry.ecc_chunk_size;
>
> Why do you need a special case here for gpmi-nand? GPMI should be
> initializing nand_ecc_ctrl.size (this->ecc.size) to something meaningful

Correction: should be this->nand.ecc.size

> instead of directly setting to 1. Then nand_base will take care of
> setting mtd.ecc_step.
>
> Along the same line, you shouldn't need to directly override
> mtd.ecc_strength here; you should be setting this->ecc.strength
> appropriately.

Correction: should be this->nand.ecc.strength. And another correction:
you are already setting this field, but you are doing it in the wrong
place.

> I see several instances here where gpmi-nand is hacking around
> nand_base, rather than using its intended infrastructure.
>
> The right way seems to be to avoid nand_scan() directly but instead to
> use nand_scan_ident() and nand_scan_tail() separately (that's what
> they're exported for) so that you can initialize any geometry-related
> options before nand_scan_tail() does the last steps.
>
> In the end, you shouldn't be needing to override this->scan_bbt at all,
> since you really intend to use the default implementation; you just are
> doing this to hack around your issues. In fact, I think every use of
> nand_default_bbt() outside of nand_base is a design mistake.
>
>>       this->mtd.bitflip_threshold = this->bch_geometry.ecc_strength;
>>
>>       /* NAND boot init, depends on the gpmi_set_geometry(). */
>>

Sorry for the above mistakes, but the argument still holds. In fact,
it's somewhat stronger, because gpmi-nand has to assign the same
information to two different (redundant) fields
(this->nand.ecc.strength and this->mtd.ecc_strength) because it is not
using the proper layering here.

Brian
