Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FF8C3DA59
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jul 2024 12:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncVARZcwNMITolu4zI6yyUlQO1i159lAoSqxgL2F8iU=; b=gZj3QSKeR+0GqU
	HZ1oWO/DkEIO1l74dKNfMlLudBuiGlPP0S9GgFsIuVtZvacorXGPuPQzp2wbXGesrfCU1VOZ7OaQr
	ThSSp5ZkTYOdHb7BjYRlUXlxgyawFJJm+SwgCpfeZAz4Zt4HjN502XqNOhKwbY9XogHr7cCojH+UY
	e+0igyD5hou+GSzhUtLkE/Jo8sg+epgriJdcCN7jTm/FNvqT/jCwyXmKAZZLVxQtXUDHnqL660mMg
	kF7M5iWYX8og9vTQSz+S7luAdsXTQADC09Cu+B7TXnE3lk1kfNdrELul4j/nP3qkfJSjIrdrRoXUQ
	47+bKIYhn1gC+7kbZdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9Io-00000005679-3Kyk;
	Sat, 20 Jul 2024 12:35:06 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sV9Il-0000000565y-0af0
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jul 2024 12:35:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14325E0005;
	Sat, 20 Jul 2024 12:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721478896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AK4VCETAmMQ+8zwCScmQ9NKNWYqofepYSgadFL20MPI=;
	b=U3rmwDQces4t8Oky2CsWzpbNJDwN6SquWJx476mCsR6zVm1AqavuVbCzC/zZ/MLmiX1c7l
	DlFVn4ae05zVm/TslujMxTZes+pdXxYCqKMq+fTygvi4Mm7owPwS6oRdjMqUSeZ1bUW9Si
	SqNUUE9aHdC4cThGSBNYlTq6ZXfbQemxsdfX46L3vMXVVucCqr8P0XaTWlABiCGWoqCgq3
	ZzN8baytRl/dCCkOmZPw/pcOLL7FuZcRMLoCVkYt5yYpeqQSrcjvMcye7MwE/HyL7LnmgD
	C6ny+J0Q+AwJ69bXW697vLjUB9/IUZOc4aBxpLS8VP6bbfbe9kgJLQ47mlJeRg==
Date: Sat, 20 Jul 2024 14:34:52 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, Michael Walle <mwalle@kernel.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.11
Message-ID: <20240720143452.730eb5aa@xps-13>
In-Reply-To: <mafs0bk3bor5s.fsf@kernel.org>
References: <mafs0bk3bor5s.fsf@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240720_053503_864514_27E8CB9C 
X-CRM114-Status: UNSURE (   5.87  )
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

SGkgUHJhdHl1c2gsCgpwcmF0eXVzaEBrZXJuZWwub3JnIHdyb3RlIG9uIEZyaSwgMDUgSnVsIDIw
MjQgMTY6MjE6NTEgKzAyMDA6Cgo+IEhpLAo+IAo+IEhlcmUgYXJlIHRoZSBTUEkgTk9SIGNoYW5n
ZXMgZm9yIHY2LjExLgo+IAo+IFJlZ2FyZHMsCj4gUHJhdHl1c2ggWWFkYXYKClB1bGxlZCBpbiBt
dGQvbmV4dC4gVGhhbmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
