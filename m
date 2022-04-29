Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 04:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mf4nI2XmKcakIMQQMk9CmgEBKSv26L8CxaLScSnDzqA=; b=001RaPG+H20d4k
	N8jTH8rNW8NM5tf79NafGIk2tkXO6Gp7I5CUD1348z/ssqSPfem+2SNAk7AA2N+rchoVKka+Jbgzv
	N7Dibp5rVdpteqFAlKXX55BWc7oudAUfMveR5R843IK03Bi59pAoXTqVHHX8XP5+70VqIf2NwSdhX
	d8heoebe3fdNXEmff4POacBMkaYTGVsUySmkd3gswQBaACGQ7cc/jhHjh7hw3cj+ZZWwws599mQ01
	dmazp2mAY4XyF2lV9xXQ6kJc2FK8MfVSnQoZYH3Uh5wkiPTyswvrjwhmQdu4fEqK7GZSpfrzQ5hQ+
	eVCp9APnyC3kxfKP0QCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkI5a-009W1O-5M; Fri, 29 Apr 2022 04:18:42 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkI5X-009Vye-NQ
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 04:18:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23T4ILPd116781;
 Thu, 28 Apr 2022 23:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1651205901;
 bh=IU5qN/m9vf7a5xu5+NjS2c5sZ6lm7tv5VMviUNrWiBU=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=xfbYQj8BUdgb5W576nT6+0j7U7V82nvFtEjKIC6wIWV4+2q3i41EqypVnxT5OENjQ
 3/184nL1x1N77Szw4pydxBwF5eqbxRCz2TnlrNq6ofiKDnQIEkqmYYFhV02mg40Eff
 C89Cr9BHJkPplrPbpklcMpOm06pTYXmqzsjWGrNk=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23T4ILU6096763
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Apr 2022 23:18:21 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 23:18:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 23:18:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23T4IKDk014910;
 Thu, 28 Apr 2022 23:18:20 -0500
Date: Fri, 29 Apr 2022 09:48:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: export spi_nor_hwcaps_pp2cmd()
Message-ID: <20220429041819.pwfixbh4v65yasbg@ti.com>
References: <20220428122840.1496876-1-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428122840.1496876-1-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_211839_964679_1E061670 
X-CRM114-Status: UNSURE (   6.89  )
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

On 28/04/22 02:28PM, Michael Walle wrote:
> The function will also be used by the debugfs module.
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
