Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3599EC43331
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 00:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03FCF2072E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 00:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BWxRm91A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03FCF2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmdsLM+G6TgymPe0hO7RIxT3EVbJD3ttff1c7wTFrgA=; b=BWxRm91AkoLZGi
	as5qvnJLk0PJq4IN89JDfcR2/wiUwYMQCYiBnooj75HJXa4yCXVWz822YyyyLRFro4yD35/PVLYH4
	4WRmvWk5lZS638Pb19pyuaNGTTEy87C/kffadG9PjGPfX1TCv1tYyVARcnH5lVdsHNvkiSc/OvcuH
	uyetwvPlg2V+37RBUO8p4PU7r2gABRowR/EAMGUxLCKUgXJ5V8FMaCpanZOxD8HIS8OaNqGHha9Kk
	ma67JLJiz5SqHw2aI8DKsZF6hAwcreU5yvwmvVw1Ug+sxoFBURRtbd6aIIkhjD7iEPWMWOydfz61y
	u7XEWw5CbSozVJTQsE2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGXhC-00017z-FK; Tue, 24 Mar 2020 00:45:30 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGXh9-000177-IG
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 00:45:29 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48mXbQ0SMCz1rx8j;
 Tue, 24 Mar 2020 01:45:21 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48mXbP5Kc0z1qyF7;
 Tue, 24 Mar 2020 01:45:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id gC2vLJWwutXk; Tue, 24 Mar 2020 01:45:20 +0100 (CET)
X-Auth-Info: ksnt2ePpOv6cIiM3lWTVPmpZXSXFGTDMcknb+ITNjK0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 01:45:20 +0100 (CET)
Subject: Re: [00/12] add STM32 FMC2 controller drivers
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <466cf542-7575-d791-da81-da32c0919505@denx.de>
Date: Tue, 24 Mar 2020 01:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_174527_755234_2BFE5D31 
X-CRM114-Status: GOOD (  12.80  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 3/23/20 3:58 PM, Christophe Kerello wrote:
> The FMC2 functional block makes the interface with: synchronous and
> asynchronous static devices (such as PSNOR, PSRAM or other memory-mapped
> peripherals) and NAND flash memories.
> Its main purposes are:
>   - to translate AXI transactions into the appropriate external device
>     protocol
>   - to meet the access time requirements of the external devices
> All external devices share the addresses, data and control signals with the
> controller. Each external device is accessed by means of a unique Chip
> Select. The FMC2 performs only one access at a time to an external device.
> 
> Christophe Kerello (12):
>   dt-bindings: mfd: stm32-fmc2: add STM32 FMC2 controller documentation
>   mfd: stm32-fmc2: add STM32 FMC2 controller driver
>   bus: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
>   mtd: rawnand: stm32_fmc2: manage all errors cases at probe time
>   mtd: rawnand: stm32_fmc2: remove useless inline comments
>   mtd: rawnand: stm32_fmc2: use FMC2_TIMEOUT_MS for timeouts
>   mtd: rawnand: stm32_fmc2: cleanup
>   mtd: rawnand: stm32_fmc2: use FIELD_PREP/FIELD_GET macros
>   mtd: rawnand: stm32_fmc2: move all registers
>   mtd: rawnand: stm32_fmc2: use regmap APIs
>   mtd: rawnand: stm32_fmc2: use stm32_fmc2 structure in nfc controller
>   mtd: rawnand: stm32_fmc2: add new MP1 compatible string

This doesn't apply to either next or 5.6-rc7, do you have a tree
somewhere with those patches applied ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
