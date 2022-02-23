Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECBDC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Feb 2022 12:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZgNRHZZW3qVzNvKyFODSa/nNUk/DOIuCqO6Exe6Yq4=; b=M+kNhTsAMDpAiu
	k5IBvkm7mlqLrbboQY6dZwVX26iGe4XISQSO38iJs8ZPwwzYvM3evsL4JBAdl1u59zaPbKjkwfkwf
	kV105gZcd8Q9tUOdWT0PnBrayhqmNscZN2S11cDz2y8LDmHV0ZTBKJJU3ylerDmDA9z/N6BoDMYeZ
	lXwy4mayLtkxkbk8rkFLFd5gmfWAQ/gfh3+t2Yuy9+8/epbGByN2G8mdrrl2FD6sEfIZwcCcJvDyI
	ON8xGak9FG1DOpU+t82y3WE0kSDWrnkYrSuR4v9gzDEk139Vxy7R37kYd9TcGqciGy254lERK23ip
	Rs4jx7i2Qe+dvalVhBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMr5f-00EFwX-UR; Wed, 23 Feb 2022 12:49:56 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMqKi-00E2Zb-6N
 for linux-mtd@lists.infradead.org; Wed, 23 Feb 2022 12:01:25 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21NC1LFS126978;
 Wed, 23 Feb 2022 06:01:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645617681;
 bh=beAAUiBHJjZi9JLosnAl3oN0PWrU4l00+9nL85TUYDI=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=ODqVzJ1GYvoiS1gKJ5y0cy4QwuoA0Eu+hdeLwzmUzwAICnWRRn/M6CQniqTwCaVfe
 U/YthzoYPa7kTqVO5TYnMFg7CH1s3d80dxS2+OWLDxEeNgEYnoSnWA0skbBgs8x8S4
 kBQ0IFilF+siOy/yp6KF8d8lvCbpQURg7YEzaVBs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21NC1L4Q102265
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Feb 2022 06:01:21 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Feb 2022 06:01:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Feb 2022 06:01:20 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21NC1KUL119770;
 Wed, 23 Feb 2022 06:01:20 -0600
Date: Wed, 23 Feb 2022 17:31:19 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v4 30/32] mtd: spi-nor: spansion: rename vendor specific
 functions and defines
Message-ID: <20220223120119.c4uualanahpg4ekj@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-31-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120809.1531502-31-michael@walle.cc>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_040124_368250_6F100BC0 
X-CRM114-Status: UNSURE (   6.54  )
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
> Drop the generic spi_nor prefix for all the spansion functions.
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
