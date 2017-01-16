Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cT9tj-0002xJ-Hy
 for linux-mtd@lists.infradead.org; Mon, 16 Jan 2017 16:12:43 +0000
Received: by mail-ot0-x243.google.com with SMTP id 65so6843423otq.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Jan 2017 08:12:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170116152130.5c4b01d9@bbrezillon>
References: <20170116130409.2686-1-zajec5@gmail.com>
 <20170116152130.5c4b01d9@bbrezillon>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 16 Jan 2017 17:12:19 +0100
Message-ID: <CACna6rysndCtj-JhHAwekHmEw9PcEZtt7KuA+AN6eF33ZzkQZw@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: use platform_(set|get)_drvdata
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On 16 January 2017 at 15:21, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Mon, 16 Jan 2017 14:04:09 +0100
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>
>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>
>> We have generic place & helpers for storing platform driver data so
>> there is no reason for using custom priv pointer.
>>
>> This patch will be followed by cleaning struct bcma_sflash which will go
>> through another tree where bcma development happens.
>
> Why not removing the ->priv field from the bcma_sflash struct
> definition in this patch?
> If it needs to go through a different tree we can ack the patch and let
> the other maintainer(s) take the whole series.

I can try that. As this will be more mtd-focused, I guess I should
rather get Kalle's ack. I'll work on that.

--=20
Rafa=C5=82
