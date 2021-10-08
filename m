Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479A4C433F5
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 051EF60F43
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 13:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 051EF60F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVc9AjZTznryY4RllwDTluXfi8IzYuqo76nVWjZs6dE=; b=qaldX++clwWD97
	MzwanQii8sGHohsuJQm+Frx3VkcRUACxfierkCVPi/0le9eJNl29jXjOjPI+mNINk4rhT/CH+BTeq
	L6ZZbDilLPz1cDRZXVJiUu30ykvSr2/1JTh7fHPSyZUJC2tQFV1msxZ63ESQLa6FH2el20RDuPE33
	cN7tg+b1sjsiutwlhLoI3UF23DEogVIFx2Ow1ZRlpwq4T7bdMFss7hf8cy25lWkSz/0JirmTEmsMQ
	GsSLzepYDkrsGOc5Jzj4BEIaUjVdkGJOwDUNDJ2bdxEzA7am3K9HvM7yNw+mE94WQbOE3aXRDf0Ke
	N9m5V/X0s27LTvbKeprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYpgx-002r0F-VK; Fri, 08 Oct 2021 13:13:40 +0000
Received: from mailout01.rmx.de ([94.199.90.91])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYpgu-002qyg-D5
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 13:13:38 +0000
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout01.rmx.de (Postfix) with ESMTPS id 4HQpXs1ZgSz2SWqc;
 Fri,  8 Oct 2021 15:13:33 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin02.retarus.com (Postfix) with ESMTPS id 4HQpXZ5NHCz2TRjn;
 Fri,  8 Oct 2021 15:13:18 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.55.107) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 8 Oct
 2021 15:13:18 +0200
From: Christian Eggers <ceggers@arri.de>
To: Stefan =?ISO-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>, Miquel
 Raynal <miquel.raynal@bootlin.com>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Fri, 8 Oct 2021 15:13:17 +0200
Message-ID: <2533161.k3LOHGUjKi@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211008142724.7fbeed6a@xps13>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
 <20211008142724.7fbeed6a@xps13>
MIME-Version: 1.0
X-Originating-IP: [192.168.55.107]
X-RMX-ID: 20211008-151318-TSMrHwftHkzP-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_061336_656859_2527734C 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, 8 October 2021, 14:27:24 CEST, Miquel Raynal wrote:
> Hello,
> =

> Could it be possible to quantify the extra time spent in
> disabling/re-enabling clocks just for the record? So far this driver
> only supports a single chip and thus frequency changes do not happen
> frequently (a couple times at boot) but if someday we introduce support
> for several chips it might become very impacting. =

> =

> Thanks,
> Miqu=E8l
> =



ktime_t start =3D ktime_get(), duration;
__gpmi_enable_clk(this, false);
clk_set_rate(r->clock[0], hw->clk_rate);
__gpmi_enable_clk(this, true);
duration =3D ktime_get() - start;
printk(KERN_ERR "%s() duration =3D %lld ns\n", __func__, ktime_to_ns(durati=
on));

--> =


gpmi_nfc_apply_timings() duration =3D 39250 ns
...
nand: device found, Manufacturer ID: 0x2c, Chip ID: 0xdc
nand: Micron MT29F4G08ABADAH4
nand: 512 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
gpmi_nfc_apply_timings() duration =3D 36750 ns
gpmi_nfc_apply_timings() duration =3D 170750 ns

On i.MX6ULL @ 792MHz this takes less than 250 us.

regards
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
