Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUukj-0001s3-0E
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 09:13:07 +0000
Received: by mail-pa0-f49.google.com with SMTP id lj1so9510483pab.22
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 02:12:42 -0700 (PDT)
Date: Tue, 1 Apr 2014 02:12:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [RFC] mtd: nand: Preparatory patch for adding on-die ECC
 controller support. This patch adds NAND_ECC_HW_ON_DIE and all other changes
 to generic code.
Message-ID: <20140401091237.GI6400@brian-ubuntu>
References: <1395975504-11301-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB9437@DBDE04.ent.ti.com>
 <CALnQHM0YEfXFoRggA+dfRzJifA3khw8C02K7LHe-LnVvO1XxXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM0YEfXFoRggA+dfRzJifA3khw8C02K7LHe-LnVvO1XxXw@mail.gmail.com>
Cc: "gsi@denx.de" <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 28, 2014 at 10:19:17AM -0600, David Mosberger wrote:
> On Thu, Mar 27, 2014 at 11:48 PM, Gupta, Pekon <pekon@ti.com> wrote:
> >>diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> >>index 5826da3..b94e2e9 100644
> >>--- a/drivers/mtd/nand/nand_base.c
> >>+++ b/drivers/mtd/nand/nand_base.c
> >>@@ -3783,22 +3783,46 @@ EXPORT_SYMBOL(nand_scan_ident);
> >> int nand_scan_tail(struct mtd_info *mtd)
> >> {
> >>       int i;
> >>+      u8 features[ONFI_SUBFEATURE_PARAM_LEN];
> >>       struct nand_chip *chip = mtd->priv;
> >>       struct nand_ecc_ctrl *ecc = &chip->ecc;
> >>       struct nand_buffers *nbuf;
> >>
> >>+      if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_OP_MODE,
> >>+                                  features) >= 0) {
> >>+              if (features[0] & ONFI_FEATURE_OP_MODE_ENABLE_ON_DIE_ECC) {
> >>+                      /*
> >>+                       * If the chip has on-die ECC enabled, we kind
> >>+                       * of have to do the same...
> >>+                       */
> >>+                      chip->ecc.mode = NAND_ECC_HW_ON_DIE;
> >>+                      pr_info("Using on-die ECC\n");
> >>+              }
> >>+      }
> >>+
> > Here, I'm bit skeptical on enabling "NAND_ECC_HW_ON_DIE" mode automatically,

I am also skeptical, but for different reasons.

> > based on ONFI parameters. ONFI params just advertise the current NAND device's
> > capability and features, whether to use that feature or not should be under
> > control of individual vendor drivers or passed by user via DT | platform-data.
> 
> No, the OP_MODE register reflects the actual operational mode of the chip,
> it's not a capability flag.  You can't ignore the chip being on
> "Internal ECC" mode:
> you either have to use on-die ECC or turn it off.  If you ignore it
> when it's on and
> try to use a different ECC scheme, all hell will break lose, because the chip
> will corrupt the OOB area with its own ECC bytes.

OK, but I think turning it off makes a better default.

> > (1) So it would be nice if instead of enabling  chip->ecc.mode=NAND_ECC_HW_ON_DIE
> > in nand_scan_tail(), you advertise the availability of this feature in nand_scan_ident(),
> > and then let user choose whether to enable 'on-die' ECC or not.
> 
> Again, we are not enabling on-die ECC unsolicited *ever* in that patch.
> We just *detect* that it's enabled (by bootstrap loader or at
> manufacturing time) and then act accordingly.

Consider this: what if the NAND is not used or configured by any
bootloader (i.e., it's not the boot device), but we still want to use
the on-die ECC (or to disable it, if it was on by default)? Then the
system still needs some way to communicate to nand_base that it should
enable/disable on-die ECC. So to make all these cases consistent, I
think it makes sense to provide some kind of flag (device tree property;
chip->options flag; etc.) that captures the system's expectations.

BTW, do these flash power on in any particular default mode? Can you
order versions that have on-die ECC enabeld/disabled by default? Is that
perhaps what the READ_ID "Internal ECC" flag actually means
(disabled/enabled by default)?

> > (2) At-least in the datasheet "m60a_4gb_8gb_16gb_ecc_nand.pdf" I have,
> > - "internal ECC" is _not_ mentioned in vendor specific ONFI params. Rather
> > - "internal ECC" is mentioned in 4th byte of READ_ID command.
> > So, I don't know if using chip->onfi_get_feature() is correct API to use here,
> > because it uses NAND_CMD_GET_FEATURES (0xeeh) not READ_ID (0x90h)
> 
> Yes, READ_ID also has an "Internal ECC" flag.
> 
> However, look on page 50, table 14: Array Operation Mode.  It documents the
> Disable/Enable ECC bit that can be read via GET FEATURES and
> set via SET FEATURES.
> 
> I can assure you, the patch I sent actually does work! ;-)
> 
> > (3) If "internal ECC" is mentioned via some vendor specific ONFI params,
> > Then you should put this code under nand_base.c : nand_onfi_detect_micron()
> 
> Yes, I don't see why that wouldn't work.  nand_onfi_detect_micron() appears
> to be a relatively recent addition that I wasn't aware of.  Let me try that.
> 
> >>@@ -516,6 +521,8 @@ struct nand_buffers {
> >>       uint8_t *ecccalc;
> >>       uint8_t *ecccode;
> >>       uint8_t *databuf;
> >>+      uint8_t *chkbuf;
> >>+      uint8_t *rawbuf;
> >> };
> >>
> > I'm not sure if its good to extend struct nand_buffers, you could have
> > as well re-used nbuf->databuf, instead of nbuf->chkbuf, as you only
> > need to get number of bit-flips. Right ?

I had the same comment on v4 :)

> > And again re-use nbuf->databuf on re-reads, in read_page_on_die().
> 
> In theory, yes.  In practice, it got way too complicated.  AFAIR, databuf
> may not contain the entire page + OOB, so in general we have to
> re-read (some) of the data some of the time anyhow.  It's much more
> reliable and cleaner to have separate buffers.  That way, it's guaranteed
> that we don't disturb the contents of databuf.

I agree that you may have to re-read anyway, but I still don't see
what's wrong with reusing the buffer. You're not really "disturbing"
anyone's data; you're re-reading the same content.

> Remember that only gets called for pages that have bitflips, so it's
> relatively rare and from a performance-perspective, the extra work
> is irrelevant.
> 
> Also, the extra buffers only get allocated when internal ECC is
> enabled, so it has no discernible effect on other configurations.

Brian
