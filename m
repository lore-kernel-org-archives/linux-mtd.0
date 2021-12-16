Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A776C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Dec 2021 18:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAtXoMxGcRDSzKd51ngqv615Q53NlOKU0RjswGhFdGE=; b=B1+GtONEgJETb9
	k/LLmTsCiBWshEZcjpi0Q2P56X7+31z0ZOcGXWyBgmzw7KQRlOoc7b76EuK4+mZJ0MZetbEXzUh0U
	wvO3FIVmRyA/l2qAdql8S1xPTUZQbBH81mnaKs22OeGFsUp7jVtOV2OMlqtu2n9kzWYixsmeyR5Mv
	SEFfTPuk3yYUbtx58HV/IDFCHjtmfj5aREx7wHQ88IOIiRmdjciK/ulSRmpJ7Tgu9tHGiAwYWRXmF
	eZ6Xx2O0ppnp5/Z0XwHxxmxDAh69WcPNfcPfKhMk2dAK9XKSVGXka6ZcnxMVZVqTnIj7HJmLUutw7
	8E4dqOE2mro0dJo1pM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxvtF-007DUL-T5; Thu, 16 Dec 2021 18:54:06 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxvsH-007Cx1-H5
 for linux-mtd@lists.infradead.org; Thu, 16 Dec 2021 18:53:08 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BGIqwr1038969;
 Thu, 16 Dec 2021 12:52:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1639680778;
 bh=Kt++jYH6T4k4HcW+Vzc/u+Ene+izPR3bx5dnQKR0r5Y=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=meBizeFsaCrRe83Rfm+VjfYFCgklCnXlb9wfP9lmJQfAIx6ABBq663/69oI3AesxO
 e61R5TWihCimtgxl1s5lUO0d90AfTGyDNdBsREdUrz8kFt+H1dMSWR0mBnnq4UdgKj
 X1CU2Bb12ZPxdErdXR1Sf8tbr1tgaLi0Dnw9qQDE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BGIqwe5096585
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 16 Dec 2021 12:52:58 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 16
 Dec 2021 12:52:57 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 16 Dec 2021 12:52:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BGIquSl115696;
 Thu, 16 Dec 2021 12:52:57 -0600
Date: Fri, 17 Dec 2021 00:22:56 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Michael Walle
 <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: micron-st: make mt25ql02g/mt25qu02g
 match more specific, add 4B opcodes
Message-ID: <20211216185254.pt3quvb4wkzou6wh@ti.com>
References: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a69181ccf225424a8bd11349aad0df7face9715e.1633607826.git.matthias.schiffer@ew.tq-group.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_105305_714657_41A7116D 
X-CRM114-Status: GOOD (  16.59  )
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

Hi Matthias,

On 07/10/21 02:08PM, Matthias Schiffer wrote:
> Change the mt25ql02g/mt25qu02g entries to include SPI_NOR_4B_OPCODES. In
> addition, the SPI_NOR_DUAL_READ flag is added to mt25ql02g; this seems
> to have been an accidental omission, as mt25ql02g and mt25qu02g should
> support the same features.

The way flags are specified are changed a bit. See [0]. Please re-roll 
your patch to use the new flag types. If this flash supports SFDP you 
should ideally just need to set the sfdp flag to true and the core 
should take care of the rest. Test reports with the new changes would be 
much appreciated :-)

> 
> In addition, the entries are made more specific by matching on the mt25q
> extended ID, like it is already done for the smaller n25q derivatives.
> It is unclear whether n25q derivatives with 2Gbit exist that do not
> support 4B opcodes (like it is the case for sizes up to 512MBit), so we
> do not have a match for such variants anymore (as we wouldn't even know
> how to name such hypothetical models).

Sounds good to me.

> 
> The changes were tested with a mt25qu01g, which should support the same
> features as the mt25ql02g/mt25qu02g.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 

[0] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=275622&state=%2A&archive=both

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
