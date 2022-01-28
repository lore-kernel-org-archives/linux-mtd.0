Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E957DC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 18:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xg4i/HTdRn7nr3YfXdhHpBArzTV2l1EFaHY+ZZNoX3s=; b=0JZ9s3vh2AHKf4
	uvtRRi12ZdohHWfFHqJaOTh5JKA96x4h6Rq5QPtokLFoDTzTa+Pi4rfPxELksOr6waNnIl0V6jzGi
	s4/Kj8ss8LPe9lk23XZbyJX9cy+vZc1MLZagQDvyFmeTpd9g8EiEocqaybaoMG5V44Z2pvUdgU0Oj
	W/IPJI9T+TYzB2gaX9mgg7J+TFOZ9J4A5faeBTAvdnah2/iMrQBvl7Cwin+FVLXCDOI7aqPA99KXa
	NoVfgHcWQZhpA94WTT6WbTn02DL3m5OlPXdfpxvvelfN9xLcWmbhnRmipo2h+3VthLdOM0U29zrvg
	rnrzTEIm8p2vRUTz5wTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDVgj-003IrU-19; Fri, 28 Jan 2022 18:09:33 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDVgc-003IqL-I9
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 18:09:28 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20SI9G8Q028640;
 Fri, 28 Jan 2022 12:09:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1643393356;
 bh=5L4T3WgLM6NwzfndCx1GYL9Org9hJGNddw2sdaZ/rhY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=EzgkTot3gbfur0LSOQ3mcNdLMkSb4ZshcQSWjhwdQjdLX0jvBc89FnLUolTZERkyp
 zS/+lZDjrvMcU1HMgFK4Cr/4EIv88VZ+T8hXuvvGPO2nr/LEE6q+5Jd5vub0zyNb2W
 SmRz9o2azYXaqeQd628pI+qDwICSTr+SoOaVsOdM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20SI9GKL102199
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 28 Jan 2022 12:09:16 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 28
 Jan 2022 12:09:15 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 28 Jan 2022 12:09:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20SI9Es2068867;
 Fri, 28 Jan 2022 12:09:15 -0600
Date: Fri, 28 Jan 2022 23:39:14 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>, Paul Cercueil <paul@crapouillou.net>,
 Harvey Hunt <harveyhuntnexus@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: Fix misuses of of_match_ptr()
Message-ID: <20220128180914.rfk3xw5xz45yvxzu@ti.com>
References: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127110631.1064705-1-miquel.raynal@bootlin.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_100926_750014_4DE1D25F 
X-CRM114-Status: GOOD (  15.23  )
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

On 27/01/22 12:06PM, Miquel Raynal wrote:
> of_match_ptr() either expands to NULL if !CONFIG_OF, or is transparent
> otherwise. There are several drivers using this macro which keep their
> of_device_id array enclosed within an #ifdef CONFIG_OF check, these are
> considered fine. However, When misused, the of_device_id array pointed
> by this macro will produce a warning because it is finally unused when
> compiled without OF support.
> 
> A number of fixes are possible:
> - Always depend on CONFIG_OF, but this will not always work and may
>   break boards.
> - Enclose the compatible array by #ifdef's, this may save a bit of
>   memory but will reduce build coverage.
> - Tell the compiler the array may be unused, if this can be avoided,
>   let's not do this.
> - Just drop the macro, setting the of_device_id array for a non OF
>   enabled platform is not an issue, it will just be unused.
> 
> The latter solution seems the more appropriate, so let's use it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
