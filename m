Received: from mail-wr0-f194.google.com ([209.85.128.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbsYv-00015U-93
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 17:31:22 +0000
Received: by mail-wr0-f194.google.com with SMTP id k90so12588695wrc.3
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 09:30:56 -0800 (PST)
Subject: Re: [PATCH V2 1/2] mtd: bcm47xxpart: move TRX parsing code to
 separated function
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170110115045.9134-1-zajec5@gmail.com>
 <20170110221525.9216-1-zajec5@gmail.com>
 <CACna6ryQ8A5XCP3oMN47BYwmv3A03OZz1sDnvUmCgw_pe=Fbnw@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1afab02b-b6d8-cf04-89a2-129c106613ed@gmail.com>
Date: Thu, 9 Feb 2017 18:29:54 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6ryQ8A5XCP3oMN47BYwmv3A03OZz1sDnvUmCgw_pe=Fbnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/09/2017 05:54 PM, Rafał Miłecki wrote:
> On 10 January 2017 at 23:15, Rafał Miłecki <zajec5@gmail.com> wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This change simplifies main parsing loop logic a bit. In future it may
>> be useful for moving TRX support to separated module / parser (if we
>> implement support for them at some point).
>> Finally parsing TRX at the end puts us in a better position as we have
>> better flash layout knowledge. It may be useful e.g. if it appears there
>> is more than 1 TRX partition.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> Marek: you were commenting on V1, what do you think about V2? Could you Ack it?
> 
Minor nit on 1/2 , but otherwise the whole series is

Acked-by: Marek Vasut <marek.vasut@gmail.com>

I will not claim I understand the TRX parsing though.

-- 
Best regards,
Marek Vasut
