Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836C2C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Apr 2022 10:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnlciE4mzsqbyUlB9n8vY03X+wb+EKV7I4mz7CU3u9Q=; b=uhabq18NJgd2y/
	SwejQsiAnKwpWFOuPK8Xkdb+1HjGIL3BX1kdMNiBbYDhUWE19Q6PyLX3UYqSMnd3XWCERx8wfz+kz
	x60KuYdUF6BkTfSTFvTB1iDAw6BgUGDMzak0MGx4np5kdlbdYM+hxXJLo9RMeTpPFc8AUSc0igK9C
	twS6ofYwDpV/rg2u3Us8SBWtFnN3n42jxcuG7eWofKNjXL8e6jLG0CJbsmbaWmkr4pbQ4yIk2OkpK
	GJJtpr1SjVcjeYdr2I6qO5wu0npXC6FbrdQb7fSk5PWqaWqXh63sTTG7vOVbqUHSfItCTF7Dzh+a6
	u+kUxRCWFkwuA4VO/APg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naEvo-005JtO-VM; Fri, 01 Apr 2022 10:55:05 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naEvm-005JsP-2g
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2022 10:55:03 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 231AsuXu124777;
 Fri, 1 Apr 2022 05:54:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1648810496;
 bh=4HIXpALjFZpmMLhAmSpJsQ6CIq1LSBSVmVQUaofI1I0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=QmdRXub247mCr9A3y6Nq3ypnVs+jJ+f67zJkGnLeB+Gylg9IkXdYAJkz3DztARsUO
 KjA6RAgMSDq178rcAv3Wc2mF7SvpWdtAD0veDWqlgGUbYDZ7eBO95avga+ZOoSF2nC
 9ck6B+YOJEII66H8dUZSd3FRgdtO/4+AvRRklGwk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 231AsuZi130439
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 1 Apr 2022 05:54:56 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Apr 2022 05:54:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Apr 2022 05:54:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 231AstgX011130;
 Fri, 1 Apr 2022 05:54:55 -0500
Date: Fri, 1 Apr 2022 16:24:54 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v2 1/4] mtd: spi-nor: Parse BFPT to determine the 4-Byte
 Address Mode methods
Message-ID: <20220401105454.7qfkoq2li36m3qyk@ti.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
 <20220309144215.179449-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220309144215.179449-2-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_035502_199444_CBDC2AF0 
X-CRM114-Status: GOOD (  11.20  )
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

On 09/03/22 04:42PM, Tudor Ambarus wrote:
> BFPT[DWORD(16)] defines the methods to enter and exit the 4-Byte Address
> Mode. Parse BFPT to determine the method. Will rename the methods with
> generic names in a further patch, to keep things trackable in this one.
> 
> Some regressions may be introduced by this patch, because the
> params->set_4byte_addr_mode method that was set either in
> spi_nor_init_default_params() or later overwritten in default_init() hooks,
> may now be overwritten with a different value based on the BFPT data. If
> that's the case, the fix is to introduce a post_bfpt fixup hook where one
> should fix the wrong BFPT info.

Okay. Let's try to queue this series (and its dependencies) early in the 
rc cycle to give some time to catch bugs.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
