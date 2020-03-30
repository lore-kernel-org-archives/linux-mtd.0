Return-Path: <SRS0=se+M=5P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70841C2D0E7
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 01:25:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FC732078B
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2020 01:25:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fhet7k9z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FC732078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzokMyB92eMmp/sG4VDHthTUJxNL9GDFe4V8GWWyu38=; b=fhet7k9z459cxx
	anG7spZ/6/svYUXjJAZfVWenga8x/iwnT4tZ+LMx9Lg+i1ZEcKYIBSSwh0fmV+KOpWO1VtOy2WFNI
	+7ogfqgcQGehUgtpGKU8sDCcB2A/jcwv6jLaL1cxl+9BmaQOOsAw6NHh/tPHn/FR3xull7kRfKOS+
	zkqueJrg0TjNvbmvnNGVJHn2bDTFL1dYBtYV8w8UPQPVfx+P15qHU7Qllz3nQB2usDkdc7G7YrTYX
	VXpLsV1mBHWBsOBk1o/dx6wcT//+dyL97NEiU/7oxBRXzHAJaodg5/dTsnR1KIngpjQzbEHQwi3Y2
	Tnxc2CASPLRCE8XNiMeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIjAj-0004wt-0X; Mon, 30 Mar 2020 01:25:01 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIjAf-0004wK-84
 for linux-mtd@lists.infradead.org; Mon, 30 Mar 2020 01:24:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48rFBD6LBGz1qrFS;
 Mon, 30 Mar 2020 03:24:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48rFBD42WBz1r0bl;
 Mon, 30 Mar 2020 03:24:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Fvub03wl5HIX; Mon, 30 Mar 2020 03:24:51 +0200 (CEST)
X-Auth-Info: od+I4xl5ut2Q/YmRdmMDkY5JVWT6qwkF+EZ0I+fyrGA=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 30 Mar 2020 03:24:51 +0200 (CEST)
Subject: Re: [03/12] bus: stm32-fmc2-ebi: add STM32 FMC2 EBI controller driver
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-4-git-send-email-christophe.kerello@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f6a2c766-8ae5-fab7-e2f6-db23f39b5d91@denx.de>
Date: Mon, 30 Mar 2020 03:24:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584975532-8038-4-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200329_182457_590003_57F977E7 
X-CRM114-Status: GOOD (  11.31  )
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
> The driver adds the support for the STMicroelectronics FMC2 EBI controller
> found on STM32MP SOCs.
> 

On DH STM32MP1 SoM in PDK2 carrier board,
Tested-by: Marek Vasut <marex@denx.de>

btw. it seems this sets BTRx DATLAT and CLKDIV to 0xf , it's "Don't
care" in the datasheet for Muxed mode, but then it should probably be
set to 0.

The bindings I used are below:

&fmc {
        pinctrl-names = "default", "sleep";
        pinctrl-0 = <&fmc_pins_b>;
        pinctrl-1 = <&fmc_sleep_pins_b>;
        status = "okay";
        #address-cells = <1>;
        #size-cells = <1>;
        /delete-property/interrupts;
        /delete-property/dmas;
        /delete-property/dma-names;
        reg = <0x58002000 0x1000>;
        ranges;

        ebi {
                #address-cells = <2>;
                #size-cells = <1>;
                compatible = "st,stm32mp1-fmc2-ebi";
                ranges = <0 0 0x60000000 0x4000000>,
                         <1 0 0x64000000 0x4000000>,
                         <2 0 0x68000000 0x4000000>,
                         <3 0 0x6c000000 0x4000000>;

                ksz8851: ks8851mll@0,0 {
                        compatible = "micrel,ks8851-mll";
                        reg = <1 0x0 0x2 1 0x2 0x20000>;
                        interrupt-parent = <&gpioc>;
                        interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
                        bank-width = <2>;

                        /* Timing values are in nS */
                        st,fmc2_ebi_cs_mux_enable;
                        st,fmc2_ebi_cs_transaction_type = <4>;
                        st,fmc2_ebi_cs_buswidth = <16>;
                        st,fmc2_ebi_cs_address_setup = <6>;
                        st,fmc2_ebi_cs_address_hold = <6>;
                        st,fmc2_ebi_cs_data_setup = <127>;
                        st,fmc2_ebi_cs_bus_turnaround = <9>;
                        st,fmc2_ebi_cs_data_hold = <9>;
                };

                sram@3,0 {
                        compatible = "mtd-ram";
                        reg = <3 0x0 0x80000>;
                        bank-width = <2>;

                        /* Timing values are in nS */
                        st,fmc2_ebi_cs_mux_enable;
                        st,fmc2_ebi_cs_transaction_type = <4>;
                        st,fmc2_ebi_cs_buswidth = <16>;
                        st,fmc2_ebi_cs_address_setup = <6>;
                        st,fmc2_ebi_cs_address_hold = <6>;
                        st,fmc2_ebi_cs_data_setup = <127>;
                        st,fmc2_ebi_cs_bus_turnaround = <9>;
                        st,fmc2_ebi_cs_data_hold = <9>;
                };
        };
};

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
