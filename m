Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1F3C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 07:48:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2C28214AF
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 07:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QeVkcKwX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VtMXvPmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2C28214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZpThHT7w2u+ZVpVlCfXgHG2oc3OQZEfI14Y8CCz75vY=; b=QeVkcKwXnHverM
	7m9XEsfCNS2YInuhiHIast/LhCCWFgpE6BWqRSZCwfPe6f0+3VtiRKCudZ76t/L0JA5Fr9KHQZYks
	g7ZL5rRSpeG9vD7fY7UTdPbVAU10IwfMLFFWJideJaLQ8FHsFAipKuuN7fPnvC2jOdWgxOCc1gqIZ
	8Y6BmEvXuR7e8h0Jr5J2P8gRLYN1OLMN6z1GoyxJqOMrpRMC0OoJ3hHXb++NAtUpgP8yyjHijtEke
	OFbHf7cCTDqTeQOO7aw3z5UsSNrhjftFuKHVwOZPlYKrXFDmJzs+PRzaqrPFVOGpiPY6rkjlzBeNz
	FatKZONSBkI0UZrdaDGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iewj0-0000U7-T3; Wed, 11 Dec 2019 07:47:58 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iewiw-0000TZ-3L
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 07:47:57 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20191211074751epoutp01395c67b5a4e21709083fc927670d90fe~fQY2a-rVG3158431584epoutp01I
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2019 07:47:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20191211074751epoutp01395c67b5a4e21709083fc927670d90fe~fQY2a-rVG3158431584epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576050471;
 bh=I3q6/+nApdrMUWAVMSy043uErsqiVEff516nlSawnFA=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=VtMXvPmE3tudblD6Kv3xXF2ZKdbUWW1lFZQRlspxidl61SngvpQ8B1qNQBm06FhvH
 C6L0wMsfuwK8tHgo1ltccPa0zFkeYgtry9J7roafeRnD6SCU4l53HuUNCjzVBX/7Fo
 3+7NoQev0N8idI1Wsx//U3FcBniOs4x++607CeY4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20191211074750epcas1p309af72840e02ea0868564d03cb870b8a~fQY1x6glK1109711097epcas1p3J;
 Wed, 11 Dec 2019 07:47:50 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.160]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 47Xpts1qKSzMqYlh; Wed, 11 Dec
 2019 07:47:49 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 E1.0E.48019.32F90FD5; Wed, 11 Dec 2019 16:47:47 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20191211074747epcas1p37cc54bb30866e988554777c3c6fc19c3~fQYzMxfO51020210202epcas1p3-;
 Wed, 11 Dec 2019 07:47:47 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191211074747epsmtrp20e0d693548a59a1ff176e0ed336bed02~fQYzL3ssk2271122711epsmtrp21;
 Wed, 11 Dec 2019 07:47:47 +0000 (GMT)
X-AuditID: b6c32a38-257ff7000001bb93-fa-5df09f23cd10
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AA.57.06569.32F90FD5; Wed, 11 Dec 2019 16:47:47 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191211074747epsmtip21516f91d34b9288084b70d8531ab4de4~fQYzB5Osv0310103101epsmtip2H;
 Wed, 11 Dec 2019 07:47:47 +0000 (GMT)
Message-ID: <93df856ba67631ae71cc4901245d902c3d398aee.camel@samsung.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Support TB selection using SR bit 6
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com, js07.lee@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, js07.lee@samsung.com
Date: Wed, 11 Dec 2019 16:47:47 +0900
In-Reply-To: <03f2eb36-dc5f-b5c6-53d2-7e24d1d90861@microchip.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRTm9e5uV3Nxm7MOow+7GKSlbs7Z8iMUK5b5Q+pPBWKXeXOrfbG7
 hQahDpWK0iyRWkUlU1GMlWnOVCrLJBUpKytpZUYUmctqpjDMNq9S/55zzvOc5z3nPQQm8uES
 QmuwMGYDraP4Ibw7D6PiYiKvTuVIH4Qq5y57gpTjb3y4stNWL1D2dr3DlD8caWm4qsPuFqhu
 O4pUb2frkKqitQll8w7oUjQMnceYIxiD2pinNeSnUrv35mbkKhKlshjZVuUWKsJA65lUantW
 dsxOrc7vSkUcpXVWfyqbZlkqbluK2Wi1MBEaI2tJpRhTns4kk5piWVrPWg35sWqjPkkmlcYr
 /MyDOs2rmj7cVCIqKOts4hejx8JTKJgAMgFqvG7BKRRCiEgXgj/d9xEX/ETQPOwN4oLfCLo+
 3uUtSRpqH/G4QjeChxdti/pvCJ6fu+kPCEJIqqD/5Y6AIIzMhNGT7XgA88loeO1rwQN8MVmC
 4MUHJwoUeOQGuNX4BAtog8l0mOrXcmabYbK/gse1XAFzrrBAGiPXQfvkZSzQBshmPsyMuVCA
 A+R2uD4QzknD4Gtfq4DDEvjl6eZzmIWOxioBpy1FMN7gWCTJwTN5Y+EJGBkFzrtxXHo9dPiu
 IM53OXimT+OclRBOlIs4CgXfxkoX1wPw9OMZnMMqmK//sLjQr0FQ+eUc/yxaZ/83jf2/aez/
 jK8hrAmtZEysPp9hZaaE//+0BS0cXrTShbqGsnoQSSAqVKhq+54jwumjbKG+BwGBUWJhX7kn
 RyTMowuPMWZjrtmqY9gepPCvugqThKuN/jM2WHJlini5XK5MSNySqJBTq4TE7LMcEZlPW5gj
 DGNizEu6ICJYUox2VbwZVbl99XKnY63kZ/ILX1X8hYzIkaFLswObS8oOVSdPiWutK9NHJ9Tn
 i7UT9tjXBVdG3MsmOtuGFXVzKbbq9zMDYtNpn9ppuHe8aJpf6S3d6BrcJHbvn2/XdGoU5a2D
 n9Zk9jKrb+r7LAcH45Iu7Rv3fT7ctmdsNrTVa5tpo3ishpZFY2aW/gtJLY87jgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSvK7y/A+xBhuuyFr8nfOOyeLRzd+s
 FrublrFbHN1zj9ni4xIHB1aPnbPusntsXlLvcefHUkaPvi2rGANYorhsUlJzMstSi/TtErgy
 rk87zlrQKFTRunsVWwPjMd4uRk4OCQETieWLjrB0MXJxCAnsZpR4dfIDE0RCQuLRzi9ACQ4g
 W1ji8OFiiJpXjBLvT11iBYnzCnhInLrqClIuLOAlcatzOyuIzSagJXHj9yYwW0SgiVFi6hM+
 EJtFQFVi48qTzCCtnAKOEh9OZUKMfM8kseFfKztIDbOApkTr9t/sECfoSLw91ccCsUpQ4u8O
 YYgSeYntb+cwT2AUmIWkYxZC1SwkVQsYmVcxSqYWFOem5xYbFhjlpZbrFSfmFpfmpesl5+du
 YgSHsZbWDsYTJ+IPMQpwMCrx8C7Y/j5WiDWxrLgy9xCjBAezkgjv8bZ3sUK8KYmVValF+fFF
 pTmpxYcYpTlYlMR55fOPRQoJpCeWpGanphakFsFkmTg4pRoYexsLvq/5dl25eZXAv2/eTFcU
 5/5dYR8Wk7QrdNeJe5Ytaj7ZE07EzeJNvBIwa8qfJmv2mveaxfH2c4Rc/DwKCusY/Db0Gl41
 MGngs22oybxwPmfToiPGUpue7KmLj1c1yHpfpMb1xG7tGwufZzxVx2+H/85Tebh+iS1bFlvN
 5vcVcg9OlpkrsRRnJBpqMRcVJwIAQL9Eg18CAAA=
