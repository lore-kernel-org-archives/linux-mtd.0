Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475DDC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE0F60EDF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 07:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DE0F60EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncrdhhymTyXmsJfx3brYbpZqU65+I4eYlABI/D5cjOY=; b=I+KVSR8UTabCdS
	OkLje+ndPdJDZRyHbFvGYOWZKuxADmctlx6V6EW6Kj8GNT5zXU4RxB9KsSG4lDJVg7tCrsuQhHyQe
	mD8sGiLkVWF259Zn3sB36uO1FIJ8E00XnBV2bvEENolj5R9TeyZEFe7q6yGu+xXmGWjJRBxmpJXAK
	hAvYayTSIZFoFIyQkQiUPIPFkcK381AMH4OydD4Jxid9RPiCjV0yjC2zYsgzKfyNalEbr/EGdfpd7
	/VkmTBKjwqgrIiy8W3UjBssn160o7GFB6lb0TiAffvdTACFZQCiAFN4i8ZMug2VMkUK+rOX3YSNN/
	cJxDzQc+5qKoneD8D60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maYsT-00FQ0A-KE; Wed, 13 Oct 2021 07:40:42 +0000
Received: from mailout04.rmx.de ([94.199.90.94])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXY6-00F76g-80
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 06:15:36 +0000
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout04.rmx.de (Postfix) with ESMTPS id 4HTj2C2g9Jz3qxLC;
 Wed, 13 Oct 2021 08:15:31 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin01.retarus.com (Postfix) with ESMTPS id 4HTj1y1SB0z30gX;
 Wed, 13 Oct 2021 08:15:18 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.63) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 13 Oct
 2021 08:15:17 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Stefan =?ISO-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Wed, 13 Oct 2021 08:15:17 +0200
Message-ID: <7977464.T7Z3S40VBb@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <2811233.e9J7NaK4W3@n95hx1g2>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20211008180752.09f33896@xps13> <2811233.e9J7NaK4W3@n95hx1g2>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.63]
X-RMX-ID: 20211013-081518-gHBvWzrZSPLd-0@out01.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_231534_507624_64A23055 
X-CRM114-Status: GOOD (  19.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Saturday, 9 October 2021, 08:26:36 CEST, Christian Eggers wrote:
> > > Do you think that the need for avoiding clock glitches is i.MX6 specific?
> > > The errata I mentioned is specific for the bootloader software, but (I think)
> > > the requirement for switching off the clocks gates prior changing the dividers
> > > may apply also for other series.
> > 
> > I honestly don't know, perhaps Han have more details about it. If you
> > think it's a wider issue, then we can just do the disable/enable step
> > without any further checks.
> I also don't know. I can not find the required sequence in the reference manual
> (only in the errata sheet), so I cannot compare with other series. For best
> performance we can start with checking for GPMI_IS_MX6Q(x) and extend it later
> if this issue comes up on other devices.
> 
> I sent a question for this on NXP community:
> https://community.nxp.com/t5/i-MX-Processors/ERR007117-Which-i-MX-devices-require-gating-the-clocks-when/m-p/1353018
> 
> 1. Which i.MX models / series require this sequence?
> 2. Where can I find this sequence in the reference manuals (e.g. for i.MX6 ULL)?
> 3. How is CCM_CCGR2[CG7] (iomux_ipt_clk_io_clk) related to "gating enfc_clk_root"?

@Han Xu: Can you provide further information about this? Do you have contact to
the hardware developers?

regards
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
