Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0289EC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeGmcoAK9ZpU2bV8AOZE1+cogACeQzQ24N/bOvCTMns=; b=c8rSqmMLr0lv9r
	qZmCsSTG3SaIn5/QK8lxwBH5VGfUFJLELQWka36oQxXoZzM/B9p2mamMUOvw5aeOW9zCmqR7pbEHL
	sXO8Rq69RgaTTOpxuu16/TAscXr1D+0zJkRA851XbihcPIhqduc2/AwoFpnHc7pvkywlSTO+IdiMn
	es8KXTpC4q10HofZChrbBK2L5uZkxE1nIotdy1C0BSlviYnTFlJD0mVtdn4/m1khlspN87ZP+Sl9H
	/dQy5YBW+dBl+6I//2GbeqEZvK6PKf3K2AeUOm/A6ooUOGWDQKdoAHY/IebgdVqZvcZgJQo3nEH9n
	8Qcw2Qd/evdV4t3Qmt1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEb-00HYPJ-1k; Thu, 17 Nov 2022 21:15:45 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmEX-00HYKl-FS
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:15:43 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E7935C0007;
	Thu, 17 Nov 2022 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NtRc2SCHF4Re1XzW5jzVp81YDXxN0uNEg20goCKLuqM=;
	b=eo61jFGW6qkHH0d18g7vSeBk5VMQTccyJ83+Lm10ZlkWQI3USEHZsFP7n+uCls3hVD8Ov1
	tMr/EESHgtiMSyCNfDuwKL22jo6a0FKylICpBAuU6btYBbdqXchtPKemS5ZofPT6ocHuwo
	xAu3XMax/GqVCO9b6rBlD8ClugMAY4Ukb2Aa5gMSJuaF7fpmpZfdZZaoQGPsRBtNSqiQLl
	F1qsd86St3Gs7Tzers86hrlDaxoYMHmnkXVX/i0NFQRqF7dD9UlPyeYKKxC0pctMtDw1r4
	isOo9vYqtarAuVbPLDxrUxVI78OxAK0kLNN03+QOG1y3iQkl5obGPyMIxLLr1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 11/17] dt-bindings: mtd: partitions: Constrain the list of parsers
Date: Thu, 17 Nov 2022 22:15:35 +0100
Message-Id: <20221117211535.1273376-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-12-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'991088a637c54377b395520631bd1e8f068d524a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131541_674174_14490D5F 
X-CRM114-Status: UNSURE (   6.86  )
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

On Mon, 2022-11-14 at 09:03:09 UTC, Miquel Raynal wrote:
> Parser compatibles cannot be used anywhere, and the list is limited. In
> order to constrain this list, enumerate them all under the top
> "partitions" subnode. New parsers will have to add their own compatible
> here as well.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
