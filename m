Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A1AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrNl08II1rcGy3/SWRpAlZ0JAzybdiyjZl6SmC94vkE=; b=yvugt9eQZvc+fW
	owmN0ziEM7SVEvSlZ7YhZNaHuQMfhE3luz39w3ZjjbieAX179UdPQHkXn7xgexzaBsoYkfc3kO0uI
	xtAkBLdAzSXR9kwng08YJiG16e4Fvk7Fu9alEaX4htCDT7VuFa1p+eLPk7YYRsFE+OB0Htp31W6mW
	3pk8uuhmIxJ0bYc8cASYiZBKOHITHbzoaqg57WJUSZPJLT2ja9i5Zrjbhy+b7/WyyMWCnEowX7ENv
	1MR51ITUrzetjXezAcwyEbL8LlafFlWQpRHBXJjbx9x76QihTtkFzhf9CWCKXDdCm6L+KlVfUYc1m
	qbkY3zOW8jQxask8jxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh3tV-007ZOw-Hp; Wed, 20 Apr 2022 06:32:53 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh3tJ-007ZN5-Bp; Wed, 20 Apr 2022 06:32:44 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23K6WWBj022338;
 Wed, 20 Apr 2022 01:32:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650436352;
 bh=vQlDnAMoy4wZrHoHB2oHSjpTBEtgonXsQqF285Vufwc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ww9oO9EteRRjtc6kgVWwj5l2jXVzW73OttyPqaohFDOHzTsQfFc6zruIo13TPVZWP
 0qsDKkuhH1Otk8s/K76qOlGLWyyRmYSMdNv+GxNaQ/GY6CQ4pf787wsisrmo7tgaHP
 qsftnRf7NgnyvE4LPC3VQ9zyKFWvuoO577xtpdBg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23K6WWNC016753
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Apr 2022 01:32:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Apr 2022 01:32:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Apr 2022 01:32:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23K6WVKC005590;
 Wed, 20 Apr 2022 01:32:32 -0500
Date: Wed, 20 Apr 2022 12:02:31 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <michal.simek@xilinx.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Introduce templates for SPI NOR operations
Message-ID: <20220420063231.kdtppbpwceiyfocb@ti.com>
References: <20220304093011.198173-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220304093011.198173-1-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_233241_521038_A241DA7A 
X-CRM114-Status: UNSURE (   8.95  )
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

On 04/03/22 11:30AM, Tudor Ambarus wrote:
> Clean the op declaration and hide the details of each op. With this it
> results a cleanner, easier to read code. No functional change expected.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

I have not looked at the changes very closely but the idea sounds fine 
to me.

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
