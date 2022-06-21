Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC83C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jun 2022 05:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FRTzRDs3yGWlqE58xkmz9GHQ1PPlaLDKVlnl8ZhpUQs=; b=u+NX8GE0Wf8hzD
	zEplx5ZVYoiBSnpUpRmJkTa8eKJAsjlbLdlYtMcF+/skT+S6dX6NLOzp/0vBxdaGqVCtF9DpgPgtn
	kpr4iLxL3rB3TztxUlWrlxdRkeYAT2g+ZYb7U+GUuwUml0S9l+3VR8Q82dhkO4Caws8hqkSLVHWoi
	Qj0yMTEdUacWbO8iTtYW3Kjq/JfnQSmtlciC/QwyZYI2FkHaOPpYjFwDcTg0EBdnWMMg3DklI1l0i
	TUvZLuDwX5GbZrMiPtMYuSneoJ5SCrtYwhkWKbOs/VBc48qxE+Ngz2G6pqfGCz152+XuajKqWBqID
	vnOvUTWCjJok6PMzyP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3WoC-003mEU-Jo; Tue, 21 Jun 2022 05:52:16 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Wo5-003m60-5M
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2022 05:52:12 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25L5ps9h110838;
	Tue, 21 Jun 2022 00:51:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1655790714;
	bh=simPKwHrU187gpKzdWj0N4xBhjRsLxWL47Bc/jEmx5k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=yIgg+8Vu7AST6/jF1cqnnxpsadQSfbWRLTcMLhYDocPdMLA7vxOaZoJHUukNuQZUJ
	 GEvXSe+y5SUXC7LKXW4X9Pzg1zCEkbMiXK3pxGNUio75NC1INg5bKHPBtDLY44++iN
	 u7lDUWOmiB0m7wF2V3PgGkHwyAWEjGoJ+HLTi85I=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25L5psn1009143
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jun 2022 00:51:54 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 21
 Jun 2022 00:51:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 21 Jun 2022 00:51:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25L5pr3u017894;
	Tue, 21 Jun 2022 00:51:54 -0500
Date: Tue, 21 Jun 2022 11:21:53 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <michael@walle.cc>, <Bacem.Daassi@infineon.com>,
        Takahiro Kuwano
	<Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v16 1/8] mtd: spi-nor: s/addr_width/addr_nbytes
Message-ID: <20220621055153.7dw3veo7z2hankna@ti.com>
References: <cover.1654741888.git.Takahiro.Kuwano@infineon.com>
 <51c3b5f0a73bd6d812122f45c3b19b310332ead1.1654741888.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51c3b5f0a73bd6d812122f45c3b19b310332ead1.1654741888.git.Takahiro.Kuwano@infineon.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_225209_341769_35581856 
X-CRM114-Status: UNSURE (   9.04  )
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

Hi Takahiro,

On 09/06/22 05:57PM, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Didn't Tudor write this patch? Please attribute authorship to him.

> 
> Address width was an unfortunate name, as it means the number of IO lines
> used for the address, whereas in the code it is used as the number of
> address bytes. s/addr_width/addr_nbytes throughout the entire SPI NOR
> framework.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Reviewed-by: Michael Walle <michael@walle.cc>
> Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
