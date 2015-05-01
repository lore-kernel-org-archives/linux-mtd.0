Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yo8X4-00080H-6H
 for linux-mtd@lists.infradead.org; Fri, 01 May 2015 10:50:58 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 895BC28BFF5
 for <linux-mtd@lists.infradead.org>; Fri,  1 May 2015 12:49:27 +0200 (CEST)
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
 [209.85.216.182])
 by arrakis.dune.hu (Postfix) with ESMTPSA id B71F728BFFE
 for <linux-mtd@lists.infradead.org>; Fri,  1 May 2015 12:49:20 +0200 (CEST)
Received: by qcbdu2 with SMTP id du2so1163032qcb.3
 for <linux-mtd@lists.infradead.org>; Fri, 01 May 2015 03:50:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOMqctSn-Ct06tWqSVYPbdoXcFmwrLb1Y9MGvhsSz0gf+fRP3Q@mail.gmail.com>
References: <cover.1430430153.git.hramrach@gmail.com>
 <35add8df33b17e2354d9496eba8597d9d8488f30.1430430153.git.hramrach@gmail.com>
 <201505010113.50293.marex@denx.de>
 <CAOMqctSn-Ct06tWqSVYPbdoXcFmwrLb1Y9MGvhsSz0gf+fRP3Q@mail.gmail.com>
From: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 1 May 2015 12:50:04 +0200
Message-ID: <CAOiHx==3emNU_Tnc952g7fWi9eSTDNq2-fi9KiAQ9Gfiv011Yw@mail.gmail.com>
Subject: Re: [PATCH 3/3] MTD: spi-nor: add flag to not use sector erase.
To: Michal Suchanek <hramrach@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Ben Hutchings <ben@decadent.org.uk>, "grmoore@altera.com" <grmoore@altera.com>,
 Rafa?? Mi??ecki <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
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

Hi,

On Fri, May 1, 2015 at 9:05 AM, Michal Suchanek <hramrach@gmail.com> wrote:
> On 1 May 2015 at 01:13, Marek Vasut <marex@denx.de> wrote:
>> On Thursday, April 30, 2015 at 11:13:12 PM, Michal Suchanek wrote:
>>> The sector size of the flash memory is unclear from datasheet or may
>>> possibly vary between chips so add a flag to always use 4k blocks.
>>>
>>> Currently 4k blocks are always used when possible but in the future
>>> somebody might want to do some optimizations with sector erase.
>>>
>>> Signed-off-by: Michal Suchanek <hramrach@gmail.com>
>>
>> I _think_ you might be able to determine the size, no ?
>>
>> One way is to ask the vendor, but you can also try something like:
>> 1) erase the whole SPI NOR
>> 2) overwrite it with zeroes (or ones ? I think it should be all ones after
>> erasing).
>> 3) Erase sector 0
>> 4) Read some 128 KiB back
>> 5) Observe what is the difference.
>>
>
> I can determine it for this particular chip. However, when the vendor
> datasheet says the block is 64/32K it might mean that chips with this
> ID can have either block size.
>
> It's a value that we don't use anyway so I just mark it as unknown
> here for future reference.

It will be used if MTD_SPI_NOR_USE_4K_SECTORS is unset, so you should
add some code to properly handle that case.

Also I'd suggest switching the order of 2 and 3, so you add the flag
handling first and then add support for a flash chip with this issue.


Regards
Jonas
