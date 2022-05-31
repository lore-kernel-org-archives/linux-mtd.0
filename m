Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E33CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 31 May 2022 11:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yGhhxSTGfbFqSu03/QWi2nQugmJKqgvQOKEo5fpXoPc=; b=iLfllpYSKx7YrB
	/eVUAnvf/vem5bGnT8sO+UAbhD9FWj8glSPWScV9npcN77TUVaoZdHMhZ0ww7gJu2bzJ0o10j64mI
	EkGLM32FHI1beflaDT3ghfHkgDYrZlRFsbkdPSm5sJJNWFGZQ7USBJ2HysFAS+jQR7cLz6x+Fox17
	Beq7jRD8GMkBzbQy5j2EyqNleY5JsFspSoXqIR2n2SEt1M9y0fywsrvg69ljJWkLV2W75XbGmxX2z
	I8SID/snorNMPAjsl7w4hFmSF04qmmS0xdd0Opfu7kzyxqBroMKypW3mvRsOXFx/1l5IbBGpcwf4l
	sAM//Jj/lTWaavdnx3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvzpW-00ALl5-L2; Tue, 31 May 2022 11:14:30 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvzpS-00ALka-Q5
	for linux-mtd@lists.infradead.org; Tue, 31 May 2022 11:14:28 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24VBEJpk082393;
	Tue, 31 May 2022 06:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653995659;
	bh=RgBQhdLiU0Y5yI7Za0/YlcnmxtW7Ssm5Azq6Pld9HLA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=D4Hz8zAoTO2Et+sO4xNoYJY2WYoAvT9v268YBwB59tVrRnoSaTmTWcjuL7iMrzODM
	 nXty7QJJzC2pbUoGyu32ARtbyFmr3fbFDxtmQj9yhYhB6NzUrI+4vYxjxar7+ff8cj
	 jmvrUk9kgOKbApb8Y394G6LwjS+cL9q70/TMCRxw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24VBEJkd037127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 31 May 2022 06:14:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 31
 May 2022 06:14:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 31 May 2022 06:14:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24VBEIFE005093;
	Tue, 31 May 2022 06:14:19 -0500
Date: Tue, 31 May 2022 16:44:17 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <michael@walle.cc>, <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v15 2/8] mtd: spi-nor: core: Shrink the storage size of
 the flash_info's addr_nbytes
Message-ID: <20220531111417.fu6grojkcjvdgt2g@ti.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <fe4cfd3586b9a050c6acde7675a43b8a2d47ea8e.1652063152.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe4cfd3586b9a050c6acde7675a43b8a2d47ea8e.1652063152.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_041426_962742_FB05AAC7 
X-CRM114-Status: UNSURE (   7.72  )
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

On 10/05/22 07:10AM, tkuw584924@gmail.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> The maximum number of address bytes in SPI NOR is 4. Shrink the storage
> size of the flash_info's addr_nbytes.
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
