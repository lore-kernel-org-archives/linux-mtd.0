Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA26C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqhiSrqeazswBF4mZagnT7oMxX3Sdvirwf6VnKVdbSk=; b=M1if6ybS/AdLig
	TB0ZCvhnlMw7NRiD8xlCWJwPJczYaPcgoRXI0Tfn9NPfPmi7rotX6OpNNXKr8mXV3QCWc1mNR9yjl
	VINyMHUusRThY+xKxl9fjbb7ZlD0OKW6QHjsihkPNqR+G+qiaUpI1Q68M+V7Fb1RnhdXqQrzQRmMM
	E5bvqOC0PpKbTj6C4kGbz0YACMTrxZYw8vPt7hcSoRuJ2ZxxAfo79VqljxmnC21bAvLYBiLY5WAMe
	grlMsqVoEJW7o8RzfmOFOKXQRgi0iqD0TGzZeY5szfs2zdndY/jWkdOasPItiiRkfnxbXPpqO4Heb
	nIbLMIS/F6EIc5guCC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbp4H-002Peb-MY; Tue, 05 Apr 2022 19:42:21 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbp4D-002PdL-V1; Tue, 05 Apr 2022 19:42:19 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 235Jfnr0038682;
 Tue, 5 Apr 2022 14:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649187709;
 bh=TvXISmEqDdYXBaHQb6lUN0/p5oi+ZGlmqEVvUhJzKQ8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ciDzolTNYNXyKmdBtu2ebtPgnOex2/jSsKSVu4LMPaRU4F7W2WBW69tI4cWh7IsXA
 gyXyEijFykg77PYCet6/RITpWWzNxggduTpNmgDPpdAm6u7SyYdpl9kntuI4SAK5D9
 WBrAXfTkx3pq1k+HIM+rAiP2UPZ6M92KGEEt36co=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 235Jfn6o027095
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 5 Apr 2022 14:41:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 14:41:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 14:41:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 235Jfl49045078;
 Tue, 5 Apr 2022 14:41:47 -0500
Date: Wed, 6 Apr 2022 01:11:46 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: core: Report correct name in case
 of ID collisions
Message-ID: <20220405194146.wymxqhksjmqepv6q@ti.com>
References: <20220228134505.203270-1-tudor.ambarus@microchip.com>
 <20220228134505.203270-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220228134505.203270-2-tudor.ambarus@microchip.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_124218_103193_53451560 
X-CRM114-Status: UNSURE (   8.14  )
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
Cc: sr@denx.de, vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at,
 esben@geanix.com, linux@rasmusvillemoes.dk, knaerzche@gmail.com,
 nicolas.ferre@microchip.com, michael@walle.cc, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, macromorgan@hotmail.com,
 miquel.raynal@bootlin.com, heiko.thiery@gmail.com, zhengxunli@mxic.com.tw,
 mail@david-bauer.net, code@reto-schneider.ch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 28/02/22 03:45PM, Tudor Ambarus wrote:
> Provide a way to report the correct flash name in case of ID collisions.
> There will be a single flash_info entry when flash IDs collide, and the
> differentiation between the flash types will be made at runtime
> if possible.
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
