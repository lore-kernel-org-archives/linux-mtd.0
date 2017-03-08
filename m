MIME-Version: 1.0
In-Reply-To: <20170307193441.0c6fd555@bbrezillon>
References: <1487593718-20752-1-git-send-email-boris.brezillon@free-electrons.com>
 <1487593718-20752-4-git-send-email-boris.brezillon@free-electrons.com>
 <CAK7LNASNFJ6_LJBS7jyyJ3-Uv_ExTYAj+tkJTCYrpDz8_BXa3Q@mail.gmail.com>
 <20170307193441.0c6fd555@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 8 Mar 2017 10:31:25 +0900
Message-ID: <CAK7LNAQP56_XUPhGfMX7EGb29SyNCBKkxt43sRXbU6C27mOUQA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: nand: Remove unused chip->write_page() hook
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Haavard Skinnemoen <hskinnemoen@gmail.com>,
 Hans-Christian Egtvedt <egtvedt@samfundet.no>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2017-03-08 3:34 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Tue, 7 Mar 2017 21:04:50 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> Hi Boris,
>>
>> 2017-02-20 21:28 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
>> > The last/only user of the chip->write_page() hook (the Atmel NAND
>> > controller driver) has been reworked and is no longer specifying a custom
>> > ->write_page() implementation.
>> > Drop this hook before someone else start abusing it.
>> >
>> > Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>
>>
>> Just a minor comment.
>>
>>
>> /**
>>  * nand_write_page - [REPLACEABLE] write one page
>>  * @mtd: MTD device structure
>>
>>
>> Can you update the comment block for nand_write_page(), too?
>>
>>   [REPLACEABLE]  ->  [INTERNAL]
>
> I think I'll just drop it, it does not mean anything to flag a static
> function as replaceable (the ->write_page() method could be overloaded,
> but not the nand_write_page() implementation itself).
>

Sounds good to me.   Thank you!



-- 
Best Regards
Masahiro Yamada
