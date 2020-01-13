Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFAFC33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 12:40:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CF220678
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 12:40:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xjfb6l4u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="cm2h5NUP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CF220678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKu1Hdqj0DIMLv+wXhgoP8fQ2L4ZSK4i35r6ohCkotY=; b=Xjfb6l4u1q9ZMx
	zgjEL/BMWBjYRi7DR4zy3XO0vRMjzrjMEuzlO6/EBw3hFfmZoFxcZ96lsME4IHBLEs7xKJSN5Z9X5
	REu1ZAtBcHBAi74gcB5b57reX+eyL/5ZAHI1M54qj+6SflRZkeeWFCUwu/4TKPoLBMpre1VNM54oS
	wpG6lHGjU9cbEWop/0ztqwTKIHEfzKlaIOo896W1FL8Yx6EbJmFGyGBPrjcruzd+JD0QPsnKC54UB
	XxRWPdXpELwMOOKQrx+hNDFDvy0oHiFRmacb2lwq4m+MNHXer0vEyrDCTvfl7Qf4R5nNH4yVpR5ih
	4HSVJAYmeCow5rf9/IgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqz1E-0000B9-74; Mon, 13 Jan 2020 12:40:32 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqz19-00009s-Gy
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 12:40:30 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200113124020epoutp034319c4c60158719d97bde585cd27065e~pcqpYqly41389413894epoutp030
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 12:40:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200113124020epoutp034319c4c60158719d97bde585cd27065e~pcqpYqly41389413894epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578919220;
 bh=TWXP/8AEZV02Xhq9I5gA94KXdKjx62l9yp7M3VCMGZQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=cm2h5NUPaKYLhhZQjlSqHzk+3VUPPL/V8h+nebnkjsFsEikz63rwg9xdTuTrEZwFB
 /UEJZ6EtFRAyht+eIZ4tZO/GTgD3+EE2+YMsn0y4eDb0tiqNz1PY93lT67xACeaBv8
 73FlosDXl5wl81yOBII4OPIQytSS1aYqjB0QzWXg=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200113124020epcas1p38e4e049439eecc33123e46ea12e37a32~pcqpFy67u1103411034epcas1p3H;
 Mon, 13 Jan 2020 12:40:20 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.162]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47xCq65hQdzMqYkV; Mon, 13 Jan
 2020 12:40:18 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 12.4E.57028.2356C1E5; Mon, 13 Jan 2020 21:40:18 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200113124018epcas1p2ce8435fd0e92ed7f723f6eec7ab258d2~pcqnnYJdH3139331393epcas1p2z;
 Mon, 13 Jan 2020 12:40:18 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200113124018epsmtrp2b9a43c6b3026892684237d52f09c43f4~pcqnmx78h0493704937epsmtrp2J;
 Mon, 13 Jan 2020 12:40:18 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-0b-5e1c65329fba
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 BB.02.10238.2356C1E5; Mon, 13 Jan 2020 21:40:18 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200113124018epsmtip14bf528b0a61c7f081d566094f6919838~pcqnfPGq30471204712epsmtip1F;
 Mon, 13 Jan 2020 12:40:18 +0000 (GMT)
Message-ID: <699891ca20ad25c2e86fa83606f08f776366f08e.camel@samsung.com>
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: support lock/unlock for a few
 Micron chips
