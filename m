Received: from mail-ve0-f176.google.com ([209.85.128.176])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSwRq-0006E2-Pq
 for linux-mtd@lists.infradead.org; Wed, 26 Mar 2014 22:37:27 +0000
Received: by mail-ve0-f176.google.com with SMTP id cz12so3094708veb.21
 for <linux-mtd@lists.infradead.org>; Wed, 26 Mar 2014 15:37:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140326211308.GO3998@book.gsilab.sittig.org>
References: <1395460989-21049-1-git-send-email-davidm@egauge.net>
 <20140326211308.GO3998@book.gsilab.sittig.org>
Date: Wed, 26 Mar 2014 16:37:05 -0600
Message-ID: <CALnQHM1m+AyXYntjZScEM6vpx9p5RKYuajZFxK9e7T2a+=gd2Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Add support for Micron on-die ECC controller.
From: David Mosberger <davidm@egauge.net>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gerhard, thanks for your feedback!

On Wed, Mar 26, 2014 at 3:13 PM, Gerhard Sittig <gsi@denx.de> wrote:
> On Fri, 2014-03-21 at 22:03 -0600, David Mosberger wrote:

>> +     if (status & NAND_STATUS_FAIL)
>> +             /* Page has invalid ECC. */
>> +             mtd->ecc_stats.failed++;
>> +     else if (status & NAND_STATUS_REWRITE) {
>
> coding style, there should be braces around all arms if one of
> them has some

Sure, I changed that.

>> +     return max_bitflips;
>> +}
>
> so the check_read_status_on_die() routine returns the number of
> bit flips (if they could be corrected)

Yes.

> are you certain about this non-zero return code from the
> chip->ecc.read_subpage() callback?  IIUC this will lead to fatal
> errors in nand_do_read_ops() -- am I missing something?

Yes, I'm certain.  See the documentation for include/mtd/nand.h
read_page and read_subpage (also, the other read_page/read_sub_page
functions have the same behavior).

I think the part that's easy to miss is that the mtd core (e.g.,
mtdcore.c:mtd_read) converts positive return-values into either
-EUCLEAN or 0, as needed).

Needless to say, we also tested this quite extensively (though that
was with earlier kernels).

>> +     if ((*chip->onfi_get_features)(mtd, chip, 0x90, features) >= 0) {
>> +             if (features[0] & 0x08) {
>
> if .onfi_get_features already is a function pointer, you need not
> dereference it before calling the routine (should apply elsewhere
> in the patch as well)

That's really a style issue.  Personally, I prefer to be explicit
about dereferencing a pointer (which is what's happening here), but
yes, I should remember that the Linux convention is to not do that.  I
changed these.

> want to replace those magic numbers with symbolic identifiers?
> especially when they get referenced from multiple locations

Sure, done.

I'll send an updated patch shortly.

Best regards,

  --david
-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
