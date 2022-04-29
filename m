Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD97C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 10:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DgEm5Q08DgOvjhGigr+kEGIjxOzQ7Qvc0PF5EjnFXcQ=; b=THH7OGufpUbRHM
	p3IDwH3u05bxFyoF689GASqjXA3StHnvQrxRtgzuEdXkYuEj4hL8EnRfeCcyUhyrkxvCaHA2vQJZ6
	KUo3iKPGeGY2kmi5N14Y5dxXWNZPe2ZO0143xrOykQ5dQ9iWxSoZ5p4TLcwNDEB2eprNLG4aHcWFG
	lj9k+gz/wzZ6ITM4kQnFnitzVOtaV7ip47Uwyzg166YiwCjGL46Ed65alu6BIHVFtB49fCRSmyFPl
	TGF+XKY+QbTq7bSQ8lH1S4S9UbUqb3Q8IUAQswmD5JeMsLSxW1mzmc3YiIxfXve5CXjDuIemo2cQL
	Znu3XWBbdTCh5hcEmV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkNoL-00Am6t-Eb; Fri, 29 Apr 2022 10:25:17 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkNet-00AgUN-MN
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 10:15:33 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23TAFQLn036375;
 Fri, 29 Apr 2022 05:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651227326;
 bh=0CLxmnDtB6/A+kmf8Kcha/AUP+LquXNbEjVqjWdMvYY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=uFF7B/3//hmiFG9scr6E9P9vIJ+EJ3ECUEU4/n0LGaFynjD+RyMPKOZvsjoAFEEDO
 KTB3+Q8BHO/7OdHtCDydwDOIbDv4FnnqFbMfb2ewkqIdf4zn1vwqHLclFnx/8xfOn0
 yeZNtg45HvMYI965w4kSChGwQd7pYc9JIMtOXQJY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23TAFQAF092312
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 29 Apr 2022 05:15:26 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 29
 Apr 2022 05:15:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 29 Apr 2022 05:15:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23TAFPo5056582;
 Fri, 29 Apr 2022 05:15:26 -0500
Date: Fri, 29 Apr 2022 15:45:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: move spi_nor_write_ear() to winbond
 module
Message-ID: <20220429101525.w2wcnhkxyb46pe2j@ti.com>
References: <20220429100153.2338501-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429100153.2338501-1-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_031531_951217_6A39B5AA 
X-CRM114-Status: UNSURE (   9.26  )
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

On 29/04/22 12:01PM, Michael Walle wrote:
> The "Extended Address Register" is winbond specific. If the flash is
> larger than 16MiB and is used in 3 byte address mode, it is used to set
> the remaining address bits. Move the write_ear() function, the opcode
> macros and the spimem op template into the winbond module and rename
> them accordingly.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
