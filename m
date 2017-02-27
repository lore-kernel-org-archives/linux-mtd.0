Received: from mail-qk0-x231.google.com ([2607:f8b0:400d:c09::231])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciTkN-00018h-6Z
 for linux-mtd@lists.infradead.org; Mon, 27 Feb 2017 22:26:26 +0000
Received: by mail-qk0-x231.google.com with SMTP id n127so121109479qkf.0
 for <linux-mtd@lists.infradead.org>; Mon, 27 Feb 2017 14:26:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170227214230.53f05677@bbrezillon>
References: <1488227292-18906-1-git-send-email-albeu@free.fr>
 <20170227214230.53f05677@bbrezillon>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Mon, 27 Feb 2017 14:26:01 -0800
Message-ID: <CAAtXAHfqDzeaHsbTzF=Ki0gafJXoxhtRYm3BUG_CycSP+vhP0g@mail.gmail.com>
Subject: Re: [RFC 0/3] drivers: Add an API to read device specific config data
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Alban <albeu@free.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

On Mon, Feb 27, 2017 at 12:42 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> +Moritz
>
> Hi Alban,
>
> On Mon, 27 Feb 2017 21:28:09 +0100
> Alban <albeu@free.fr> wrote:
>
>> Hi all,
>>
>> while looking at adding OF support for the ath9k driver I had the problem of
>> reading the EEPROM data. On the SoC platforms this data is stored in an SPI
>> flash along with a few other things. In OpenWRT/LEDE this data is read from
>> the board init code using the fact that the flash is (normaly) readable from
>> a memory map. A bit too hackish for my taste.
>>
>> This is just one example, there is various other similar cases, mostly with
>> MAC addresses. I thought it would be nicer if we had a clean API for this,
>> similar to the firmware API but per device instance instead of beeing per
>> driver. The device driver wouldn't have to care where the data is stored,
>> they just request it and the backend take care of reading the EEPROM, MTD
>> or whatever is used on the board.
>>
>> This series implement such an API along with an implementation for MTD
>> devices and a use in the ath9k driver. As this is an RFC I didn't yet
>> write the OF binding documentation, that will come later if the feedback
>> is positive.
>
> What you're looking for already exists and it's called nvmem[1]. Some
> work has been done to expose MTD partitions as nvmem cells [2], but
> it's never been finished.
> Can you please finish Moritz implementation instead of creating a new
> API?

Whoops ... this totally fell off my radar (project got axed for $REASONS).
I could potentially take another look at this this weekend, otherwise I'm
happy to review whatever you come up with Alban.

Cheers,

Moritz
