Received: from mail-ob0-f182.google.com ([209.85.214.182])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV0aD-0004qV-K1
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 15:26:38 +0000
Received: by mail-ob0-f182.google.com with SMTP id uz6so11093735obc.41
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 08:26:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140401063958.GA6400@brian-ubuntu>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
 <20140401063958.GA6400@brian-ubuntu>
Date: Tue, 1 Apr 2014 09:26:13 -0600
Message-ID: <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
From: David Mosberger <davidm@egauge.net>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian,

On Tue, Apr 1, 2014 at 12:39 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Mar 31, 2014 at 05:28:53PM -0600, David Mosberger wrote:
>> Signed-off-by: David Mosberger <davidm@egauge.net>
>> ---
>>  drivers/mtd/nand/nand_base.c |   27 ++++++++++++++++++++++++---
>>  include/linux/mtd/nand.h     |    4 ++++
>>  2 files changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>> index 09fe1b1..f145f00 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -3054,11 +3054,30 @@ static int nand_setup_read_retry_micron(struct mtd_info *mtd, int retry_mode)
>>                       feature);
>>  }
>>
>> +static void
>
> Does this really need to be on its own line? It doesn't match the style
> of anything else.

Sure, I changed that.  It's not something that's flagged by chkpatch
and I'm working on enough different code-bases that I'm pretty
much blind to such things.

>> +nand_onfi_detect_micron_on_die_ecc(struct mtd_info *mtd,
>> +                                struct nand_chip *chip)
>
> I'm really not sure why the inconsistent style throughout nand_base on
> using both an 'mtd' and a 'chip' parameter (we often assume that
> 'mtd->priv == chip'). If you need the mtd parameter, let's just pass it
> instead of 'chip'.

Ah, yes, that makes sense.  I updated my code.

>> +{
>> +     u8 features[ONFI_SUBFEATURE_PARAM_LEN];
>> +
>> +     if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_ARRAY_OP_MODE,
>> +                                 features) < 0)
>> +             return;
>> +
>> +     if (features[0] & ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC) {
>> +             /*
>> +              * If the chip has on-die ECC enabled, we kind of have
>> +              * to do the same...
>> +              */
>
> That's not really true at all, is it? We can simply disable the on-die
> ECC and use the provided spare area with a different ECC scheme, can't
> we? (e.g., software BCH; or an SoC's HW ECC) In fact, I think disabling
> the on-die ECC is a more reasonable default; nand_base is used by many
> drivers, most of which provide their own implementations, and many of
> which would not be compatible with the implementations you provide. A
> system should have to "opt in" somehow to enable this, I think.
>
> Additionally, you need a way to inform the hardware driver that you're
> using on-die ECC, so they can make the appropriate choices (to disable
> their HW ECC, for instance).
>
> BTW, what driver/controller/SoC are you running this with?

No, if you booted with on-die ECC enabled, presumably you have the
on-die ECC layout and you can't switch (sure, you can turn off ECC
but all hell will break lose when you actually try to read data with
the wrong ECC layout).

There seems to be this misconception that somehow on-die ECC would
be turned on "accidentially".  It is not.  Either a boot loader has to turn
it on or you have to pay Micron extra money (several dollars/chip, AFAIR)
to have them send you custom chips with on-die ECC enabled by default.

This is not to say that you may want a way to override it, but the patch
as it stands is safe.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