From: Jungseung Lee <js07.lee@samsung.com>
To: John Garry <john.garry@huawei.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, js07.lee@gmail.com
Date: Mon, 13 Jan 2020 21:40:14 +0900
In-Reply-To: <8ff035e5-ac9e-cc25-6cb8-6d201c2fdb96@huawei.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRju2+0co8VpWr7NoHWgQPGyOTeXuAiSWCUhFFFKzpN+TWk3dmZo
 FF6YFlamoVEyxcgWdm+Zt7K8kdDFtCwNMkXrR+Ul7YIkZtvOov69l+f5nud9v5fkS86LpGSW
 2Y5tZsZIi5YKGrtCIyKi8ZpU+WJZlGbwzQDSuB8VCjULzime5n6hi9DM1G3WLD7/SmwW6Vqq
 hgndePUdQufonhTq7tbl6d7NXUa6nqEmXpIo2RifiZkMbJNhc7olI8ts0NI7dum36FVquSJC
 sVETS8vMjAlr6YTEpIitWUaPC1p2mDFme0pJDMvSUZvibZZsO5ZlWli7lsbWDKNVIbdGsoyJ
 zTYbItMtpjiFXB6t8iDTjJmOynaedSYw59OzRZSPZpeXoAASqBh4X1MgLEFLSQnVjKCxb4DP
 JbMIXCNnCS75iaD4bbPoL+Vp5XUe12hDkH//OfI2JNQEgonKYyWIJMWUDoZO+SQCqT1wsaVI
 6I1FVBgMzbt9ckGUG0FFzyjhbfCpUHA19fC8sYBaD713O3yEAGoTzC3UCjnhcJh8Uirg3l8B
 C82BHHUtNE06fa6BeiaC7zdb/UYT4EKHU8DFgfC5p4HgYil8m2rzY1hoqS8nOLIDwdiVOj9I
 CVOTN/heMa+5W61RXHkdtMxXI054OUz9OCX0QoASw4liCQehYWLU4ZcF6Bs/7bevg9K54wJu
 b9MIbjWMEGVIVvVvnKr/xqn6J1yL+FfRKmxlTQbMKqyK/z/YjXxXGaZqRhW9iZ2IIhG9TNx+
 JCRVImQOs7mmTgQknw4Su3ulqRJxBpN7BNsselu2EbOdSOVZdjlfujLd4rlxs12vUEUrlUpN
 jDpWrVLSwWJyrn+/hDIwdnwIYyu2/eXxyABpPirSnxhOKJhetPeeTFG+aFv9cfDkuYG4T98a
 f+79nBf+e0/BltkvEH7pgXZ7yod6Nb7WMDN9IOxVVm4NEbfv9o+0mCXxIUcf7m1lSEfxWKJ5
 52M6PS0lvvuXtquDiDTAmVRXzutHl4T3nAeTR/tzTl93BU871QU4b/c25eCGl7Fj9bSAzWQU
 YXwby/wB4OGc46sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnK5RqkycwYtGcYvr164wWmza38Rq
 8XfOOyaL3U3L2C0+LnGw+H/2A7sDm8fOWXfZPR7P3cju0XLkLavH5iX1Hnd+LGX0OH5jO1MA
 WxSXTUpqTmZZapG+XQJXRsvUA0wFH4UrXp75z9jA+Imvi5GTQ0LAROL01DVMXYxcHEICuxkl
 Fr9eyAaRkJB4tPMLSxcjB5AtLHH4cDFEzStGiY73u1lB4rwCHhI3esDmCAuESSzc2coKYrMJ
 aEnc+L2JFaReRGAzo8Ssng9MIAlmAU2JZduPg9ksAqoS5zYfBGvgFLCT+PF3AZgtJPCJUeLF
 UU2Y+tbtv9kh7tGReHuqjwVir6DE3x3CECXyEtvfzmGewCg4C0nHLISqWUiqFjAyr2KUTC0o
 zk3PLTYsMMxLLdcrTswtLs1L10vOz93ECA5/Lc0djJeXxB9iFOBgVOLhlaiVjhNiTSwrrsw9
 xCjBwawkwrvpnFScEG9KYmVValF+fFFpTmrxIUZpDhYlcd6neccihQTSE0tSs1NTC1KLYLJM
 HJxSDYxupaerfbRyLJ2yK/5u+ftx9stbBV1NX317wrZXarFV/1TPmDD1xeI1u7quXPE1eLir
 1TIgakHuu1NiczZmqTl7q6QIVYbZdl19f7Tp8CzmvzlTOizbJKQcL9pI5yqd4n80Q2bWz5rP
 +jknnh7rO301Z9+1iasdPlUHdU7/OW3NFNuv1Xe2TalXYinOSDTUYi4qTgQA2CqH/nsCAAA=
X-CMS-MailID: 20200113124018epcas1p2ce8435fd0e92ed7f723f6eec7ab258d2
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200113055910epcas1p384c04182e7c643163d659d42fafd01b3
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p384c04182e7c643163d659d42fafd01b3@epcas1p3.samsung.com>
 <20200113055907.9029-3-js07.lee@samsung.com>
 <8ff035e5-ac9e-cc25-6cb8-6d201c2fdb96@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_044028_674600_4B65999D 
X-CRM114-Status: GOOD (  20.16  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: chenxiang <chenxiang66@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, John

2020-01-13 (Mon), 12:30 +0000, John Garry:
> On 13/01/2020 05:59, Jungseung Lee wrote:
> > Some Micron models are known to have lock/unlock support,
> > and that also support 4bit block protection (bp0-3).
> > 
> > This patch support lock/unlock feature on the flashes.
> > 
> > Tested on w25q512ax3. The Other is modified following the
> > datasheet.
> > 
> > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > ---
> >   drivers/mtd/spi-nor/spi-nor.c | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-
> > nor/spi-nor.c
> > index 7e8af6c4fdfa..97a027c38d66 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2583,12 +2583,17 @@ static const struct flash_info
> > spi_nor_ids[] = {
> >   	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024,
> >   			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> >   			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
> > },
> > -	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, SECT_4K |
> > USE_FSR | SPI_NOR_QUAD_READ) },
> > +	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024,
> > +			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> > +			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
> > +			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6)
> > },
> >   	{ "mt25qu512a",  INFO6(0x20bb20, 0x104400, 64 * 1024, 1024,
> >   			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> >   			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES)
> > },
> > -	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K |
> > -			      USE_FSR | SPI_NOR_QUAD_READ) },
> > +	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024,
> > +			       SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> > +			       SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
> > +			       SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6)
> > },
> >   	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, SECT_4K |
> > USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> >   	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K |
> > USE_FSR | SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> >   	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
> > 
> 
> Hi,
> 
> I'd like to test on a n25q128a11.
> 
Thanks for your interest.

> Seems I just need to add "SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | 
> 	 
> SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6" to
> n25q128a11 INFO also, right?
> 
You are right.

> Thanks,
> John
> 
> 
Best Regards,
Jungseung Lee


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
