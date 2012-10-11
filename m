Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TMR7P-0008Ap-8I
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2012 22:20:39 +0000
Received: by mail-we0-f177.google.com with SMTP id u50so1372331wey.36
 for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2012 15:20:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20121011180406.GX12801@game.jcrosoft.org>
References: <1349335709-13399-1-git-send-email-linus.walleij@linaro.org>
 <1349953632.12014.8.camel@sauron.fi.intel.com>
 <20121011180406.GX12801@game.jcrosoft.org>
Date: Fri, 12 Oct 2012 00:20:37 +0200
Message-ID: <CACRpkdb+=EPVjuwcCHqc-HE09cBhjo1fAf69iWVdHC+auEyc8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: nomadik: switch over to using the FSMC driver
From: Linus Walleij <linus.walleij@linaro.org>
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Mike Turquette <mturquette@linaro.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org,
 Alessandro Rubini <rubini@unipv.it>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Mike Turquette <mturquette@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 11, 2012 at 8:04 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:
> On 14:07 Thu 11 Oct     , Artem Bityutskiy wrote:
>>
>> Pushed both to l2-mtd.git, thanks!
>
> wait on this one Linus said he will send an other version based on my patch
> for fmsc

I made a fix-up patch instead, that's simpler I guess... mailing out now.

Thanks,
Linus Walleij
