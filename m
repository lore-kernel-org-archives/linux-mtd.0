MIME-Version: 1.0
In-Reply-To: <CAAQYJAuPpzDb_OV1naHZCovy4LJC0_6gFJKPqo7REt7zZzh0pw@mail.gmail.com>
References: <1498681836-3765-1-git-send-email-andrea.adami@gmail.com>
 <1498681836-3765-4-git-send-email-andrea.adami@gmail.com>
 <20170703112621.rd3ija3efqlq57rg@dell>
 <CAAQYJAuPpzDb_OV1naHZCovy4LJC0_6gFJKPqo7REt7zZzh0pw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 12 Jul 2017 00:42:00 +0200
Message-ID: <CAAQYJAvCdSG25U6DjiD5owC7GHyGnWyyaLD_R-fzuMGUDZN8pQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/9] mfd: tmio.h: support partition parser types
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linus Walleij <linus.walleij@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Mon, Jul 3, 2017 at 2:03 PM, Andrea Adami <andrea.adami@gmail.com> wrote=
:
> On Mon, Jul 3, 2017 at 1:26 PM, Lee Jones <lee.jones@linaro.org> wrote:
>> Please use the $SUBJECT line expected by the subsystem.
>>
>> `git log --oneline -- $SUBSYSTEM` can help with this.
>>
>> You also need a commit log.
>>
>
> Lee,
>
> thanks for spotting it.
> I'll fix the subject and add a little text in these patches touching head=
ers.
>
> I am awaiting for a new review of the big piece of the patch, the
> ftl/parser, then I'll send a fixed v5.
>
>

Lee,

I have looked at the history of mfd/tmio.h but couldn't find
unambiguous examples.
Do you prefer

Subject: mfd: tmio: tmio_nand: add partition parsers platform data
or
Subject: mfd: tmio: tmio-nand: add partition parsers platform data
or
Subject: mfd: tmio: tmio/nand: add partition parsers platform data

Thanks
Andrea


>>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>> ---
>>>  include/linux/mfd/tmio.h | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
>>> index a1520d8..23bb069 100644
>>> --- a/include/linux/mfd/tmio.h
>>> +++ b/include/linux/mfd/tmio.h
>>> @@ -139,6 +139,7 @@ struct tmio_nand_data {
>>>       struct nand_bbt_descr   *badblock_pattern;
>>>       struct mtd_partition    *partition;
>>>       unsigned int            num_partitions;
>>> +     const char *const       *types; /* names of parsers to use if any=
 */
>>
>> I'm okay with this if it's suits the MTD folk.
>>
>
> Other than kerneldoc comments there are maybe other little
> discordances to settle: see above is *partition, num_partitions.
> In the other header it is *partitions, nr_partitions ...I'll see if
> oneday I can janiitor this.
>
> Regards
> Andrea
>
>>>  };
>>>
>>>  #define FBIO_TMIO_ACC_WRITE  0x7C639300
>>
>> --
>> Lee Jones
>> Linaro STMicroelectronics Landing Team Lead
>> Linaro.org =E2=94=82 Open source software for ARM SoCs
>> Follow Linaro: Facebook | Twitter | Blog
