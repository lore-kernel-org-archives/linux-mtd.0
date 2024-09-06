Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F82CE7B1E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AmL+JQwtFyFDvOOF47Xxfkxl4XvzdtB93Gn2D2CLJzg=; b=jRoOREVhANNZk5
	PyVWhh1AfTnLbm7WxEDKCpslI/s11Z1u6LETqdSZcmbqfRM5d6Spa+vuN+wRJj1eB594wy2CRljkg
	llYPM6jbcLE6Xzy8kifZhaXGMwseXe9ZZ9TQG1Et8zwtfN+utme2hu1BF32uGnf1gqpPL47GlDp7D
	DS7vjNEqB37d52n9GlSDicScuf/ww1UWIAX/oLX3Bzh0Jk5rZiOl0MzSGz+I6NvDWcFxqnW9u+Bs+
	6EocCEMsLecPy8l1ZYY3UVUO/gUoMlwN2xGQIbq/GfIGXSsK3I73wSqs8VADVh29Z007vbZZBDpPB
	U4LrJvDwQe20O+xlvP0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaX0-0000000CfoA-0sga;
	Fri, 06 Sep 2024 15:05:50 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaTu-0000000Cea0-2dml;
	Fri, 06 Sep 2024 15:02:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4800BFF80B;
	Fri,  6 Sep 2024 15:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bShx9qS3RjTU7WY6871ftxYErfkPGjSbqzocHZ+wtwU=;
	b=RxTlNtDsykLrUo1s2APsrcIn5dYaIW20JHNiY0KsTNIVkTLQ0l0vEXLPZM2MBO6t6fY3NA
	oQhJjp8z92/9NMnoH2x21Sy3W+cUnmRmbrzFIt+1s9LofZsGH03WX2cZh5z152cjGCKmdX
	o39sEl2W8B1enavLVwVWXbN/WAc2vZGjLMnQFFvOLoEHde3NDoiC3Bt6R37oELyc57D57x
	UWtqp+jIAIRQRwlClayHtNYtuS63AhJoGP4cSBxZub66HyOSCWF76UgfWL/647KQy4Q5Ba
	qIi+n24S2+AVKNBQR3/qWAgPKDwWrfbarybcc9GzA8w++e55sJ42CdSddbOp7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH next 1/2] mtd: rawnand: mtk: Factorize out the logic cleaning mtk chips
Date: Fri,  6 Sep 2024 17:02:33 +0200
Message-ID: <20240906150233.734100-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826153019.67106-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'96127aff3b6659c52176415ba04da4145121440c'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080238_844586_6FB7502E 
X-CRM114-Status: UNSURE (   7.39  )
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

On Mon, 2024-08-26 at 15:30:18 UTC, Miquel Raynal wrote:
> There are some un-freed resources in one of the error path which would
> benefit from a helper going through all the registered mtk chips one by
> one and perform all the necessary cleanup. This is precisely what the
> remove path does, so let's extract the logic in a helper.
> 
> There is no functional change.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
