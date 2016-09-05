Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgnOx-0006s4-Hi
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 06:29:04 +0000
Subject: Re: [PATCH] ubifs: compress lines for immediate return
To: Heiko Schocher <hs@denx.de>, linux-mtd@lists.infradead.org
References: <1473051597-30078-1-git-send-email-hs@denx.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <94271caf-4852-1d08-c6a0-102aac22ab65@nod.at>
Date: Mon, 5 Sep 2016 08:28:05 +0200
MIME-Version: 1.0
In-Reply-To: <1473051597-30078-1-git-send-email-hs@denx.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Heiko,

On 05.09.2016 06:59, Heiko Schocher wrote:
> fix the following code:
> 
> -ret = expression;
> -if (ret)
> -        return ret;
> -return 0;
> +return expression;

"Fix"? ;-)
What was broken?

I agree that we can write the expression in a different way, but is it really worth it?
Is this part of a tree-wide cleanup?

Thanks,
//richard
