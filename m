Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B0BC34047
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:24:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7870821D56
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:24:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eW7Pk98F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="dnD4/IXq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7870821D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nn7b5VyyhnQIB+dmMIeftdYEh8nMtDOE7xUWh05mjs8=; b=eW7Pk98Fnvna/9
	HnxWUtel/11w0+MYmjQh4MLHSfLtninf41BRhBXZ3/CG6pIxZx996g2VlY+bVzo4IPwe06WCbJtBR
	O+a2sc9zyvGW8hjBNEC+ySy8rKNT1jdanM3wowzM+q/qUEKTsloHfP5FXrU0nTXqwusmV+Er7ecPN
	b059ec/ECDLlErOeH4KbvVfiJKl0iGI3Y+5F/7l862nqIzPi6/fwmFwUqXkFVxaHKn4t7zCo7KThk
	cDeJi5v7d5M5aBpAYWjrzM/83dfSyX09GrflLdx2Y6pwU+Y/yKPOA1xHJbE6NEoEaI8F6vz7pMHEA
	kW4OW/JvhjllqJFoCfSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4NSI-0000Uh-77; Wed, 19 Feb 2020 11:23:50 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4NS1-0000FL-JJ
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 11:23:35 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200219112326epoutp02100783046294bfbb2492fdd20ddfb8b1~0yfEi4c7I1507515075epoutp02w
 for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2020 11:23:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200219112326epoutp02100783046294bfbb2492fdd20ddfb8b1~0yfEi4c7I1507515075epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1582111406;
 bh=LegDIF3k2Ey2rJmH7gf0TJ+51TV7z5arUdF/z77yWO4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=dnD4/IXqGQnZ98uO+oz9BMTJBhrZGSqBZh6WwONW7gvQeUdm3c5e2Dg8sJ5QD3WVZ
 yZCfH+IKtKnUgoBVND2T5I6WUoB5pjDXu9UjAJBJ/jQ1tfThT6KV42b6o3pD8jH1sM
 yYpREg7WE9dwncQL51gd+9wI77NuhnNvhTzE9Sfk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200219112326epcas1p43c0fbb7dc96628f784b443810588008e~0yfD-Mz9b0533905339epcas1p4W;
 Wed, 19 Feb 2020 11:23:26 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.162]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48MwMK12K0zMqYkV; Wed, 19 Feb
 2020 11:23:25 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.38.52419.CAA1D4E5; Wed, 19 Feb 2020 20:23:25 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200219112324epcas1p3d073662e1a2355d421bc2c7e004dd730~0yfCi3PkN2239422394epcas1p3b;
 Wed, 19 Feb 2020 11:23:24 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200219112324epsmtrp12c75fb50ec7132377c110c6d516ed5b2~0yfCiGBVF3001330013epsmtrp1C;
 Wed, 19 Feb 2020 11:23:24 +0000 (GMT)
