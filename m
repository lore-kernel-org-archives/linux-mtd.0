Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M562u-0007xY-8Y
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 22:38:36 +0000
Received: by ewy25 with SMTP id 25so4650182ewy.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 May 2009 15:38:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A0DE96B.4040109@boundarydevices.com>
References: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<200905132212.11923.david-b@pacbell.net>
	<20090514102311.56495bb0@hskinnemoen-d830>
	<4A0C5E34.8080100@boundarydevices.com>
	<80b317760905150026jcfaa421i6139e7f4d4b9385d@mail.gmail.com>
	<80b317760905151257l4c80eed3l862cb8245b5af194@mail.gmail.com>
	<4A0DE96B.4040109@boundarydevices.com>
Date: Sat, 16 May 2009 00:38:26 +0200
Message-ID: <80b317760905151538g7572190ahaffc2e22b73a0f9@mail.gmail.com>
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
From: Richard Genoud <richard.genoud@gmail.com>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>,
	Nicolas Ferre <nicolas.ferre@rfo.atmel.com>,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2009/5/16 Troy Kisky <troy.kisky@boundarydevices.com>:
> I think you are wrong. It is definitely not what I intended.
> The logic should say, "If I can place the ecc at the beginning I will,
> otherwise, I will place it at the end." With the bad block marker
> at 0, it should choose the end.
>
> Troy
>
You're right, I missed that.
So, for atmel_nand, nothing changes, and the hardware ecc code will
still be correct.
Maybe you could add a little comment in the code explaining the logic,
as you just did.

Acked-by: Richard Genoud <richard.genoud@gmail.com>
