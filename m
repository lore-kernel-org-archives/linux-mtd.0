Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8775E7717D
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 20:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VC9czsHalGY2Y1UcyYwl31B4YPVjrwpY+gEZ5uGeERY=; b=RrfEIXT2kjbhSo
	j9P2H+DdRLmr0LGwVtmhmAWN7okDsIR9IerSQifUDErvNQ4nPxH+HBw0z+s3Xa4ZVkAuORQk8XS8X
	UQ9RmIbPfQ7dXE4VdFxAckcMhpaGWdeB/3qyUqhocrENlOhFCqytHKZomz+rOpYIaiNYlriekIf3/
	YJxUAT6c8S7oAh6ZptJbR3fw8irZJzqIMvh4RsEl8FPtD1uSVL9gssp3eqJLsMGdqOWXudkBoSvam
	ICe5Mkd8yXSjJeFucceS/KF/tBqxZUH5mxanoQCTTN+vgKHpF8dmoIM4V3bdgoZCOqrCOdQJx2w1Y
	BCyfNZuacec1Q7j/JFLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKklH-00000009De1-2E8V;
	Mon, 09 Dec 2024 20:53:47 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKkkz-00000009DbZ-3YFr
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 20:53:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A3FDE0004;
	Mon,  9 Dec 2024 20:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733777606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MuEuujiyyJvWTVyWstHQ8QjJFMFxtjOyvwBn0XuKDrQ=;
	b=DB93rz6WjPj6/SWHmQsR5IQ9w8dxml0YceInz36BE61vyVuVednaZiU3O4/wWGE4poVevW
	3XI+1dJwj45Z0Ci6VwiQRmgilo765uoh45TMjeZ/DZZH2fS4/ZKQNqOlMObPCrzVJJJURE
	DBDtqES2HbzYZv1OlzJVKj8lS8NlFh9BYaZl2aekvahGaFTCCsLWhYcUZr5c2zNB5Y8qBl
	W2JTqHVQGaJdi0u3uZ8GpCNVSXB+mF1yFlXjZywea/FwVkr/orijLUzZM0fOT3n6fHz0Pq
	aCYXng97NzMRAtBxwshXMR5McFyswCbiwA1mVtyFpgTbfDtJioNOW53XQaxEag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Bastien Curutchet
 <bastien.curutchet@bootlin.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: (subset) [PATCH v5 0/9] Implement setup_interface() in the
 DaVinci NAND controller
In-Reply-To: <173377318397.159219.10800117213949308208.b4-ty@linaro.org>
	(Krzysztof Kozlowski's message of "Mon, 9 Dec 2024 20:40:56 +0100")
References: <20241204094319.1050826-1-bastien.curutchet@bootlin.com>
	<173377318397.159219.10800117213949308208.b4-ty@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 09 Dec 2024 21:53:24 +0100
Message-ID: <87ikrsr323.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_125330_017141_1AE99E06 
X-CRM114-Status: UNSURE (   3.46  )
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

SGVsbG8sCgo+IEknbGwgd2FpdCB0aWxsIGl0IGhpdCBuZXh0IGFuZCBnb3QgYnVpbGQgcmVwb3J0
cyBhbmQgcHJvdmlkZSB0aGVzZSBhcyBzdGFibGUKPiB0YWcvYnJhbmNoLgoKUGVyZmVjdC4KClRo
YW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
