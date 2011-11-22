Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSxW0-00057o-Ps
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 21:04:29 +0000
Received: by ywa12 with SMTP id 12so756916ywa.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 13:04:27 -0800 (PST)
Subject: Re: [PATCH v3 3/3] mtd/nand : workaround for Freescale FCM to
 support large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b35362@freescale.com
Date: Tue, 22 Nov 2011 23:04:18 +0200
In-Reply-To: <1321349355-1639-3-git-send-email-b35362@freescale.com>
References: <1321349355-1639-1-git-send-email-b35362@freescale.com>
 <1321349355-1639-2-git-send-email-b35362@freescale.com>
 <1321349355-1639-3-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321995862.2222.2.camel@koala>
Mime-Version: 1.0
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Liu Shuo <Shuo.Liu@freescale.com>,
 Shengzhou Liu <Shengzhou.Liu@freescale.com>, linux-mtd@lists.infradead.org,
 scottwood@freescale.com, akpm@linux-foundation.org, leoli@freescale.com,
 dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-15 at 17:29 +0800, b35362@freescale.com wrote:
> +               /*
> +                * Freescale FCM controller has a 2K size limitation of buffer
> +                * RAM, so elbc_fcm_ctrl->buffer have to be used if writesize
> +                * of chip is greater than 2048.
> +                * We malloc a large enough buffer at this point, because we
> +                * don't know writesize before calling nand_scan(). We will
> +                * re-malloc later if needed.
> +                */
> +               elbc_fcm_ctrl->buffer = kmalloc(4096 * 6, GFP_KERNEL);
> +               if (!elbc_fcm_ctrl->buffer)
> +                       return -ENOMEM; 

Why 4096*6? Judging from the comment it should be 4096.

Artem.
