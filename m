Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A700BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 13:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kI5PCwnbIkDgUhLXvdI56WZS8A0Qcui4gdiy5ahn64=; b=rOC/ggpDDyFKbL
	XTGO4ZdebYARu49lV3abHILYOa8FjDW0szfyizHRrunz85+g+ceUF/R9bgz20M46CGQL6Mp/YYXC0
	7pB2MtOUeOavr/EHrIJ86fXUrhoQLhkJxxaE4lgXcph80GrD8xVFZf02GvACQfJEmNo3ASAE1kXj5
	p6GCzUUTiYp8scS+qTyeNsEeICPydJV35ZIqfOgbybbtjZR+UvrqaJG7/YkBhKxrBNFZSi6GY1k09
	QpCOq4iTqrp/+Qjg6rzp7W3OfsPcc4zFChgDTc+ePsT4jpQwHRslvlyKsf0wYyX37TXHxAg8QLPxa
	Qb8+qaxh/FqC2e+UPjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzIGn-002Ql6-Gz; Mon, 20 Dec 2021 13:00:01 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzIGj-002QiL-8M
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 12:59:59 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BKCxpmI023603;
 Mon, 20 Dec 2021 06:59:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640005191;
 bh=hMVOqmAJZbsyb3QBuNTaaQMcPGqxuuGKv7gUTecph3w=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=iBewReKsviy9/YTyjKmwvwR+A5fp89CHBX9Bng4wyjEiyOB9XaHGX1E7mhJORtLZ4
 3pQoDoHBIbeXZNpVK/t+h7u4BWfVx2T2FE3Woee++OBip761lwFL5VmOfcJwDpSudU
 7nSXc6hrQS+0A3AZXFamyey+VMv4duo7Fu2SXuc8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BKCxpE1039047
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Dec 2021 06:59:51 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 06:59:50 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 06:59:50 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BKCxoIu123519;
 Mon, 20 Dec 2021 06:59:50 -0600
Date: Mon, 20 Dec 2021 18:29:49 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <zhuohao@chromium.org>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Remove debugfs entries that duplicate
 sysfs entries
Message-ID: <20211220125947.vkcslquovvm432qy@ti.com>
References: <20211217122636.474976-1-tudor.ambarus@microchip.com>
 <20211217122636.474976-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211217122636.474976-2-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_045957_460591_4CC6042A 
X-CRM114-Status: UNSURE (   8.45  )
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

On 17/12/21 02:26PM, Tudor Ambarus wrote:
> SPI NOR sysfs defines partname and jedec_id device attributes, which
> duplicate the information from debugfs. Since the sysfs directory
> structure and the attributes in each directory define an ABI between the
> kernel and user space, thus it can never be removed, remove the debugfs
> entries so that we don't duplicate the information.
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
