Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsHim-00026Y-PD
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 17:42:21 +0000
Received: by wera10 with SMTP id a10so311078wer.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 09:42:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1328011843-7402-1-git-send-email-w.sang@pengutronix.de>
References: <1328011843-7402-1-git-send-email-w.sang@pengutronix.de>
Date: Tue, 31 Jan 2012 09:42:18 -0800
Message-ID: <CAN8TOE-075faswyt-q8-DKtAuNhRTeq3pqA45jwwkamjOKq6Wg@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: gpmi: use correct member for checking
 NAND_BBT_USE_FLASH
From: Brian Norris <computersforpeace@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 4:10 AM, Wolfram Sang <w.sang@pengutronix.de> wrote:
> This has been moved from .options to .bbt_options meanwhile. So, it
> currently checks for something totally different (NAND_OWN_BUFFERS) and
> decides according to that.
>
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Huang Shijie <b32955@freescale.com>
> ---
>
> Artem: NAND_OWN_BUFFERS should not get set, so no danger. But I'd think we
> should add the stable tag nonetheless if Huang is fine with this change.

Acked-by: Brian Norris <computersforpeace@gmail.com>

And the "stable" tag is probably good, since the "options" ->
"bbt_options" split was a few releases ago. I guess I missed this one.

Also, you might note that there are some changes in progress with the
default NAND "block_markbad" routine, which you may or may not want to
reflect in the overriding "gpmi_block_markbad" routine eventually.

Brian
