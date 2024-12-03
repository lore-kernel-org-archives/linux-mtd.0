Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D348AE74AC3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 17:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdqvDkOIl5ycQxCSRRTFLExZXeYNEDc39199jTRNLuk=; b=wuNa7EWuyrvpLq
	4AHKLH/snSwivJfWkFyfqr+huBUPv4FrRkpJ2p345XhN3xQGghsVWuHQnWObBsCT6Ih/C57glF+Pr
	Ls7zgFCuYvuT3QdHIEfCDwgtYFKjiMYJSCv+ZpierFVJZiSrJ3Pnugvq/9Nc/wOShJcOVKQkP1yLg
	nuj9TxuCmk/LSya4qXtxuNKTq6QS6YNhwKFgD1Aa9J2tPzVZ/a9iWjEqMt/Lk2x1sffgbILJWkd8A
	euoVGPyZWMyJJO0kgI+UM0O394l/xH2R2kAowgst5x60DkaJkjFmBFFk8JGZWRldxrkcEjJjA9fmt
	PskFuBMCA4Ee20i4PStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWTk-0000000ADo8-0cjb;
	Tue, 03 Dec 2024 17:14:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIWTh-0000000ADmp-0DMO
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 17:14:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F0C98A40946;
	Tue,  3 Dec 2024 17:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A95C4CECF;
	Tue,  3 Dec 2024 17:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733246063;
	bh=X54gmApuOV9z0KSTh0iuDvmqMg+NUxdjzp9aJq8n3Tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Anz86Efdp1IdwoVfnZUmqU6tLuIveq13pYFx+gRkVpxGkcZyyBw7LYzHq23uQ9Z7+
	 VessNp0ggXiyPwcknvWYy3BXbkf6gXEZxXI0n0P9Wy3K1dupw5Qk94qU2KaOktLALE
	 tINYb/0lEME2FiKeaw3asJXO0r6dG/UEIDPJz8zPCpaRbtEnFRh96jjb3uQSUP6mTj
	 Ho8h8IR3hyUUwPFtwzF/To5wrz+Z3jEdpF9shBwUXM1JOqaqw4a7/J2xrODd+JJ7fg
	 E1nJFKu5T7GURcYUTLCSETGRUsoNFYiM6bRbENRsz4I0U6wFWv0ZMHlkdZN5QUYfnm
	 y5+/cVZe4wmEw==
Date: Tue, 3 Dec 2024 11:14:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] dt-bindings: mtd: fixed-partitions: Fix "compression"
 typo
Message-ID: <173324605959.1986625.7343237766910696825.robh@kernel.org>
References: <20241113225632.1783241-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113225632.1783241-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_091425_149324_CA740E13 
X-CRM114-Status: UNSURE (   8.74  )
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


On Wed, 13 Nov 2024 16:56:31 -0600, Rob Herring (Arm) wrote:
> The example erroneously has "compress" property rather than the
> documented "compression" property.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
