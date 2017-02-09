Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbs0K-0007Sr-Su
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 16:55:34 +0000
Received: by mail-oi0-f65.google.com with SMTP id j15so685291oih.0
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 08:55:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170110221525.9216-1-zajec5@gmail.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <20170110221525.9216-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 9 Feb 2017 17:54:11 +0100
Message-ID: <CACna6ryQ8A5XCP3oMN47BYwmv3A03OZz1sDnvUmCgw_pe=Fbnw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] mtd: bcm47xxpart: move TRX parsing code to
 separated function
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10 January 2017 at 23:15, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wro=
te:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This change simplifies main parsing loop logic a bit. In future it may
> be useful for moving TRX support to separated module / parser (if we
> implement support for them at some point).
> Finally parsing TRX at the end puts us in a better position as we have
> better flash layout knowledge. It may be useful e.g. if it appears there
> is more than 1 TRX partition.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Marek: you were commenting on V1, what do you think about V2? Could you Ack=
 it?
