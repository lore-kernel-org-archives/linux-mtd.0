Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97C3C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 11:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7a14OkKXjgUAY6jf1HKYqku8R7kslv5lykarAhVD5c=; b=mtDwvhAss4XEsC
	aJfm4SmHh479Q7h2KuTK0poN/CQiutxya6asJYwYjqbPhxIiGVgOI8AAPqTJWRQazTkhdktg5SNo6
	nTaGmxS4p9tFNBwQbfOUBZMiec7s7AWnbxK+G4tTQ01zcbF8F3S38uKOKXyJIOYRLj9ckigp/sG6y
	bFuMZSxwN9HQHmgFAW4SwFUkVY1ckt3diEnRSNuC1HyTcQ7t4RGGmLCDwOcOe1RhutgrMoxAwKJX1
	XcSCpj4+xZAuIDo5S0Rta23ZnbRN/8pqYcIcuPyM4AAST66RwUMu7+WDSG05aRKTo5YNoVzlrEJhi
	ooT3iyJKu3oVvRW59dIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGbn-007Vu5-3D; Mon, 21 Mar 2022 11:53:59 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGbk-007Vqq-27
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 11:53:57 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LBrpxs129379;
 Mon, 21 Mar 2022 06:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1647863631;
 bh=d88Otb0kIMljIcclrz/rDFMAepVS3BcWvi6rOXAC88g=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=LOKrhhypuM3dMGW8PzlITIn1Z/LVh9YAZa8pji9EVqAry7yENrQxtCjbY2QKGHRo8
 iLKNjjKohh9Bd58a/z/QfnTOeE8+eNrTrsblsAgAeEoI5xWi3agTqKseXjJgo0vzJv
 UEHeOYxYNtp5MDM2LDEi9Ji0h7xR9titnaSQc9Ag=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LBrp8k022885
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Mar 2022 06:53:51 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 06:53:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 06:53:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LBroj5024841;
 Mon, 21 Mar 2022 06:53:50 -0500
Date: Mon, 21 Mar 2022 17:23:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <michael@walle.cc>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>,
 <zhengxunli@mxic.com.tw>, <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v6 1/7] mtd: spi-nor: Rename method,
 s/spi_nor_match_id/spi_nor_match_name
Message-ID: <20220321115349.vffvanluf5b2wzhh@ti.com>
References: <20220209133656.374903-1-tudor.ambarus@microchip.com>
 <20220209133656.374903-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220209133656.374903-2-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_045356_252060_EFEFE546 
X-CRM114-Status: UNSURE (   6.60  )
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

On 09/02/22 03:36PM, Tudor Ambarus wrote:
> The method is matching a flash_info entry by searching by name. Rename
> the method for better clarity.
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
