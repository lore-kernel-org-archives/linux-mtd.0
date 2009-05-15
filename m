Received: from mail-ew0-f225.google.com ([209.85.219.225])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M53XJ-0000oU-9N
	for linux-mtd@lists.infradead.org; Fri, 15 May 2009 19:57:48 +0000
Received: by ewy25 with SMTP id 25so4494826ewy.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 May 2009 12:57:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <80b317760905150026jcfaa421i6139e7f4d4b9385d@mail.gmail.com>
References: <1242270008-1552-2-git-send-email-troy.kisky@boundarydevices.com>
	<1242270008-1552-3-git-send-email-troy.kisky@boundarydevices.com>
	<200905132212.11923.david-b@pacbell.net>
	<20090514102311.56495bb0@hskinnemoen-d830>
	<4A0C5E34.8080100@boundarydevices.com>
	<80b317760905150026jcfaa421i6139e7f4d4b9385d@mail.gmail.com>
Date: Fri, 15 May 2009 21:57:39 +0200
Message-ID: <80b317760905151257l4c80eed3l862cb8245b5af194@mail.gmail.com>
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

2009/5/15 Richard Genoud <richard.genoud@gmail.com>:
> 2009/5/14 Troy Kisky <troy.kisky@boundarydevices.com>:
>> Haavard Skinnemoen wrote:
>>> I also suspect it will break hardware ECC. The ECC controller is a bit
>>> picky about the OOB layout, which is why the defaults were overriden in
>>> the first place.
>>>
>>> Haavard

Looking at the first 2 patches on nand_base.c, it seems that the HW
ECC layout for small pages will be the same (ecc at offsets 0,1,2,3)
wich is good (because it's the only possible place).

For large pages, the HW ECC layout will change from [60,61,62,63] to
[2,3,4,5]. The ecc will still be correct, but as david said, the
compatibility won't.

richard.
