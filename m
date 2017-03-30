Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctXND-0005cN-3J
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 10:32:12 +0000
Received: by mail-lf0-x244.google.com with SMTP id v2so4160176lfi.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 03:31:50 -0700 (PDT)
Subject: Re: [PATCH V3 1/2] mtd: add support for partition parsers
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <20170221124002.585-1-zajec5@gmail.com>
 <20170227130633.4020-1-zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <5242215d-9230-82b1-13cf-5db6ee0a70e9@gmail.com>
Date: Thu, 30 Mar 2017 12:31:45 +0200
MIME-Version: 1.0
In-Reply-To: <20170227130633.4020-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/27/2017 02:06 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
>
> Some devices have partitions that are kind of containers with extra
> subpartitions / volumes instead of e.g. simple filesystem data. To
> support such cases we need to first create normal flash partitions and
> then take care of these special ones.
>
> It's very common case for home routers. Depending on the vendor there
> are formats like TRX, Seama, TP-Link, WRGG & more. All of them are used
> to embed few partitions into a single one / single firmware file.
>
> Ideally all vendors would use some well documented / standardized format
> like UBI (and some probably start doing so), but there are still
> countless devices on the market using these poor vendor specific
> formats.
>
> This patch extends MTD subsystem by allowing to specify partition format
> and trying to use a proper parser when needed. Supporting such poor
> formats is highly unlikely to be the top priority so these changes try
> to minimize maintenance cost to the minimum. It reuses existing code for
> these new parsers and just adds a one property and one new function.
>
> This implementation requires setting partition format in a flash parser.
> A proper change of bcm47xxpart will follow and in the future we will
> hopefully also find a solution for doing it with ofpart
> ("fixed-partitions").
>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: A totally rebased & refreshed version.
> V3: Don't mention uImage in commit message, it was a mistake.

Marek: I updated commit message as you suggested.

Can I ask for your Reviewed/Acked tag, please?
