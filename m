Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F7DFC2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 11:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407CC21734
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 11:42:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ArKmHJQ4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tDpOSljK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407CC21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wi4jBTlutPxbhdfPe/3yH112tBWiQsmZg99Ag9aHRoQ=; b=ArKmHJQ4CdQjI1
	QyNw8F8jnMuziwNqEF+OkKDMW81MLrAjxWpSlIxjG4CPlQ5R9la5psVA6b/sq/7lxiU0O4b8IK+Gt
	SsD1qkwUIVUZd4mVww+X9pUQtmrnW5XfSBWjEfWLBj6uHLlDGgtiSBd6AqBEPH1mOfIVsL88IBaFe
	55blm+Lab/phGjqT+7BwEIM0ib+4yEy3RgoPFC3bWKWSxw5Hek8ev8sknAUJ1wtP4CkhjvZAfk1c3
	dsueEuZsWESfyXrVDD+bhHtO6EFf5YdnkEr2Ja+tkTkI5qhMphX+aXvrsRJczDyyuLDBlg/lIlxPl
	2G6K9XWK4g6syzLDIuwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuEOg-0002xh-Vr; Wed, 22 Jan 2020 11:42:10 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuEOd-0002wz-BF
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 11:42:09 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200122114203epoutp03fb32ee797225025d9e3a900071727b5b~sMrVDMsjz1437514375epoutp03E
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jan 2020 11:42:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200122114203epoutp03fb32ee797225025d9e3a900071727b5b~sMrVDMsjz1437514375epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579693323;
 bh=BD8Ndw1GulXg/BP3QWsTV4Bi/O1ZGMXsZGVVOWh8pJQ=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=tDpOSljKr6RWA9qStbSaYx4IJj3z44yPctr2jfgMbDNpu6kUl1FfwCMAZNLHw+Gs/
 ZrZ825OvVh/rdT6PngJ8OWLfoNo2WjJA2FpOuv6ZSyR6/QGThTVRtIFWpNH/xeYpur
 D6eHHCRGcDqw57/LED9fYTM8vfrlER8WtHwRYdEY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200122114202epcas1p4126424ab72239e6639fb7d49f24b34ee~sMrULM6k22807628076epcas1p4P;
 Wed, 22 Jan 2020 11:42:02 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.160]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 482k5j3qvwzMqYkf; Wed, 22 Jan
 2020 11:42:01 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 27.14.48498.905382E5; Wed, 22 Jan 2020 20:42:01 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200122114200epcas1p499bec859ec168fb69b1a11c5272a1dcc~sMrSzzAmO2807628076epcas1p4L;
 Wed, 22 Jan 2020 11:42:00 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200122114200epsmtrp129dbdfb52444721567b121b20c34c2a9~sMrSzNH9U1170411704epsmtrp1N;
 Wed, 22 Jan 2020 11:42:00 +0000 (GMT)
X-AuditID: b6c32a36-a3dff7000001bd72-4c-5e2835094a8a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D7.A2.06569.805382E5; Wed, 22 Jan 2020 20:42:00 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200122114200epsmtip1acb49c6f2e25debacb128b28e4644829~sMrSp3Fi43183231832epsmtip1C;
 Wed, 22 Jan 2020 11:42:00 +0000 (GMT)
Message-ID: <0a2c4e9132f7d4f61fd3ce87c5393c65515b937e.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Jungseung Lee <js07.lee@gmail.com>, Tudor.Ambarus@microchip.com,
 js07.lee@samsung.com
