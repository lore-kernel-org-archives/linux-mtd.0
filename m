Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1apSty-0006bU-CQ
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2016 03:52:39 +0000
Received: by mail-pa0-x233.google.com with SMTP id ot11so29654217pab.1
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2016 20:52:16 -0700 (PDT)
Date: Mon, 11 Apr 2016 09:22:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V2 2/7] cpufreq: Loongson1: Update cpufreq of Loongson1B
Message-ID: <20160411035211.GA16238@vireshk-i7>
References: <1460115779-13141-1-git-send-email-keguang.zhang@gmail.com>
 <1460115779-13141-2-git-send-email-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460115779-13141-2-git-send-email-keguang.zhang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08-04-16, 19:42, Keguang Zhang wrote:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> - Rename the file to loongson1-cpufreq.c
> - Use kcalloc() instead of kzalloc()
> - Use devm_kzalloc() instead of global structure
> - Use dev_get_platdata() to access the platform_data field
>   instead of referencing it directly
> - Remove superfluous error messages

Its much better now, in the sense that I can see what you have done.
And see you have done a lot.

That's not how you are supposed to send the patches, sorry.

You need to break this patch into multiple patches, each targeting a
particular fix.

And I have no idea now, what change you have done to make it work for
Loongson1B. Which of the above changes does that?

And please, just send out a separate cpufreq series and don't send
everything in a single patchset that covers DMA, cpufreq, clk, etc..

-- 
viresh