X-AuditID: b6c32a37-59fff7000001ccc3-78-5e4d1aac0ca7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 87.C0.06569.CAA1D4E5; Wed, 19 Feb 2020 20:23:24 +0900 (KST)
Received: from ara-VirtualBox (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200219112324epsmtip2aae7b9f124bafbf92686a3c391219edf~0yfCa673H1267712677epsmtip2j;
 Wed, 19 Feb 2020 11:23:24 +0000 (GMT)
Message-ID: <3cb7988378ebe79ae0fc82d89de661177f121e60.camel@samsung.com>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
From: Jungseung Lee <js07.lee@samsung.com>
To: Michael Walle <michael@walle.cc>
Date: Wed, 19 Feb 2020 20:23:24 +0900
In-Reply-To: <1dea94d182249f9640e2cfb2f7ef402a@walle.cc>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+Xm3e6e4uG2WpxG0blloqZtzeg0tKYmhFpb0h0Kum96ctFe7
 s7KIrEx6aUlhpUaGlo/ygfnMDFmRlWXmX4telhBobVY+slRqc1fqv8/5ndf3nN8RYZIruEyU
 ZbSyFiOjp3AfQevDwJDgOtmWNEWnE9GzZU4v+tPraSHdefwWQTt6Gwn6e2Us/efFNyIW13SU
 vCM0dyuPat5O3USawuZapOmxt3lpurvy8CQ8VR+tY5kM1iJnjemmjCxjZgyVkKzdpFVHKJTB
 yig6kpIbGQMbQ8UlJgVvztK7VFDy/Yw+2/WUxHAcFbo+2mLKtrJynYmzxlCsOUNvVirMIRxj
 4LKNmSHpJsM6pUIRpnZF7tLrHnV9wM3F3gd7bAVYLrpEnEHeIiDDoedJp9DNErIdQeFL6gzy
 cfEPBNWT73GPMYngYvUgms+wT43yji4E+c4qocf4iqDr7DjmjhKTGhiovy9ws5RMgNJCB+5m
 nAwC+3TTXD8/ciUMjfXPVcXIw3C2onSOBWQAjFac9nKzN0lDwTcHr3UtOJ4VumqKXPUXwmy7
 1JO6DNocZZhbA5DPcbjR0MgrjYPrxY95lsJITzNfRwbD5/N55qCjpojwJOch+FRVyTtU4HTU
 Ye5mGBkIDfdCPc/LoWP6Gq95ATgnzgndIUCK4VS+xBNCwdfBPIGHAfqHCoQe1sC5yjF+Vycw
 eNoyILiA5CX/xin5b5ySf43LEVaLFrNmzpDJckqz6v8PbkJzVxkU2Y4a+xJtiBQhylfc/Soh
 TSJk9nM5BhsCEUb5iRP849Mk4gwm5xBrMWkt2XqWsyG1a9lFmGxRusl140arVqkOU6lUdHhE
 ZIRaRfmLP6YEpknITMbK7mVZM2uZz/MSecty0ZJRtmnDjMwYa09W/G68vSvrc8zOnytSTaFH
 lo/4lMfPSrEaA2et8rcOOe7YWhndmNDhO7Wy3U7U7t6m/KK6XOtnbqsYIaTEcP30jtVrJh4s
 iJe/kS8MHb7668D2jVWqFi4gLurkVlNT73jxqgJ1ik7bu7R0tOLevmN7Bmb6ihSUgNMxyiDM
 wjF/Ab8/DqqrAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSvO4aKd84g+f7pSz+znnHZPHo5m9W
 i91Ny9gt3p7ewG7xcYmDxf+zH9gd2Dx2zrrL7rF5Sb3HnR9LGT36tqxi9Dh+YzuTx4G9LWwB
 bFFcNimpOZllqUX6dglcGUf23mcrmMZZcfxQL3MD4xT2LkZODgkBE4kbP96zdTFycQgJ7GaU
 OLTqKTNEQkLi0c4vLF2MHEC2sMThw8UQNa8YJRqvrgKr4RXwkLi0bg8LiC0s4C0xu+8tG4jN
 JqAlceP3JlYQW0RAReLx5wuMIDazQI3E21cNYItZBFQl3i/uZAKxOQUsJHo/vGWHWNDJLLHj
 8ilWiAZNidbtv6Eu1ZF4e6oP7CBeAUGJvzuEIUrkJba/ncM8gVFwFpKOWQhVs5BULWBkXsUo
 mVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJERwBWlo7GE+ciD/EKMDBqMTDe+Cid5wQa2JZ
 cWXuIUYJDmYlEV5vca84Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzy+ccihQTSE0tSs1NTC1KL
 YLJMHJxSDYzytw0eCOZWXi9541J84izPxg3HkwXP8ZtsChaKPvVtsu59t+vfhe2DzTQkRFSb
 v/j/KFyx7bjujjt9UZxVne1T5v7631G2y1nL8Oat10ejvIzuC7les2drELA/qiI2cV3ustKy
 gJuWrhneM31KRVot7S93KscJqcQ6J2wvOhh2Yg6zo/lVISWW4oxEQy3mouJEAOR8pYh8AgAA
X-CMS-MailID: 20200219112324epcas1p3d073662e1a2355d421bc2c7e004dd730
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200210112615epcas1p1c838e38a519a3f3e390bfc51d4db1d3b
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <4000296.ZurDTCRVlM@localhost.localdomain>
 <23efafdb8c439838338eef421e341f4a@walle.cc>
 <CGME20200210112615epcas1p1c838e38a519a3f3e390bfc51d4db1d3b@epcas1p1.samsung.com>
 <132665276.5Rxbr4LpEM@localhost.localdomain>
 <ed9ae10ab3be4da90779cb6f8d6c6cf1e9fbc968.camel@samsung.com>
 <1dea94d182249f9640e2cfb2f7ef402a@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_032333_883826_F3954AA8 
X-CRM114-Status: GOOD (  16.84  )
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
Cc: js07.lee@samsung.com, js07.lee@gmail.com, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, Tudor.Ambarus@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

2020-02-19 (Wed), 12:08 +0100, Michael Walle:
> Am 2020-02-19 11:50, schrieb Jungseung Lee:
> > Hi, Tudor and all
> > 
> > 2020-02-10 (Mon), 11:26 +0000, Tudor.Ambarus@microchip.com:
> > We could also find a few flashes that does not following the
> > overall
> > logic. For example, "en25qh256" and "en25qh16" which was
> > manufactured
> > by EON. They are always following way (2) no matter what the number
> > of
> > slot is. It seems that it could be handled like below with custom
> > hook
> > later.
> 
> For these two flashes, BP3 is just the TB bit. So it should already
> work 
> with the current logic.
> 

Refer to what I mentioned before in the mail I talked with you.

>>It is mixed. Let's compare "en25qh128" from EON with "w25q128jv" from
>>Winbond. They have the same capacity(128MBit) and also supporting
>>3bit
>>block protection. (Note that the named BP3 bit of "en25qh128" is
>>working exactly same with T/B bit.)

>>"en25qh128" is following (2) and "w25q128jv" is following (1). It
>>seems
>>impossible to distinguish them by the flash size or the number of
>>protection bits. 

> -michael
> 
> 

Thanks,


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
