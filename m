Received: from mail-qc0-f179.google.com ([209.85.216.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTZVM-0003dg-DK
 for linux-mtd@lists.infradead.org; Fri, 28 Mar 2014 16:19:41 +0000
Received: by mail-qc0-f179.google.com with SMTP id m20so6133672qcx.38
 for <linux-mtd@lists.infradead.org>; Fri, 28 Mar 2014 09:19:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAB9437@DBDE04.ent.ti.com>
References: <1395975504-11301-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9437@DBDE04.ent.ti.com>
Date: Fri, 28 Mar 2014 10:19:17 -0600
Message-ID: <CALnQHM0YEfXFoRggA+dfRzJifA3khw8C02K7LHe-LnVvO1XxXw@mail.gmail.com>
Subject: Re: [RFC] mtd: nand: Preparatory patch for adding on-die ECC
 controller support. This patch adds NAND_ECC_HW_ON_DIE and all other changes
 to generic code.
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

On Thu, Mar 27, 2014 at 11:48 PM, Gupta, Pekon <pekon@ti.com> wrote:

>>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
>>index 5826da3..b94e2e9 100644
>>--- a/drivers/mtd/nand/nand_base.c
>>+++ b/drivers/mtd/nand/nand_base.c
>>@@ -3783,22 +3783,46 @@ EXPORT_SYMBOL(nand_scan_ident);
>> int nand_scan_tail(struct mtd_info *mtd)
>> {
>>       int i;
>>+      u8 features[ONFI_SUBFEATURE_PARAM_LEN];
>>       struct nand_chip *chip = mtd->priv;
>>       struct nand_ecc_ctrl *ecc = &chip->ecc;
>>       struct nand_buffers *nbuf;
>>
>>+      if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_OP_MODE,
>>+                                  features) >= 0) {
>>+              if (features[0] & ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC) {
>>+                      /*
>>+                       * If the chip has on-die ECC enabled, we kind
>>+                       * of have to do the same...
>>+                       */
>>+                      chip->ecc.mode = NAND_ECC_HW_ON_DIE;
>>+                      pr_info("Using on-die ECC\n");
>>+              }
>>+      }
>>+
> Here, I'm bit skeptical on enabling "NAND_ECC_HW_ON_DIE" mode automatically,
> based on ONFI parameters. ONFI params just advertise the current NAND device's
> capability and features, whether to use that feature or not should be under
> control of individual vendor drivers or passed by user via DT | platform-data.

No, the OP_MODE register reflects the actual operational mode of the chip,
it's not a capability flag.  You can't ignore the chip being on
"Internal ECC" mode:
you either have to use on-die ECC or turn it off.  If you ignore it
when it's on and
try to use a different ECC scheme, all hell will break lose, because the chip
will corrupt the OOB area with its own ECC bytes.

> (1) So it would be nice if instead of enabling  chip->ecc.mode=NAND_ECC_HW_ON_DIE
> in nand_scan_tail(), you advertise the availability of this feature in nand_scan_ident(),
> and then let user choose whether to enable 'on-die' ECC or not.

Again, we are not enabling on-die ECC unsolicited *ever* in that patch.
We just *detect* that it's enabled (by bootstrap loader or at
manufacturing time) and then act accordingly.

> (2) At-least in the datasheet "m60a_4gb_8gb_16gb_ecc_nand.pdf" I have,
> - "internal ECC" is _not_ mentioned in vendor specific ONFI params. Rather
> - "internal ECC" is mentioned in 4th byte of READ_ID command.
> So, I don't know if using chip->onfi_get_feature() is correct API to use here,
> because it uses NAND_CMD_GET_FEATURES (0xeeh) not READ_ID (0x90h)

Yes, READ_ID also has an "Internal ECC" flag.

However, look on page 50, table 14: Array Operation Mode.  It documents the
Disable/Enable ECC bit that can be read via GET FEATURES and
set via SET FEATURES.

I can assure you, the patch I sent actually does work! ;-)

> (3) If "internal ECC" is mentioned via some vendor specific ONFI params,
> Then you should put this code under nand_base.c : nand_onfi_detect_micron()

Yes, I don't see why that wouldn't work.  nand_onfi_detect_micron() appears
to be a relatively recent addition that I wasn't aware of.  Let me try that.

>>@@ -516,6 +521,8 @@ struct nand_buffers {
>>       uint8_t *ecccalc;
>>       uint8_t *ecccode;
>>       uint8_t *databuf;
>>+      uint8_t *chkbuf;
>>+      uint8_t *rawbuf;
>> };
>>
> I'm not sure if its good to extend struct nand_buffers, you could have
> as well re-used nbuf->databuf, instead of nbuf->chkbuf, as you only
> need to get number of bit-flips. Right ?
> And again re-use nbuf->databuf on re-reads, in read_page_on_die().

In theory, yes.  In practice, it got way too complicated.  AFAIR, databuf
may not contain the entire page + OOB, so in general we have to
re-read (some) of the data some of the time anyhow.  It's much more
reliable and cleaner to have separate buffers.  That way, it's guaranteed
that we don't disturb the contents of databuf.

Remember that only gets called for pages that have bitflips, so it's
relatively rare and from a performance-perspective, the extra work
is irrelevant.

Also, the extra buffers only get allocated when internal ECC is
enabled, so it has no discernible effect on other configurations.

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
