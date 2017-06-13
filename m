Received: from conssluserg-03.nifty.com ([210.131.2.82])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dKgoy-0001qJ-SQ
 for linux-mtd@lists.infradead.org; Tue, 13 Jun 2017 08:05:10 +0000
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id v5D84C1V024771
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 17:04:12 +0900
Received: by mail-yw0-f179.google.com with SMTP id e142so37570810ywa.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2017 01:04:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170613090249.6a247389@bbrezillon>
References: <1497330250-17348-1-git-send-email-yamada.masahiro@socionext.com>
 <20170613090249.6a247389@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 13 Jun 2017 17:04:11 +0900
Message-ID: <CAK7LNAQr+pxE_orE5m1+9v3aFjMJmWMy+rWCecNk_RsVdhezoA@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: nand: denali: Denali NAND IP patch bomb
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-mtd@lists.infradead.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Enrico Jorns <ejo@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,


2017-06-13 16:02 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> Le Tue, 13 Jun 2017 14:03:52 +0900,
> Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
>
>> This patch series intends to solve various problems.
>>
>> [1] The driver just retrieves the OOB area as-is
>>     whereas the controller uses syndrome page layout.
>> [2] ONFi devices are not working
>> [3] It can not read Bad Block Marker
>>
>> Outstanding changes are:
>>  - Fix raw/oob callbacks for syndrome page layout
>>  - Implement setup_data_interface() callback
>>  - Fix/implement more commands for ONFi devices
>>  - Allow to skip the driver internal bounce buffer
>>  - Support PIO in case DMA is not supported
>>  - Switch from ->cmdfunc over to ->cmd_ctrl
>>
>> 18 patches were merged by v2.
>> 11 patches were merged by v3.
>> 2 patches were merged by v4.
>> 5 patches were merged by v5.
>> Here is the rest of the series.
>>
>> v1: https://lkml.org/lkml/2016/11/26/144
>> v2: https://lkml.org/lkml/2017/3/22/804
>> v3: https://lkml.org/lkml/2017/3/30/90
>> v4: https://lkml.org/lkml/2017/6/5/1005
>>
>> Masahiro Yamada (18):
>>   mtd: nand: denali: set NAND_ECC_CUSTOM_PAGE_ACCESS
>>   mtd: nand: denali: remove unneeded find_valid_banks()
>>   mtd: nand: denali: handle timing parameters by setup_data_interface()
>>   mtd: nand: denali: rework interrupt handling
>>   mtd: nand: denali: fix NAND_CMD_STATUS handling
>>   mtd: nand: denali: fix NAND_CMD_PARAM handling
>
> AFAICT, patch 5 and 6 are unneeded...
>
>>   mtd: nand: denali: switch over to cmd_ctrl instead of cmdfunc
>
> ... because you're anyway switching to ->cmd_ctrl() in patch 7, which
> fixes the problem you were addressing in patch 5 and 6.
>
> Please squash those 3 patches into a single one and adjust your commit
> message accordingly (explaining that it fixes STATUS and PARAM handling).
> See below if you need an example.

Squashing 3 patches is OK, but I did not get your additional implementation=
.


> BTW, I also implemented ->read/write_buf_word() since the core may one
> day call these functions, and the default implementations used by the
> core when these hooks are NULL are not appropriate in your case.

I implemented

denali_read_buf()
denali_write_buf()
denali_read_buf16()
denali_write_buf16()

in 13/18 in a bit different way:
http://patchwork.ozlabs.org/patch/774961/


If you like, I can modify 13/18 so that
denali_read/write_byte() is implemented based on denali_read/write_buf().





> --->8---
> From 136727ba7b453ca1567c711037230aa6ec0f124a Mon Sep 17 00:00:00 2001
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
> Date: Tue, 13 Jun 2017 14:03:57 +0900
> Subject: [PATCH] mtd: nand: denali: switch over to cmd_ctrl instead of cm=
dfunc
>
> The NAND_CMD_SET_FEATURES support is missing from denali_cmdfunc().
>
> Besides, we see /* TODO: Read OOB data */ comment line.
>
> It would be possible to add more commands along with the current
> implementation, but having ->cmd_ctrl() seems a better approach from
> the discussion with Boris [1].
>
> Rely on the default ->cmdfunc() from the framework and implement the
> driver's own ->cmd_ctrl(). We are also implementing
> ->read/write_buf/byte/word().
>
> Also add ->write_byte(), which is needed for write direction commands.
>
> Then, we can drop nand_onfi_get_set_features_notsupp from this driver.
>
> This transition also fixes NAND_CMD_STATUS and NAND_CMD_PARAM handling.
> NAND_CMD_STATUS was just faked by the implementation, and the only valid
> bit returned in this case was the WP bit.
> NAND_CMD_PARAM was completely broken: not only the command sent on the
> bus was NAND_CMD_STATUS instead of NAND_CMD_PARAM, but the driver was
> only reading 8 bytes of data, while the parameter page is contains
> several hundreds of bytes.

Probably "... page contains" instead of "... page is contains".





--=20
Best Regards
Masahiro Yamada
