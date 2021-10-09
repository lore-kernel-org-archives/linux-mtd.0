Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 642DFC433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:27:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2BC660F6D
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2BC660F6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arri.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tqKQ6IsP4/viQurR5PdIobi1MXogMwk36CRaDrCdw0M=; b=xtNQZObjv5ApBm
	W2gFa//UcWRmxusyiu7dcEMbU6Pjuq85n1v/ZXvoKiorD6DpGwz6y5lY6thsPR/wSxzVf8nw7UuYO
	rlGOrTAktsrUJ1pzyY/YRplSE7DpBfOYV+PORcK2vCYb9+O4mCAwZ/CqucQUIwdi2PNzChQCG9Rcp
	AwQa2TIXUC9zpvQhOCFGC16C+kLuVYt59g5iQHMbA6Lt6LWzxOcmh6llwnGYcejbKPFPcuv5s9ciP
	to8pz9UzaLZ1nwaX6DQoTor5ZggRHmQ2phnEQT+OqnrItNYro50wyBLm6N96mgWGRfjQQblNknihz
	3zqG1DMDBGeRiyuHVtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ5ov-005FiT-4u; Sat, 09 Oct 2021 06:26:57 +0000
Received: from mailout09.rmx.de ([94.199.88.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ5oq-005Fi7-NR
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 06:26:55 +0000
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mailout09.rmx.de (Postfix) with ESMTPS id 4HRFT44cbzzbmjJ;
 Sat,  9 Oct 2021 08:26:48 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by kdin02.retarus.com (Postfix) with ESMTPS id 4HRFSs4dVwz2TRlV;
 Sat,  9 Oct 2021 08:26:37 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.28) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 9 Oct
 2021 08:26:36 +0200
From: Christian Eggers <ceggers@arri.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Stefan =?ISO-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "han.xu@nxp.com"
 <han.xu@nxp.com>, "michael@amarulasolutions.com"
 <michael@amarulasolutions.com>, Christian Hemp <C.Hemp@phytec.de>,
 "gerg@kernel.org" <gerg@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: GPMI iMX6ull timeout on DMA
Date: Sat, 9 Oct 2021 08:26:36 +0200
Message-ID: <2811233.e9J7NaK4W3@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20211008180752.09f33896@xps13>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <6364938.4vTCxPXJkl@n95hx1g2> <20211008180752.09f33896@xps13>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.28]
X-RMX-ID: 20211009-082637-jglrxhfttBKl-0@out02.hq
X-RMX-SOURCE: 217.111.95.66
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_232652_955946_CB8BA903 
X-CRM114-Status: GOOD (  35.94  )
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

On Friday, 8 October 2021, 18:07:52 CEST, Miquel Raynal wrote:
> Hi Christian,
> 
> ceggers@arri.de wrote on Fri, 8 Oct 2021 15:49:21 +0200:
> 
> > On Friday, 8 October 2021, 15:36:31 CEST, Miquel Raynal wrote:
> > > 
> > > miquel.raynal@bootlin.com wrote on Fri, 8 Oct 2021 15:29:05 +0200:
> > >   
> > > > 
> > > > If this clock (as I understand) does not prevent us to access the
> > > > registers but only feeds the external NAND bus part, then there is no
> > > > need to enable it in the probe, just acquiring it will be enough.  
> > 
> > clocks[0] is "gpmi_io" which sounds more like i/o than registers. So lets
> > try to remove the initial call to clk_set_rate().

From the GPMI description (i.MX6 ULL):
> [GPMI] Registers are clocked on the HCLK domain. The I/O and pin timing are 
> clocked on a dedicated GPMICLK domain. GPMICLK can be set to maximize I/O
> performance.

Additionally, figure 17-1 in IMX6ULLRM.pdf shows that both (BCH and GPMI)
registers are connected to APBH.

I checked this with the debugger: For accessing the BCH and GPMI
registers, only CCGR0::CG2 [APBHDMA_HCLK_ENABLE] is required. This bit is
enabled in mxs_dma_alloc_chan_resources():

-000|mxs_dma_alloc_chan_resources(chan = 0xC2090154)
-001|__refcount_inc_not_zero(inline)
-001|refcount_inc_not_zero(inline)
-001|kref_get_unless_zero(inline)
-001|dma_chan_get(:chan = 0xC2090154)
-002|find_candidate(device = 0xC2090050, :mask = 0xC209BD38, :fn = 0xC0254679, :fn_param = 0xC209BD3C)
-003|__dma_request_channel(:mask = 0xC209BD38, :fn = 0xC0254679, :fn_param = 0xC209BD3C, np = 0xC7EEB0B0)
-004|mxs_dma_xlate(:dma_spec = 0xC209BD60, :ofdma = 0xC2264840)
-005|of_dma_request_slave_channel(np = 0xC7EEB2B4, name = 0xC04F923A -> "rx-tx")
-006|dma_request_chan(dev = 0xC2182410, :name = 0xC04F923A -> "rx-tx")
-007|acquire_dma_channels(inline)
-007|acquire_resources(:this = 0xC200F840)
-008|gpmi_nand_probe(:pdev = 0xC2182400)

The root clock is BCH_CLK_ROOT. It doesn't depend on ENFC_PRED or ENFC_PODF
(the dividers which are actually set in clk_set_rate(r->clock[0], 22000000)).

--> clk_set_rate(r->clock[0], 22000000) is not required for accessing the
registers. I removed the call entirely and everything works fine.

> > 
> > > > Then, the first call for an IO operation with ->must_apply_timings
> > > > should:
> > > > 
> > > > 	if (imx6)
> > > > 		disable_clk();
> > > > 
> > > > 	clk_set_rate();
> > > > 
> > > > 	if (imx6)
> > > > 		enable_clk();  
> > 
> > Do you think that the need for avoiding clock glitches is i.MX6 specific?
> > The errata I mentioned is specific for the bootloader software, but (I think)
> > the requirement for switching off the clocks gates prior changing the dividers
> > may apply also for other series.
> 
> I honestly don't know, perhaps Han have more details about it. If you
> think it's a wider issue, then we can just do the disable/enable step
> without any further checks.
I also don't know. I can not find the required sequence in the reference manual
(only in the errata sheet), so I cannot compare with other series. For best
performance we can start with checking for GPMI_IS_MX6Q(x) and extend it later
if this issue comes up on other devices.

I sent a question for this on NXP community:
https://community.nxp.com/t5/i-MX-Processors/ERR007117-Which-i-MX-devices-require-gating-the-clocks-when/m-p/1353018

> > > Actually we should ensure clks are enabled in the !imx6 case anyway,
> > > but this is needed only once so either we keep enabling the clock in
> > > the probe or we check here if the clk has already been enabled or not.  
> > The clocks are already enabled (and kept on) in probe. The initial call to
> > clk_set_rate() is just above this (but the clocks are not disabled at this
> > stage as all gates have been enabled by the boot loader).
> 
> The IO clock should be enabled and set to a particular rate the first
> time the die is selected to perform a NAND operation, or when we switch
> from one device to the other (this does not apply to the GPMI driver
> for now). So we can drop the enable/set_rate call in the probe if the
> assumption that this clock only feeds the external bus is right.

I think that this assumption is right.

regards
Christian




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
