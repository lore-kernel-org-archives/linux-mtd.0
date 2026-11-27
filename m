Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724B1606A31C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2PqnOpi+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ChK2eBW3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KQ9ygSPUQMSvKO0nLYxfFhO/a6TnpDk1dCGsHt0/szo=; b=2PqnOpi+rFzHvlVvL1JMY2V2Xc
	DMUMMRFTyoiPUKBLJ8Vh4bM9wYLM+o792Pq+5iX2lkm/J9czMx8WemDKdmL4Z5ZeA21hw85lGd6vB
	6reibXvJa9ffCp6vDG+luzQQMaUp0uTEJQoS2OYbDuyRZdDguZJSEXNzIMX1o9SApSdegAVmyJ12u
	msLcee/NvuZA87ouOiC5wogDi/HLvOd4q06ODHoIJwsyvef07bO9+nXEpgIivXfFcEBUwhPMG8gzE
	sTSopBxDoHXWKc32CG25MC4VfL6gqPQpqT11ei8hC8nS+hpkIoSglkWcrb6xk/me6nHyLWT6NVwFR
	Y0L2q81Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsC3-0000000FQOs-3jOb;
	Fri, 27 Nov 2026 09:24:35 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsBt-0000000FQIt-1xGM
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 09:24:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BCC8B1A1827;
	Fri, 27 Nov 2026 09:24:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FE9B6049C;
	Fri, 27 Nov 2026 09:24:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 91E7911E68208;
	Fri, 27 Nov 2026 10:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795771461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=jgyHrYPYaDcdHaZArH0qgJYcR9o9hCgTJicEvymP6v8=;
	b=ChK2eBW3QA2qWNgV4nzPcBWiNDgSUQbUP3CFkm5tJ3dgq3pwKNZ7d2io3wmtshAvuLTDnJ
	rFCuTJItE3Q0cWqM9tZf30r3HG1BYdatVjX3FDF6Ze+q1N17Op46peLjuXWC7g6FdMP/NK
	cJtdSEZCegXdsb1JCxfCnY8iqgTflNi9lMAXSG+2pOz2BPMGcABM6CaM3u79CeLmTLuEB7
	gYaie9l2X6JTKG7StX171IBZOqc993Pxx7aGob00lAKAZO0gGDbvbc8fZZNhB70ztq97z3
	GG0auLCldd4x6TcwpRLqJsskrFO94QU0HdCnir6Ab7CQb4K86a9agvMNsEM8lg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bough Chen <haibo.chen@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev,  Mark Brown <broonie@kernel.org>,
  Liang Yang <liang.yang@amlogic.com>,  Feng Chen <feng.chen@amlogic.com>,
  Xianwei Zhao <xianwei.zhao@amlogic.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Valentina Fernandez
 <valentina.fernandezalanis@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Haibo Chen <haibo.chen@nxp.com>,  Jyan
 Chou <jyanchou@realtek.com>,  Yu-Chun Lin <eleanor.lin@realtek.com>,
  Maxime Coquelin <mcoquelin.stm32@gmail.com>,  Alexandre Torgue
 <alexandre.torgue@foss.st.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Alvin Zhou <alvinzhou@mxic.com.tw>,
  Cheng Ming Lin <chengminglin@mxic.com.tw>,
  linux-amlogic@lists.infradead.org,  imx@lists.linux.dev,
  linux-stm32@st-md-mailman.stormreply.com,  linux-mtd@lists.infradead.org,
  Frank.Li@kernel.org,  neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 08/16] spi: fsl-qspi: Consume dummy cycles directly
In-Reply-To: <20261127085632.44irp2necxfqbbn2@shlinux89> (Bough Chen's message
	of "Fri, 27 Nov 2026 16:56:32 +0800")
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
	<20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
	<sashiko-outbox-233875@kernel.org>
	<20261127085632.44irp2necxfqbbn2@shlinux89>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 27 Nov 2026 10:24:11 +0100
Message-ID: <87zeuutyo4.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012425_653721_66900D1E 
X-CRM114-Status: UNSURE (   6.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


>> [Severity: High]
>> Does fsl_qspi_mem_caps also need .dummy_cycles = true?
>> 
>> fsl_qspi_mem_caps only sets .per_op_freq = true.  Without .dummy_cycles =
>> true, spi_mem_convert_dummy() converts any dummy cycles to op->dummy.nbytes
>> and sets op->dummy.ncycles = 0 before invoking the driver callbacks.  As a
>> result, op->dummy.ncycles is always 0 in fsl_qspi_supports_op() and
>> fsl_qspi_prepare_lut(), so dummy validation is skipped and LUT_DUMMY is
>> never programmed into the hardware LUT for operations requiring dummy
>> cycles.
>
> Correct, need .dummy_cycles = true

Yes, I forgot to add the capability there.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
