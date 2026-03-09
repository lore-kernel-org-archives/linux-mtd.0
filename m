Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34CBF4180C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaemuhZx6CkKOybSupWs52trQJGYN+mLxcjy2r91N50=; b=HPZ8QefmuurSKo
	PFxbkxCqlb/IaggHJtOwS7faTA6fD2mJrGrTaGvx3KA1mNZxWmkitO2z8A8LcttB3cnqlmi+V2vcw
	g8IzUxfvqQzxZPDO5r4DfUVFEzjxmwRUw+TqrqdxTZKHen4vIbCFquqMDpOTgbct8yiYZK7/FyHG3
	gJpHb/2k8k+2zkhogrIb13OOhq6goijwrnb98IxtjL1pg5lf71Z/ejfhcScleTAETh2uLraVGCceS
	fSuX6QrUxRB8Ey81mVJA41bv6B0Mf0ijvfGVnfQKp4e9jDubhV+TsYuelwhEu1qYLVfoX5nlTGVvp
	kriu6nBnaplrZaU2y5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcGm-00000007ZGa-1434;
	Mon, 09 Mar 2026 15:11:44 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcGk-00000007ZFs-2s5n
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 15:11:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8EEBC1A2D55;
	Mon,  9 Mar 2026 15:11:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64BDD5FFB8;
	Mon,  9 Mar 2026 15:11:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6452110369C05;
	Mon,  9 Mar 2026 16:11:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773069099; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7JXs9JPlH1EFUBa4y7Zu+UQwHDwDOw9hKMguqAinxxA=;
	b=sAI0/V2fOKDCAIIu17PDW7TyNOOytaasThnsBQdJvP2Z+5QKV9ZlcnDHfoTeOCzVwIQXF+
	Sjub3GxEYFtFVeyH9vP0RM5Hn/sTu6ozGfJPlJg+1SUccVT5gmi1YXeVNNzSe7dXQKxbzj
	ihtr82t+oXpMCCLvPwmr5FDauPfpzjd5Y0YlnR1ERqHL4G+0+vQoHGW1ruLO5vCJec7NUr
	ue3yLaoPx8OA9IUfmVUZVGrHThnaZOtrQjkl1K8v6e0GvNbXd7oUjjcmc2KDXn1e7I96Ge
	zZT5ZeqLZulMiXPe07lR45GLHTl7mB5NhY1uf1SfTD3fFczCLKv5ox+ICwFRAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frieder Schrempf <frieder@fris.de>
Cc: Mark Brown <broonie@kernel.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Han Xu <han.xu@nxp.com>,
  Eberhard Stoll <eberhard.stoll@kontron.de>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Tudor Ambarus <tudor.ambarus@linaro.org>,
  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  imx@lists.linux.dev
Subject: Re: [PATCH RFC 2/7] mtd: spinand: Add support for clock to RX delay
 setting
In-Reply-To: <20260303-fsl-qspi-rx-sampling-delay-v1-2-9326bbc492d6@kontron.de>
	(Frieder Schrempf's message of "Tue, 03 Mar 2026 17:29:23 +0100")
References: <20260303-fsl-qspi-rx-sampling-delay-v1-0-9326bbc492d6@kontron.de>
	<20260303-fsl-qspi-rx-sampling-delay-v1-2-9326bbc492d6@kontron.de>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 16:11:34 +0100
Message-ID: <87qzptnil5.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_081142_858250_CDAAE45E 
X-CRM114-Status: UNSURE (   4.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Cj4gKyNkZWZpbmUgU1BJTkFORF9SWF9TQU1QTElOR19ERUxBWShfX2RlbGF5KQkJCQlcCj4gKwku
cnhfc2FtcGxpbmdfZGVsYXlfbnMgPSBfX2RlbGF5CgpGb3IgdGhpcyBtYWNybyBJIHdvdWxkIGJl
IGluIGZhdm91ciBvZiBzdWZmaXhpbmcgaXQgd2l0aCB0aGUgdW5pdCwKaWU6IF9OUy4KCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
