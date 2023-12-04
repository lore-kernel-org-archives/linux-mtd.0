Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3CFC4167B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Dec 2023 10:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrqRyAM0PRyCMxltUx97wZUtEFmkd0Uh9giOBd+3fNM=; b=UWe4YdGrhQ5Ie7
	3qeWSVCsMQklWP1pZZtH3uMpMDhKAG9VggMzoAtfGNTBoaaSKAwjaO0Ag/CJDywtE5ZfWeZObpJif
	P4LS5DX80Un9yjPUY32kQpEXRSbyAS5WYufrIN5QZHDhGNdHCvnpEPZdyeKRtxz83LSJNF2Yn3+7Y
	bNLnsjWLIan9Yf/nk1wnIBYi8FxbPfREX9EgDupTyqClOuvBuIV+K/8pnpMgb5QKo+HW2genxbv3w
	fK1E6cwwl+frsj9arBw1Bmj2F+vw9GuHq5a+rdbnHf6ChxgEx39dFf9u7/JjaF0BUteYQem76R7m9
	UPyY5JhYR6XITG7hf9yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA6Z9-003aIy-35;
	Mon, 04 Dec 2023 10:52:43 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA6Z3-003aGO-1x
	for linux-mtd@lists.infradead.org;
	Mon, 04 Dec 2023 10:52:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66B6C2000D;
	Mon,  4 Dec 2023 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701687152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGW0aYaSSgY7TbVn7mSy7EgFtx4MSa9KcaOfi7zh3LA=;
	b=iv8ooXpqwTm8wRYeLHrtRDLvjizLyoyApYNVhbJn9vWZSMP9gMM4ji/koDOEB4AWp7Hcfq
	Kvhe+28Bn2YS2xI8QgV9y5Q954Gw+wiSxRge4R1kVkkd1HfxqyyHdDoCXs5t7dRF4+YMma
	SEF8wBl66viXznFYmTc53TT+Hk63OqhWLn7Cg/t1EgCIk4C0+FgN0RJ/i/9+fuvxDzp7DI
	g+7zW1zQyZAzg82Ta4jymaQOPGyU6+VPPjfRhDwg7EpUwvaur+kPlIIoko47pBf5EO+CZh
	yurS+qGrc+x0Dkz5x8DsCpF0ICc0sAgaqmynU2hAHlyhgzIrk7wFVoiI9fcuHg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: dregan <dregan@broadcom.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] mtd: rawnand: Add deassert_wp comment
Date: Mon,  4 Dec 2023 11:52:29 +0100
Message-Id: <20231204105229.870290-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201212446.189491-1-dregan@broadcom.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'578dc962ff2000ba4bf52d50717aea0819615634'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_025237_963120_7ABFCAAD 
X-CRM114-Status: UNSURE (   6.05  )
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

On Fri, 2023-12-01 at 21:24:46 UTC, dregan wrote:
> From: David Regan <dregan@broadcom.com>
> 
> Add deassert_wp description comment
> 
> Signed-off-by: David Regan <dregan@broadcom.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
