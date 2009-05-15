Received: from smtpauth03.csee.onr.siteprotect.com ([64.26.60.137])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M56Rz-0008DT-RZ
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 23:04:32 +0000
Message-ID: <4A0DF4ED.6080704@boundarydevices.com>
Date: Fri, 15 May 2009 16:04:13 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH 3/5] mtd: nand: atmel: use default ecc layout
References: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>	<200905132212.11923.david-b@pacbell.net>	<20090514102311.56495bb0@hskinnemoen-d830>	<4A0C5E34.8080100@boundarydevices.com>	<80b317760905150026jcfaa421i6139e7f4d4b9385d@mail.gmail.com>	<80b317760905151257l4c80eed3l862cb8245b5af194@mail.gmail.com>	<4A0DE96B.4040109@boundarydevices.com>
	<80b317760905151538g7572190ahaffc2e22b73a0f9@mail.gmail.com>
In-Reply-To: <80b317760905151538g7572190ahaffc2e22b73a0f9@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

Richard Genoud wrote:
> 2009/5/16 Troy Kisky <troy.kisky@boundarydevices.com>:
>> I think you are wrong. It is definitely not what I intended.
>> The logic should say, "If I can place the ecc at the beginning I will,
>> otherwise, I will place it at the end." With the bad block marker
>> at 0, it should choose the end.
>>
>> Troy
>>
> You're right, I missed that.
> So, for atmel_nand, nothing changes, and the hardware ecc code will
> still be correct.
> Maybe you could add a little comment in the code explaining the logic,
> as you just did.
> 
> Acked-by: Richard Genoud <richard.genoud@gmail.com>

Ok, I will. Thanks for the review.

Troy
