Received: from mail-pb0-x233.google.com ([2607:f8b0:400e:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoULe-0002zO-MZ
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 08:31:51 +0000
Received: by mail-pb0-f51.google.com with SMTP id up15so25253914pbc.24
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 00:31:28 -0800 (PST)
Date: Thu, 5 Dec 2013 00:31:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v4 0/4] optimize and clean-up of OMAP NAND and ELM driver
Message-ID: <20131205083124.GB4636@norris.computersforpeace.net>
References: <1385374141-10934-1-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA510F4@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA510F4@DBDE04.ent.ti.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pekon,

On Mon, Dec 02, 2013 at 07:51:50PM +0000, Pekon Gupta wrote:
> Just a ping..
> Do you have any further updates on this series ?
> If this is clean, I just want to rebase and send last pending series for 
> omap2.c driver.

I'm sorry to delay this long, but this patch series is still rather
impenetrable for a third-party reader, and so I really can't give my sign-off.

For one, you don't give very good patch titles; 3 of the 4 have "optimize" in
the title, when in fact that "optimize" does not mean anything about
optimization, but rather, "unification", "consolidation", "cleanup", or
something else entirely, depending on which part of the patch you're talking
about... which brings me to the next point:

Patches 1 and 4 are doing much more than one thing. Your commit messages
-- rather than describing succintly a single change being made -- are a
description of a list of things that you did, some of which are quite
independent.

For instance, consider this list from patch 1:

>         This patch optimizes omap_elm_correct_data() in following ways:
>         (1) Removes dependency on specific reserved-byte (0x00) in OOB area,
>             instead Erased-page is identified by matching calc_ecc with a
>             pre-defined ECC syndrome of all(0xFF) data

This sounds like a self-contained task that should be done in its own patch.

>         (2) merges common code for BCH4_ECC and BCH8_ECC for scalability.

This sounds like a second independent task, so it should be in its own patch.

>         (3) handles incorrect elm_error_location beyond data+oob buffer.

This sounds independent. And is this a bugfix? The description doesn't make
this clear, and I certainly can't pinpoint this fix, amidst the other 3 tasks
here.

>         (4) removes check_erased_page(): Bit-flips in erased-page are handled
>             in same way as for programmed-page

This may be interrelated with (1), and so needs to be in the same patch.

Anyway, it's up to you how to order these patches, due to dependencies
between the task you list. But I really can't review patch 1 like this,
and patch 4 suffers a few of the same sort of problems.

If you need clarification on how you can best rework/resubmit this work,
please ask. I don't want this series to drag on to version 12+, so let's
focus on how to get this right now.

Brian
