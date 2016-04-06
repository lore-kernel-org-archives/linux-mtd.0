Received: from mail-oi0-x230.google.com ([2607:f8b0:4003:c06::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1annZB-0008Oo-0X
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2016 13:32:17 +0000
Received: by mail-oi0-x230.google.com with SMTP id p188so57669854oih.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Apr 2016 06:31:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1459946095-7637-6-git-send-email-keguang.zhang@gmail.com>
References: <1459946095-7637-1-git-send-email-keguang.zhang@gmail.com>
 <1459946095-7637-6-git-send-email-keguang.zhang@gmail.com>
Date: Wed, 6 Apr 2016 15:31:53 +0200
Message-ID: <CACRpkdYGjz5n4Cw=cE45-KeWLZ1ZK82MMVEe5sYxkoCbNfZ-Yw@mail.gmail.com>
Subject: Re: [PATCH V1 5/7] gpio: Loongson1: add Loongson1 GPIO driver
From: Linus Walleij <linus.walleij@linaro.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: Linux MIPS <linux-mips@linux-mips.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 dmaengine@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Alexandre Courbot <gnurou@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 6, 2016 at 2:34 PM, Keguang Zhang <keguang.zhang@gmail.com> wrote:

> From: Kelvin Cheung <keguang.zhang@gmail.com>
>
> This patch adds GPIO driver for Loongson1B.
>
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>

Nice and pretty driver.
Patch applied for v4.7.

Yours,
Linus Walleij
