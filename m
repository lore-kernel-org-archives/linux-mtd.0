Received: from conssluserg-01.nifty.com ([210.131.2.80])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cuw4F-0006EL-8e
 for linux-mtd@lists.infradead.org; Mon, 03 Apr 2017 07:06:25 +0000
Received: from mail-yb0-f169.google.com (mail-yb0-f169.google.com
 [209.85.213.169]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id v3375gV9013925
 for <linux-mtd@lists.infradead.org>; Mon, 3 Apr 2017 16:05:42 +0900
Received: by mail-yb0-f169.google.com with SMTP id l201so17794245ybf.0
 for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2017 00:05:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170330181623.5b595827@bbrezillon>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-27-git-send-email-yamada.masahiro@socionext.com>
 <20170330181623.5b595827@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 3 Apr 2017 16:05:40 +0900
Message-ID: <CAK7LNARSwcEdC=jm2z2WzoG0au48OgUVYDZqZ6r+wtydq5UYug@mail.gmail.com>
Subject: Re: [PATCH v3 26/37] mtd: nand: denali: fix bank reset function
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-03-31 1:16 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Thu, 30 Mar 2017 15:46:12 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> The function denali_nand_reset() is called during the driver probe,
>> and polls the INTR__RST_COMP and INTR__TIME_OUT bits.  However,
>> INTR__RST_COMP is set anyway even if no NAND device is connected to
>> that bank.
>>
>> This can be a problem for ONFi devices.  The nand_scan_ident()
>> iterates over maxchips, and calls nand_reset() for each chip.
>
> Actually, maxchips is a bad name. What should be passed in argument to
> nand_scan_ident() is not the maximum number of CS-line the controller
> has, it's the expected number of CS-lines provided by a chip.
>
> If you're using DT, this information should be retrieved from the DT. If
> you look at this binding doc [1] you'll see that each NAND chip has a
> reg property encoding the CS line. When a chip exposes more than one
> CS-line, the reg property should contain 2 entries describing which
> controller-side CS lines are connected to the chip CS-lines.


Actually, the Denali driver is much older than
commit 2d472aba15ff169 ("mtd: nand: document the NAND
controller/NAND chip DT representation").

So, I guess it is allowed to use the old binding,
then you were kind to merge my

commit 63757d463ea683b469c1976032054d46cecdef09
Author: Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu Mar 23 05:07:18 2017 +0900

    mtd: nand: denali: call nand_set_flash_node() to set DT node




Having said that, I have to admit the current implementation
(not my fault) is not nice in a long run.

In order to switch to the new binding,
I have to de-couple the controller and chips
(like you did for sunxi_nand)

I am taking a close look for how much efforts are needed
(because I am guessing you will recommend me to do this work  :-)  )





> For non-DT cases, this should be exposed by some other means (for
> example pdata, but I'm not sure it works well with PCI where everything
> is discoverable).
>
> So normally, you shouldn't have a timeout, or something is wrong with
> the DT/board description.
>
> Note that you might have different NAND models connected to the same
> NAND controller. If you call nand_scan_ident() only once and pass
> controllers->max_cs_lines to it, you will only have one chip detected,
> which is not what you expect.


The Denali IP actually supports multiple chip selects,
but has only a single set of parameter registers.

For example,
DEVICE_MAIN_AREA_SIZE must match to a chip's mtd->writesize.

If denali_select_chip() updates all parameter registers every time,
it would be theoretically possible to use different models.

(And, looks like sunxi_select_chip does this.)





-- 
Best Regards
Masahiro Yamada
