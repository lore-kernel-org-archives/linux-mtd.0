Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D9EC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Apr 2022 07:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsViRf6JVMxjgYbCniHppEnmixT1Nz+7bke2Rx8doUs=; b=PB2afgin/3i/86
	8DJp+Ni3LDE9V+yM1StiptRhqMCUOT5JDF6WJfCFK04CrAftHUAnUZHb6OPOh6DZrQDZz5GVdrx5J
	lEbZVqpEVxyj964mOzCTxupODXf7rfGUIMvqjc6owMpLUjVVvQKEc2edNHHV8F7LsIAnWH0DGnFr9
	kwAEyVcwZvi6jVZYoA5Rki/JeJ+xSpt46rIMAJ9iMmin0oLEP9jWC0lXUoIRPMVyEF6P8/AtqN2CU
	9DSOZYFoPzomYx5fHnoYeutVffrBhm5zceWh5cNM4sZ+KtdI6Qeai14WZerdrfn5IAtwYeNya8IL0
	7Z2XNJmx+uOvvpHhhorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh56A-007tU5-VN; Wed, 20 Apr 2022 07:50:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh568-007tR6-4T
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2022 07:50:01 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23K7nqJc038648;
 Wed, 20 Apr 2022 02:49:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1650440992;
 bh=VlUxj43GKYHn+kpFf/gQnONEe0h0G7JMf+3O4zsf3f8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=pp2xtf3XotwVURpaMJN3GCjA79CLzaiuYuO7I6AUdqin2+gV666YC/hpIoRoTAJEw
 n9cS1JdLpW86AJG8Mm3ra4FsqcqZOdY8SoFT46bOLO0cMqKOUiKRbirlooi2lbu7wf
 ytqYE3S7IO/dUvD+BLY12yvmPwP8zlmfy1Xs0OoQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23K7nqHj126378
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 Apr 2022 02:49:52 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Apr 2022 02:49:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Apr 2022 02:49:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23K7npCx113626;
 Wed, 20 Apr 2022 02:49:51 -0500
Date: Wed, 20 Apr 2022 13:19:50 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>, 
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH v3 9/9] mtd: spi-nor: Introduce templates for SPI NOR
 operations
Message-ID: <20220420074950.gy5okqwwp4c4efv2@ti.com>
References: <20220411091033.98754-1-tudor.ambarus@microchip.com>
 <20220411091033.98754-10-tudor.ambarus@microchip.com>
 <d912d9834a219162ef46efad7d332ef3@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d912d9834a219162ef46efad7d332ef3@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_005000_296989_4ED78477 
X-CRM114-Status: UNSURE (   9.26  )
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

On 19/04/22 01:45PM, Michael Walle wrote:
> Am 2022-04-11 11:10, schrieb Tudor Ambarus:
> > Clean the op declaration and hide the details of each op. With this it
> > results a cleanner, easier to read code. No functional change expected.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> I haven't gone through all of it.

Same.

> 
> Acked-by: Michael Walle <michael@walle.cc>

Acked-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
