Received: from mail-ob0-f172.google.com ([209.85.214.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUh2E-0003e3-Cw
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 18:34:15 +0000
Received: by mail-ob0-f172.google.com with SMTP id wm4so9653015obc.17
 for <linux-mtd@lists.infradead.org>; Mon, 31 Mar 2014 11:33:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140329131642.GA2775@book.gsilab.sittig.org>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
 <20140329131642.GA2775@book.gsilab.sittig.org>
Date: Mon, 31 Mar 2014 12:33:48 -0600
Message-ID: <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
Subject: Re: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
From: David Mosberger <davidm@egauge.net>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
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

On Sat, Mar 29, 2014 at 7:16 AM, Gerhard Sittig <gsi@denx.de> wrote:

> ISTR that the test should not be done for a single bit, but for
> the specific 0x08 data pattern, i.e. for equality of the byte
>
> can you re-check the documentation?  this is how I read table 14

Yes, the data sheet certainly makes it look that way.
However, Micron's own sample code checks individual bits.
Also, I don't know why the other array-op features (OTP) would
be exclusive with internal ECC, so I'm leaning towards believing
the sample code (see function test_on_die_ecc() on page 8 & 9):

 http://www.micron.com/~/media/Documents/Products/Technical%20Note/NAND%20Flash/tn2956_ondie_ecc_omap3_linux.pdf


>>       if (!(chip->options & NAND_OWN_BUFFERS)) {
>> +             size_t on_die_bufsz = 0;
>> +
>> +             if (chip->ecc.mode == NAND_ECC_HW_ON_DIE)
>> +                     on_die_bufsz = 2*(mtd->writesize + mtd->oobsize);
>> +
>>               nbuf = kzalloc(sizeof(*nbuf) + mtd->writesize
>> -                             + mtd->oobsize * 3, GFP_KERNEL);
>> +                             + mtd->oobsize * 3 + on_die_bufsz, GFP_KERNEL);
>>               if (!nbuf)
>>                       return -ENOMEM;
>>               nbuf->ecccalc = (uint8_t *)(nbuf + 1);
>>               nbuf->ecccode = nbuf->ecccalc + mtd->oobsize;
>>               nbuf->databuf = nbuf->ecccode + mtd->oobsize;
>> +             if (chip->ecc.mode == NAND_ECC_HW_ON_DIE) {
>> +                     nbuf->chkbuf = (nbuf->databuf + mtd->writesize
>> +                                     + mtd->oobsize);
>> +                     nbuf->rawbuf = (nbuf->chkbuf + mtd->writesize
>> +                                     + mtd->oobsize);
>> +             }
>>
>>               chip->buffers = nbuf;
>>       } else {
>
> so the additional buffers only get allocated when upon
> identification the on-die-ECC feature already is enabled?

Yes.

> not
> when it's supported, and might get enabled at any later point in
> time?

There is no way to switch ECC mode later on, is there?

>>  /* Vendor-specific feature address (Micron) */
>>  #define ONFI_FEATURE_ADDR_READ_RETRY 0x89
>>
>> +/* Vendor-specific array operation mode (Micron) */
>> +#define ONFI_FEATURE_ADDR_OP_MODE    0x90
>> +#define ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC               0x08
>> +
>>  /* ONFI subfeature parameters length */
>>  #define ONFI_SUBFEATURE_PARAM_LEN    4
>>
>
> is something like "array op mode" more appropriate, in case other
> things might have their individual mode of operation in the future?

Either way is fine with me.  ARRAY_OP_MODE is more accurate, but
it tends to get long and there is no other op-mode at this point in time.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
