Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZStg3-00069D-KI
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 21:16:44 +0000
From: Marek Vasut <marex@denx.de>
To: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Date: Fri, 21 Aug 2015 23:16:21 +0200
Cc: Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
References: <1440148160-14355-1-git-send-email-marex@denx.de>
 <201508212034.50804.marex@denx.de>
 <CAOiHx=kU_Pg3RXojJPtPWdyVwwn+GAVotw0pR4hF4FDQPNXEtg@mail.gmail.com>
In-Reply-To: <CAOiHx=kU_Pg3RXojJPtPWdyVwwn+GAVotw0pR4hF4FDQPNXEtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508212316.21111.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, August 21, 2015 at 10:49:46 PM, Jonas Gorski wrote:
> On Fri, Aug 21, 2015 at 8:34 PM, Marek Vasut <marex@denx.de> wrote:
> > On Friday, August 21, 2015 at 04:15:11 PM, Jonas Gorski wrote:
> >> > This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
> >> > mtd: nand: add common DT init code
> >> 
> >> I know that this commit named it dn for nand, but IMHO "dn" isn't a
> >> very readable member name, so I would suggest using something with
> >> "node" in it (just using of_node as well seems to be common). I see no
> >> place where the name length might become an issue.
> > 
> > I thought .dn was supposed to be abbrev for device_node ;-)
> 
> Sure, if you know what it is supposed to stand for it is obvious ;-).
> And from a "stylistic" point of view, struct spi_nor has members
> called page_size, flash_read or cmd_buf and not ps, fr, or cb so using
> dn instead of e.g. dev_node seems a bit odd.

On the other hand, the .dn is consistent across the MTD subsystem.
I don't have a strong prefference though.

Best regards,
Marek Vasut
