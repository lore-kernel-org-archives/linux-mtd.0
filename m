Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4B7C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:34:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C45160F5D
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:34:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C45160F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zWBGWNc5mkYnE54eOqcm7+4xXgL0e85SrhD/7GZqPFY=; b=hiEkDxmGOqIGV4
	h73EcNh9Tf9eDntSPzqohpZB574zA19ktwgo6EeTLy9uA+dh777ljmalmKZughFHdyrsQp2zC/uIt
	q3KjMwDXU69+OlC749m8SkVClmhtNMUtbnY57Xjf7EB01/SVsMDEk1+SwURLZTt10NMh030crk55W
	umCzoBYs+jIPdnX00FnxxOHkIVB4CGAC4D0xMAi2NGSvfOdwA2vAVUbJIed23k8yOLVN2oHnHWyKS
	+/azNie9P6WEeyx+go+MTw3IQKbgQl2nN+AQlrym9UHHTjNRXvQYEfMR+34a8br31aveQiDAObWjC
	o/tdcYkb2ZjAW9LdqeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ5vP-005G4k-Bn; Sat, 09 Oct 2021 06:33:39 +0000
Received: from mailout12.rmx.de ([94.199.88.78])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ5vL-005G4G-NL
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 06:33:37 +0000
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout12.rmx.de (Postfix) with ESMTPS id 4HRFcr4m2XzRx2L;
 Sat,  9 Oct 2021 08:33:32 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin01.retarus.com (Postfix) with ESMTPS id 4HRFcd4hfNz30h6;
 Sat,  9 Oct 2021 08:33:21 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.28) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 9 Oct
 2021 08:33:20 +0200
From: Christian Eggers <ceggers@arri.de>
To: Stefan =?ISO-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>
CC: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Sat, 9 Oct 2021 08:33:20 +0200
Message-ID: <9980438.nUPlyArG6x@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <2091909.Mh6RI2rZIc@n95hx1g2>
 <b6cc888f8211790ddee6683204f3b8e31a9facd4.camel@phytec.de>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.28]
X-RMX-ID: 20211009-083321-tsMKsFzQtGpK-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_233335_939578_86E2A073 
X-CRM114-Status: GOOD (  10.90  )
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

On Friday, 8 October 2021, 14:08:01 CEST, Stefan Riedm=FCller wrote:
> On Fri, 2021-10-08 at 11:55 +0200, Christian Eggers wrote:
> > @Stefan Riedmueller: Are you willing to commit this upstream?
> =

> Yes sure, I can prepare a patch beginning of next week.
> BTW, we have seen these DMA timeout issues on the i.MX6 SOCs as well. So =
this
> fix is not only for the i.MX 6ULL.

Current status:

- If have entirely removed the following part:
	if (GPMI_IS_MX6(this))
		/*
		 * Set the default value for the gpmi clock.
		 *
		 * If you want to use the ONFI nand which is in the
		 * Synchronous Mode, you should change the clock as you need.
		 */
		clk_set_rate(r->clock[0], 22000000);

- I applied your patch:
https://git.phytec.de/linux-mainline/commit/?h=3Dv5.10.48-phy&id=3D866939ea=
8110764d9c12af960d746e2f7f5debe3


Last night I made a cycle test with a phyCORE i.MX6ULL. Over 1700 cycles we=
re successful!

regards
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
