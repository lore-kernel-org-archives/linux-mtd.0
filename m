Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alHFz-0002Mk-Vh
 for linux-mtd@lists.infradead.org; Wed, 30 Mar 2016 14:38:05 +0000
Received: by mail-qk0-x235.google.com with SMTP id x64so20415489qkd.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Mar 2016 07:37:43 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: jz4780: fixup, device structure assigned at
 probe
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1458784407-12908-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160330163432.29c3864c@bbrezillon>
Cc: alex@alex-smith.me.uk, harvey.hunt@imgtec.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Message-ID: <56FBE4B4.8030807@linaro.org>
Date: Wed, 30 Mar 2016 10:37:40 -0400
MIME-Version: 1.0
In-Reply-To: <20160330163432.29c3864c@bbrezillon>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/30/2016 10:34 AM, Boris Brezillon wrote:
> On Wed, 23 Mar 2016 21:53:27 -0400
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org> wrote:
>
> How about adding the following message:
>
> "
> bch->dev is already assigned to &pdev->dev in the probe function.
> Remove the duplicate assignment done in jz4780_bch_get().
> "
>
> If you agree I'll add this commit message while applying (no need to
> resend).

I am so sorry - got side tracked I should have followed up.
yes that is what I tried (seems like I failed miserably) to indicated in the
commit title.

>
> Harvey, can I have your ack on this patch?
>
> Thanks,
>
> Boris
