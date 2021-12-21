Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24682C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 18:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmrdcKZ7cGLAW8toASg9qwI8wRaWFPfl1R0QBlBIRi8=; b=ZWvgFaBb+jZQ2+
	DsWAvvmchaoUeqlQ93PdMrnbM13JRE9sPVYOYIwDe+v/75qjsD/x1DuE5pn11yNrO9dzfAOqkWhGi
	drCjwIC+sm4IqO2t7viAtcpdGs7vOzHHnfytbDWAtkDFMbzKn2Ie6YWkV7b68PeQ2PEEFd/m/FvDt
	nQlDswDOG51mDCY4qj9oC9pbCXY24EcDyV6XFxzKWw1sZNBn1GT/hve2b7sMUk0T3S57O8y3s551/
	qdvX3V9l+RKqQ0aDkfu8/aj0MdIDBnzl3Ln/u+mDbj7IKbqeCJLyzcoki61JiYU9WE4TQv/7Uivjw
	3o4E7SP6Jdka+2JikkWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzk6S-0089AD-Ib; Tue, 21 Dec 2021 18:43:12 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzk6O-008975-3A
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 18:43:09 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BLIgsw3000922;
 Tue, 21 Dec 2021 12:42:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640112174;
 bh=el/cV8Rc2gOaI8aO+L9PYhA3ODJOeaLAkmKdeuV6Il8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RfEPoocBhYWvI9TdHQvthGn3V133CCVa+BSPdautEokl02rmwJwDJSwbMKSxVP/RI
 eGNGuKNscUQyo3MI+S2h9T/jzGobsvzNnUWWUgK8js9Te777u8O6DTJCinbpbrjYDg
 +LdariCckALcn+/0zBYpLE0eyK6+Ki0h/2nzBYb0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BLIgsbo040073
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 21 Dec 2021 12:42:54 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Dec 2021 12:42:54 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Dec 2021 12:42:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BLIgruo089813;
 Tue, 21 Dec 2021 12:42:53 -0600
Date: Wed, 22 Dec 2021 00:12:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, <linux-spi@vger.kernel.org>, Julien Su
 <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>, Boris Brezillon
 <boris.brezillon@collabora.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v8 04/14] spi: cadence-quadspi: Provide a capability
 structure
Message-ID: <20211221184250.wvgxfyxkmz5xmwvm@ti.com>
References: <20211221174844.56385-1-miquel.raynal@bootlin.com>
 <20211221174844.56385-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211221174844.56385-5-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_104308_215172_1A8148F5 
X-CRM114-Status: UNSURE (   9.19  )
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

On 21/12/21 06:48PM, Miquel Raynal wrote:
> This controller has DTR support, so advertize it with a capability now
> that the spi_controller_mem_ops structure contains this new field. This
> will later be used by the core to discriminate whether an operation is
> supported or not, in a more generic way than having different helpers.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
