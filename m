Return-Path: <SRS0=9DP4=3M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC239C33CAA
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 04:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77F1021835
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jan 2020 04:00:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ocvVehVI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UelZK64d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77F1021835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9tRArTc1PA2YoIlAkNMg7vjyoNzL0rRnOvxBDqMyg0=; b=ocvVehVIYG+0hF
	HF+KbJ6VnYNsW7e+E7z5B9zxo7FG7RmDHIJW0NJRorsufKeLUX1s5VDRGCVguwyeLPBkvNH9f/wIu
	32eXiuxaRoGsxi+HzemiQGOk+sGOLjXFHuJ1DqGXxTZCK+x9R+04cc8K/CF+M4Pc/j/b5lBKyZF93
	Ekv5IHCllYWTWBTYWA1/MerxNGU/1S3REiAayjEzgfxGO1QJEs+bMC4qssIhwAuBN9SUjUZiVqeE9
	lkeMGzuKzMmyJHmvl3lxhC14o0cSLK4VTnZ0oXoD2zwRwBXOnHG0OkVshhkJheEKiH2VEGm303evI
	j62oZBV9Vz9T8Qd4KZog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuTf3-000322-BD; Thu, 23 Jan 2020 04:00:05 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuTey-0002Ut-Ra
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2020 04:00:03 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200123035956epoutp039b2e58974bfeef84c91a6cfd27b39f81~saBI1EL_J1453214532epoutp03-
 for <linux-mtd@lists.infradead.org>; Thu, 23 Jan 2020 03:59:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200123035956epoutp039b2e58974bfeef84c91a6cfd27b39f81~saBI1EL_J1453214532epoutp03-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579751996;
 bh=AmlhhdgD+10K3qKdQCDUHS0DBv2h76YyGB0PzR1/770=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=UelZK64dX5C9NFQMIZxAShx7evaSB0KTveZq1jEh+gUT4cLA/2NKAahYkEyWcioVa
 Lbwt1zVCvyfjt+FGaBycBwCF40lQVGu+RRW8TgYZRw5Ouqfaht9M/isL9eKlqXqXfF
 Z1Q0Rruo12QCMtziQm5DOdMJj0iFLytdylJw6E4s=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200123035956epcas1p400e408eaaf41d2628b2ee23447b52412~saBIUNij-1966019660epcas1p4C;
 Thu, 23 Jan 2020 03:59:56 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.162]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4837p319dyzMqYm1; Thu, 23 Jan
 2020 03:59:55 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 AB.3D.51241.B3A192E5; Thu, 23 Jan 2020 12:59:55 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200123035954epcas1p26a22f51ee2063f437600afc4cfbfe549~saBG8Dh4o1514415144epcas1p2M;
 Thu, 23 Jan 2020 03:59:54 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200123035954epsmtrp17daec1c1ddc598550a31f892aa994a02~saBG7SEeO1464714647epsmtrp1v;
 Thu, 23 Jan 2020 03:59:54 +0000 (GMT)
X-AuditID: b6c32a39-14bff7000001c829-23-5e291a3b2089
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 6C.1A.06569.A3A192E5; Thu, 23 Jan 2020 12:59:54 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200123035954epsmtip1b6b0a3ddd8cd0c27c67ca7401dd161a0~saBGvr1R50865908659epsmtip1s;
 Thu, 23 Jan 2020 03:59:54 +0000 (GMT)
