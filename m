Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327FEC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 06:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYxdx/kv2a+QLHXE865EMkC6h/wl2i75dwAaGnYo7h0=; b=uNt/HuWi1gzjuO
	yddbIY5XGx2jeXQIBJBsthZHCOL8OGTymf0Zd7Wakn3wXoyxAIto7zFKeFCkitzRKdNRIYJSFXcQ8
	jae0aOTmjeQwInFDRWbsTI2IErbXCMmlOYBYrpuhalMUJc1nepaWIWcfAIT3XIw6eF7X+rGdPgkyh
	cn9BygjV79/a9h7gymkPpQOhv6rjR/0w2+80yDugDC4D7lBqmUogdSogg/s5cEkWfFFp7NeqxpId3
	LEQdDEfLMFbTZXwEjqx+LtfMGGL8reHlV9gyuUfcYXk4NAkUZhZRGD7Ma4nkQ+jx9VJgdB93LXWmT
	4a7M6GZgVrWDTxvhhBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh3oD-007Yll-Ks; Wed, 20 Apr 2022 06:27:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh3oA-007Yjj-JZ
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 06:27:23 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23K6RH2I087766;
 Wed, 20 Apr 2022 01:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650436037;
 bh=kcICsLaU+27agvzkGVtj5FT1OOdR/R0i+L5NDYQzseQ=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=JRHJ2H64Cz2nMTXtzuo1+EophJa+7WY3QNeL21RFjCECmoQ7PnQAjxTaAa3Y7nn6v
 7H94EDNPZr9vvaQcbYOssiGUjWeRilKzHs3W1rCR+nEe6VXGiqwOG585E+enGxjKR6
 dEY2ZeqHPHVK8tuxXLLtUcRWKHp/bKQKj91ca44w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23K6RHrQ044932
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Apr 2022 01:27:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Apr 2022 01:27:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Apr 2022 01:27:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23K6RGaK073295;
 Wed, 20 Apr 2022 01:27:16 -0500
Date: Wed, 20 Apr 2022 11:57:16 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: move SECT_4K_PMC special handling
Message-ID: <20220420062716.zhs3y4koirjpshqw@ti.com>
References: <20220418112650.2791459-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418112650.2791459-1-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_232722_747303_94C87E5B 
X-CRM114-Status: GOOD (  12.53  )
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

On 18/04/22 01:26PM, Michael Walle wrote:
> The SECT_4K_PMC flag will set a device specific opcode for the 4k sector
> erase. Instead of handling it in the core, we can move it to a
> late_init(). In that late init, loop over all erase types, look for the
> 4k size and replace the opcode.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Please have a closer look here. This is only compile time tested. Also
> I didn't see much reason to reorder the flags.

Patch looks okay to me but I would like someone to test it on the flash 
before I apply it.

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
