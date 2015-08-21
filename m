Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZStGm-0006an-92
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 20:50:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 0B32428C19F
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 22:49:20 +0200 (CEST)
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
 [209.85.217.180])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 013E72844A3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 22:49:16 +0200 (CEST)
Received: by lbbsx3 with SMTP id sx3so50800301lbb.0
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2015 13:50:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201508212034.50804.marex@denx.de>
References: <1440148160-14355-1-git-send-email-marex@denx.de>
 <CAOiHx==Vuc8CCF0rTr5E8A0n31oeAR=UA3PgGhKTwEzi5PH0Jw@mail.gmail.com>
 <201508212034.50804.marex@denx.de>
From: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 21 Aug 2015 22:49:46 +0200
Message-ID: <CAOiHx=kU_Pg3RXojJPtPWdyVwwn+GAVotw0pR4hF4FDQPNXEtg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
To: Marek Vasut <marex@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 21, 2015 at 8:34 PM, Marek Vasut <marex@denx.de> wrote:
> On Friday, August 21, 2015 at 04:15:11 PM, Jonas Gorski wrote:
>> > This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
>> > mtd: nand: add common DT init code
>>
>> I know that this commit named it dn for nand, but IMHO "dn" isn't a
>> very readable member name, so I would suggest using something with
>> "node" in it (just using of_node as well seems to be common). I see no
>> place where the name length might become an issue.
>
> I thought .dn was supposed to be abbrev for device_node ;-)

Sure, if you know what it is supposed to stand for it is obvious ;-).
And from a "stylistic" point of view, struct spi_nor has members
called page_size, flash_read or cmd_buf and not ps, fr, or cb so using
dn instead of e.g. dev_node seems a bit odd.


Jonas
