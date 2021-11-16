Return-Path: <SRS0=mJc1=QD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCF0C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:38:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2033063259
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Nov 2021 11:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2033063259
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGfpSWf0k1pXUiuL7n7aB9XcZ10sO5bsx+t6YbR7Rt8=; b=XWyMI+KFPFW4/f
	Y1bX21ReD3cEyD8Vul+AsqPqGLQsSR4k5y/T6FLAWQbxDeOuLbQ+nS+jz9Gg+ycw5w5o/XWUayxMk
	9ggJVzGFvVg04N7T4hTBJ22wSHOtO+ymPrC/1S23xKJ09RasWRHiYDHGUQ0gdbn+h29w5fGn2EJGR
	pAcFcrbptMU/3azcJvwlukzH9ttbz6L+EqxorzLcXvmjv9e3OvtVCQtIaXNrW0VaQ42crzBGSc89X
	FdMPg9qovnGl+Xt3mAjiAkemtnrBfmuCtAmUs3S/BCkD04lJZcKMkdE5QZXl5TsT3Gm6gL/9Gq+pv
	4My38qe5rnft4frNJMdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwmA-001UIL-A7; Tue, 16 Nov 2021 11:37:22 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwm4-001UG3-Ow; Tue, 16 Nov 2021 11:37:19 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AGBanqr025026;
 Tue, 16 Nov 2021 05:36:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637062609;
 bh=nxbGQl2u2w2uLbBtH9C6m8NNpT6eaI/9tq48jajlpRs=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=i3u0J3eL4eGl5+0jNnX4X074gJXqq/J58i/ItdB0XXeoeIpfTysD4/MR+zywkpTiI
 vMEFdmFyjBrsq3pR+mblCEIFOvusTbI2oZq2xIFrWvPb7m9djfHxa1O16HGU9CxXg6
 UHBsAT/wue1i9mbQnApSSgKjt6CUeyDVLKl6CW2o=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AGBansw125449
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Nov 2021 05:36:49 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 16
 Nov 2021 05:36:49 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 16 Nov 2021 05:36:49 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AGBamTA014993;
 Tue, 16 Nov 2021 05:36:49 -0600
Date: Tue, 16 Nov 2021 17:06:48 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 00/25] mtd: spi-nor: Clean params init
Message-ID: <20211116113646.3yjfk3ifatvsimli@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029172633.886453-1-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_033717_748808_BFF512E3 
X-CRM114-Status: GOOD (  10.85  )
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
> Clean spi_nor_scan() and the flash parameters initialization code. 
> Tested all the flashes from patch set. If someone can test the
> locking ops on few flashes would be great. It seems that my flashes
> have the non volatile bits weared out.
> 
> This patch set is split from:
> https://lore.kernel.org/linux-mtd/20210727045222.905056-1-tudor.ambarus@microchip.com/
> The ID collision series will be set in a dedicated patch set that will
> depend on this one.

I generated some random data (4 MiB), erased the flash, wrote the data 
to the flash, read the data back, and compared it with the original 
image. Works fine on Micron MT35XU512ABA, Micron N25Q128A13, Cypress 
S28HS512T.

Tested-by: Pratyush Yadav <p.yadav@ti.com> # mt35xu512aba, s28hs512t, n25q128a13

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
