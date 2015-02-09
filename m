Received: from mail-lb0-x233.google.com ([2a00:1450:4010:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YKxvc-0005hF-Id
 for linux-mtd@lists.infradead.org; Mon, 09 Feb 2015 23:39:45 +0000
Received: by mail-lb0-f179.google.com with SMTP id w7so8875633lbi.10
 for <linux-mtd@lists.infradead.org>; Mon, 09 Feb 2015 15:39:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150209221859.GS18140@ld-irv-0074>
References: <CAOMZO5BgY1YXdnoKpZJW6k9AdrDFZH=6mdCfuB=9aSVZukAV8A@mail.gmail.com>
 <20150209221859.GS18140@ld-irv-0074>
Date: Mon, 9 Feb 2015 21:39:22 -0200
Message-ID: <CAOMZO5BMrA1HGXXoriwbAk53Kmkr8GcQbEt75CuT_voeqW3s6Q@mail.gmail.com>
Subject: Re: m25p80 spi1.0: unrecognized JEDEC id
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Huang Shijie <shijie8@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 9, 2015 at 8:18 PM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Feb 09, 2015 at 08:09:02PM -0200, Fabio Estevam wrote:
>> Hi,
>>
>> Running linux-next 20150209 on a mx28evk I see that m25p80 is not
>> detected correctly:
>>
>> m25p80 spi1.0: unrecognized JEDEC id bytes: bf, 24, 40
>
> That's not good. I don't see anything in MTD's -next that should cause
> that though.

Yes, I have just tested other platform (mx6) with linux-next and
m25p80 can be probed.

Looks like the issue is mxs specific and comes from other area (spi
driver, dma, clocks, etc).

Regards,

Fabio Estevam
