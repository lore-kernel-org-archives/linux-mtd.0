Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608A9C54798
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x7IDssXiC+dGHBxCdJH3CKCI45LTkrCjGVyJAGTCVhI=; b=DemlfaC6PLEIoa
	/mLxrbB1VNjRv9r1lCSqvv4uD0TJl7HxfCclgSmCbDlw3Hr1Qi0/gi/Kb5o/kWvG9mdDH2qSbIgMC
	am6gRPsRAr/5yEm8cfaOJGS5hi9A5DIh58lBEscQndf0vLE7ptjl+CJqYVLW7Xij2V4v8dHO4sIlI
	CZNtC8ZJKrH/arLXtvGI5J0WES55MIALZmOuu+yJT9cItwiP7rBM1dKX3UtYMWuDMhU67cpsRL8XZ
	OUtASC/AVKS6BXO6p4UrR8Qg91SctiWdVoV5hamA1b3HnRpuxQUnjAhsxKkzq+JDXHatR/J08h0pk
	j5YyQpPB410zOAwaLplw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHXy-00000005gev-1RIT;
	Thu, 07 Mar 2024 17:28:46 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHXs-00000005gYf-0a7Q;
	Thu, 07 Mar 2024 17:28:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C397D20005;
	Thu,  7 Mar 2024 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709832517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q21DLTQj0SvAQbvsDh1KicDozRTQwOzP95SJqpPGBGw=;
	b=N5PPEM0FilHp2agp8St2TXpGgvFLXB17kbldpeIjASzZ3VL3D3s2E5pUGt+te7ZspetCP7
	GGTFQHm33ttAnWGPoz1iehSR7xIGSS/cqoqqMLpPNnbekk+huDtyYOV9Cl4XBg7UmTpp73
	FAhluhXKkf9P2o15/W+XiNocTAKFeZPuNUESpjgX0+JdRl+qza5saoGWqJMZmMTkx8aNfC
	2nci/0eWvA/7An4GYRw2CnGARVCvRxZgOGgI8NXwFoLF4Hs93pU1wcetdexpMEw5WOiQQP
	pja4vxDDgl+SmLTpIdJuVsnqDMfK7px6Yq8x2NkE0ezRPo6TEc/IyskJJOZhJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Dahl <ada@thorsis.com>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: raw: atmel: Fix comment in timings preparation
Date: Thu,  7 Mar 2024 18:28:35 +0100
Message-Id: <20240307172835.3453880-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240226122537.75097-1-ada@thorsis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'c52f6062fa3d93eb033cfc38cc56c34976df1258'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_092840_439521_B107297B 
X-CRM114-Status: UNSURE (   7.22  )
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

On Mon, 2024-02-26 at 12:25:37 UTC, Alexander Dahl wrote:
> Looks like a copy'n'paste mistake introduced when initially adding the
> dynamic timings feature with commit f9ce2eddf176 ("mtd: nand: atmel: Add
> ->setup_data_interface() hooks").  The context around this and
> especially the code itself suggests 'read' is meant instead of write.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
