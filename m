Received: from mail-ve0-f177.google.com ([209.85.128.177])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTFzG-0007kr-NV
 for linux-mtd@lists.infradead.org; Thu, 27 Mar 2014 19:29:15 +0000
Received: by mail-ve0-f177.google.com with SMTP id sa20so4597317veb.8
 for <linux-mtd@lists.infradead.org>; Thu, 27 Mar 2014 12:28:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140327112722.GQ3998@book.gsilab.sittig.org>
References: <1395875121-9320-1-git-send-email-davidm@egauge.net>
 <20980858CB6D3A4BAE95CA194937D5E73EAB5F84@DBDE04.ent.ti.com>
 <20140327112722.GQ3998@book.gsilab.sittig.org>
Date: Thu, 27 Mar 2014 13:28:53 -0600
Message-ID: <CALnQHM0PkQUQk0uYGBL3TwgWaComHfZNBxu1e45_FJK2i+TrbA@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller
 (rev2).
From: David Mosberger <davidm@egauge.net>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
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

On Thu, Mar 27, 2014 at 5:27 AM, Gerhard Sittig <gsi@denx.de> wrote:
> thanks for adding me to Cc:
>
> On Thu, 2014-03-27 at 06:56 +0000, Gupta, Pekon wrote:
>>
>> >From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of David Mosberger
>> >Subject: [PATCH] mtd: nand: Add support for Micron on-die ECC controller (rev2).
>> >
>> Sorry, I looked at this patch little lately.
>> But good, if you can keep $subject consistent, like using
>> prefix "[PATCH v2]"  instead of adding suffix "(rev2)".
>
> David, "PATCH v2" (can be applied with --subject-prefix in the
> --format-patch invocation) has several benefits, reviewers
> clearly notice it's another iteration, and the irrelevant
> "(rev2)" won't clobber the commit message upon application

OK, thanks for the tip!

> a quick search even suggests that the REWRITE status bit need not
> be seen upon _any_ fixable ECC error, but might depend on an
> internal threshold (i.e. when this chip or a later model thinks
> that a data refresh might be due); this is an assumption, cannot
> tell whether it was verified

That's correct.  Micron doesn't define that clearly, but we found that for the
chip we used (MT29F4G16ABADAWP) the bit gets set for any ECC errors
(and that behavior was confirmed by others on the linux-mtd list previously).

> http://lists.infradead.org/pipermail/linux-mtd/2012-November/044855.html
>
> it's a pity that the hardware won't tell how many bit errors were
> detected, and that you feel you have to do the dance of switching
> modes and reading raw data just to find this detail for yourself
> :(  this is a new quality in all the patches I have seen floating
> around

I agree.  I'm certainly not looking for extra work or creating needless
complexity in the driver and at first was hoping that we could get away
without having to count bitflips, but in the end, it was the only solution
that worked correctly.  Without it, you'd end up rewriting blocks
needlessly, making the problem only worse.

> AFAIU the sequence of commands which the NAND chip requires
> doesn't quite map to the sequence of what the MTD layer does
> (emit the read command, read the data, optionally check ECC)
>
> when "on die ECC" is enabled, the chip requires a sequence of
> - read page command (READ0, addresses, READSTART)
> - status check (mandatory! cmd 70, to check FAIL and REWRITE bits)
> - re-enter data read mode (READ0, _without_ addresses and START)
> - fetch data bytes
>
> actually the READ0 plus READSTART does a transfer from the chip's
> array into the chip's caches, before data is fetched out of the
> chip into the SoC; the repeated READ0 does some kind of "rewind"
> from status output to data output, it doesn't re-read the array
> within the chip

That's correct.

>> >+    if (ret < 0 || mtd->ecc_stats.failed != failed) {
>> >+            memset(buf, 0, mtd->writesize);
>>
>> This is not required, because if there are ECC failure (uncorrectable bit-flips)
>> then, nand_do_read_ops() will automatically convert it into -EBADMSG.
>> And then let above layers MTD, UBI determine what to do with the corrupted data.
>> Un-correctable bit-flips may be in those portions of  a page which do not
>> contain any data. Hence, you should not reset the buffer even for ECC failures.
>>
>> Example: UBIFS erase-header and volume-id-headers occupy on first few
>> bytes of the page. And so UBIFS uses in-band CRC checks to see if its headers
>> have any corruption. Now, even if the NAND page had some uncorrectable
>> bit-flips, but those bit-flips do not affect the data of UBIFS headers,
>> then UBIFS just reads those pages and scrubs the block.

I see.  OK, I'll fix that, thanks!

> I was wondering, have you seen an explicit discussion of how many
> data bytes to read and to write in read and program requests?  I
> missed this in the datasheet, neither found it in TN-29-56, but
> just might have been blind ...

Sorry, I'm not sure I understand the question.  Let me know if this doesn't
answer your question: the way those chips work is that when you issue a
READ command, the entire page gets transferred and ECC applied.
After that, you can transfer bytes from the read buffer at will (even
randomly).

>> >+     * Large page NAND with SOFT_ECC or on-die ECC should support
>> >+     * subpage reads.
>> >+     */
>> >+    if (((ecc->mode == NAND_ECC_SOFT)
>> >+         || (chip->ecc.mode == NAND_ECC_HW_ON_DIE))
>> >+        && (chip->page_shift > 9))
>> >             chip->options |= NAND_SUBPAGE_READ;
>> >
>> >     /* Fill in remaining MTD driver data */
>
> this might apply to this specific model, but is it a general rule
> that chips with on-die-ECC will have subpage support?  and that
> we always want to use it?

I don't know, but obviously that can be tweaked later if it's not perfect.

>> Also, can include a link to public copy of the Micron device datasheet
>> which has on-die ECC feature. It would be helpful to understand your patch
>
> I don't have a link at hand, but the datasheet's footer reads
> "m60a_4gb_8gb_16gb_ecc_nand.pdf"
>
> searching for implementations, there's the "sketch" or outline in
> TN-29-56, but I haven't seen an official implementation from
> Micron yet, and all the floating patches appear to "be inspired
> by each other" if they are not identical (they all follow a
> certain scheme, and even use identical identifiers) -- would be
> nice to see some official reference, regardless of how much test
> an "arbitrary" external implementation has received

As far as I know, those datasheets all require an NDA.
For example, google for MT29F4G16ABADAWP and then try
to download the datasheet: you'll have to create an account and
agree to an NDA.  (This is part of the reason we don't use Micron
for our manufacturing anymore).

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
