Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5A5C43464
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 09:37:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7EE2151B
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 09:37:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aNboKUAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7EE2151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rN0TTgPW8pShwimljsCwhN7m9ohmtraiSBJxoux8u/M=; b=aNboKUAjJfA48Erf7owaM3gFV
	V9hHXHe6b00WDSf4wOZ0xq3QG/7doBMab0Z+0WYL/bh+Ug2xtKLHYKAi44e73XGS6am/A9vG02hys
	oYDvUVTCwV0JwsnH9r20wQsZz5i1bsBABUpnTJTKwccSokYsyfBmtF8fB8qXXIEMd52pwyV8IKjh7
	UyhXr6bloEXQCY0JdTwVFFeAd2rFMsaSNxc9O5qTF5JwoeH2Zgyu0PADN9jEamBGykSeFJYIaRveI
	M48TaqjyX3evTB+BWVXAoMqhHBrPtnUcz90uS6Ftd5iyN2YiTq7DgsnwlNPaLw6Uai6d3GDfmqOHZ
	Qm9FSdcmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKIF6-0000jS-5d; Mon, 21 Sep 2020 09:36:16 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKIF3-0000io-L4
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 09:36:14 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kKIEv-0000hN-Kz; Mon, 21 Sep 2020 11:36:05 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1kKIEu-0005ZS-0f; Mon, 21 Sep 2020 11:36:04 +0200
Date: Mon, 21 Sep 2020 11:36:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v13 19/20] mtd: rawnand: Use the ECC framework user input
 parsing bits
Message-ID: <20200921093603.GA19513@pengutronix.de>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-20-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200827085208.16276-20-miquel.raynal@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:31:11 up 214 days, 17:01, 153 users,  load average: 0.87, 0.68,
 0.44
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_053613_835874_1627084C 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Fabio Estevam <festevam@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 10:52:07AM +0200, Miquel Raynal wrote:
> Many helpers are generic to all NAND chips, they should not be
> raw-NAND specific, so use the generic ones.
> 
> To avoid moving all the raw NAND core "history" into the generic NAND
> layer, we keep a part of this parsing in the raw NAND core to ensure
> backward compatibility.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---

...

> -static int of_get_nand_ecc_step_size(struct device_node *np)
> +static void of_get_nand_ecc_legacy_user_config(struct nand_chip *chip)
>  {
> -	int ret;
> -	u32 val;
> +	struct device_node *dn = nand_get_flash_node(chip);
> +	struct nand_ecc_props *user_conf = &chip->base.ecc.user_conf;
>  
> -	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
> -	return ret ? ret : val;
> -}
> +	if (user_conf->engine_type != NAND_ECC_ENGINE_TYPE_INVALID)
> +		user_conf->engine_type = of_get_rawnand_ecc_engine_type_legacy(dn);

I think the intention is to set user_conf->engine_type when it's not set already,
so this should be == instead of !=

>  
> -static int of_get_nand_ecc_strength(struct device_node *np)
> -{
> -	int ret;
> -	u32 val;
> +	if (user_conf->algo != NAND_ECC_ALGO_UNKNOWN)
> +		user_conf->algo = of_get_rawnand_ecc_algo_legacy(dn);

ditto

>  
> -	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
> -	return ret ? ret : val;
> +	if (user_conf->placement != NAND_ECC_PLACEMENT_UNKNOWN)
> +		user_conf->placement = of_get_rawnand_ecc_placement_legacy(dn);

ditto

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