Message-ID: <7004715e639d0d7aadd48ebb82cfaec42e032cec.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>, Tudor.Ambarus@microchip.com
Date: Thu, 23 Jan 2020 12:59:54 +0900
In-Reply-To: <87d1ed5d35cc5cb7addfb60d5dd028c9@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRTm3d3urtLqdTM9LKJ5oUhpuTmn18pQkhjpD8EfQYHr4m662he7
 W6R/KptSovZBaE4jrZn0ndqHS8ywSOwL0z9GZV8kWG1qpJX2te0a9u85z/uc85xz3kMR8hOk
 kjLbXJzTxlpoMlp8816iWr1emVioGTojZTp6yyXMr6agiOkuPydlAo+uSZkpXxbz58mkNIs0
 +L2vpAbP/YDE0OnbZ3j5vRUZ+kduiQx3ezxkPrnNsqGEY02cU8XZiuwms604k84tMG4y6tM0
 WrU2g0mnVTbWymXSOXn56s1mS6gLWrWHtbhDVD7L83Tyxg1Ou9vFqUrsvCuT5hwmi0Orcazl
 WSvvthWvLbJb12k1mhR9SLnDUjI6WSN2zCr3BjoHJPvRoKIKURTgVGj7trwKRVNy3IWgbqJC
 IgRfEEy8eCquQlGhYAbBm8bcMA4nfH82KxJEPQguHh8lBNHnUBDcEsYybICm7gOSMFbgXGis
 DZBhTOIkGJnriPCxOBtmhqcjPIGNcGn4YKSOGK+E6coPERyFGTjw+6FUMF4DgYe14nDXMhwD
 v7oUQuoKuBVoIgTJMAlTvhhhsBzwfd0m0Ar42H99vooSxo9UzmMe/OePScOjAPYgeNfmm3/Q
 QTBwmQjXIXAiXL2dLNAJ4J87hQTbxRCcrpYIVjI4VCkXJDR8fuMRCxhg8H2NRMAGuHNykBC2
 FhDBwMC09ChSeReG8f43jHfBuBkRF1Ac5+CtxRyvdej//9wOFLnIpIwu9OBpXh/CFKIXybIy
 VhfKJewevtTah4Ai6FhZc/nKQrnMxJaWcU670em2cHwf0odWfYxQLi2yh+7b5jJq9Sk6nY5J
 TUtP0+voeFl9jqpQjotZF7eb4xyc81+eiIpS7kfqw6N1LeZWW/vOn0PVPWPLU36MbO09EWNW
 Fjwec4+V9TasalC2z3bXNhyUGWu3L2MT59pMCc9vKMap5Jb42Dy7/7TFk3183dQUXDkbV1/N
 Z77Nl6/Gj3UZy06/9858KkW4beJFWUfF+C4wrrrxeonpNq64bFST/aahhPoVp2poMV/CapMI
 J8/+BRGeCkOnAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSnK6VlGacwfRHShab9jexWvyd847J
 YnfTMnaLt6c3sFt8XOJg8f/sB3YHNo+ds+6ye7QcecvqsXlJvcedH0sZPY7f2M7kcWBvC1sA
 WxSXTUpqTmZZapG+XQJXxr0PvSwFv6Qq3m4+ydrAeEG4i5GTQ0LAROLHxV9MXYxcHEICuxkl
 vr6/xgiRkJB4tPMLSxcjB5AtLHH4cDFEzStGiV2XrjOD1PAKeEjM2d3ICmILC3hLzO57ywZi
 swloSdz4vQksLiLgKPHt8lewOLNAgsTk1yfZQWwWAVWJr21PweZwClhINP47xQ6x4BOTxMf2
 PnaIBk2J1u2/2SEO0pF4e6oP7CBeAUGJvzuEIUrkJba/ncM8gVFwFpKOWQhVs5BULWBkXsUo
 mVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERwBWlo7GE+ciD/EKMDBqMTD62CpESfEmlhW
 XJl7iFGCg1lJhHdBk2qcEG9KYmVValF+fFFpTmrxIUZpDhYlcV75/GORQgLpiSWp2ampBalF
 MFkmDk6pBkbd908XJ3ZGTBDiy3v57DvbbfanxveyfdgDlno7RzAnHlE03uSX33HaY9OZ/njG
 VY6cJoqHgy4si5fYemyLddAKs3UrXm47WGb+x2zrnrBus3J+CwZm3SuLnpZGWySeODK1ou5T
 VEBWTEvr8t3rp/4xT7zX+OBQ42e+Y688Uji0Vx9/r8GYfkmJpTgj0VCLuag4EQB1rPZMfAIA
 AA==
