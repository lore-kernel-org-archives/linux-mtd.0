Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C9CC41535
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 11:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9EfbpPwSQvaBUD3S7J3JmgRb9bKXYyrOrl6znhPRgsA=; b=wCwsgUBpIzzBkd
	v9X2QhQpMT/9QOKvDaT4OeL8r/UmrAzro7bMesCLU6WZkrn7Lp64qFwt3OD+x689ZRJ3C3/6xZSIh
	kb0r8vZYtxegS8A7OqMmc7qGpbRDJpvJFGC3Ufkcp6EqHmmV/EMzRK2IWfdIk7rcfkIa9aPii13lJ
	TGRMTjCeuXbodvDtHi4d3xSoznSFeZC6Fv8f/r756PfHmbTIVfgAstupnnurqsKsH2Fke+WapMNej
	fiMdRqoJvTRtrFEuFkHBDjGbYt9MSeJsAVr07QDIqWS1EBozn2mWvj41yRBqXdP2DoD0il536sbct
	iV56HH8OnFtUJY9pev4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdzE-005nw4-0U;
	Fri, 22 Dec 2023 11:46:40 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGdzB-005nqq-0U
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 11:46:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5668A1BF209;
	Fri, 22 Dec 2023 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703245590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9LYO8f2xfFql9mlJ2jzuGrwC1kbkje71CwgfHXC2N8=;
	b=PPe612Ro+bpTJH0LISAIWWC/HGWBeWq1qRB/AFigR9tCXoKZ+e3fn71utcZuWI1K/G+VO5
	/r1XxMLrrLE/1D4nt++77vlHCTOVuE/qkRHGePzPqNRong5yinoq4k1d/H7p7tuO1rfKM+
	fjcOTZXEBulEmuXQBkbHkqS8Ol1Gi7ipf23DzsEhl/WpUNiTcQCu3i57FibmQaG1/7Alqe
	bAjqMW2gl4dbo3Rt+Ly3QHS0FUi929DAOy7KYVEvmc3od9/Kcu1griipE+VG289H+Z/v+1
	S4/dAMRq7TM1ldAFErimaRlgH7cBKzw7YhQWUQ8ajR40rsTxQzAWh+dsMLKnFQ==
Date: Fri, 22 Dec 2023 12:46:29 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Michael Walle <mwalle@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>, "open list:SPI NOR SUBSYSTEM"
 <linux-mtd@lists.infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.8
Message-ID: <20231222124629.4f196ba5@xps-13>
In-Reply-To: <b80247b7-ce6c-4c87-8fc0-60af45148632@linaro.org>
References: <b80247b7-ce6c-4c87-8fc0-60af45148632@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_034637_325205_53DB24CD 
X-CRM114-Status: UNSURE (   5.68  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVGh1LCAyMSBEZWMg
MjAyMyAwODo0MDowNiArMDIwMDoKCj4gSGkhCj4gCj4gSGVyZSBpcyB0aGUgU1BJIE5PUiBQUiBm
b3IgdjYuOC4KClB1bGxlZCwgdGhhbmtzIQoKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
