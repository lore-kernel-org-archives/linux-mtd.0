Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E07C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18C33ckd8fXPGrhLCjRpZW/mtpULle1Hg4p6dWl/5S0=; b=O4R20ZktoWUqSq
	xQ+ctlZpiwdu3nWqNZy5pMWl2TDVQPl1FmgRgjCBcpxOy0HRKlEbqyfHUAkTC8JD2blEg+SoPVaw4
	GlBBE1IN+JIX2uoQY+ysfMueAE7gvoaa+cOIvDUAfruG+CloPH4CBLTu99fmXqv0to2VIWrwFfCdu
	mi8Ianr3NeNWPL/XrI1cPkUfb4oiFEwHmrtjqKE9a5hXo1iLfa+fWCpCD7OkBe9we+ahyxMfkQa93
	n91PqpWDCGUFpYECT2IcYD7gVlXF9IKxzjdBy/WrOqeFFcDI7txfNulT78vIlSW4Qf0drlJjzsXRS
	KSjhGwlLVAK9TSmXe4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMr4V-00EFWU-1A; Wed, 23 Feb 2022 12:48:43 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMqJj-00E2Jd-Ah
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 12:00:26 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NC0KuI056218;
 Wed, 23 Feb 2022 06:00:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645617620;
 bh=rb+JKqwrhcprw7ZNPfiTuYpfu5/yjDpPHHSpi/Rs7hc=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=no414x/Q05q1rHwNKGseCW5biMLmHgE/yG6UTxKbj6dgfXkaa4Z8RhcR9V1wB+uAe
 rwIg33IzMjJTDBkXFiafW0MWDSt/sicI2rZiVzhcv0o9JfyK9wF2g2UuX0yVDH+l3d
 8dfYK3LQR+NsaXFwsWtCFpEw7oVvXzl54P2diINo=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NC0KGJ048375
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 06:00:20 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 06:00:20 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 06:00:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NC0Jdj082269;
 Wed, 23 Feb 2022 06:00:20 -0600
Date: Wed, 23 Feb 2022 17:30:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 31/32] mtd: spi-nor: slightly change code style in
 spi_nor_sr_ready()
Message-ID: <20220223120019.a645et7i43kx2lde@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-32-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120809.1531502-32-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_040023_492245_FD78888E 
X-CRM114-Status: UNSURE (   8.97  )
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

On 21/02/22 01:08PM, Michael Walle wrote:
> Now that there is almost no special case code left in
> spi_nor_sr_ready(), the return check looks odd. Move the function call
> closer to the return code checking.
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