X-CMS-MailID: 20200123035954epcas1p26a22f51ee2063f437600afc4cfbfe549
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200122171949epcas1p207e3296cb8a63135437d2b6380c233e7
References: <20200113055907.9029-1-js07.lee@samsung.com>
 <CAPP0e=NMzizy=fEZi4nWzo9GAJOpB2Qwv7ReK7HDvrGKUv+VEw@mail.gmail.com>
 <0a2c4e9132f7d4f61fd3ce87c5393c65515b937e.camel@samsung.com>
 <1780435.Q0f6Nmcn8h@localhost.localdomain>
 <CGME20200122171949epcas1p207e3296cb8a63135437d2b6380c233e7@epcas1p2.samsung.com>
 <87d1ed5d35cc5cb7addfb60d5dd028c9@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_200001_321455_6AC163BC 
X-CRM114-Status: GOOD (  32.31  )
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
Cc: john.garry@huawei.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael

2020-01-22 (Wed), 18:14 +0100, Michael Walle:
> Am 2020-01-22 15:31, schrieb Tudor.Ambarus@microchip.com:
> > Hi, Jungseung,
> > 
> > On Wednesday, January 22, 2020 1:42:00 PM EET Jungseung Lee wrote:
> > 
> > cut
> > 
> > > > > > +#define SPI_NOR_BP3_SR_BIT6    BIT(18) /*
> > > > > > +                                        * BP3 is bit 6 of
> > > > > > status
> > > > > > register.
> > > > > > +                                        * Must be used
> > > > > > with
> > > > > 
> > > > > Are we safe to replace SPI_NOR_TB_SR_BIT6 and
> > > > > SPI_NOR_BP3_SR_BIT6
> > > > > with a
> > > > > SPI_NOR_SR_TB_BIT6_BP3_BIT5? Or maybe with a
> > > > > SPI_NOR_SR_BP3_BIT6_TB_BIT5, how
> > > > > is more convenient?
> > > > 
> > > > Let's think about some flash in which BP0-3 exists in the
> > > > status
> > > > register but TB exists in another register.
> > > > for example, mx25u12835f.
> 
> And like the mx25u3232f, but this bit is only OTP programmable! For
> now,
> I'd only add support for reading the TB bit to for this kind of
> flashes,
> to prevent accidentially program this bit. It would be up to the
> board
> manufacturer how to actually set the bit.
> 
> Like having a TB_READ_ONLY flag.
> 
> Its also some kind of asymmetrical because you can only set it one
> way,
> eg. you can OTP the flash to be TB=1. Then you can be sure that the 
> flash
> will always be TB=1. But OTOH you cannot be sure that a TB=0 flash
> will
> always be a TB=0 flash, because you cannot lock that bit.
> 
> Any thoughts?
> 

Actually, I didn't get the chance to take a look at some flash that has
TB bit in configuration register. Currently mainline kernel just care
flashes that has TB bit in SR and SPI_NOR_HAS_TB can be set only such
flashes(as you could see in comment). It seems neccessary to add
another functions and flag for mx25u3232f case.
Is there any flash that has OTP programmable TB bit in SR?

Tudor and me were saying that there is some flash that has not TB bit
in *SR* even if it has BP3 bit in SR. So it seems unnecessary to make
correlated flag like SPI_NOR_SR_TB_BIT6_BP3_BIT5 for convenience.

> -michael
> 
> > > > I haven't tested yet, but according to the datasheet, I think
> > > > this
> > > > patch can support 4bit block protection for the flash.
> > > > 
> > > > In order to embrace the case, how about letting them as It is.
> > > > Is there any suggestion?
> > 
> > Ok, this info should go in the commit message, together with
> > details 
> > about
> > which flashes were tested.
> > 
> > I didn't know that the TB bit can be defined in the Configuration 
> > register.
> > This means that your suggestion with dedicated macros for BP3 and
> > TB is 
> > fine.
> > 
> > I looked a bit over your patches, they are in a pretty good shape.
> > I 
> > saw
> > something that can be improved on patch 2/3, but I didn't manage
> > to 
> > finish the
> > review. Your patches are the first on my TODO list, but now I'm a
> > bit 
> > busy. I
> > hope that I'll come with a complete review by the end of the next
> > week. 
> > I'm
> > going to do tests on few flashes too, to make sure that BP0-2 was
> > not
> > affected.
> > 
> > In the meantime, maybe Michael or John can review/test your
> > patches, 
> > they
> > showed interest in BP0-3 support.
> > 
> > Cheers,
> > ta
> 
> 
Thanks,
Jungseung Lee


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
