Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ao3sW-0008N2-9N
 for linux-mtd@lists.infradead.org; Thu, 07 Apr 2016 06:57:20 +0000
Received: by mail-pf0-x233.google.com with SMTP id n1so50019901pfn.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2016 23:56:58 -0700 (PDT)
Date: Thu, 7 Apr 2016 12:26:55 +0530
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
Subject: Re: [PATCH V1 2/7] cpufreq: Loongson1: Update cpufreq of Loongson1B
Message-ID: <20160407065655.GH14903@vireshk-i7>
References: <1459946095-7637-1-git-send-email-keguang.zhang@gmail.com>
 <1459946095-7637-3-git-send-email-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459946095-7637-3-git-send-email-keguang.zhang@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06-04-16, 20:34, Keguang Zhang wrote:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> - Rename the file to loongson1-cpufreq.c
> - Use kcalloc() instead of kzalloc()
> - Use devm_kzalloc() instead of global structure
> - Use dev_get_platdata() to access the platform_data field
>   instead of referencing it directly
> - Remove superfluous error messages
> 
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> ---
>  drivers/cpufreq/Makefile            |   2 +-
>  drivers/cpufreq/loongson1-cpufreq.c | 230 ++++++++++++++++++++++++++++++++++++
>  drivers/cpufreq/ls1x-cpufreq.c      | 222 ----------------------------------
>  3 files changed, 231 insertions(+), 223 deletions(-)
>  create mode 100644 drivers/cpufreq/loongson1-cpufreq.c
>  delete mode 100644 drivers/cpufreq/ls1x-cpufreq.c

This can't be reviewed. I am not going to compare them line by line to
see what you might have changed in between.

Please use '-C -M' options of git format-patch to generate this, it
will give a review-able output of this.
-- 
viresh
