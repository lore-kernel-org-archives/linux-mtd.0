Received: from mail-oa0-f54.google.com ([209.85.219.54])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WV0gV-00051O-Jm
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 15:33:08 +0000
Received: by mail-oa0-f54.google.com with SMTP id n16so11303952oag.41
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 08:32:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB9FF9@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-3-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9FF9@DBDE04.ent.ti.com>
Date: Tue, 1 Apr 2014 09:32:43 -0600
Message-ID: <CALnQHM22RAUfF=Zb7BOAgnJfQW-niq3Ri0zu0a8gSuyXdX_9EQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mtd: nand: Add NAND_ECC_HW_ON_DIE ECC-mode.
From: David Mosberger <davidm@egauge.net>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "gsi@denx.de" <gsi@denx.de>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

On Tue, Apr 1, 2014 at 12:02 AM, Gupta, Pekon <pekon@ti.com> wrote:

>>+      } else if (status & NAND_STATUS_REWRITE) {
>>+              /*
>>+               * Simple but suboptimal: any page with a single stuck
>>+               * bit will be unusable since it'll be rewritten on
>>+               * each read...
>>+               */
>>+              max_bitflips = mtd->bitflip_threshold;
>
> This is not correct. You need to count the bit-flips. This would lead to
> un-necessary scrubbing of the pages by UBI even for single-bit errors.

Wrong.  It is correct, it's just not optimal.
Patch 5 of 5 changes this part to count the bitflips, to get optimal behavior.

> Please spawn out nand_read_subpage_on_die() into a separate patch
> (or may be later) so that basic framework with nand_read_page_on_die()
> can be independently reviewed and accepted.

Good point, thanks.


>>@@ -3985,6 +4099,25 @@ int nand_scan_tail(struct mtd_info *mtd)
>>               ecc->strength = ecc->bytes * 8 / fls(8 * ecc->size);
>>               break;
>>
>>+      case NAND_ECC_HW_ON_DIE:
>>+              /* nand_bbt attempts to put Bbt marker at offset 8 in
>>+                 oob, which is used for ECC by Micron
>>+                 MT29F4G16ABADAWP, for example.  Fixed by not using
>>+                 OOB for BBT marker.  */
>>+              chip->bbt_options |= NAND_BBT_NO_OOB;
>>+              chip->ecc.layout = &nand_oob_64_on_die;
>>+              chip->ecc.read_page = nand_read_page_on_die;
>>+              chip->ecc.read_subpage = nand_read_subpage_on_die;
>>+              chip->ecc.write_page = nand_write_page_raw;
>>+              chip->ecc.read_oob = nand_read_oob_std;
>>+              chip->ecc.read_page_raw = nand_read_page_raw;
>>+              chip->ecc.write_page_raw = nand_write_page_raw;
>>+              chip->ecc.write_oob = nand_write_oob_std;
>>+              chip->ecc.size = 512;
>>+              chip->ecc.bytes = 8;
>>+              chip->ecc.strength = 4;
>
> Shouldn't you parse these value from ONFI params ?
> Do Byte[112] (Number of bits ECC bits) of ONFI param page still holds
> good when on-die-ECC is enabled ?

Probably.  I just don't know how to do that.  If someone wants to send
me a patch,
I'll be happy to test it.


>>--- a/drivers/of/of_mtd.c
>>+++ b/drivers/of/of_mtd.c
>>@@ -23,6 +23,7 @@ static const char *nand_ecc_modes[] = {
>>       [NAND_ECC_HW_SYNDROME]  = "hw_syndrome",
>>       [NAND_ECC_HW_OOB_FIRST] = "hw_oob_first",
>>       [NAND_ECC_SOFT_BCH]     = "soft_bch",
>>+      [NAND_ECC_HW_ON_DIE]    = "hw_on_die",
>> };
>>
> Why are you adding this an selectable option for "nand-ecc-mode"
> DT binding ? (as you are not giving user to choose ECC mode).
> Also, description of this new DT binding value needs to be added in
> Documentation/devicetree/bindings/mtd/nand.txt

I don't know how this is used.  If it's not needed, we can leave it out.
I was just worried about some code indexing into nand_ecc_modes[].

> In summary, It seems that you havn't followed the recommendations by
> given on previous patches. If you feel those are not applicable to your driver
> then please feel free to discuss before re-sending the new version.

That's a bit thick, isn't it?

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
