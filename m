Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0F1C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Dec 2021 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OCZ15OMJDWfo1KEG7QqHJS1xG1R5oQ6XhCd/t9JEYwI=; b=a3FnMvWmdkrHxa
	9BQpoG8YtnMM/ilnVLIdFNq/BqxQmXfzHua2v0lrunsQ5pYTDvRlE/4D3o8H7W8LTuOX0tULLwG/Z
	3WkigC+kc3/iOzJwWzv66zf0dykHWqXIpGsY7Zsuo1hW6XHDONbOQin0nvq1HA2yCBxnPCt63v5Y2
	9r72cAthzlqKGy6GM1fswA5Qq9n84VBIWuk4wHyn0Nml82UzWZOdqfvuj0BNkVgV9kfv7JVDuKiXM
	HKcGDiFCss3vUBBmKVYQDLogbyecLcIHZrCz8dAwx1djkpM6FEYC1N22CXLCu/BPDiQLB32DPm9Ma
	M8e+AD/g6E0uCIBi4IbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msiRH-00BZMl-AR; Thu, 02 Dec 2021 09:31:39 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msiRE-00BZLs-M6; Thu, 02 Dec 2021 09:31:37 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B29VDj2088347;
 Thu, 2 Dec 2021 03:31:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1638437473;
 bh=p7qU82bJhHfoiCfbMhGfOdgIM+b0ZRmhOvUSu/smNig=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=KqeSVgSYJpnmAi7eJdRO5d4lFmHrR9CeW1Jviw7ZjH+ASsusB3UefmF1USFZZCLkx
 6IJf2L5IOFSr/U5+v3vWkNLWKpKLVTG8mStFT6XibWhQ4SCv+9PNx+e3X1iOgDLISE
 jFwkvTsIC+ag5PMmZ/t7i43xG+CFnPDAJ8EpS0Q0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B29VDOc092296
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 Dec 2021 03:31:13 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 2
 Dec 2021 03:31:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 2 Dec 2021 03:31:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B29VCd4043195;
 Thu, 2 Dec 2021 03:31:12 -0600
Date: Thu, 2 Dec 2021 15:01:11 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 03/13] mtd: spi-nor: core: Call
 spi_nor_post_sfdp_fixups() only when SFDP is defined
Message-ID: <20211202093109.57fxeg7c272k53n2@ti.com>
References: <20211122095020.393346-1-tudor.ambarus@microchip.com>
 <20211122095020.393346-4-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211122095020.393346-4-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_013136_791459_68890106 
X-CRM114-Status: UNSURE (   9.24  )
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

On 22/11/21 11:50AM, Tudor Ambarus wrote:
> spi_nor_post_sfdp_fixups() was called even when there were no SFDP
> tables defined. late_init() should be instead used for flashes that
> do not define SFDP tables.
> 
> Use spi_nor_post_sfdp_fixups() just to fix SFDP data. post_sfdp()
> hook is as of now used just by s28hs512t, mt35xu512aba, and both
> support SFDP, there's no functional change with this patch.
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
