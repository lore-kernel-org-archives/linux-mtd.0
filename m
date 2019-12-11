Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B547DC43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 06:47:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873F82077B
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 06:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G+Q3F4Xb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="i2RDsmoV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873F82077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lmt67cT03x9eGVMqbRLuLq2PFMzMpKowP6mSWxiQMUM=; b=G+Q3F4XbA4uHHb
	SmsHSZITSDYzpUcQr7VXOkXNYUXnNMgXp4y5sWQhg4sHCI82+PIRJVEiIRIwU+/6Lhynxi4MEt1BO
	4/PJS6bZZ3204OkPLHhQC7S4rWf5rIZcHb0q3LsiQ7OQJizzH4x+bMM/hcadmk56bhtDttMPq9iHr
	cVxvuPoqUIHkdyh6gfhYRd+Q0uylHniIvDRKVO4uyiOJixhnfJH1O5g0zgKx+yDgCs48fbZ+ersYc
	RCog4YQeLHFYRDiphue31dlLjV+5NFilJ0ohXEh8BCUbFLH1ewYfCX0DPjH8v0BvpeJFMHKc4HPit
	jciNRPtj8bw0IPOYT2qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ievmP-0002pV-KH; Wed, 11 Dec 2019 06:47:25 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ievmI-0002oN-Eg
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 06:47:22 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20191211064713epoutp02c91ec1c932304b2ec69f951069f17da5~fPj65RNXO0510505105epoutp02X
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2019 06:47:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20191211064713epoutp02c91ec1c932304b2ec69f951069f17da5~fPj65RNXO0510505105epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576046833;
 bh=ioAssHuSUWEruEDcLPRs/3/LoUSBW2ZlcP/C7Au51SQ=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=i2RDsmoVCUdM7UL2QNN5GjB3dQcm0o8uAnHMhkQCyJFBNjZ0PmHcvGcAqbchpAidB
 /uuNtjwzA+sPFgt36ue/QWtizege1yioiqSgmbTuAKUcSWz3BeBcTFcXTBFu6WIJOM
 09ZUvgzEbzrLshf+99meAxz4elWhjD6xg+0/QuVQ=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191211064713epcas1p2148edc63b3dcabaa0e6adf6f05dc1248~fPj6hoQN10983109831epcas1p2p;
 Wed, 11 Dec 2019 06:47:13 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.161]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 47XnXw2RKRzMqYkq; Wed, 11 Dec
 2019 06:47:12 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 3B.F1.57028.EE090FD5; Wed, 11 Dec 2019 15:47:10 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20191211064710epcas1p4ebdf77038ebb02dcffbeebe7b89a0bbc~fPj3mjLND2849328493epcas1p4j;
 Wed, 11 Dec 2019 06:47:10 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20191211064710epsmtrp1213137b2f77ee19339a583b97cbd46c4~fPj3l6rs52618926189epsmtrp1h;
 Wed, 11 Dec 2019 06:47:10 +0000 (GMT)
X-AuditID: b6c32a35-50bff7000001dec4-59-5df090eeab85
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 DE.B0.10238.EE090FD5; Wed, 11 Dec 2019 15:47:10 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20191211064710epsmtip1d1d285aae91ed0dd3d62d3fd19a6d98f~fPj3dNUac1912819128epsmtip1I;
 Wed, 11 Dec 2019 06:47:10 +0000 (GMT)
