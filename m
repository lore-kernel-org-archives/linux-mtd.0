Received: from mail-gh0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Soq5C-0006ii-Tw
 for linux-mtd@lists.infradead.org; Wed, 11 Jul 2012 06:07:32 +0000
Received: by ghbf11 with SMTP id f11so907909ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jul 2012 23:07:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1341293533-2214-1-git-send-email-b32955@freescale.com>
References: <1341293533-2214-1-git-send-email-b32955@freescale.com>
Date: Tue, 10 Jul 2012 23:07:19 -0700
Message-ID: <CAN8TOE-59M6UCW91QS0_ZKzBO-HUyXrUXcmW3avOd8=4CmE4Fg@mail.gmail.com>
Subject: Re: [PATCH] mtd: add a new macro about the subpage write
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: marex@denx.de, dedekind1@gmail.com, Jan Weitzel <j.weitzel@phytec.de>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Scott Wood <scottwood@freescale.com>,
 Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Mon, Jul 2, 2012 at 10:32 PM, Huang Shijie <b32955@freescale.com> wrote:
> The nand chip may does not support the subpage writes, while the nand
> controller may also does not support the subpage writes too.
>
> Now, the nand controller drivers use the NAND_NO_SUBPAGE_WRITE(0x00000200)
> to tell the MTD layer that they do not support the subpage writes. But
> this flag could be masked off in nand_get_flash_type():
>         ....................................................
>         /* Get chip options, preserve non chip based options */
>         chip->options &= ~NAND_CHIPOPTIONS_MSK;
>         ....................................................
...

It looks like you're finally getting around to solving your
NO_SUBPAGE_WRITE problem. I believe the discussion was left hanging a
few months ago. In that discussion, I'm beginning to agree with Scott
Wood [1]; I don't see a good reason not to just kill the
NAND_CHIPOPTIONS_MSK instead of adding more flags. As long as we
perform a few sanity tests, I think it'd be safe.

If somebody has a good reason not to remove NAND_CHIPOPTIONS_MSK,
though, I'd Ack this patch.

Regards,
Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2012-January/039144.html
