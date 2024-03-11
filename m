Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5138EC54E58
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2024 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UcPGkV3oXPqn2yzugUSQJLqHrxJjNcY1KPQ90IWP0vE=; b=Qmg6zlLKYiruwd
	IxxykjvRVHdkzRsoIlbl4IdyDFs7Ecth5R2EyMfDhZTNZPLAutJRJ34MuXoPpzM3ueUrkMZb+b5J/
	JdUi5sawwxtNHcXJf/6r/yC/fUCz2NMn6OAGXNckr3JIvweDQOM+IO25rehHN9G7F2qXZ7mMdI+F3
	UDCTOGv5ltTGk3/iCMx8mnlvPq5dGuNXLDi5VxnMdwLzEEKuYz2AkI2jaKG3VujQ7/wspFhjONjIx
	s9wNVb5VhwT4Tn/AgBzNZpGVjPdOqrcDKgIx4kIf5Z0CdefNTHjUemnVGsUKtgKnS7KMbpK/EBD4E
	y6Dg2P2hj9WHwQpX40Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjay0-00000000cYl-0AWd;
	Mon, 11 Mar 2024 08:25:04 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjaxw-00000000cXO-3h73
	for linux-mtd@lists.infradead.org;
	Mon, 11 Mar 2024 08:25:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F190120004;
	Mon, 11 Mar 2024 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710145497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bLjA14wnYsJnSoHGoJfzY/KdBjvo43UoNn4NETMONSQ=;
	b=bm0tUKlhxxd+6ItRceW9ceUHPdDMneQi4vgivtfcBtWNg0NjTNFYdwFtFCEg/eafGu0BBa
	oV/7MeV4XKcAfKXGVeRNnLiuRwaKt7+1l1uQaQfhM7Uak21QBgLNYYu60600JVdQTS1A0P
	5aJkqc9fSoodAZhxvv4unkhCzRHBt1CT8qBwdPvzsr/u3HzyoLhFSgCDG7Q+HcnKYF3107
	7yw0ezcnhvMnaCVm4UBNEjUwGmzET6g5hK63cORtu3kFuR7S0ccRPthO1wveNmicLP4VM4
	nqGISpr1ICeQHt2W9hBFWRdp6QwP+8MiGXjyo8I5DIYCFIrPlmsUPw4iz/3CRA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: Constrain even more when continuous reads are enabled
Date: Mon, 11 Mar 2024 09:24:50 +0100
Message-Id: <20240311082450.4191310-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240307115315.1942678-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'64b35c8a3acaa1236e642f4ccfc401d394f85fe8'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_012501_073399_14C0589B 
X-CRM114-Status: GOOD (  13.19  )
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

On Thu, 2024-03-07 at 11:53:14 UTC, Miquel Raynal wrote:
> As a matter of fact, continuous reads require additional handling at the
> operation level in order for them to work properly. The core helpers do
> have this additional logic now, but any time a controller implements its
> own page helper, this extra logic is "lost". This means we need another
> level of per-controller driver checks to ensure they can leverage
> continuous reads. This is for now unsupported, so in order to ensure
> continuous reads are enabled only when fully using the core page
> helpers, we need to add more initial checks.
> 
> Also, as performance is not relevant during raw accesses, we also
> prevent these from enabling the feature.
> 
> This should solve the issue seen with controllers such as the STM32 FMC2
> when in sequencer mode. In this case, the continuous read feature would
> be enabled but not leveraged, and most importantly not disabled, leading
> to further operations to fail.
> 
> Reported-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 003fe4b9545b ("mtd: rawnand: Support for sequential cache reads")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