Date: Wed, 22 Jan 2020 20:42:00 +0900
In-Reply-To: <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+3Z2dqPFaaa9aOA6paSkbq6tJRmBK2YmKCVZgeugh03ajZ1p
 GUFNKsrStAhxGkl5QS0XU3JaYSilVlaolFqBmeuGSkWpIFbbjqH//b73fZ73+W4CTFLMCxXk
 mu20zUwZSZ6Ie687KjZGqNyUJXOXhqsXqqY56vGReVx9v7COr/5Rs1P9t/87fyeubXe+52tb
 ak5p383VIm1JayPS9gy3cdLwQ8btBprKoW1S2pxtyck16xPJlH26JJ1SJZPHyLept5JSM2Wi
 E0nN3rSY3blGXzYpzaeMeb5SGsUwZNyO7TZLnp2WGiyMPZGkrTlGq1xmjWUoE5Nn1sdmW0wJ
 cpksXulTHjEaHM2duLUq/Pis9xZ+GjWGFCGhAIgt8L6lAytCIoGE8CDocTlwdvETwdAf72Jn
 BkHH3WLOf8tCQ+ei6iGCTwNDfHYxiaCv9gHXrxITWhi5divgCCJSoLJkiudnHhENw/Nu3M9r
 iMPgvTIaqGNEPLx79oHvZy4RAbcvNCI/C4l0uNEyyWOTN8PU0xLffIFv/mpY8ASx1nBom6oK
 7BSIRzx4fH4M82uA0EB9r461BsG3nlY+y6Hw9fK5RWagvaGMz3rPIBivr1lsKGB66k5gDkZE
 gasjji2vh/b564jNXQXTvy/hbJQYzp+TsBISJsfOcFkGePWxGGdZC3MTngBLCBcHXNczS5HU
 uXQY57LDOJdyqxHWiEJoK2PS04zcGr/8fd0o8BWjVR5088XeLkQIELlSbPBGZklwKp8pMHUh
 EGDkGnF1YUSWRJxDFZygbRadLc9IM11I6bvqMiw0ONvi+9hmu06ujFcoFOotqq0qpYJcKy7X
 SLMkhJ6y00dp2krb/vs4AmHoadQp6ui+LKr7dPJR7GQY5k6MbFsxOPokeMTxMjldGZm+392S
 mvmmOqG2qFTz2b1u18TESUP3rLYwKTmjYcCxR7OR6sl/PePIrnjedPDtgVSJpwzbICxKFZ/t
 bz7WG9abUe/qu2p9wJFWGTJ/fblYcbP2Y2V50yXmT0rSWaeBO1j3hOQyBkoejdkY6h+forz0
 oAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnC6HqUacwdVF5hZ/57xjsnh08zer
 xe6mZewWH5c4WPw/+4HdgdVj56y77B6bl9R73PmxlNGjb8sqRo/jN7YzBbBGcdmkpOZklqUW
 6dslcGU0rtvPWjBHvuL708WsDYyrxLoYOTkkBEwk/q7cz9rFyMUhJLCbUWL+ZxAHJCEh8Wjn
 F5YuRg4gW1ji8OFiiJpXjBJ7ts9lB6nhFfCQuDl1MROILSzgLTG77y0biM0moCVx4/cmsDki
 AjES33/eBqtnFjCSuHP6IZjNIqAqsaZzFSOIzSkQKDF/8xs2iAWbmSTOTN7PBNGgKdG6/Tc7
 xEE6Em9P9YEdxCsgKPF3hzBEibzE9rdzmCcwCs5C0jELoWoWkqoFjMyrGCVTC4pz03OLDQuM
 8lLL9YoTc4tL89L1kvNzNzGCg11LawfjiRPxhxgFOBiVeHgznqrFCbEmlhVX5h5ilOBgVhLh
 XdCkGifEm5JYWZValB9fVJqTWnyIUZqDRUmcVz7/WKSQQHpiSWp2ampBahFMlomDU6qBMeif
 3Er5t4vZZvxW/uMlUbs118pwI784RyznSxZlRoHDG9ZI2zP7CV2S9dvdoeCepNj00VKz+zbf
 GrZsw++pG+vKGmXrJ7hyTdqhtGrZ80zTk+tcrQ/c121wXWaikcmveWJa23Ke0xmrpgQdC77F
 OYvza82HdiOePO5jD+S7etuWyep9CpulxFKckWioxVxUnAgAkYunKHICAAA=
X-CMS-MailID: 20200122114200epcas1p499bec859ec168fb69b1a11c5272a1dcc
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CGME20200113055910epcas1p377b2618bea2ca860acac2b6f34e2b83e@epcas1p3.samsung.com>
 <20200113055907.9029-2-js07.lee@samsung.com>
 <3703036.Ns4Yp6NO8s@localhost.localdomain>
 <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_034207_640512_6F8454C1 
