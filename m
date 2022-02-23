Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4E3C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VP89lekjvzH0AGgydcrgxMs5PnX2CsldIpnPC8UtKM=; b=RzOwRKMQRrHQWh
	C9kk1BqImkRv/ZLV/QWKWE+LnPMSgHUIs3CGWFYDRIY4KwMkA/VEa9vDZ/XKPDbrd1ZgJoHFkmOLn
	xIdYoPGZQukBUQMaqZa1Z5L2k2kdptQ5nyOyXivRfnnyrXD5WngQuCeiwXLlBrmunK6UtlX1s+bAx
	A63xm/OfLDnuZiALjCWPb/c55pg9AEfXcgRFijVzNDwVFgRpgOLhrI8ZahNuT6EiWJs6drg8XXyCh
	Y2uiOMZdG7v+5JHw1sll4J5nqqXYWyyIOwbCKB+tdE2fC76z8whpPBNLIL18Vv0PSRuOxjKNAqTRa
	Cjj3zIX9GMsiljkjKVqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMtBe-00EurQ-NW; Wed, 23 Feb 2022 15:04:14 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMt4g-00ErvZ-4e
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 14:57:04 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NEuwJa071904;
 Wed, 23 Feb 2022 08:56:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645628218;
 bh=xlfpSw9Qqx6AkAHRLq3ORbzvQmMJ/ic109cbKv7Vroc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=MorgSufRCpYwIexMDnzo0KCEorwarm2qPvzbggt0LbGsOfbN1Cmn2vlqNEAf1hvkK
 ROZpXQeX6ILLzIPFGd5i9Ee2Ba/cgRTw2nWAxM1u5laVTJv7Mrwic2fMHdWX+KfFyX
 NYs0GLd1W1QS6VWZA2EnsLYkJvmSHEBrt7ujwpyc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NEuwoO109562
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 08:56:58 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 08:56:58 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 08:56:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NEuvxe011793;
 Wed, 23 Feb 2022 08:56:57 -0600
Date: Wed, 23 Feb 2022 20:26:56 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v5 26/32] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
Message-ID: <20220223145656.cfap4y2gskiatcnx@ti.com>
References: <20220223134358.1914798-1-michael@walle.cc>
 <20220223134358.1914798-27-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223134358.1914798-27-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_065702_372585_1F19AB68 
X-CRM114-Status: UNSURE (   6.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 23/02/22 02:43PM, Michael Walle wrote:
> Drop the generic spi_nor prefix for all the micron-st functions.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Tested-by: Pratyush Yadav <p.yadav@ti.com> # on mt35xu512aba, s28hs512t

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
