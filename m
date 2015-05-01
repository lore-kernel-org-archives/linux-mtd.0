Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yo51e-0001jw-3b
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 07:06:19 +0000
Received: by wizk4 with SMTP id k4so44831215wiz.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2015 00:05:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201505010113.50293.marex@denx.de>
References: <cover.1430430153.git.hramrach@gmail.com>
 <35add8df33b17e2354d9496eba8597d9d8488f30.1430430153.git.hramrach@gmail.com>
 <201505010113.50293.marex@denx.de>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 1 May 2015 09:05:15 +0200
Message-ID: <CAOMqctSn-Ct06tWqSVYPbdoXcFmwrLb1Y9MGvhsSz0gf+fRP3Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Woodhouse <dwmw2@infradead.org>, Rafa?? Mi??ecki <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, "grmoore@altera.com" <grmoore@altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Ben Hutchings <ben@decadent.org.uk>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1 May 2015 at 01:13, Marek Vasut <marex@denx.de> wrote:
> On Thursday, April 30, 2015 at 11:13:12 PM, Michal Suchanek wrote:
>> The sector size of the flash memory is unclear from datasheet or may
>> possibly vary between chips so add a flag to always use 4k blocks.
>>
>> Currently 4k blocks are always used when possible but in the future
>> somebody might want to do some optimizations with sector erase.
>>
>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>
> I _think_ you might be able to determine the size, no ?
>
> One way is to ask the vendor, but you can also try something like:
> 1) erase the whole SPI NOR
> 2) overwrite it with zeroes (or ones ? I think it should be all ones after
> erasing).
> 3) Erase sector 0
> 4) Read some 128 KiB back
> 5) Observe what is the difference.
>

I can determine it for this particular chip. However, when the vendor
datasheet says the block is 64/32K it might mean that chips with this
ID can have either block size.

It's a value that we don't use anyway so I just mark it as unknown
here for future reference.

Thanks

Michal
