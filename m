Received: from conssluserg-04.nifty.com ([210.131.2.83])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqrxe-0001xO-8B
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 01:54:48 +0000
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com
 [209.85.161.176]) (authenticated)
 by conssluserg-04.nifty.com with ESMTP id v2N1s9Oi026095
 for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2017 10:54:10 +0900
Received: by mail-yw0-f176.google.com with SMTP id v76so137701052ywg.0
 for <linux-mtd@lists.infradead.org>; Wed, 22 Mar 2017 18:54:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170322223550.1f1c97ae@bbrezillon>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
 <20170322223550.1f1c97ae@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Mar 2017 10:54:08 +0900
Message-ID: <CAK7LNATT9uz+vqRx6Fndyxm=TeVVRseM1rsA+8tNw7un5bkB6A@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 00/53] mtd: nand: denali: 2nd round of Denali
 NAND IP patch bomb
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, laurent.monat@idquantique.com,
 thorsten.christiansson@idquantique.com, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
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


2017-03-23 6:35 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> Hi Masahiro,
>
> On Thu, 23 Mar 2017 05:06:59 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> It took a couple months to update this series, but finally here is v2.
>> (v1: https://lkml.org/lkml/2016/11/26/144 )
>>
>> This driver includes many problems.
>>
>> One of the biggest one is a bunch of hard-coded parameters.  This IP
>> has many parameters that can be customized when a delivery RTL is
>> generated.  However, this driver was upstreamed by Intel, with
>> Intel parameters hard-coded.  Later, Altera added denali_dt.c to use
>> this driver for embedded boards, but they did not fix the code in
>> denali.c  So, this driver has never worked.  Even some DT bindings
>> actually turned out wrong.
>>
>> There are more problems: [1] The driver just retrieves the OOB area as-is
>> whereas the controller uses syndrome page layout. [2] Many NAND chip
>> specific parameters are hard-coded in the driver. [3] ONFi devices are
>> not working  [4] It can not read Bad Block Marker
>>
>> This patch series intends to solve those problems.
>>
>> Since v1, here are more fixes/improvements:
>>  - Fix raw/oob callbacks for syndrome page layout
>>  - Implement setup_data_interface() callback
>>  - Fix/implement more commands for ONFi devices
>>  - Allow to skip the driver internal bounce buffer
>>  - Support PIO in case DMA is not supported
>>  - Switch from ->cmdfunc over to ->cmd_ctrl
>
> I'll probably pick a few patches for 4.12, so please wait a bit before
> sending a v4.


This will be helpful.

I was refused by the SMTP server I use
(probably due to too much volume at once).




Please check the following as well.

>>   mtd: nand: do not check R/B# for CMD_READID in nand_command(_lp)
>>   mtd: nand: do not check R/B# for CMD_SET_FEATURES in nand_command(_lp)

I noticed them when I switched from ->cmdfunc to ->cmd_ctrl hook.



-- 
Best Regards
Masahiro Yamada