Message-ID: <6310ba957fe2cf54ac308d3fec9705183066aeef.camel@samsung.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: Support TB selection using SR bit 6
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com, js07.lee@gmail.com, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, js07.lee@samsung.com
Date: Wed, 11 Dec 2019 15:47:09 +0900
In-Reply-To: <1b5b1748-500b-7027-40c6-b51ecf7df3b4@microchip.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRTn8+5xlRZfU+tkr3kjSPGxuaYrMooiRpqJgUQ01kUvTtyr3a3U
 iCxllWUlRdawEJtPjIFpamnZpIzAqCi0MM1H9NCtd1nLavMu7L/fOef3O7/vnO+QhHiaH0Hm
 GiyM2UDrKEEI71pPlDTWc/qDWvr5SIxyutITpBx95uUrbxyuFSrvdA4Ryo+O9ev5qg77C6Hq
 quOganCqBqlOtjSidN5O3VotQ2czZgljyDJm5xpykqmU7ZqNGkWiVBYrW61MoiQGWs8kU5tS
 02M35+p8tpRkL62z+lLpNMtS8evWmo1WCyPRGllLMsWYsnUmmdQUx9J61mrIicsy6tfIpNIE
 hY+5W6d9XfFKYJoIya/rKg4qQi6yFAWTgFdBqeOVsBSFkGLcjuBxWQWfCz4hcA3UByrfEPzu
 9gr+Sfrf/EBcoQtB343zPC6YRND6+TLhZ4mwCvqd7hlFKN4Cz4+18f1YgKNhwNs84xGGDyF4
 MuL0tSJJHl4B1ZcW+WEw3gAl1Qs5sxhw3z/J86dFeB5Mt4f60wReBm3uSsLfBXCTAKbe3Q08
 bhMMV9wjOBwK73pbhByOgLenbAHMQkdDuZATlyAYrXMECnLwuK8QfjMCR4HzejyXjoQO70XE
 Gc8Fz9cTfD8FsAiO2sQchYLJlyU8DgM8HCvjc1gFf2pHArv6guCcc4w4jZbZZ8ex/zeOfda4
 ChGNaD5jYvU5DCszyf7/1GY0c3rRinZ09kGqC2ESUXNEVW3v1WI+vZct0LsQkAQVJuq1edRi
 UTZdUMiYjRqzVcewLqTwrbqciAjPMvoO2WDRyBQJcrlcuSoxKVEhpxaIyKlHajHOoS1MHsOY
 GPM/XRAZHFGEwlf2adXtmvjCS0sd9vqx6l8Hvu/a98d2cbDplqIGl9vSftQWHs+An0uC8jtU
 +61Lzx10eou7i4t65BuGpZLUhh1adRMuqtvaxAxMxoUUptzcM5l3aHl/ZGZrV1q+9gx1Rrwm
 a9wy1BwWW7GwJ3Hzm/HMjHmLt12YmHh6e3Wre1cnxWO1tCyaMLP0X9reMNSQAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDLMWRmVeSWpSXmKPExsWy7bCSnO67CR9iDSZfYbP4O+cdk8Wjm79Z
 LXY3LWO3OLrnHrPFxyUODqweO2fdZffYvKTe486PpYwefVtWMQawRHHZpKTmZJalFunbJXBl
 PJ/+lK3gNVfF8r3NTA2Mhzi6GDk5JARMJK6/+MnYxcjFISSwm1Hibv88doiEhMSjnV9Yuhg5
 gGxhicOHiyFqXjFK/Gx+zAJSwyvgIXF9/Vs2EFtYwEviVud2VhCbTUBL4sbvTWC2iEATo8TU
 J3wgc1gEVCUWzZMGMTkFHCVaFklCjPzOKPG5fw/YWmYBTYnW7b+hTtCReHuqD+wEXgFBib87
 hCFK5CW2v53DPIFRYBaSjlkIVbOQVC1gZF7FKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7
 iREcxlqaOxgvL4k/xCjAwajEw7tg+/tYIdbEsuLK3EOMEhzMSiK8x9vexQrxpiRWVqUW5ccX
 leakFh9ilOZgURLnfZp3LFJIID2xJDU7NbUgtQgmy8TBKdXAaDWzUsTYsfHJ06sV+oFMa5ZH
 VzE5Pg4zXumh0OSz5XqU+JFvB9YYRCjFT+L46ee9fk3u453XxcVY5nZH56nK1s/9xKM/4YBC
 q4JsyhcDp1dFax65HBeXtPi97mCfTs7/c4yXm0R615TK2HT853DUttTWPeTXX/Vi66/Vt7k/
 zJ5zv89z39dQJZbijERDLeai4kQAEENPH18CAAA=
X-CMS-MailID: 20191211064710epcas1p4ebdf77038ebb02dcffbeebe7b89a0bbc
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_224721_142136_056D742B 
X-CRM114-Status: GOOD (  14.61  )
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

Hi, Tudor
2019-12-10 (Tue), 17:08 +0000, Tudor.Ambarus@microchip.com:
> Hi, Jungseung,
> 
> It's great to see this happen :).
> 
> On 12/2/19 8:35 AM, Jungseung Lee wrote:
> > 
> > There are some flashes to use bit 6 of status register for
> > Top/Bottom (TB).
> 
> What flashes are using the 6th bit of the SR as TB? Is something that
> we can
> generalize per manufacturer? I'm thinking of using a SNOR_F instead.
> 
Thanks for your comment.

Actually, I failed to find some generalized way to know which bit is
used for TB.

I was able to find some pattern that it was affected by capacity.

Winbond : Use the 6th bit from 32MB capacity
W25Q20EW, W25Q50BW, W25Q128V - TB(5)
W25Q256JV, W25M512JV - TB(6)

GigaDevice : Use the 6th bit from 32MB capacity
GD25Q16C, GD25Q32C, GD25LQ32D, GD25Q64C, GD25Q128 - TB(5)
GD25Q256 - TB(6)

Micron/STM : Keep to use 5th bit
M25PX64, N25Q128A, N25Q512A, MT25QL512ABB, MT25QL02GCBB - TB(5)

Spansion : Use the 6th bit from 16MB capacity
S25FL116K, S25FL132K, S25FL165K - TB(5)
S25FL128L, S25FL256L - TB(6)

Some of manufacturer use 6th bit for some flashes, that is probably
some cases to need additional BP bit (BP3).

Anyway it was hard to find anything that could be normalized. That's
why I add SPI_NOR_TB_SR_BIT6 that could be set on each flash info.

> Cheers,
> ta
Best Regards,
Jungseung Lee


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