X-CRM114-Status: GOOD (  33.78  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Tudor,

2020-01-18 (Sat), 00:06 +0900, Jungseung Lee:
> Hi, Tudor,
> 
> On Tue, Jan 14, 2020 at 7:49 PM <Tudor.Ambarus@microchip.com> wrote:
> > 
> > Hi, Jungseung,
> > 
> > Thanks for working on this.
> > 
> > On Monday, January 13, 2020 7:59:06 AM EET Jungseung Lee wrote:
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > > know the
> > > content is safe
> > > 
> > > Currently, we are supporting block protection only for
> > > flash chips with 3 block protection bits in the SR register.
> > > This patch enables block protection support for some flash with
> > > 4 block protection bits(bp0-3).
> > 
> > Some? Isn't this generic for all the flashes that support BP0-3?
> > 
> 
> This one would be a generic solution to support BP0-3 on Status
> Register.
> From my study, this covers all the flashes listed on spi-nor.c that
> have BP0-3 bit on SR.
> It looks like I have to change this description.
> 
> Note that it is NOT for some flashes that have BP0-3 in another
> register.
> As you know, just like SPI_NOR_HAS_TB did.
> 
> > > 
> > > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > > ---
> > > v3 :
> > >   Fix wrong ofs calculation on v2 patch
> > > v2 :
> > >   Add sample table portion about 4bit block protection on the
> > > comment
> > >   Trivial coding style change
> > > 
> > >  drivers/mtd/spi-nor/spi-nor.c | 127
> > > +++++++++++++++++++++++++++++-----
> > >  include/linux/mtd/spi-nor.h   |   8 +++
> > >  2 files changed, 119 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-
> > > nor/spi-nor.c
> > > index e3da6a8654a8..7e8af6c4fdfa 100644
> > > --- a/drivers/mtd/spi-nor/spi-nor.c
> > > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > > @@ -238,6 +238,14 @@ struct flash_info {
> > >                                          * status register. Must
> > > be used
> > > with * SPI_NOR_HAS_TB.
> > >                                          */
> > > +#define SPI_NOR_HAS_BP3                BIT(17) /*
> > > +                                        * Flash SR has 4 bit
> > > fields (BP0-3)
> > > +                                        * for block protection.
> > > +                                        */
> > > +#define SPI_NOR_BP3_SR_BIT6    BIT(18) /*
> > > +                                        * BP3 is bit 6 of status
> > > register.
> > > +                                        * Must be used with
> > 
> > Are we safe to replace SPI_NOR_TB_SR_BIT6 and SPI_NOR_BP3_SR_BIT6
> > with a
> > SPI_NOR_SR_TB_BIT6_BP3_BIT5? Or maybe with a
> > SPI_NOR_SR_BP3_BIT6_TB_BIT5, how
> > is more convenient?
> > 
> 
> Let's think about some flash in which BP0-3 exists in the status
> register but TB exists in another register.
> for example, mx25u12835f.
> I haven't tested yet, but according to the datasheet, I think this
> patch can support 4bit block protection for the flash.
> 
> In order to embrace the case, how about letting them as It is.
> Is there any suggestion?
> 

Hmm.. I again have summarized the case of using 4bit block protection.

* Not supporting TB on status register.

- BP3(BIT5)
  SPI_NOR_HAS_BP3

- BP3(BIT6)
  SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6

* Supporting TB on status register.

- TB(BIT6), BP3(BIT5)
  SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_HAS_BP3
  vs
  SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3 | SPI_NOR_SR_TB_BIT6_BP3_BIT5
    
- TB(BIT5), BP3(BIT6)
  SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3 | SPI_NOR_BP3_SR_BIT6
  vs
  SPI_NOR_HAS_TB | SPI_NOR_HAS_BP3 | SPI_NOR_SR_TB_BIT5_BP3_BIT6  
    
SPI_NOR_BP3_SR_BIT6 and SPI_NOR_TB_SR_BIT6 must exist becuase it maybe
used. It would be ok to add some definitions(as you mentioned) to get
same value with SPI_NOR_BP3_SR_BIT6 or SPI_NOR_TB_SR_BIT6 for
readabilty.

But I think there is nothing looks so cool. Any suggestion?

> > Cheers,
> > ta
> > 
> 
> 
Thanks,
Jungseung Lee


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
