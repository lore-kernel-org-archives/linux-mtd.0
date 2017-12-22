Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eSBXA-00030Z-3y
 for linux-mtd@lists.infradead.org; Fri, 22 Dec 2017 00:49:58 +0000
Received: by mail-lf0-x22f.google.com with SMTP id e30so12942629lfb.9
 for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2017 16:49:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <a06312e4-a7e6-8b7b-9eb5-8320302dcc55@exceet.de>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
 <20171205135804.478902dc@bbrezillon> <20171205140313.40f3f17d@bbrezillon>
 <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
 <20171213222710.32d12514@bbrezillon>
 <CAAyFORJcT1abbo21iA4cetLKmF0zE4akFGFryxPpwPO+730LDQ@mail.gmail.com>
 <20171214085036.436b4fcf@bbrezillon>
 <CAAyFOR+=JwTRTm2MXVdMy7KRPsnV8LV4t71kHUh_s=+QOsVurA@mail.gmail.com>
 <23d17416-e555-4b92-cc47-f644fbe676c6@exceet.de>
 <20171214163848.41f6d277@bbrezillon>
 <CAAyFORKeFq+=tF9AK+8hp6GYYiyp3DKcw8+LWrC3RWS2zLNU_w@mail.gmail.com>
 <CAAyFORJEuEaHDXgk+m0ax5RoZ-3cRJs6uFXw7syR4vHE1veEwQ@mail.gmail.com>
 <a06312e4-a7e6-8b7b-9eb5-8320302dcc55@exceet.de>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 22 Dec 2017 08:49:42 +0800
Message-ID: <CAAyFORL6mUFXFRvku6sm=Pj2=+Bf4wSV7EoBM_7+wRdPrF-ufw@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frieder,

On Thu, Dec 21, 2017 at 7:48 PM, Frieder Schrempf
<frieder.schrempf@exceet.de> wrote:
> Hello Boris,
>
>>>>> So shouldn't there be an spinand_die_select_op in the SPI NAND core
>>>>> that
>>>>> is executed when necessary and skipped if there's only one die.
>>>>
>>>>
>>>> Sure, I was arguing against a ->select_chip() at the generic NAND
>>>> level. That's something you can add in the SPI NAND framework.
>
>
> I added an op to send the die selection command and call it, where I think
> it is needed: [1]

I think we should add die_select_op in vendor's file and call a hook in core.c
since the die select command implementation is different by vendors.

Thanks
Peter Pan


>
> Accessing both dies on the Winbond SPI NAND works fine like this.
>
> While running tests I came across some problems:
>
> * On accessing the BBT in RAM via nanddev_bbt_[set/get]_block_status, the
> calculation of position and offset seems to be wrong.
> My fix is here: [2]
>
> * On calculating the row address for read/program/erase via
> nanddev_pos_to_row, it seems like the eraseblock_addr_shift is wrong.
>
> * Also, I'm not sure if the LUN should be taken into account when
> calculating the row address. At least when you select the LUN by issuing a
> separate command, the row address sent to the chip should only contain the
> page address.
> But I'm not sure if that's the case in general, or if some code is needed to
> differentiate.
>
> See my changes of nanddev_pos_to_row here: [3]
>
> * I run into a mutex deadlock, when spinand_write_page fails (e.g. because
> of a bad block) as the lock is not released in such cases. See my fix here:
> [4]
>
> With these fixes applied and as far as I can tell everything seems to work
> fine. I'll do some tests with UBI next and look into the ECC topic.
>
> Regards,
>
> Frieder
>
> [1]:
> https://github.com/fschrempf/linux-0day/compare/4f8472ea05f27d55ebb2e42eadc9ed59d7036f4c...fschrempf:2c5471c1f1e04fa91ff80c95276b4828b99c4f94
>
> [2]:
> https://github.com/fschrempf/linux-0day/commit/937a16248570368fe05e15b1f70e753e202b6ae6
>
> [3]:
> https://github.com/fschrempf/linux-0day/commit/8013696e0394960bfc36625d277f0d2425262939
>
> [4]:
> https://github.com/fschrempf/linux-0day/commit/28ffc7211745dd124702358c24ddccff8e6f2d95
