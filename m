Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4048AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbutmvelHblQZ+/TYxqFvYrUqNj76KXzg0WfOnyP20w=; b=rH6Npis5htfwey
	Ne2zDgiJLFtviKtiGy/OWkoTy4FIuroBcKYt3DLFxinTBYWHZMDBTsoTh/nimu8UdNpll38yviBHv
	G4J81BvH2JlICpfypnZbEo11N9HtshGtwp4X2QA5J/uZtRKDKhInNv9EzYNi2BSs1GwosjLlpWCKb
	qazg2Y07OzUqbaE9VTljnmO8tV/5+jmBpXs9aH0435u1U5JnX2xMZnIAiq1b0MoiuYWrfk0iqvxNP
	8zfp9C2eY7MEatzvPAskFhzw9Lt9hObXnDDWcx8Qc3JuwenESkDwNgAK6sdaWR8I9TxJzcytpPrLk
	xQEYi/Qk1nykurqXJtrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMpvu-00Du7Y-RM; Wed, 23 Feb 2022 11:35:47 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpuT-00DtVZ-KH
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 11:34:19 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NBYFUt067880;
 Wed, 23 Feb 2022 05:34:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645616055;
 bh=2LkD5YBwfGax8FSb4kF5KhkTV5+/YMmcx2pkuCKsJLo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=FzfGoYsz8mChcNQvv4DFI4u4gFlQ4pyTZ/I3HCB5tzml3JZyul0LZphnfihl5o4hR
 Ab3exPlovIcti82zderru5bGg0A66gHh2lRWFJSciwNyJLVGO2mUAi3O7pfgHLvfY6
 Lvui4vHLbYGNH5Yxla5uXlnuBHpESHILiSOs5iSk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NBYFjq067397
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 05:34:15 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 05:34:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 05:34:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NBYEtb060315;
 Wed, 23 Feb 2022 05:34:15 -0600
Date: Wed, 23 Feb 2022 17:04:13 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 04/32] mtd: spi-nor: esmt: unify function names
Message-ID: <20220223113413.g6maqnl4d4lew4wj@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-5-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120809.1531502-5-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033417_798062_EE3A6A73 
X-CRM114-Status: UNSURE (   8.92  )
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

On 21/02/22 01:07PM, Michael Walle wrote:
> To avoid name clashes unify all the function and static object names and
> use one of the following prefixes which should be sufficiently unique:
>  - <vendor>_nor_
>  - <flash_family>_nor_
>  - <flash_part>_
> 
> There are no functional changes.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
