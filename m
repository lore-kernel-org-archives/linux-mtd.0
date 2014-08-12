Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XH4Px-0003vx-9W
 for linux-mtd@lists.infradead.org; Tue, 12 Aug 2014 05:14:41 +0000
Received: by mail-ig0-f175.google.com with SMTP id uq10so5635431igb.14
 for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2014 22:14:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACna6rwi81Po66pi1GYf-Z93kkwP7XubTtux-GJjdOwFxosTtA@mail.gmail.com>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-7-git-send-email-computersforpeace@gmail.com>
 <CACna6rwi81Po66pi1GYf-Z93kkwP7XubTtux-GJjdOwFxosTtA@mail.gmail.com>
Date: Tue, 12 Aug 2014 07:14:19 +0200
Message-ID: <CACna6rxEmC9esNt8AW402gH4KZfw2oE=fDow2Twj9OjxZEHi=A@mail.gmail.com>
Subject: Re: [PATCH 6/8] mtd: spi-nor: drop replaceable wait-till-ready
 function pointer
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12 August 2014 07:13, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> On 7 August 2014 03:17, Brian Norris <computersforpeace@gmail.com> wrote:
>> We don't need to expose a 'wait-till-ready' interface to drivers. Status
>> register polling should be handled by the core spi-nor.c library, and as
>> of now, I see no need to provide a special driver-specific hook for it.
>
> Do you think we could use spi-nor for Broadcom's SPI Atmel flashes? If
> so, we could need this.
>
> Broadcom's code includes support for two Atmel flashes: AT25F512 and AT25=
F2048.
>
> From what I can see, Atmel-specific code uses command 0xD7 (checking
> for bit 0x80 to be unset). That is a bit different from "standard"
> flashes using command 0xD7 (checking for bit 0x80 to be unset).

I meant standard code using command 0x05 and checking for 0x01 to be unset.

--=20
Rafa=C5=82
