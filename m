Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGCfA-0004s6-Lg
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 21:59:54 +0000
Received: by mail-wm0-x229.google.com with SMTP id r201so1562752wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jun 2016 14:59:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <576C4A9B.8010708@denx.de>
References: <cover.1466440540.git.cyrille.pitchen@atmel.com>
 <0a3b22ec3bc41c26536f3acc8acfd98f9b3207ed.1466440540.git.cyrille.pitchen@atmel.com>
 <CAOMqctSuP6E55mJ7QrqASRQUpxSy=ZR-b7VPF=0vcw45B6S+Yg@mail.gmail.com>
 <576C4A9B.8010708@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Thu, 23 Jun 2016 23:58:51 +0200
Message-ID: <CAOMqctT_a2Zb1RArxB3jVQU0p1iZWKxsC9s4ZkqiEzxB-f3qHA@mail.gmail.com>
Subject: Re: [PATCH 7/9] mtd: m25p80: add support of dual and quad spi
 protocols to all commands
To: Marek Vasut <marex@denx.de>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, nicolas.ferre@atmel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 23 June 2016 at 22:46, Marek Vasut <marex@denx.de> wrote:
> On 06/23/2016 10:35 PM, Michal Suchanek wrote:
>> Hello,
>
> Hi,
>
>> this patch is kind of awesome.
>>
>> I have a few practical concerns however.
>>
>> On 20 June 2016 at 18:50, Cyrille Pitchen <cyrille.pitchen@atmel.com> wrote:
>>> Before this patch, m25p80_read() supported few SPI protocols:
>>> - regular SPI 1-1-1
>>> - SPI Dual Output 1-1-2
>>> - SPI Quad Output 1-1-4
>>> On the other hand, all other m25p80_*() hooks only supported SPI 1-1-1.
>>
>> Under typical use my estimate is that huge majority of data is
>> transferred in _read() seconded by _write().
>>
>> As I understand it the n-n-n means how many bits you transfer in
>> parallel when sending command-address-data.
>>
>> In _read() the command and data overhead is negligible when you can
>> read kilobytes at once. So difference between 1-1-4 and 4-4-4 is not
>> meaningful performance-wise. Are there flash chips that support one
>> but not the other?
>
> That's quite unlikely.
>
>> For _write() the benefits are even harder to assess.
>
> The page program usually works on 256B pages, so the math is rather easy.
>
>> You can
>> presumably write at n-n-4 or n-n-2 if your controller and flash
>> supports it transferring the page faster. And then spend possibly
>> large amount of time waiting for the flash to get ready again. If the
>> programming time is fixed transferring the page faster may or may not
>> have benefits. It may at least free the bus for other devices to use.
>>
>> The _reg_ stuff is probably negligible altogether,
>>
>> Lastly the faster transfers of address bytes seem to be achieved with
>> increasingly longer command codes given how much the maximum command
>> length increased. So even in a page write where the address is a few %
>> of the transfer the benefit of these extra modes is dubious.
>>
>> Overall I wonder how much it is worthwhile to complicate the code to
>> get all these modes in every single function.
>
> In my opinion, 1-1-x makes sense as it is supported by most flashes,
> while n-m-x where n,m>1 does not make sense as it often requires some
> stateful change to non-volatile register with little gain.
>

There is actually one thing that x-x-x modes make easier. If I were to
implement dual mode switch on my SPI master controller it would be
probably set for whole message and would not change mid-transfer.
Still you can probably simulate x-x-x with 1-1-x by scattering the
1-1-x command bits across more bytes.

Thanks

Michal
