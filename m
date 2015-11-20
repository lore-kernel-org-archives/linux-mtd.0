Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzqvX-0008Or-Uc
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:00:56 +0000
Received: by wmec201 with SMTP id c201so85112448wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 11:00:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151119231857.GM64635@google.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <e1251eea4ec9cc8c72d54300f3396919a3afe4b1.1439543572.git.hramrach@gmail.com>
 <20151119231857.GM64635@google.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 20 Nov 2015 19:59:54 +0100
Message-ID: <CAOMqctSn=bMu0b4YgtAs=GJCZ6YiEcR4Q0ZgisyQ8SAAnObH-w@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] mtd: spi-nor: simplify write loop
To: Brian Norris <computersforpeace@gmail.com>
Cc: Hou Zhiqiang <B48286@freescale.com>, Huang Shijie <shijie.huang@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Han Xu <han.xu@freescale.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMLA==?= <beanhuo@micron.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
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

On 20 November 2015 at 00:18, Brian Norris <computersforpeace@gmail.com> wrote:
> Hi Michal,
>
> Sorry this has sat so long...
>
> On Fri, Aug 14, 2015 at 09:23:08AM -0000, Michal Suchanek wrote:
>> The spi-nor write loop assumes that what is passed to the hardware
>> driver write() is what gets written.
>>
>> When write() writes less than page size at once data is dropped on the
>> floor. Check the amount of data writen.
>
> Have you seen write() return less than the page size? I know you've
> struggled with a SPI driver that can't do "very" (for some definition of
> very) long transfers, due to unknown bugs, but I thought that "very" was
> much larger than the page size.

Not in the case of a driver that can transfer 63 bytes at a time. It
because the DMA engine needed for normal operation was not merged yet,
though.

>
>> This also means that write can start mid-page any time so there is
>> no special case for first page.
>
> I think we'd have some problems if we start seeing hardware that can't
> write ~256 bytes at a time. If nothing else, this can be a problem
> because some SPI NOR flash are known to have inferior reliability if you
> regularly write in small chunks. I believe this is because they actually
> use some kind of internal ECC.
>
> So, if you're just guarding against a theoretical behavior, perhaps it's
> best if this is done with some kind of assertion, as I'd rather not
> encourage non-aligned writes if possible. I notice you used BUG_ON() in
> another patch, but I'd suggest maybe something less harsh, like WARN()
> or WARN_ONCE().

I agree that a warning is in order in the case when whole page cannot
be written in one go.

Thanks

Michal
