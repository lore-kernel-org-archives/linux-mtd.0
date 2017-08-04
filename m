Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddYT6-0002ll-Es
 for linux-mtd@lists.infradead.org; Fri, 04 Aug 2017 09:00:30 +0000
Received: by mail-oi0-x241.google.com with SMTP id e124so1005361oig.0
 for <linux-mtd@lists.infradead.org>; Fri, 04 Aug 2017 02:00:07 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <20170804093550.41e5936c@bbrezillon>
References: <20170721202636.3361536-1-arnd@arndb.de>
 <20170804093550.41e5936c@bbrezillon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Aug 2017 11:00:05 +0200
Message-ID: <CAK8P3a2Zvsc880ZYy9aaQ1fOJeO50uJc92OKMK0QxCcTzwGPsg@mail.gmail.com>
Subject: Re: [PATCH] [RESEND] mtd: only use __xipram annotation when
 XIP_KERNEL is set
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Michal Marek <mmarek@suse.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>,
 Chris Metcalf <cmetcalf@mellanox.com>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 4, 2017 at 9:35 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 21 Jul 2017 22:26:25 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:

>> Note that MTD_XIP has been broken on ARM since around 2011 or 2012. I
>> have sent another patch[2] to fix compilation, which I plan to merge
>> through arm-soc unless there are objections. The obvious alternative
>> to that would be to completely rip out the MTD_XIP support from the
>> kernel, since obviously nobody has been using it in a long while.
>>
>> Link: [1] https://patchwork.kernel.org/patch/8109771/
>> Link: [2] https://patchwork.kernel.org/patch/9855225/
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>  include/asm-generic/vmlinux.lds.h |  1 +
>>  include/linux/mtd/xip.h           | 10 ++++++----
>
> For the MTD part,
>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks. If you don't mind, could you just apply the patch to the mtd tree?

      Arnd
