Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23F3C71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WeXFJnMr5KZX7f+uYS/T+TjthEHOCMz+BTNGgMWTFWk=; b=PxXyhh1vZYXUtn
	9eaPnikZHMaqH0bC9ftG/jGb8YHgwAuQ5fz0Y+OXX8ibgJ6x5pV2ol69uRKmjPiYk6tDVS0ltVjAB
	LPNI5HB36iaC4kGUxkfmZ5HSmlrMVF9s4DJeRYBLSZrpZIzs6ltX3+Q0cUWv6FPXs6jcWlTyiI5SD
	61OSyurwlGWzY1FgvZ5gjq67QlceCQz1DOsGPvDUIYUHzhRM5SA1LWykxgOGyT2shAFfvJIjT7+AJ
	CcnT+l2WKInuZqhOZD/xg8PxvvSNdzj1lJ+znzGwuElAoTXAy0dGHB9OcfF3UvCxPr4tvXGJyQ2ys
	DX3psi/Ytningq/3ev/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0f4-009VeO-2e;
	Fri, 18 Aug 2023 14:41:14 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0f1-009VdT-2k
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:41:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 96F5AC0004;
	Fri, 18 Aug 2023 14:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692369670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S2D18FkNGn6vKd9cQEb4+sumhSExtjMBFF0Z2OP4N80=;
	b=kPT77qjMNoPYWkyNGf6jWTx74k3pqBQoovS07xZW8XL1Bgv0H1DdmNw624SEidCREWr6A7
	5h9T2UAQ75WbDZH2KceIa4o4itkiPmGNbRSU/Kiz2fO/49ym8EZJtduRqrKtdctPHQRD9q
	HzbuZAedhHGv0kYpWq2ds1XEKaExVmJVs0o2MwSEMDikrhf1Vt6Puer41fvM5W9LjsGPcF
	JtJftA0erP5lo1bNaT3UC9Vm+zHbCZYqWtGe0wT5ak19z+xu8vLqXq1NofkYyJG81pDRIq
	LC2x48wyUuuF7Ilxf7VAHaG9knXCg+TR9QDQgSOQCtC+zq/VC+t/SnBXg5hKyQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	David.Woodhouse@intel.com,
	vireshk@kernel.org
Cc: martin.blumenstingl@googlemail.com,
	robh@kernel.org,
	jernej.skrabec@gmail.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: handle clk prepare error in fsmc_nand_resume()
Date: Fri, 18 Aug 2023 16:41:08 +0200
Message-Id: <20230818144108.145848-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230817115839.10192-1-yiyang13@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a5a88125d00612586e941ae13e7fcf36ba8f18a7'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_074112_021434_C69D3535 
X-CRM114-Status: UNSURE (   5.50  )
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

On Thu, 2023-08-17 at 11:58:39 UTC, Yi Yang wrote:
> In fsmc_nand_resume(), the return value of clk_prepare_enable() should be
> checked since it might fail.
> 
> Fixes: e25da1c07dfb ("mtd: fsmc_nand: Add clk_{un}prepare() support")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
