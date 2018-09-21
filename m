Received: from 10.mo1.mail-out.ovh.net ([178.32.96.102])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g3EdN-0000wH-Sp
 for linux-mtd@lists.infradead.org; Fri, 21 Sep 2018 06:09:50 +0000
Received: from player786.ha.ovh.net (unknown [10.109.160.93])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id BA8B3135FF0
 for <linux-mtd@lists.infradead.org>; Fri, 21 Sep 2018 08:09:23 +0200 (CEST)
Subject: Re: [PATCH 1/4] mtd: spi-nor: aspeed: use command mode for reads
To: Joel Stanley <joel@jms.id.au>, Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>
References: <20180622121417.6762-1-clg@kaod.org>
 <20180622121417.6762-2-clg@kaod.org>
 <CACPK8Xf-XfxMVMewC5T6u1XzDX3idqk+FeGRLMC+xrKDqtWggg@mail.gmail.com>
 <CACPK8XePSehmuYTtJFYuNqUz_CQ4cQ6s4gdZ2rKNKUpO46yZKQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b4d99763-98d6-ef64-d1b2-bd86c6a10e12@kaod.org>
Date: Fri, 21 Sep 2018 08:09:11 +0200
MIME-Version: 1.0
In-Reply-To: <CACPK8XePSehmuYTtJFYuNqUz_CQ4cQ6s4gdZ2rKNKUpO46yZKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/21/2018 04:39 AM, Joel Stanley wrote:
> Hello Mark,
> 
> On Mon, 23 Jul 2018 at 21:42, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On 22 June 2018 at 21:44, Cédric Le Goater <clg@kaod.org> wrote:
>>> When reading flash contents, try to use the "command mode" if the AHB
>>> window configured for the flash module is big enough. Else, just fall
>>> back to the "user mode" to perform the read.
>>>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Are you waiting on anything from Cedric or myself for this series. If
> not, can we please get them queued for 4.20?

There is one typo on the definition of the timing register of the AST2400
SPI controller we should fix. It can come later. Apart from that, I don't 
see any changes I would like to do. May be a couple of variable renames to 
clarify the loop on the hclk cycles and delays to fit the U-Boot driver
which was proposed recently. Please tell me :)

Thanks,

C. 
