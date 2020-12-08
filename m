Return-Path: <SRS0=eGw4=FM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927E4C4361B
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:13:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51A4A23AFB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Dec 2020 16:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51A4A23AFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eXpWbmugk7e4CWumja52jSM4q4X6t53vUsQ5plKerA=; b=Gz3O4NsZtaX0dt8Sy1U5x4oQ8E
	FSzjapr5TkcH74dTjky12JPNsurZ75iYVGmwB8DNUdDXLwvzYrNPJBCewPmyDb4Sl1qf4PXK7A0L3
	a4QISOlwhLraYYEOrb1zQ0sKHpuybw/uAjCndlD6YVUVfTyz6bM6ItcOhXp/P2PZv1mQsBaczAgf4
	Lsk3U+KpBV+mC6BcjNNEHBFWE0AD65oatkkLgikqZ4gV7eJnVCoNdIY+K1A0d7WOtw5q/+YLPmaU9
	5vAJi91nDohoO6vHARVHyi9uSa1iopABLXyD6g+dVlnKEWEVNEdDzNqOfG48aVUqobGPRgL02aUDs
	wWgHcwyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmfbB-0005Xs-1H; Tue, 08 Dec 2020 16:12:21 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmfb6-0005Vp-UW
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2020 16:12:18 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GCFfw016889;
 Tue, 8 Dec 2020 10:12:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607443935;
 bh=qyMODEZC6qKDZr+TvKNeUpnt+5/u/je0qlD1Yr8nPP8=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=Db9eI+072qeKgLOOnZj1QA/W0oJIvQwYfqFtPW6gATFxyXTLWkzCCZcGd/aOQk2xo
 fwDS9/7KHppCgDLQO5vkEGiE6Ddp6Tx/3ScG3ywqdekhYev4iRr5tLndYeDzeJD00y
 f/OraHqr/s5eI5gC1BoFlHNXZTnZ6O9iQqlpmMx0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8GCEu0041582
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 10:12:14 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 10:12:14 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 10:12:14 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8GCCHU118687;
 Tue, 8 Dec 2020 10:12:12 -0600
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: spansion: Set ECC block size
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20201201102711.8727-1-p.yadav@ti.com>
 <20201201102711.8727-4-p.yadav@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <469a1112-93b0-1991-5a38-2142394f461f@ti.com>
Date: Tue, 8 Dec 2020 21:42:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201102711.8727-4-p.yadav@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_111217_139326_319B777C 
X-CRM114-Status: GOOD (  19.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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



On 12/1/20 3:57 PM, Pratyush Yadav wrote:
> The S28 flash family uses 2-bit ECC by default with each ECC block being
> 16 bytes. Under this scheme multi-pass programming to an ECC block is
> not allowed. Set the writesize to make sure multi-pass programming is
> not attempted on the flash.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next, thanks!
[3/3] mtd: spi-nor: spansion: Set ECC block size
      https://git.kernel.org/mtd/c/294cca6ce5


> 
> Notes:
>     No changes in v3
>     
>     New in v2.
> 
>  drivers/mtd/spi-nor/spansion.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index e487fd341a56..b0c5521c1e27 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -109,6 +109,7 @@ static int spi_nor_cypress_octal_dtr_enable(struct spi_nor *nor, bool enable)
>  static void s28hs512t_default_init(struct spi_nor *nor)
>  {
>  	nor->params->octal_dtr_enable = spi_nor_cypress_octal_dtr_enable;
> +	nor->params->writesize = 16;
>  }
>  
>  static void s28hs512t_post_sfdp_fixup(struct spi_nor *nor)
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
