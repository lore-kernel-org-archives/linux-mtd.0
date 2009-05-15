Received: from mail-bw0-f208.google.com ([209.85.218.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M4roN-0006Xz-62
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 07:26:38 +0000
Received: by bwz4 with SMTP id 4so2079958bwz.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 May 2009 00:26:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A0C5E34.8080100@boundarydevices.com>
References: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<200905132212.11923.david-b@pacbell.net>
	<20090514102311.56495bb0@hskinnemoen-d830>
	<4A0C5E34.8080100@boundarydevices.com>
Date: Fri, 15 May 2009 09:26:28 +0200
Message-ID: <80b317760905150026jcfaa421i6139e7f4d4b9385d@mail.gmail.com>
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

2009/5/14 Troy Kisky <troy.kisky@boundarydevices.com>:
> Haavard Skinnemoen wrote:
>> I also suspect it will break hardware ECC. The ECC controller is a bit
>> picky about the OOB layout, which is why the defaults were overriden in
>> the first place.
>>
>> Haavard
definitely.

>
> This patch by itself would break ECCs. But with the 1st two patches
> it shouldn't. I would love to have that assertion tested however.
>
> Troy
but where are those pathces ? I couldn't find them...

richard.
