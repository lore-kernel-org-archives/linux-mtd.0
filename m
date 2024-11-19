Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF0ED44150
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Nov 2024 12:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhQEjvOmg4CSVF68JX4dUzyu2hqioJpmQppu6msZe7Q=; b=1EjrVDzp1LXayv
	VvmX0nFohb0mXeokOHbIj3PVknLV+Xs5VMA+NZFQcEJ7reMzppkenx6QK2+6uQun98RNPbmMLHJEk
	dm/h5fOWUQjl/TpDtP+YTdhk+WkBApkdS4EL7UPODZtq+TgX82dXKux861wVfQZGJwR/F6QQZYPhZ
	PiS3fBoL+QDQM3x0Ol0snp21Jj0pOSR+hHtSSxDtJgLMEfqTH6NdxhZJlr677ku8IRcNtmuJyeI5F
	yDzOmfLd3UKFe122qWxp3Nhgnjs7DtBMeCyexvanuGyhjmYfzOFD3bU6rpmvUWN3efcIDky6sdhbV
	7+bC/66urfkdfGEtfARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNDY-0000000CLM7-2s82;
	Tue, 19 Nov 2024 12:20:28 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDNDW-0000000CLKR-2eCC
	for linux-mtd@lists.infradead.org;
	Tue, 19 Nov 2024 12:20:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F05D8240005;
	Tue, 19 Nov 2024 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732018822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6Kl17eArBM0EZMPMgm5R/LCZavWU3H9uIUYsEhNJklA=;
	b=lJYOqh03bBvzBLZ4tZLr8cJ2DfzohdBNzn7gwtwNB64Padlc/uKaWZqLole/ahctWJo9fn
	Wrnmrtr+AjV++84vIidrwJpKdKMGIxmdacUBQmIoVbWGASUpcbsOM2wv9a0jqRt1dWqBCL
	w/P8Oh50TqynNbAL8Z7bs7Qw9oUP64apJArzYK8g2ygxzjjEZ67TOnmbWOr9Gi6akgCb8d
	uzB6VscH6u+Fo92j5zhnWuj0hpq0x9ishIW/YOSeXRHDy/a6x8emXx9sqvqc58IekDM9YA
	GhTd9hhWMNQbFB3WchpGGSggenSI1ylmGZRp+hpoCqptthEQyusMe/r95vVv7Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 "open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>, 
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
In-Reply-To: <2d182f21-9766-4c05-8b97-786af69666a0@linaro.org>
References: <2d182f21-9766-4c05-8b97-786af69666a0@linaro.org>
Subject: Re: [GIT PULL] mtd: spi-nor: changes for v6.13
Message-Id: <173201882188.120826.10402782871636263997.b4-ty@bootlin.com>
Date: Tue, 19 Nov 2024 13:20:21 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_042026_802875_9BD9BCF9 
X-CRM114-Status: UNSURE (   6.52  )
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

T24gVHVlLCAxMiBOb3YgMjAyNCAxMTozMjo1NCArMDIwMCwgVHVkb3IgQW1iYXJ1cyB3cm90ZToK
PiBTUEkgTk9SIHY2LjEzIFBSIGluY2x1ZGVzIHRoZSBtdGQvc3BpLW1lbS1zd2FwMTYtZm9yLTYu
MTMgdGFnIHRoYXQKPiBjb250YWlucyBhIHBhdGNoIGZvciBTUEkgTUVNIGFuZCBvbmUgZm9yIHRo
ZSBTUEkgTVhJQyBjb250cm9sbGVyLiBJIGdvdAo+IE1hcmsncyBhcHByb3ZhbCBvbiBxdWV1aW5n
IHRoZW0uCj4gCj4gVGhhbmtzLAo+IHRhCj4gCj4gCj4gWy4uLl0KCk1lcmdlZCBpbnRvIG10ZC9u
ZXh0LCB0aGFua3MhCi0+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvbXRkL2MvMzQyNjdkM2MKCktp
bmQgcmVnYXJkcywKTWlxdcOobAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
