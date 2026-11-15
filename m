Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CD606A329
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z4Bmbytm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4h8+GeT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BqPKrW7w9hA/3Sh0EYjlKZKn9Jr8JjPgAJv+Q2VA9To=; b=Z4Bmbytm32bs220zcagBJ++6l5
	xgw6QdN4edAaMHBLT1a3DwG3CuLre7gNvpBChI/GbpIfYIjuCeszv9wf7ARKJDn7E18/6ibBnRGlK
	msXYlwbhadBzex1JRFCpCPZG6P9fwzCqfzDjAtfQQ2Fg5xMnKLefuDYTcCEx7Gm958N8sj2MaGJGp
	HUu5S+UcFdsZjiiIuib/0aM/+H2+Ok9QQdkdTWv9bQd0+hdSVdV8qs73jZgy5X7cjK5XYbO1Ee+AM
	5jajTWh4FVRE7KiT1QU6QM28k77CY44j4KyrIOiWNjWPgVfjVvSzidGEhgYzRFJd5R++I1DYzik7C
	gvnohuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfUm-00000000Mao-32uW;
	Sun, 15 Nov 2026 19:02:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSfUi-00000000Ma4-3W17
	for linux-mtd@lists.infradead.org;
	Sun, 15 Nov 2026 19:02:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6760245694;
	Sun, 15 Nov 2026 19:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C003B1F000C6;
	Sun, 15 Nov 2026 19:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794769347;
	bh=1cTMD6rpl21Vb6HPpVL+YKvnpPXKBaj6/RS9XazGUt4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=A4h8+GeTpGoICj8LAusJY7fyz799M81c/p6+2bXpg65MYiGpWPUSzD9EPd4OgGC+y
	 4y+vI2Ye5CFirDmrG4iuoJyfTBS/4NJ4u+YiU+X/nzh1JDr9loQ9KqkYaF7Bn8ggVO
	 MsiOPSGMrMAeH+Dij+bEla8pnhO1SuOT71bJiJVleYsohxs26zlxLfkl1mQKn/nbh2
	 g7q14odkpGRsBP8Mej4Bw7W3ScUmht/p4qn9K95HxvTIumxjT5iRk3MjM1Y4jxc0Ov
	 oxploRytu7zwflW442B10wYsQ62Nx+UTAvtItE8PBEsMtmpfqmDjMhAS6+KuPFW+W6
	 9Apaai/zJYAWQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 489283438C03;
	Sun, 15 Nov 2026 19:02:22 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v11 11/19] spi: cadence-quadspi: enable PHY for direct
 reads
From: Mark Brown <broonie@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org, 
 takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, praneeth@ti.com, sebin.francis@ti.com, 
 u-kumar1@ti.com, srikanth.boyapally@amd.com, m-shah@ti.com
In-Reply-To: <20261105105832.2134313-12-s-k6@ti.com>
References: <20261105105832.2134313-1-s-k6@ti.com>
 <20261105105832.2134313-12-s-k6@ti.com>
Date: Sun, 15 Nov 2026 19:02:20 +0000
Message-Id: <179476934046.140154.3805598097732218794.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=broonie@kernel.org;
 h=from:subject:message-id; bh=fwy4hjtJ5n4yoEaGTYcqUt3ywO3A0Q78K+izyy35w7s=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJ+Me7b4vec11V8Q8r03GluPex6cTdeTmVh2T8hxtrwr
 2TXKWWhjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExkcwbDP6uGA3Yr7ZWEAhZ8
 +/b373XZSVO3pUzfZltu7JD64BE/3yuG/wlu/x7MWdqkJvFmd6bIydclPnVzjuT2LpO4LJfk3Wz
 Axg4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Add cqspi_tune_phy_read() to toggle PHY mode around a direct-mode DMA
> read. On enable: reprogram the DLL from the per-CS calibration result
> when the hardware values differ (handles alternating PHY reads across
> chip selects with different calibration), configure read-capture for
> the tuned delay, assert PHY_EN and PHY_PIPELINE in CONFIG, and reduce
> the dummy cycle count by one since the PHY data-capture pipeline
> absorbs that latency. The controller is confirmed idle before CONFIG
> or RD_INSTR is touched in either direction -- including on disable,
> since the preceding read may still be draining.

> +static int cqspi_tune_phy_read(struct cqspi_flash_pdata *f_pdata, bool enable)
> +{

> +	ret = cqspi_phy_reprogram_dll(f_pdata);

If we fail here should we just give up on using tuned mode?

> +	cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,

Calibration runs the capture with CQSPI_REG_READCAPTURE_EDGE_LSB but
that's not set for actual transfers - is that not going to be an issue
for SDR?

> +static int cqspi_direct_read_fallback(struct cqspi_flash_pdata *f_pdata,
> +				      const struct spi_mem_op *op,
> +				      unsigned long max_speed_hz,
> +				      u32 post_config_max_speed_hz)
> +{
> +	struct cqspi_st *cqspi = f_pdata->cqspi;
> +	loff_t from = op->addr.val;
> +	size_t len = op->data.nbytes;
> +	u_char *buf = op->data.buf.in;
> +	unsigned long configured_sclk = cqspi->sclk;
> +	bool reclock = op->max_freq == post_config_max_speed_hz &&
> +		       configured_sclk != max_speed_hz;
> +	int ret = 0;
> +
> +	/* Drop to the safe rate for this untuned transfer; PHY isn't used. */
> +	if (reclock)
> +		cqspi_configure(f_pdata, max_speed_hz);

Does this DTRT when we get here from cqspi_phy_check_pattern()?

-- 
Mark Brown <broonie@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
