Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094B60A2605
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 12:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A2iUhdYQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/hWv9yE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9hDEAPMllThKGR6rJWLQrQt2//kOnXIixwQsMqWcdfY=; b=A2iUhdYQBf+IxdisDda51AMx76
	9YXXTTJJrikYf+M0bmv4SBwUE29DoaqGf/sCMzKUbU7K7A+d3SimH7WnecSDflMOKhGGBLR2bGCct
	QsBLYaGp2HJt8DM3A1+GGlurNMR3DNhFCorEghX9KdjIv1p/jFl0wz7zuu4mje4u7HuuqWDIMPFuT
	0lwqbWb1oMOrARDAk/NpAZ7vapIIcmHlD+O1PYJel5fHbQi7ZFK3ERxMHpAUPG3EYxD+tf4rdeSX+
	yAxgtimDP+lOyrpeVanqxkqMoXUtBqZLx3Sstr18ms0RUvxHSuko92g9IFn4aFbdKs9sXspG69Lgk
	AxdVdzSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNiB-0000000ExDB-1Fqz;
	Fri, 20 Nov 2026 12:27:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNiA-0000000ExCD-0TDI
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 12:27:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E6FC61DF5;
	Fri, 20 Nov 2026 12:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B401F000D2;
	Fri, 20 Nov 2026 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795177645;
	bh=TU45TieMHnoNsAzLGBQ9WAzCc/Ph1uI6h74S+nvnSBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D/hWv9yERp0ILvAGLn7xFqt1CMmapEK+cXBt0JXJfbu9LUdRm3dIVNXf4kaTvr5ju
	 gvkzOrboyyesa5j1+QYu9T/hKd2rdLBFH9ioClASRw411PZhh16SawaEkHgTPNpn2F
	 onfDPncQW4SGssT6lb4xEps7tBQlUQTtDQ5TBloSjXLpiCfJrx/+gJVp6c5PY4pB19
	 UyvVrDqsVQyVg+aAK2L2xGMj5Pury0gO4jQuEvovpJhtis5iDwNUO/dnTll31Z+U74
	 v23/RW/cy/7NR92JcQ1Tk09cEjRjcXSXfCzmKL6okU/68K3r0FqV5ySHCEUGZkdWYX
	 l1WIuW4U3gs1g==
From: Michael Walle <mwalle@kernel.org>
To: Pratyush Yadav <pratyush@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
In-Reply-To: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 0/3] Add 1S-xD-xD DTR support for SPI NOR
Message-Id: <179517764333.1011003.5755754465844686253.b4-ty@b4>
Date: Fri, 20 Nov 2026 13:27:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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


On Wed, 11 Nov 2026 02:12:37 -0800, Changhuang Liang wrote:
> SPI NOR already defines the 1S-xD-xD DTR protocols (1S-1D-1D, 1S-2D-2D,
> 1S-4D-4D, 1S-8D-8D), but spi_nor_spimem_setup_op() treats every DTR
> protocol like 8D-8D-8D: it marks the command phase as DTR and turns
> the opcode into a 2-byte opcode + extension. No flash declares these
> protocols today, so the path has never been used.
> 
> This series makes the 1S-xD-xD protocols usable and enables the first
> user(MX66L1G45G).
> 
> [...]

Applied, thanks!

[1/3] mtd: spi-nor: Support mixed 1S-xD-xD DTR protocols in spi_nor_spimem_setup_op()
      commit: 20b85b6067e976c4a820eb0b099edc4735feed6c
[2/3] mtd: spi-nor: debugfs: Correct DTR protocol names for 1S-xD-xD modes
      commit: ed4a5fefe5134816d3827b3a44572b95af042863
[3/3] mtd: spi-nor: macronix: Add 1-4-4 DTR read support for MX66L1G45G
      commit: 7a7f426ca93dbbcb0a2b4f52fe48226fc2be71ca

Best regards,
-- 
Michael Walle <mwalle@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
