Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA18E6FE23
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zq1oqqhDaJlFOgseObyNzCMVk33LosXihA6NJrodVwI=; b=L/N1qYTr8GGyZu
	mUJ1CAaO1vFvqcCEkhEfOYF0aEatn7M3bkXn0taHZ0gPKNorTV/t3cm4TnRRVVSgajCjqx6+aVRO8
	PE0uUk8T93CZWMyPYD7MgNqCZzMcGstrnch4LkOH0PvuTJcL6U0jE9oSdsdgzUo+fhH0fF+toUwKU
	cNmNQF6wji8d6pHSbaWtYoPbvcpeqhBpy/LOjfeVzvqPqGgF9NK1B61N4W35igDpgXhUt/t3sT9of
	wxNk+MFKqu5CeVk81MJ7+X/vPU/T6nsFb4wkhzHhokRqoD0J2dkOxiaT2vrTxgiFpuWDEp/y5p5KZ
	TDirQZmKsE5fNk2YUjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smal5-0000000Cjhn-1aCJ;
	Fri, 06 Sep 2024 15:20:23 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaVY-0000000CfEg-2s0G
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:04:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A37ADFF802;
	Fri,  6 Sep 2024 15:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u9bdq9pRdZbdusPUWTBl/V2iUlg/kkjhWiEOFq0Lhoo=;
	b=HxKkYkXKO8ABGe8k2+c3Q81SrO7GxGADuHEHXZgiUNMMT4QvuKg1wh8kHf6vVNs6FIuTZu
	P4dbNXYXTrfJgQotLZ6lKdkiJvJ/zUkML0sDYfSGWfkl9rztQ9doafQ+qR/cpwM1nxMqPa
	N9B2St30HJ9L+2syakO6TU9P7SQiYld8Tj8R0BoGPQcSFGMknvIa4FvsRXFXpB1dZiNlfG
	qbpCbY+Z/CtrL3CSlpSil8LHLrrDzzfnLCfiPqCd1DZrcAmIkndbNdP+DWtrb05k64Z+hk
	4xD4EHyo87bB1Mathr9TKXChTrQfx7D70EnqQtsWoUFS2XAGTbcWPJ01+yst/Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: rawnand: denali: Use the devm_clk_get_enabled() helper function
Date: Fri,  6 Sep 2024 17:04:18 +0200
Message-ID: <20240906150418.734840-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826080408.2522978-1-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3c0e167c21721901413e8bc2293642f4ee6f983f'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080420_882857_BD7D4CDB 
X-CRM114-Status: UNSURE (   7.16  )
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

On Mon, 2024-08-26 at 08:04:08 UTC, Jinjie Ruan wrote:
> The devm_clk_get_enabled() helper:
>   - calls devm_clk_get()
>   - calls clk_prepare_enable() and registers what is needed in order to
>     call clk_disable_unprepare() when needed, as a managed resource.
> 
> This simplifies the code.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
