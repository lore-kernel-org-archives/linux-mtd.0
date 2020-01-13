Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40538C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 12:46:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12736207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 12:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JfWZcxrn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pnr6GqfB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12736207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZ2Y1dLvwPGAQZEWVJhChRuRwAxZq9UyPiufU4IOwpY=; b=JfWZcxrnaAySej
	1Av+QtAt0BeuOQSBF6bZAFzNdMbmemCST/jKf1/0vrzwqbOGkmpH4G+VKO5NFJzB96JOfWTGWpjQL
	tBraCHFDsw9zVZgWjbu7CSZajm1cCitRHNts+VDK5FZXD8oqxEZw/UAXnCpUnVLk284N0RtOGwG/X
	HgFS0ME9Ng1a5vm3FzdxbFy4kt4ZbMUyHT3OMO5mcsRsGnfU6hZeLsfcI/HlEds3Yag0qKC/GQU8B
	mVVZ+2BJsZY/ZyhM7z/uIOm5TXYZl3VoCGALp/aBiaBhu/dXwiRxA/w82lvuCSlFNOLdP3iwcXQsa
	3foHMQUY3cq0k2+6fi6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqz6b-0002Md-0t; Mon, 13 Jan 2020 12:46:05 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqz6W-0002LX-Kv
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 12:46:02 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200113124556epoutp049d3fd3e5eb07f723b458edc7f6adbb99~pcvi5EpSC2800628006epoutp04X
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2020 12:45:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200113124556epoutp049d3fd3e5eb07f723b458edc7f6adbb99~pcvi5EpSC2800628006epoutp04X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1578919556;
 bh=PmVFam4y4SLZn2OOsDsIBsxCPhVe/FB5yrbr4InIfKU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=pnr6GqfBrP1I7LY38+o5gPBRRT23X/wQBnSn/bKsGW0Xo7YnRjLCUyXXPkjiuhjCL
 6CdlvZ8E6nglhoYuhh5BG3rBC+KI1MIjAkgEIZUKyVj78myw1XpjZXHRI/372SMfTd
 m4cyFU2Ur1Rvw5cZ9RYsVFqNLmSamESc9KUT7wfw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200113124556epcas1p1376b5460e15728f612f5022dfcc2ecd6~pcviWsVgc1675316753epcas1p10;
 Mon, 13 Jan 2020 12:45:56 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.159]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47xCxZ5PZ2zMqYkV; Mon, 13 Jan
 2020 12:45:54 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 BD.73.48019.2866C1E5; Mon, 13 Jan 2020 21:45:54 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200113124554epcas1p3d8e60e08c17bccc66b5e52a863086050~pcvggMAuI0960109601epcas1p36;
 Mon, 13 Jan 2020 12:45:54 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200113124554epsmtrp2ccc43e5751d6246a9cfef637414b23e6~pcvgfkcs10768707687epsmtrp2c;
 Mon, 13 Jan 2020 12:45:54 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-cf-5e1c6682ac3c
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0A.42.10238.2866C1E5; Mon, 13 Jan 2020 21:45:54 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200113124554epsmtip162038293419c7f71ba2490a902f35fdb~pcvgRfT8v0629206292epsmtip15;
 Mon, 13 Jan 2020 12:45:54 +0000 (GMT)
Message-ID: <799d1e85197f328b05c112e42baf327248f9c9a7.camel@samsung.com>
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: support lock/unlock for a few
 Micron chips
