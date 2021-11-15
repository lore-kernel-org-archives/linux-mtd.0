Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5DCC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 18:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205936367D
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 18:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 205936367D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxEpKxcmqG1JpyOXPyLzGb1et/jhugeuiANX/nd/PcI=; b=pSSeZ5WT7jVabU
	ys+EAibaQ59Zo8hAOeefXhu0DlfNGW5iZPqXS9pvCrZK5i+VYtbBg2PJzJnoaXZjVXjycw3fKujwi
	l0muLQF0o9ahirHot2pc/BikBIqTlN2AZdgOvgbwgaldKKizGUQ/pobVUdP/2DPYIDm5HX5XQLeXz
	2RjylsBS65yOy3wh+K7Ysmcu7SjApoLWpQu5cir4wMfjlgeX+TMfYIJjHbtVub4UcHQK9NRX4jG0W
	BjSnmjiMwsU8XSIFDSFc/Be/jl5TV4W9B/JEYDYhRS+oDt12sjkpa4aHo9+YNEzUZu8TYRPbCJzTS
	4bnGNISRlfKCuem+GMVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmhAS-00GnPG-Or; Mon, 15 Nov 2021 18:57:24 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmhAP-00GnNm-QJ; Mon, 15 Nov 2021 18:57:23 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFIutej004716;
 Mon, 15 Nov 2021 12:56:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637002615;
 bh=DCwtUxRtDpusdWifzkSSPR+M/H9y5hvg0HMey7q/Qbg=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=JDjldkUnBTIVPWcq4KwfWvuAoMJvY29p53ojojsoc8xrltTbKPni2QWx68ISJcAYK
 LhwItf5SKmjDF/+FTAXZszgn91Bo5XwW3FaluUNaOSn6c+FMrcmONln2w+yktyZrEw
 NFhncHuKIccu30RQGDC8QImJA7DV0KXG90j182NA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFIutT9075733
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Nov 2021 12:56:55 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 12:56:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 12:56:54 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFIusAC001746;
 Mon, 15 Nov 2021 12:56:54 -0600
Date: Tue, 16 Nov 2021 00:26:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 05/25] mtd: spi-nor: core: Introduce the late_init()
 hook
Message-ID: <20211115185651.3m5rrt2x4tvmbk3j@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-6-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029172633.886453-6-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_105721_968204_B3ED7F82 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, nicolas.ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/10/21 08:26PM, Tudor Ambarus wrote:
> Flash parameters init is done in a spaghetti way right now.
> There is the init based on the flash_info data, then there is the
> default_init() hook, then SFDP init, an intermediary post_bft(),
> then post_sfdp() and a spi_nor_late_init_params(). Each method can
> overwrite previuosly initialized parameters.
> 
> We want to separate what is SFDP and non-SFDP specific. late_init()
> will replace the default_init() hook and will be used only to initialize
> flash parameters that are not declared in the JESD216 SFDP standard, or
> where SFDP tables are not defined at all.
> We cut a member in the chain of initializing parameters by getting rid
> of the default_init() hook, and we make it clear that everything that is
> in late_init() is not covered by the SFDP tables defined by the flash.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
