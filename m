Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87ACC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 11:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RbutmvelHblQZ+/TYxqFvYrUqNj76KXzg0WfOnyP20w=; b=00krVRBM9cJfeQ
	CyBv+kSJfsRh2Wh8avtfhduiH9EDrwe8YzX+MUEyE8UvqXrVdr6AOpuqABfF6eMvZESC7MAF4tQQn
	lkvQL7sUHEciecyBjeqXtL7pjopgF5qTioRaVJpaGi3+OtRpXKfVA/+hLWWYBKavvGmgNRhawQNOn
	DjyfjdT9jnf5u9IQKbmLkP5xg099emA10HoQvnlV5YTe9AH2qCOhTvnog5oLDZDDnvU/m9Xng/hKe
	GXVEOR3UIBBy4IRwB5lr73HM6CdlCqkt244Uyi4MXT/yCiswQfHQcBb/rD7vHlgNEC9ICeOBP7qQC
	57rPZy+G7gFHtPNM4yzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMqG4-00E16F-9o; Wed, 23 Feb 2022 11:56:37 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMpwl-00DuRx-Ug
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 11:36:41 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NBaca5050642;
 Wed, 23 Feb 2022 05:36:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645616198;
 bh=2LkD5YBwfGax8FSb4kF5KhkTV5+/YMmcx2pkuCKsJLo=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=n2IqJCB5E62Hw9mxoKbkhxocpdrwAgeN1+IHBL4AuTzNReNYpvoZ89aMjjIorrUrl
 XBgRPJ7RT9+3oHkt4EI9OBp+loKdePDe5m3TOMJmoT5Qkf60cdnE2gqSDWFmMow977
 4NDw+YMl+lQzCUhGqEq0jgnlgbi33kA6LZprwmNA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NBacUv125567
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 05:36:38 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 05:36:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 05:36:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NBabp9007068;
 Wed, 23 Feb 2022 05:36:37 -0600
Date: Wed, 23 Feb 2022 17:06:36 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 10/32] mtd: spi-nor: macronix: unify function names
Message-ID: <20220223113636.4hy6epzrr6gf7n7u@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-11-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120809.1531502-11-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_033640_101222_4F102847 
X-CRM114-Status: UNSURE (   9.02  )
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