X-CMS-MailID: 20191211074747epcas1p37cc54bb30866e988554777c3c6fc19c3
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8
References: <20191202063507.21311-1-js07.lee@samsung.com>
 <CGME20191202063518epcas1p1bd11a13b9092ba5d4df9452c73c07bf8@epcas1p1.samsung.com>
 <20191202063507.21311-2-js07.lee@samsung.com>
 <1b5b1748-500b-7027-40c6-b51ecf7df3b4@microchip.com>
 <6310ba957fe2cf54ac308d3fec9705183066aeef.camel@samsung.com>
 <03f2eb36-dc5f-b5c6-53d2-7e24d1d90861@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_234754_543930_4BBC721E 
X-CRM114-Status: GOOD (  26.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

2019-12-11 (Tue), 07:28 +0000, Tudor.Ambarus@microchip.com:
> 
> On 12/11/19 8:47 AM, Jungseung Lee wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> > 
> > Hi, Tudor
> > 2019-12-10 (Tue), 17:08 +0000, Tudor.Ambarus@microchip.com:
> > > Hi, Jungseung,
> > > 
> > > It's great to see this happen :).
> > > 
> > > On 12/2/19 8:35 AM, Jungseung Lee wrote:
> > > > 
> > > > There are some flashes to use bit 6 of status register for
> > > > Top/Bottom (TB).
> > > 
> > > What flashes are using the 6th bit of the SR as TB? Is something
> > > that
> > > we can
> > > generalize per manufacturer? I'm thinking of using a SNOR_F
> > > instead.
> > > 
> > 
> > Thanks for your comment.
> > 
> > Actually, I failed to find some generalized way to know which bit
> > is
> > used for TB.
> > 
> > I was able to find some pattern that it was affected by capacity.
> > 
> > Winbond : Use the 6th bit from 32MB capacity
> > W25Q20EW, W25Q50BW, W25Q128V - TB(5)
> > W25Q256JV, W25M512JV - TB(6)
> > 
> > GigaDevice : Use the 6th bit from 32MB capacity
> > GD25Q16C, GD25Q32C, GD25LQ32D, GD25Q64C, GD25Q128 - TB(5)
> > GD25Q256 - TB(6)
> > 
> > Micron/STM : Keep to use 5th bit
> > M25PX64, N25Q128A, N25Q512A, MT25QL512ABB, MT25QL02GCBB - TB(5)
> 
> They keep TB at BIT(5) and define BP3 at BIT(6).
> 
> > 
> > Spansion : Use the 6th bit from 16MB capacity
> > S25FL116K, S25FL132K, S25FL165K - TB(5)
> > S25FL128L, S25FL256L - TB(6)
> 
> While spansion defines BP3 at BIT(5) and TB at BIT(6). I hoped that
> at least we
> could made a correlation between TB and BP3, i.e. assume that if BP3
> is defined
> then TB will be at BIT(6), but we can't do this. What a mess.
Yeah, Really.

> > 
> > Some of manufacturer use 6th bit for some flashes, that is probably
> > some cases to need additional BP bit (BP3).
> > 
> > Anyway it was hard to find anything that could be normalized.
> > That's
> > why I add SPI_NOR_TB_SR_BIT6 that could be set on each flash info.
> > 
> 
> Yeah, makes sense. The explanations from above should fit in the
> commit message,
> but I think I can amend it when applying.
I really appreicate if you can do it.

> 
> Thanks,
> ta
Best Regards,
Jungseung Lee


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
