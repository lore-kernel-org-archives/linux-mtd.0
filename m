Received: from mail-ve0-x236.google.com ([2607:f8b0:400c:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve7Wr-0007uj-63
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 18:08:33 +0000
Received: by mail-ve0-f182.google.com with SMTP id c14so3801278vea.41
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 10:08:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1383758172-29798-2-git-send-email-festevam@gmail.com>
References: <1383758172-29798-1-git-send-email-festevam@gmail.com>
 <1383758172-29798-2-git-send-email-festevam@gmail.com>
Date: Wed, 6 Nov 2013 10:08:09 -0800
Message-ID: <CAN8TOE8GZyL6T7XdFyPrNozT2hAXawUqmVFRBX=xgYyHu4fS-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: Revert "mtd: gpmi: remove the nand_scan()"
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>, Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 6, 2013 at 9:16 AM, Fabio Estevam <festevam@gmail.com> wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
>
> Commit f720e7ce (mtd: gpmi: remove the nand_scan()) caused the following
> regression on mx23:

...

> This reverts commit f720e7ce510bf79f029be45ce200ccfce5551280.
>
> Cc: <stable@vger.kernel.org> #3.12
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Kernel 3.11 boots fine on mx23, but 3.12 fails because of this commit.

I seriously doubt that a total revert is the correct answer to this
problem. Can you pick up the discussion with Huang on the mailing
list, or at least explain what the actual root cause is? Have you been
going through some private communication on this issue? A proper
bugfix with an identified issue is preferable to a blind revert.

Huang, is the DMA patch you sent related, or is it a totally different bug?

Brian
