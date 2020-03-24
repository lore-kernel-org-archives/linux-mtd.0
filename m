Return-Path: <SRS0=g+sZ=5J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECA2C10DCE
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 00:45:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBDED2072E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2020 00:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GnvGgyVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBDED2072E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LsZrmfC8hnrqVEue0HjIBIcL7jHje1EAw2BVn6PgAl0=; b=GnvGgyVvUNgNex
	naV2hJ/p39Jf6kS0RTaXiXxuMT9MIwgewLO5lryNXiZW8jfI2EdSEjyKWcRX7xKjVH75Y1GpUDZEp
	iSqxMANVEinuP1XPpuSB1cyB5HBUirfB1VBM2l8XDZLacwJzGjpMzsqKTxqA0q/oH5EceJKq4gS48
	b8J6tT48DRkxBt9GUMrQasvuf2rbzVC5I/VmceFffMVT1Q8lmuMQb7eYbf+GdCeGMQ8EdknhHJdUq
	JVkS7S4iyyqqCTlzZQzcwNTTymyOSfy3FvgheIU9NltdvXYyIB1/BdIlE/nvPL/Pu5toPEYFDpwPF
	3/TLu/ooOfRd5p94St9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGXhL-0001HA-41; Tue, 24 Mar 2020 00:45:39 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGXh9-00017K-UY
 for linux-mtd@lists.infradead.org; Tue, 24 Mar 2020 00:45:29 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48mXbR5r3Jz1qs45;
 Tue, 24 Mar 2020 01:45:23 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48mXbR568tz1qyF8;
 Tue, 24 Mar 2020 01:45:23 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id FO-gghsvXtfJ; Tue, 24 Mar 2020 01:45:22 +0100 (CET)
X-Auth-Info: ZGG/J4gwG3dOZ4fK596fd89O+wp6LvVr1WgV+S4kI0M=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 24 Mar 2020 01:45:22 +0100 (CET)
Subject: Re: [10/12] mtd: rawnand: stm32_fmc2: use regmap APIs
To: Christophe Kerello <christophe.kerello@st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 tony@atomide.com
References: <1584975532-8038-1-git-send-email-christophe.kerello@st.com>
 <1584975532-8038-11-git-send-email-christophe.kerello@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <784fafd2-f1f3-f9c4-d6eb-1d2f6f8d38e4@denx.de>
Date: Tue, 24 Mar 2020 01:44:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1584975532-8038-11-git-send-email-christophe.kerello@st.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_174528_131823_75E195AB 
X-CRM114-Status: GOOD (  10.07  )
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
[...]
> @@ -531,11 +515,11 @@ static int stm32_fmc2_nfc_bch_correct(struct nand_chip *chip, u8 *dat,
>  		return -ETIMEDOUT;
>  	}
>  
> -	ecc_sta[0] = readl_relaxed(nfc->io_base + FMC2_BCHDSR0);
> -	ecc_sta[1] = readl_relaxed(nfc->io_base + FMC2_BCHDSR1);
> -	ecc_sta[2] = readl_relaxed(nfc->io_base + FMC2_BCHDSR2);
> -	ecc_sta[3] = readl_relaxed(nfc->io_base + FMC2_BCHDSR3);
> -	ecc_sta[4] = readl_relaxed(nfc->io_base + FMC2_BCHDSR4);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR0, &ecc_sta[0]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR1, &ecc_sta[1]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR2, &ecc_sta[2]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR3, &ecc_sta[3]);
> +	regmap_read(nfc->regmap, FMC2_BCHDSR4, &ecc_sta[4]);

Would regmap_bulk_read() work here ?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
