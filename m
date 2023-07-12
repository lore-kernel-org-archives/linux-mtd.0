Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAC5EB64DD
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 14:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVlPMT+QpvfzjPNN0Gt71SIKrprOyRgNyIfAJ6PFYYw=; b=LJyDK61aKBwfVT
	k2daiJ71PJocpO63XSX89D7w88hjH1UBdgSKvPHieHRcWyt1w/zansiTlqbh3cfy8OPAMCNzIlh6N
	FdWdspB54K/tNDL7WrZaTy5miQp6haBvhyGUsHCDXq53mhese8nI37s7+olWGuQ5HKMwRPzazHUkh
	Nz7vNe7f3oIPU6S4xYH1R6ZJomEwXNCI/cDrZgz6M/BBKcdswyj5201QfuRcLVu9+1qIepoqn3mBs
	TrVCqwV4i+xKN2exBpbBeGNknELFzNHUiOV7RXOyMU5vTV3Gz6PPv/5qzb6SeJlqk05dPlKVC3PWp
	bxZ5/ubKg+gWSfL1gyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaag-000A59-2u;
	Wed, 12 Jul 2023 14:13:14 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJaad-000A3w-2o
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 14:13:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EE3C60003;
	Wed, 12 Jul 2023 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689171186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rZvoTpQokhfxDtKwxijGGRwv2ma6a+U5Syy0BYVUUzo=;
	b=CMAxGgaJTMD5faz+BirBc+qKDEqdZXxClErK7qVOCgjEMccFvmjBcKx034xtOc/LuNRC4D
	CV5KZXGwyN/0sT92rhBuPSI3qfk/l5+astqJozxNK33bLKaVEBIVoZLKId2dds76TU/NfJ
	f3BGd9D3I4vS0dyCJq9h/rzaVM/v8LTKWmynwDDB/tahyVw/tHDTFf8CXr065+ISPrf+VT
	r2Qm2tqFJ1Vc98LvmKNXJCs6Ds2tX8er5bYHDqL4FxMYiKNaSW2qDIShePKqKG3AzPbvIB
	1KNJ1VSartJPX/JVBo/ZPG4w/h4MYZBfJC5UfhyCJ8+l7lM18DumiM33cb2atg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/18] mtd: physmap-core: Use devm_platform_get_and_ioremap_resource()
Date: Wed, 12 Jul 2023 16:13:03 +0200
Message-Id: <20230712141303.354734-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-18-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e1666cfd78222ae145ac260368f29fa443d97b3f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_071312_053680_7F90B4ED 
X-CRM114-Status: UNSURE (   6.17  )
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

On Fri, 2023-07-07 at 04:06:22 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
