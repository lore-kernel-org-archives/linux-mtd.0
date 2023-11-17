Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DA6C197A0
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Nov 2023 08:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHULciZFXsxGUYJzio24mgD4rA/4S4BTm+Bd2AqSMso=; b=fTip3Xm2w/tCOdg/ucVrpOmIBe
	m0rn0OePL7hcu1vucXOt4uLr7Nlr9p4RSYIKSw21GTgmZXt6ON7LCNVGhINVlbMsGyb+rM7mROGMh
	tS3ftkN3YAK4brLO08dJI46UxhxHi0HZvmpAtVUof6ieUrsu8Vr4GnQZUOsWWyBLuo4K49Bz8cylT
	AEP0HTdPnG91QKrIyNup9NGn35X17UKxDWZxV6v3cAdt/V6WGvX4/g58+G6KY63AJVTCMNILQpTgP
	QBuDvPFuFXwfueE0u5fyuDGbVKyOKGZD470ukSjH19dnYEYRdvjV7mvnsBkt4eqsdxw+jFO+VRtP5
	9XC6JEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uX2-005yrb-08;
	Fri, 17 Nov 2023 08:48:56 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3uWz-005yqk-0T
	for linux-mtd@lists.infradead.org;
	Fri, 17 Nov 2023 08:48:54 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 11A01AA;
	Fri, 17 Nov 2023 09:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700210928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CwHsZNqE/GMn8IrgCciDZgafd/GX6GwFgZ1W+S4Ucsw=;
	b=F+uCzUWRwZ/UYJfRh1OvZ3BTblaqNCxwYrwtDV6C2J4rX0nfov6vO4aSWy4exLEHWjrMct
	iLaU4ksWl3PFTNKhf2fpLKmIt0qeUBXt9rFNr6yvf+6saFZKuneC5dUXpJXru1CLpBgB4F
	omT81fOZELW5R7y4nFNZoGh2Meyf0lCjQJ6hKiYB4/p2O5Pb5MtpfxZJsLEBsxhLVV8OUT
	kKjs2qwIcrzxgsc98jRbGNFR7/l7EMRQR1Z4b4kxp6jEeDw5ZRzhlWn3dMyQLbFW7li01/
	HcuEj+ZyXJB0cjkgDsP4PYPFjvAPT1Cgp9k/B4Emw3NQneik1hredfdgLaZS4Q==
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 09:48:47 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 0/6] Add octal DTR support for Macronix flash
In-Reply-To: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
Message-ID: <bdcaa357da0d1d3861831761b428dee9@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_004853_342000_112A5533 
X-CRM114-Status: UNSURE (   7.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Jaime,

> Add method for Macronix Octal DTR Eable/Disable.
> Merge Tudor's patch "Allow specifying the byte order in DTR mode"
> Add support for Macronix flash

I skimmed over the patches and they look good, but where is the
controller part of this? I.e. which driver is using the dtr_swab16
bit?
There should be a working setup.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
