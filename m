Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DE2C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfTD5/RjWStL1qH7ACoxYkbJ7Xr+ZdgnZMK0XTJ/Ymk=; b=JNii7Fp9LRgd0y
	DKfZs1XctOxInhahMAa9JsVfABBr53v29e0MjzAiKFtuFlw14YIIDWRBc7ibiEkhCYFXgEIpr+VnG
	Xfc/DZ84xhDW6RhJpdbuLgRmvYjQgf69VUobSQcT58WQwF6Do8IX953j+R+ceGKxz0BAr2X92ZMv5
	GbhcyorLA6GZVl1tUQkxDdzlC4gmXPAlVo2d9NSBBgG9qMm08bCWubRLBZnQdgxRfZoz71z0zt509
	6C2ttjMF2YUUL367MKKghz7rZTOGL+DeMlRPxBucttiuFwg6ADWtoytfwpCeCQR2jQjb3NfLWdhL2
	FsLHbgTi5mUvxW63Cthg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK3UO-004JkW-Sx; Tue, 15 Feb 2022 19:27:53 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK3UL-004JjV-MW
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 19:27:51 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21FJRlSu061142;
 Tue, 15 Feb 2022 13:27:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644953267;
 bh=Qkwjf57xlH5V3afr/StOorltpiLph87zUCxTofDyKO8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=PTtToDR6zc9xbtTIsyuhLQGYe6n+Usd8z7iYI0XPiGTTYmd1zVhtPPjBUVn7EhSwz
 9dcB1wogg/l5yxOXNQT09MpndqWen2T0JFky2ZNlKC9xLk9qAivtFYNngaIdYnDpdO
 JXB1M1nX1uQN2kzxJ43F7lYDHvumS/yA1XqKvRPc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21FJRlTK116144
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Feb 2022 13:27:47 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 15
 Feb 2022 13:27:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 15 Feb 2022 13:27:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21FJRIdr094655;
 Tue, 15 Feb 2022 13:27:18 -0600
Date: Wed, 16 Feb 2022 00:57:17 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 14/14] mtd: spi-nor: renumber flags
Message-ID: <20220215192717.pxk33eyi3skg2lqz@ti.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-15-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220202145853.4187726-15-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_112749_862243_11B03497 
X-CRM114-Status: UNSURE (   5.71  )
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

On 02/02/22 03:58PM, Michael Walle wrote:
> As we have deleted some flag, lets renumber them so there are no holes.

I was expecting you to forget about this and was about to comment this 
in a previous patch. Good thing I looked ahead to double check :-)

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

> 
> Signed-off-by: Michael Walle <michael@walle.cc>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
