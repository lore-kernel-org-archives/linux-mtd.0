Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQeOK-0003ph-Vx
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 14:56:21 +0000
Date: Thu, 20 Mar 2014 11:55:30 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH] mtd: nand: omap: ecc.correct: omap_elm_correct_data:
 return number of bit-flips detected in erased-page
Message-ID: <20140320145530.GA23161@arch.cereza>
References: <1395321598-4565-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395321598-4565-1-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pekon,

I'm not sure we need such a detailed subject. Just "mtd: nand: omap:
Return detected bitflip count" should be enough.

This goes for your other patches. It's just a nitpick, of course,
but it's good to have commit log consistency.

On Mar 20, Pekon Gupta wrote:
> fixes: commit 62116e5171e00f85a8d53f76e45b84423c89ff34
>        mtd: nand: omap2: Support for hardware BCH error correction.
> 

Remove these extra whitespace.

> In current omap_elm_correct_data(), an erased-page is also identified based on
> 	'bitflip_count <= ecc.strength' per ecc-step (data+oob)

And this extra tab.

> But bitflip_count is ignored, unless errors are detected in other ecc.steps.
> ------------------
>   if (bitflip_count) {
>         /*
>          * number of 0-bits within ECC limits
>          * So this may be an erased-page
>          */
>         stat += bitflip_count;
>   }
>   [...]
>   /* Check if any error reported */
>   if (!is_error_reported)
>         return 0;
> ------------------
> 

We don't need a piece of code here, we can see that in the patch itself.
The commit log should be a text explaining what you are doing, why you are doing
it and perhaps the impact it has.

I suggest that you clean-up this a bit and resend it.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
