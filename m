Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FB0C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 19:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E74632D6
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 19:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0E74632D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/QNBhhyTM1ayYGWuvNh7tMCEjwqUayMD4YrQAKerpw=; b=iGXUcqxvN8VbXb
	43NYcGBB0J1J9EuykvBNlrrqE3BN89Ose+kdVrbgKr+aM0QyCL+31rN3zveMgKpvvPhVlbw96/7gF
	nAdS2Zad4hiD0z7TOJNK8q18HlEyj0iMEIcvNN9L5perd2EeN0z15leLVFq204Wm4X/iOJW77AP5P
	wWCoEb9NFu2KNdK9hBC3yPm6CNMU7TKmvS8ga8DJl6SSLBWSPrFR5ChMY/S49xLQUBqIS+uJ0rPVv
	ljxBKN3FMQdPjdnSSO98QQkZySIYjTy4iaqYypLcvtRJwoIfSKs06/8iFSMRN125v1bFJCuuUH/IR
	T+nAuIdMagFQrKngtyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmhLG-00GrAH-KT; Mon, 15 Nov 2021 19:08:34 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmhK1-00Gqob-Ub; Mon, 15 Nov 2021 19:07:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AFJ6ot3119723;
 Mon, 15 Nov 2021 13:06:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1637003210;
 bh=XfjWUsJQ5QAaU/bEp70k552JsVRB6ANUiXNJzFbl4pY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RoLWG/TBkGIdWbLR4YYlSQrpdcb9pav4RJnuFZRUW6On0akG22Yxj9CCjNJ4DWb4O
 v8Nv2VFWEJU/+M+NWJ5IUt0/SXU++BdeYZTzQUJZS0cYA02hHpsn3rDo4SE4LrNIEq
 c5xCW1w4BhIs359IEmhXhTXKgslYcKD8swfwaQ5U=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AFJ6o6V090587
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Nov 2021 13:06:50 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 15
 Nov 2021 13:06:50 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 15 Nov 2021 13:06:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AFJ6nYi088213;
 Mon, 15 Nov 2021 13:06:50 -0600
Date: Tue, 16 Nov 2021 00:36:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v3 11/25] mtd: spi-nor: spansion: Use manufacturer
 late_init()
Message-ID: <20211115190647.jamrifawubaz66fm@ti.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-12-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211029172633.886453-12-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_110718_073334_D4788F6E 
X-CRM114-Status: UNSURE (   9.65  )
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
> spansion_post_sfdp_fixups() was called regardless if the flash defined
> SFDP tables or not. A better place for this kind of parameters init is
> in manufacturer's late_init() hook. post_sfdp() should be called only
> when SFDP is defined. No functional change in this patch.
> 
> Instead of doing the 4b opcodes settings at manufacturer level, thus
> also for every flash that will be introduced, this should be done
> just where it is needed, per flash. I'll let this for other patch.
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
