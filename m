Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E351EC05027
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQP0o9tVsWkXxt3ewaNpua3aQa/rxGISMd8Acx4flNE=; b=UVZ5mBt+jF2pfy
	SMYrGiQtfZcbLEFenm2idzbBXxIxXL0EKE3/m8aaJsu9HuhZE+aDsjBOX912+CTr4ZO3akEpCages
	4dQWTvRMZjSV3DItVj3mnur6y4cepStvdTNwEcWWLLkG9HXYY4NPQAUEFSPTmPzvh07UzuyM1qfLl
	73p6PAqa0JSpk4eHmwHOyrFIcmTwJ05sWIP3z/P1yeCcPQVEo3lBAXZNGAABSfu32tK8ZL0V9iTqb
	13uBSMcTN/KejDg+nBIugXNYfhfOePywSttPYgyEAq05Dl6Q21bfu8sjob+X8eElkP62GZgal883u
	5FXR6C9dmDgj+RFUiUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx5w-002S1A-Cl; Fri, 03 Feb 2023 14:31:16 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwxF-002NPt-5x
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 14:22:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DD8DE6000D;
	Fri,  3 Feb 2023 14:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675434128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDf/E5qRsQ13O+6osABAwgoxPH8VjUVG7UNYlqOUD3U=;
	b=K8tgW27V3mmWiCh4RtIUsHnJKAUoAZu8O8C+mwuXplj8Sr39A82ZQSgAfrOY2s/HTFKdvn
	JBs3InxamnYXahQWOCzF2dF33xtWeNPoWvu7hZgP2wHgbSQhB1nWMgXcYXkWLeAZ++fxjJ
	xj4GjAzqIIgVs5z+0gzAEQwqtKqpRMZ9+QjOEoXczIdHpnCxh2bXrg3QeLHdpVPg9HYRs8
	Gon8z7mKr+Al1F6gv7LbVbvOB9VZlZPRwSoBwb37GaP4WTMlrNBsBiEGxDg7SF40mfkKBr
	vfjvKF/CJz2bS/CA+D5hCr6g5Kh0PDtb8zB7DH97G7VMbRcWj+0QcVN0qqcI1w==
Date: Fri, 3 Feb 2023 15:22:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, michael@walle.cc, richard@nod.at,
 broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: s/a SPI/an SPI
Message-ID: <20230203152203.55f584a9@xps-13>
In-Reply-To: <dac961df-c43a-03a1-2d85-33075f75589b@linaro.org>
References: <20230203080136.68505-1-tudor.ambarus@linaro.org>
	<dac961df-c43a-03a1-2d85-33075f75589b@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_062217_430208_4D142C64 
X-CRM114-Status: UNSURE (   6.21  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAzIEZlYiAy
MDIzIDEyOjE4OjI1ICswMjAwOgoKPiBTZW50IGEgdHJlZSB3aWRlIHBhdGNoIGluc3RlYWQsIGZl
ZWwgZnJlZSB0byBjb21tZW50IGF0Ogo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIz
MDIwMzEwMTYyNC40NzQ2MTEtMS10dWRvci5hbWJhcnVzQGxpbmFyby5vcmcvVC8jdQoKSSdtIHdv
bmRlcmluZyBob3cgcmVsZXZhbnQgdGhpcyBjaGFuZ2UgaXMsIGJlY2F1c2UgSSBlYXIgYSBsb3Qg
b2YKcGVvcGxlIChpbmNsdWRpbmcgbWUpIHNheWluZyBib3RoOgotICJhbiBlc3MgUC4gSS4gY29u
dHJvbGxlciIKYW5kCi0gImEgW3NwaV0gY29udHJvbGxlciIKCkFueXdheSwgSSB3b24ndCBvcHBv
c2UgZWl0aGVyLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
