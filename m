Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F188FC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Jul 2022 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nyjd6NQpMkF5/+lBcX3+Y6DTtUEDfuksOu7izXkw0Ew=; b=yJVD7sj+ceULY5
	6mZNiuEp4MSy5Nc3AhjqjlzVgqObYtSvoU9xoSGt26LDqyXWHCbvZCipBZMBNmmAXtAzAG7LFpn63
	Oz+0rmwq2GgQpVrsW2KUo1WKcAlesoNWhOSP8lZpGvbd+yq9rZv2JFLTC0Y0tEfs5c0OWDJ2xc7Pw
	0z5GOGotCxk4z3YjTbiKWfpF5gAmCEj2vk2meKISflKqaam/F+eBlnOVhUNfKKMN9YYVlxEyAq8Y8
	2yJ9PUvxI/HElI8ryPilQeexDqKTJmlTN+wa3hNyGvL54SdeCwMgy2vj61AlUq/knUpVD6R1dBB+w
	XMr57Vw3MtcyBTlMlG5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBAEm-008IjD-Un; Tue, 12 Jul 2022 07:23:16 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBAEk-008Igw-NR
	for linux-mtd@lists.infradead.org; Tue, 12 Jul 2022 07:23:16 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26C7N6OL085875;
	Tue, 12 Jul 2022 02:23:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657610586;
	bh=iQV1bIfl8FQruMBMeoBcsL27lyqT/vZYQCTpuCzw4Zo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=j0KNRpArAEa6aSXJQR8nKgogyKnQl0u53MZMrSEAJk/AZDZ6+2mfYc5yYLMpeYDsa
	 DN1gdmM3XirRW2U5ee/g2EX8YX78HmOXKHHzi0tWVGcc1tDSKoADwnEM+/exRX2cd6
	 vhzUMqv9WZ9z8BedxzYo0Ih6dNe++AkkYjctGyDk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26C7N6is022176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Jul 2022 02:23:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Jul 2022 02:23:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Jul 2022 02:23:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26C7N58A042639;
	Tue, 12 Jul 2022 02:23:05 -0500
Date: Tue, 12 Jul 2022 12:53:04 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>,
        Miquel Raynal
	<miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Shaik Sajida Bhanu
	<quic_c_sbhanu@quicinc.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
Message-ID: <20220712072304.icesvrfmem5lgr6i@ti.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220510140232.3519184-2-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_002314_881660_A7F7773F 
X-CRM114-Status: UNSURE (   9.92  )
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

On 10/05/22 04:02PM, Michael Walle wrote:
> Up until now, flashes were defined by specifying the JEDEC ID, the
> sector size and the number of sectors. This can be read by parsing the
> SFDP, we don't have to specify it. Thus provide a new macro SNOR_ID3()
> which just takes the JEDEC ID and implicitly set .parse_sfdp = true. All
> new flashes which have SFDP should use this macro.
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
