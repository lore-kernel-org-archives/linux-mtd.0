Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B88C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y/nUcaZqJDdyAd7MLt0AwPkyNzdua0RBwjKiIJbtaXw=; b=I+YgqWxF5eco1o
	NVlmXLHJELle2BJVTafSpIyME2OBWEr5v7UGNjcivKtHjAb3+5fltNsSo1mymi8yqizWMWnSC9OtL
	Yzm7ZvCvGoOvqgV8E+vznQ+ADJ9rGL1qkQ7FXU0BsOAwJK8NlcJx+SIAAWvll0Rf3WwpXVoXpC6bK
	T8VY8QIpiMLK0BvdJkDY3Sc9Vtg2sE0vGMuV9VqZ9TvGA38DMyq1AfZeVKGmBP/TNt/nkPTNffozZ
	LUiH14BtTT7pVMV20ihXbceVbYOVIrrLuv/bwyWtzKd7YhLoa1u5me8FfbUPvMWvBa9uSNMWjSBEw
	E9ZCI0OJVZvoOaCIXj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlSdn-000fYd-7S; Mon, 02 May 2022 09:46:51 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlSdk-000fXb-GM
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 09:46:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2429khig030092;
 Mon, 2 May 2022 04:46:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651484803;
 bh=/f3+ZN1BRGOPjS26Jk9C7pfpeHeos4hddQADZyloaso=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=hpBeSDROS88ZzV1RwsUTd7IItg2jtfZ2v+SJLCd58Q2vsh1C5YCSDaRbcrahEj2Ot
 CtJ3+FKrrfvt7h2eZrNsyu+ormjOBXRGT+e5ONlQHSMJmNv/lrf//sL2xcbwHFHw7G
 uMh5uIx7B7RGfuF96cxXXJMNgLbR39N56LfFJqDE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2429khF9042579
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 May 2022 04:46:43 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 2
 May 2022 04:46:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 2 May 2022 04:46:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2429kgkh040255;
 Mon, 2 May 2022 04:46:43 -0500
Date: Mon, 2 May 2022 15:16:42 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: expose internal parameters via
 debugfs
Message-ID: <20220502094642.trl7fggx6se5cqhg@ti.com>
References: <20220429102018.2361038-1-michael@walle.cc>
 <20220429102018.2361038-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220429102018.2361038-2-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_024648_711433_C9453760 
X-CRM114-Status: GOOD (  10.56  )
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

On 29/04/22 12:20PM, Michael Walle wrote:
> There is no way to gather all information to verify support for a new
> flash chip. Also if you want to convert an existing flash chip to the
> new SFDP parsing, there is not enough information to determine if the
> flash will work like before. To ease this development, expose internal
> parameters via the debugfs.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Did some basic testing, seems fine to me. I'll wait a couple more days 
if someone has any comments or else I'll apply it.

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
