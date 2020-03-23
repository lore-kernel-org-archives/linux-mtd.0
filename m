Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80348C54FCF
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 13:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5615820722
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 13:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRPV5iSk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="oBzNN3kp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5615820722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnA6XKjW72xMx2tDCQuUlrFiho1JR1HBpwudFN6yiPI=; b=CRPV5iSkHx+SeD
	yO2aPDY5tp8T5rnfIJ0UL58SpCDeKeioODFdHcWoySbWqMYFnEZvwJGiOCOMrBRnqacuiibpxNm+T
	9sRaToNPjD10EiuI/4Jzain9ryETYOgKWClIm+QmvsVSbMSfX+NH3Zhb8O8J9NEldFv29+REmVGgP
	7ZITfTLEqahXCt7j+avKwRNJ8qxe2FqeoruZRD4TUC1AznVJ4KDrRDJeDlkl1r3Acrg2Q92XFmClB
	oga7XZnr8c2KDouQAFYKurl+hFkSSDZhOtc8XR1C9stkXI79yDrSVslPrnXON6g+uhVH6IY5WQq9P
	GLyZ6xAGGHlRa29FPo9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGMwz-00020Q-MA; Mon, 23 Mar 2020 13:17:05 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGMww-0001zy-GL
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 13:17:04 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200323131659epoutp028d9c2674a4ecdb78685e3a9821251e15~_8UogkG831780217802epoutp02b
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2020 13:16:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200323131659epoutp028d9c2674a4ecdb78685e3a9821251e15~_8UogkG831780217802epoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584969419;
 bh=pHAfXVFE3rFXWRKOwlcxmuTUgek0RowFwuJzvJApGvU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=oBzNN3kpEzPkfBEK2LuHhu0ruiqpQpb6Yt3ZOIuKwbcaG3LspawjsTr8j6zjEayiO
 Xz9Y418L3HQp18eK/4DG2Jdr0qBm6y39kvkrtKt0cdTeBdNwK0innbLqq56oxzCox0
 DXYwaxcYl8dFFu42Ge3PyPGzURao6s4fEFEn8/Ck=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200323131658epcas1p23d98a0a2baf4b7e48812d17858e31ff4~_8Un4ewkv1550315503epcas1p20;
 Mon, 23 Mar 2020 13:16:58 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.164]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48mFK55yv1zMqYkV; Mon, 23 Mar
 2020 13:16:57 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.FE.04145.9C6B87E5; Mon, 23 Mar 2020 22:16:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200323131657epcas1p18fd17be92e4e1d9adfde6222d49c4c63~_8UmnAV7o1160111601epcas1p1U;
 Mon, 23 Mar 2020 13:16:57 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200323131657epsmtrp2a3ee6ac3a45c3a3e816e375efb63c9df~_8UmmV8Ta0675506755epsmtrp2q;
 Mon, 23 Mar 2020 13:16:57 +0000 (GMT)
X-AuditID: b6c32a35-2a5ff70000001031-63-5e78b6c96cb2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F3.F6.04158.9C6B87E5; Mon, 23 Mar 2020 22:16:57 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200323131657epsmtip231acf55337f6b2dd15f2b2ac0b6c829d~_8UmfCJ2D2458124581epsmtip2j;
 Mon, 23 Mar 2020 13:16:57 +0000 (GMT)
Message-ID: <cc07dfbb7f9182d904c2ef6458404c9b58abcd54.camel@samsung.com>
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com
Date: Mon, 23 Mar 2020 22:16:57 +0900
In-Reply-To: <8548006.u9pkoXE8D1@192.168.0.120>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SW0hTcRzuv7OzHbXVaZb+GETzWJDWdHNOV2kISozyweqlLFwnPU1xt3Y2
 Ux9MbHYRtYSysJuRJa3Ea6XWSJSwC0rgwzRK1qwXc/PeTcI2z6Levt/H9/H9bgQmrhFIiAKj
 lbEYaT0lCOU/GYiRyV4/Kc6RuxxytWdsCVc/q7gvVHvftgnVs01p6uWhGWEarulsOq358OMe
 0tR2OZBmcPQpT9PntAuy8Gx9Sj5D5zEWKWPMNeUVGHWp1L6D2nStKkmukCl2qJMpqZE2MKlU
 RmaWbE+B3p9NSYtovc1PZdEsS8XvTrGYbFZGmm9irakUY87TmxVycxxLG1ibUReXazLsVMjl
 CSq/8pg+//nvSWQeCS/uXb6FlaMza6sQQQCZCCMj0VUolBCT3Qi80wtCrphD0FdziccV3xB8
 6q5AVShkxfHA+TGociJ41zIeLDwIWq9dFARUIlIDPXWDeACHk1nw9eWiMIAFZCyMLnXggez1
 5CZwNosDNEYehRn3wxUrn9wCHs/3FWsIGQ+PWl7gXPB28L6p5QesInId/O4O56yb4Kn3BhZo
 Acg+AYy77Binz4DhXz/4HA6HycEuIYclMO9zCjjMQs+DOiFntiPwNDcFRUrweVuwQBhGxkBr
 bzxHR0HP0k3EBa8B32I1zq1RBOfPijkJBVNuezAW4N1ETbB9DTRXPsS4VXXyYKG1gXcJSRv+
 jdPw3zgN/4IbEeZAEYyZNegYVmFW/H/fDrTyirGqbnR5OLMfkQSiVova6otzxDhdxJYY+hEQ
 GLVe1Mn4KVEeXVLKWExai03PsP1I5V92HSbZkGvyP7bRqlWoEpRKpToxKTlJpaQiRVdc+hwx
 qaOtTCHDmBnLXx+PCJGUo7CJ3K2x9vqfrw4XNjpq00KaZt2zJzPv7lp11XXn6pSv7fqBKOfQ
 +wvasvbqWnvJNqL/dkdke4Rp85FWx/yac6dL53B+zPwJcbSo93hX6Dj58/GpuY2HNkTLxqPi
 05NdCb79XzIHZufKpbrmLuneSrmNFyOoKkv4PO1GEnd6dtgYxWfzaUUsZmHpP50zyH6gAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDLMWRmVeSWpSXmKPExsWy7bCSvO7JbRVxBo3dMhaPbv5mtdjdtIzd
 4u3pDewWH5c4WPw/+4HdgdVj85J6jzs/ljJ69G1Zxehx/MZ2Jo8De1vYAlijuGxSUnMyy1KL
 9O0SuDL2/H3FWHBZuGLX/3nMDYzN/F2MnBwSAiYSK/feZe9i5OIQEtjNKHGs8S8TREJC4tHO
 LyxdjBxAtrDE4cPFEDUPGCVurpjNCFLDK+AhsXPicVYQW1ggQOL10a/sIDabgJbEjd+bWEF6
 RQTkJfYuFwIxmQViJY7N8wWpYBFQlXj06DtYJ6eAvsSatfvBbCGB7UwSU//zgtjMApoSrdt/
 s0NcoyPx9lQf2DW8AoISf3cIQ5TIS2x/O4d5AqPgLCQdsxCqZiGpWsDIvIpRMrWgODc9t9iw
 wCgvtVyvODG3uDQvXS85P3cTIzjMtbR2MJ44EX+IUYCDUYmHl2NmRZwQa2JZcWXuIUYJDmYl
 Ed7NqUAh3pTEyqrUovz4otKc1OJDjNIcLErivPL5xyKFBNITS1KzU1MLUotgskwcnFINjBz/
 DWq+atwLLNM5+LRk73rZ02I7NS8wtct7e9ZZV28Pl31kmFAUtOddwvPDe0Nk4iusFvi5BrzR
 Kf+w21LCNtL5yIS5UScWhjx5k9S9c5qo6CznTN70bqWD/+q54k3Ll7x9pc9a+rl5r1HJ9E1f
 Ome8/OKVNP9q262vez7VmmtbbdOu66jVVWIpzkg01GIuKk4EAGyr+XdvAgAA
