Received: from mail-ig0-x22c.google.com ([2607:f8b0:4001:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjXF5-0000Pi-Fy
 for linux-mtd@lists.infradead.org; Wed, 29 Oct 2014 17:41:14 +0000
Received: by mail-ig0-f172.google.com with SMTP id a13so1737227igq.5
 for <linux-mtd@lists.infradead.org>; Wed, 29 Oct 2014 10:40:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201410291505.48720.marex@denx.de>
References: <1414576675-7792-1-git-send-email-Chunhe.Lan@freescale.com>
 <201410291505.48720.marex@denx.de>
Date: Wed, 29 Oct 2014 18:40:46 +0100
Message-ID: <CACna6ryTfC0c6op+Kv6TU3gFJPHj00nvkMH+T8BL2-=1ffbdww@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Move n25q032 entry to Micron devices list
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Huang Shijie <shijie8@gmail.com>,
 Chunhe Lan <Chunhe.Lan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 29 October 2014 15:05, Marek Vasut <marex@denx.de> wrote:
> On Wednesday, October 29, 2014 at 10:57:55 AM, Chunhe Lan wrote:
>
> [...]
>
> There are problems with this patch. Firstly, it misses any description
> explaining why the change took place at all. From an outside observer
> point of view, this change seems random at best.

This looks like a normal cleaning for me.


> Secondly, the change in itself makes no sense -- it just reorders the
> entries in an array.

It moves Micron entry to the Micron pseudo-group, which makes sense to me.


> I can only speculate here, that your SPI NOR was
> recognised as some other part, right ? That's why moving the n25q032
> higher resolved the problem for you, right ?
>
> The problem is with the fragility of this code which matches the JEDEC
> ID and type of the SPI NOR. I recall Huang had some patches which tried
> to resolve this, not sure what the status of those patches is though.

Wait, what? OK, this makes things tricky. Does this patch really
change any behavior? How does it happen? I don't see any duplicated
entry with the same JEDEC ID (0x20ba16).

Could you give us some more details?
