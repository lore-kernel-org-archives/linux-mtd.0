Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aoXR8-0004it-Kn
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2016 14:31:03 +0000
Received: by mail-wm0-x244.google.com with SMTP id y144so4781455wmd.0
 for <linux-mtd@lists.infradead.org>; Fri, 08 Apr 2016 07:30:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57079B87.9030209@nod.at>
References: <1460115779-13141-1-git-send-email-keguang.zhang@gmail.com>
 <1460115779-13141-4-git-send-email-keguang.zhang@gmail.com>
 <57079B87.9030209@nod.at>
From: Kelvin Cheung <keguang.zhang@gmail.com>
Date: Fri, 8 Apr 2016 22:30:21 +0800
Message-ID: <CAJhJPsXaidmMUX7CcTHshaYGZ-iqbaAExMh6eoOFDEAuzp4t7A@mail.gmail.com>
Subject: Re: [PATCH V2 4/7] mtd: nand: add Loongson1 NAND driver
To: Richard Weinberger <richard@nod.at>, linux-mips@linux-mips.org,
 linux-clk@vger.kernel.org,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 dmaengine@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: Ralf Baechle <ralf@linux-mips.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Vinod Koul <vinod.koul@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Courbot <gnurou@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
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

On 04/08/2016 07:52 PM, Richard Weinberger wrote:
> Am 08.04.2016 um 13:42 schrieb Keguang Zhang:
>> + chip->options = NAND_NO_SUBPAGE_WRITE;
>> + chip->ecc.mode = NAND_ECC_SOFT;
> Is the lack of HW ECC and subpage write a hardware limitation?

Yes, that's the hardware limitation of Loongson1B NAND controller.

> Thanks,
> //richard

Best regards,

Keguang Zhang
