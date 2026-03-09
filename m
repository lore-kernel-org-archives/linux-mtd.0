Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45462F41808
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 15:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pa2QFwWov53uW2asOHobTjzEpHTLTIKAa/hKPeC2RiY=; b=T6Qiy9dIRx5xjc
	N3+qdNMHawKfzYEtKb0bUaeX96dP7IZC3G49JZMEZ/P4J8detml//jwrFcCZQqL1Su6xTDyCzAzrn
	c8jpQ+udGqkrhcXusOHgnzQ/FTQPmvthpFcFDa98FQOgSdee92ZXYQ1miDC2pItk2qBzaD6osfi1M
	7pUXQeKIRkCsGccl1bUCOOsedBntlnyt3dvIwuRBUztA4K2SrPIzz0XL78/iqwIUVhnVa/gPsEhBY
	lSXptX/RjEjB1dY0d4TBTzXSY+7mLv1bZTaV4ye9EulEvk2/dQ26e7ipOjYN/ZtX3LXdgq18x6BD2
	AK/3u+U9dVzx+pa7gZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcHx-00000007ZQ1-2rz2;
	Mon, 09 Mar 2026 15:12:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcHv-00000007ZPU-1KVG
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 15:12:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DA3ED1A2D61;
	Mon,  9 Mar 2026 15:12:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE09C5FFB8;
	Mon,  9 Mar 2026 15:12:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8DEF410369BCD;
	Mon,  9 Mar 2026 16:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773069172; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=MFUuT1i3CoEQ+RFV5Q+XaILI6r1cUNtCHVqM62g6SC8=;
	b=nrVi0LdFidCzYgrltpoM3L2NmISNFRjbPlEomhZbtYBiyxV7pM/0WkX+JsW9xkTvZ9L1sy
	Wd/KHy+weEU5aBlsPWQFzrr5F4aPuaBr477/+O62rpk/yi9dcEEEiQV6onYfS6tIl8g8MM
	i5hWg/N2GcbPWs1ofcC513Uiq17CfEWoZP/Ud0JtzButvtNZgeQJik9fkdvlJk7foWfLdb
	s2TErxRmsUUJD3WWErKtPtYCrSp2lsLH781yIiJFDK38G7syf0StNFjWUPbYUZMug5UXuq
	8cRa+Pssv+p2oPOKNhtlWGlO816xjKvC3fixAxaLpoMwi0QyfaK0haBbFa1anA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,
  Eberhard Stoll <eberhard.stoll@kontron.de>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev
Subject: Re: [PATCH RFC 4/7] mtd: spinand: toshiba: Add RX sampling delay
 values
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
	(Frieder Schrempf's message of "Tue, 03 Mar 2026 17:29:25 +0100")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-4-9326bbc492d6@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:12:48 +0100
Message-ID: <87ldg1nij3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_081255_486878_84455688 
X-CRM114-Status: UNSURE (   6.32  )
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


> @@ -277,7 +291,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
>  					      &update_cache_variants),
>  		     0,
>  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> -				     tx58cxgxsxraix_ecc_get_status)),
> +				     tx58cxgxsxraix_ecc_get_status),
>  	/* 1.8V 4Gb (1st generation) */
>  	SPINAND_INFO("TH58NYG2S3HBAI4",
>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xAC),
> @@ -288,7 +302,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
>  					      &update_cache_x4_variants),
>  		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> -				     tx58cxgxsxraix_ecc_get_status)),
> +				     tx58cxgxsxraix_ecc_get_status),
>  	/* 1.8V 8Gb (1st generation) */
>  	SPINAND_INFO("TH58NYG3S0HBAI6",
>  		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xA3),
> @@ -299,7 +313,7 @@ static const struct spinand_info toshiba_spinand_table[] = {
>  					      &update_cache_x4_variants),
>  		     SPINAND_HAS_QE_BIT,
>  		     SPINAND_ECCINFO(&tx58cxgxsxraix_ooblayout,
> -				     tx58cxgxsxraix_ecc_get_status)),
> +				     tx58cxgxsxraix_ecc_get_status),
>  };

Are these 3 changes legitimate?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
