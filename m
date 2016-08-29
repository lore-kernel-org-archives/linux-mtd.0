Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1beMYV-00038k-Ut
 for linux-mtd@lists.infradead.org; Mon, 29 Aug 2016 13:24:54 +0000
Received: by mail-lf0-x233.google.com with SMTP id f93so100730584lfi.2
 for <linux-mtd@lists.infradead.org>; Mon, 29 Aug 2016 06:24:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <VI1PR0401MB2640FF70F5770AEB32F7449E94140@VI1PR0401MB2640.eurprd04.prod.outlook.com>
References: <1470597730-10400-1-git-send-email-jteki@openedev.com>
 <VI1PR0401MB2640FF70F5770AEB32F7449E94140@VI1PR0401MB2640.eurprd04.prod.outlook.com>
From: Jagan Teki <jagannadh.teki@gmail.com>
Date: Mon, 29 Aug 2016 18:54:28 +0530
Message-ID: <CAD6G_RQmTJrT0AneZp1h+4Vc5f5d83Lp=be-6SSB7fAoweZg1A@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add s25fs256s1 spi-nor flash support
To: Yunhui Cui <yunhui.cui@nxp.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 17, 2016 at 2:27 PM, Yunhui Cui <yunhui.cui@nxp.com> wrote:
>
> On Monday, August 08, 2016 3:22 AM, Jagan Teki wrote:
>
>> Add Spansion s25fs256s1 spi-nor flash to the list of spi_nor_ids.
>>
>> In spansion S25FS-S family the physical sectors are grouped as normal and
>> parameter sectors. Parameter sectors are 4kB in size with 8 set located
>> at the bottom or top address of a device.
>> Normal sectors are similar to other flash family with sizes of 64kB or 32
>> kB.
>>
>> To erase whole flash using sector erase(D8h or DCh) won't effect the
>> parameter sectors, so in order to erase these we must use 4K sector erase
>> commands (20h or 21h) separately.
>>
>> So better to erase the whole flash using 4K sector erase instead of
>> detecting these family parts again and do two different erase operations.
>>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: Yunhui Cui <yunhui.cui@nxp.com>
>> Cc: Michael Trimarchi <michael@amarulasolutions.com>
>> Signed-off-by: Jagan Teki <jteki@openedev.com>
>> ---
>> Changes for v2:
>>       - Fix wrong vendor name in commit message
>
> [Yunhui] Actually, This flash is belongs to S25FS-S Family, besides,
> S25FS128S 128 Mbit (16 Mbyte)
> S25FS256S 256 Mbit (32 Mbyte)
> S25FS512S 512 Mbit (64 Mbyte)
> They need some specific operations, not the Spansion S25FL128S Family.

Please point what exactly the specific ops? because I observed S25FL
vs S25FS have change in a way that they erase the whole flash.

-- 
Jagan Teki.