X-CMS-MailID: 20200323131657epcas1p18fd17be92e4e1d9adfde6222d49c4c63
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323125550epcas1p407aeb621dd8e39d41536e30ec759367c
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-6-tudor.ambarus@microchip.com>
 <26331bf950dc9945aad93f874dcf15d639fe3424.camel@samsung.com>
 <CGME20200323125550epcas1p407aeb621dd8e39d41536e30ec759367c@epcas1p4.samsung.com>
 <8548006.u9pkoXE8D1@192.168.0.120>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_061702_974969_399FA8CC 
X-CRM114-Status: GOOD (  22.53  )
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
Cc: michael@walle.cc, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2020-03-23 at 12:55 +0000, Tudor.Ambarus@microchip.com wrote:
> On Monday, March 23, 2020 2:43:09 PM EET Jungseung Lee wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the
> > content is safe
> > 
> > Hi,
> 
> Hi, Jungseung,
> > 
> > On Mon, 2020-03-23 at 09:24 +0000, Tudor.Ambarus@microchip.com
> > wrote:
> > > From: Jungseung Lee <js07.lee@samsung.com>
> > > 
> > > Currently, we are supporting block protection only for flash
> > > chips
> > > with
> > > 3 block protection bits (BP0-2) in the SR register.
> > > 
> > > Enable block protection support for flashes with 4 block
> > > protection
> > > bits
> > > (BP0-3).
> > > 
> > > Add a flash_info flag for flashes that describe 4 block
> > > protection
> > > bits.
> > > Add another flash_info flag for flashes in which BP3 bit is not
> > > adjacent
> > > to the BP0-2 bits.
> > > 
> > > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > > Reviewed-by: Michael Walle <michael@walle.cc>
> > > Tested-by: Michael Walle <michael@walle.cc>
> > > [ta:
> > > - introduce spi_nor_get_sr_bp_mask(), spi_nor_get_sr_tb_mask()
> 
> from the previous patch set
> > > - drop Micron n25q512ax3 / BP0-3) boilerplate description
> > > - be explicit in spi_nor_get_locked_range_sr aboyt SR_BP3 as
> > > Michael
> > > suggested,
> > > - amend commit description]
> 
> I'll drop these comments when/if applying. Let me know if you're ok
> with the 
> changes that I did. Please do the same for patches 3/5 and 5/5.
> 

It looks much better. All the parts you modified are those that I
thought were ambiguous. now it's ok.

Thanks,

> > > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > > ---
> > > 
> > >  drivers/mtd/spi-nor/core.c  | 66 +++++++++++++++++++++++++++--
> > > ----
> > > 
> > > ----
> > > 
> > >  drivers/mtd/spi-nor/core.h  | 10 ++++++
> > >  include/linux/mtd/spi-nor.h |  2 ++
> > >  3 files changed, 60 insertions(+), 18 deletions(-)
> 
> cut
> 
> > Tested with a n25q512ax3 (bp0-3) and w25q128 (bp0-2).
> > It passed all of my test cases.
> > 
> > Tested-by: Jungseung Lee <js07.lee@samsung.com>
> 
> Great! Since you are the author of the patch, it's not necessary to
> add your 
> T-b tag, but I'll amend the commit description to say that it was
> tested on 
> n25q512ax3 (bp0-3) and w25q128 (bp0-2).
> 
> Also, would you please review patches 1 and 2 from the series?
> 
> Cheers,
> ta
> 
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
