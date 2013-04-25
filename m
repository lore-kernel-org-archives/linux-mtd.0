Received: from mail-vc0-f173.google.com ([209.85.220.173])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVFqp-0001V4-R2
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2013 06:40:16 +0000
Received: by mail-vc0-f173.google.com with SMTP id ia10so1174995vcb.18
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 23:40:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1366707297-31309-1-git-send-email-b32955@freescale.com>
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>
Date: Wed, 24 Apr 2013 23:40:14 -0700
Message-ID: <CAN8TOE_5OZ7=hyLn-9hUy9b5ne4HGqra2uAurofB+8kOEuamsw@mail.gmail.com>
Subject: Re: [PATCH V3 0/9] mtd: add datasheet's ECC information to nand_chip{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Tue, Apr 23, 2013 at 1:54 AM, Huang Shijie <b32955@freescale.com> wrote:
> v2 --> v3:
>         [0] add a new patch to define the semantics of the two fields.
>         [1] Use the Change Read Column command to remove the "last" argument.
>         [2] simplify the onfi_feature().
>         [3] Use kmalloc() to replace kcalloc().
>         [4] others.

Please see especially my comment on your usage of nand_command_lp. But
other than that, I think that by the time we get to v4, this series
should be good. Anyway, I'll try to reserve any more nitpick-y
comments for minor things to my own follow-up patch(es). Thanks for
the work.

Brian