From: Jungseung Lee <js07.lee@samsung.com>
To: John Garry <john.garry@huawei.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mtd@lists.infradead.org, js07.lee@gmail.com
Date: Mon, 13 Jan 2020 21:45:53 +0900
In-Reply-To: <8ff035e5-ac9e-cc25-6cb8-6d201c2fdb96@huawei.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm2+XsqC1O0+rtFLRO9CNJtzmnp2giFXG6QIOgoot60NMm7cY5
 m6lQimlFF0mIUFEqWoZ2MWeoy8QwcREVFc3EikSNbk67YIlmteMx6t/zft/zfM/zvt+LyzWV
 GInnOj0c72TtFBataLm3UpdQsn9Jhn7wSTz9ovc5ov2dJUp6umZURreX1KnoL750+vejz6p0
 jAlUv1YxQ7VNKqa0O6xkmn1FzKuJy4gJ9rXKLNhu+1obx+ZwvJZzZrtycp1WM7Vle+b6TFOK
 3pBgWE2nUlon6+DM1IatloSNufZICkqbx9q9kSMLKwiULm0t7/J6OK3NJXjMFOfOsbsNenei
 wDoEr9OamO1yrDHo9UmmCDPLbqt59gG5J2Pzm4JXsWL0c+4JhONAJEPluX0nUDSuIdoQ1IZu
 y6TiK4Kbbe8jRVSk+I7gyCVSxKLg90gVJpE6EBwt/jRbjCAIHX+HRJaaYKCxfxgTcSyxAy4G
 ypQixoh46JvyK0VBHOFHcDY4oBIv5MRKqGsNztgpiBUQHn47I44i0mBi+oJSsl4F4QflCjG3
 mpgH022xknQptIZr5OKbQDzEoKrnjELib4CWkmtIwrHwMXhLJWESvo12YBIWIFBfoZLEpQgG
 r/hmSUYYDV+Xi2ZiuMbbOul4GQSmapFkPBdGx08ppTmq4fhRjUShYGSgdDYCwJOh07PxGSif
 OKaQhjWGoPHWG9UZpK3+1071f+1U/zO+gOQNaAHnFhxWTjC4k///YD+a2cp4ug3deby1CxE4
 ouao4dDiDI2SzRMKHF0IcDkVp/Y/JjM06hy2oJDjXZm8184JXcgUGXaFnJyf7YrsuNOTaTAl
 GY1GOjklNcVkpBaq8Ymn+zSElfVwBzjOzfF/dTI8iixGrjIq5v3JOSnp/LdgiB0PdVdoWZ89
 NH7wTRKw/nUL2+th+ZR576Le/OLo9LtTw7pNZK1r0/Pz1skbS3UDtoYfL7ft7O/cnN+Z4KXx
 /bvGAoXkQNRhZGYORRe1lJe3/3rE57be7x3+vPmVQf8l2WLJ6pnnq2om4ypXNcoS98RQCsHG
 GuLlvMD+Ab/yF0irAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnG5TmkycwYGPfBbXr11htNi0v4nV
 4u+cd0wWu5uWsVt8XOJg8f/sB3YHNo+ds+6yezyeu5Hdo+XIW1aPzUvqPe78WMrocfzGdqYA
 tigum5TUnMyy1CJ9uwSujDmXXjIW/BKu2Hh8NVsD4x++LkZODgkBE4n/b2aygdhCArsZJVY1
 ykPEJSQe7fzC0sXIAWQLSxw+XNzFyAVU8opRYsPsOWD1vAIeEutvPQGzhQXCJBbubGUFsdkE
 tCRu/N7ECtIgIrCZUWJWzwcmkASzgKbEsu3HwWwWAVWJt0+egjVzCthJ/Pi7gBXiiE+MEi+O
 asLUt27/zQ5xkI7E21N9YAfxCghK/N0hDFEiL7H97RzmCYyCs5B0zEKomoWkagEj8ypGydSC
 4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjODw19LcwXh5SfwhRgEORiUeXola6Tgh1sSy4src
 Q4wSHMxKIrybzknFCfGmJFZWpRblxxeV5qQWH2KU5mBREud9mncsUkggPbEkNTs1tSC1CCbL
 xMEp1cDYY97z+bDOEa5H5w8fLuWq2X/6aOgZxv+HZ28LXFW623P673zHNbsfq6+YvPOR9rq8
 Jx62ieEiv6aprU567rlON+ZWw6fs2kUbl/NvlVJ66WC6kGXrusvf+Fj21CXdLltf+k1HcGXg
 j7Qg94s7K7b6cb4VyNpQ73/RfdKkCbeZ5U+vvLi5de5tEyWW4oxEQy3mouJEAH4PDDl7AgAA
X-CMS-MailID: 20200113124554epcas1p3d8e60e08c17bccc66b5e52a863086050
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
X-CRM114-CacheID: sfid-20200113_044601_096408_031069EA 
X-CRM114-Status: GOOD (  18.88  )
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
Thanks for your interest to my patches.

> Seems I just need to add "SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | 
> 	 
> SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6" to
> n25q128a11 INFO also, right?
You're right.

> Thanks,
> John
> 
> 
Best Regards,
Jungseung Lee


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
