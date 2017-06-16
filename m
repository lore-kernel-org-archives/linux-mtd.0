Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLjyf-0001Rf-9c
 for linux-mtd@lists.infradead.org; Fri, 16 Jun 2017 05:39:27 +0000
Received: from mail-yb0-f171.google.com (mail-yb0-f171.google.com
 [209.85.213.171]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id v5G5cdpD027423
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jun 2017 14:38:39 +0900
Received: by mail-yb0-f171.google.com with SMTP id f192so9656508yba.2
 for <linux-mtd@lists.infradead.org>; Thu, 15 Jun 2017 22:38:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1497361550-8115-17-git-send-email-yamada.masahiro@socionext.com>
References: <1497361550-8115-1-git-send-email-yamada.masahiro@socionext.com>
 <1497361550-8115-17-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Jun 2017 14:38:37 +0900
Message-ID: <CAK7LNAQ+F4NZy=XFTaBS=L=sX0mMYcMFf0P+=QicggezxzAPBQ@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] mtd: nand: denali: avoid magic numbers and
 rename for clarification
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Enrico Jorns <ejo@pengutronix.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-06-13 22:45 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Introduce some macros and helpers to avoid magic numbers and
> rename macros/functions for clarification.
>
> - We see '| 2' in several places.  This means Data Cycle in MAP11 mode.
>   The Denali User's Guide says bit[1:0] of MAP11 is like follows:
>
>   b'00 = Command Cycle
>   b'01 = Address Cycle
>   b'10 = Data Cycle
>
>   So, this commit added DENALI_MAP11_{CMD,ADDR,DATA} macros.
>
> - We see 'denali->flash_mem + 0x10' in several places, but 0x10 is a
>   magic number.  Actually, this accesses the data port of the Host
>   Data/Command Interface.  So, this commit added DENALI_HOST_DATA.
>   On the other hand, 'denali->flash_mem' gets access to the address
>   port, so DENALI_HOST_ADDR was also added.
>
> - We see 'index_addr(denali, cmd, 0x1)' in denali_erase(), but 0x1
>   is a magic number.  0x1 means the erase operation.  Replace 0x1
>   with DENALI_ERASE.
>
> - Rename index_addr() to denali_host_write() for clarification
>
> - Denali User's Guide says MAP{00,01,10,11} for access mode.  Match
>   the macros with terminology in the IP document.
>
> - Rename struct members as follows:
>   flash_bank   -> active_bank    (currently selected bank)
>   flash_reg    -> reg            (base address of registers)
>   flash_mem    -> host           (base address of host interface)
>   devnum       -> devs_per_cs    (devices connected in parallel)
>   bbtskipbytes -> oob_skip_bytes (number of bytes to skip in OOB)
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v7: None
> Changes in v6:
>   - Newly added
>
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2: None


Please let me update 18.  (only typo fix)

I sent v8 for this one.


-- 
Best Regards
Masahiro Yamada
