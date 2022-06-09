Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8418C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Z3XRzGeX6DhKcBZkitioT491LP2jX6f1KTDRyiTNp8=; b=v728YqLcFFBV3Z
	nd1anhXPmdXaZinnrlVb74uSYJmNMDrCS6hL2P25kmi/mWsuNTZToFVCmdojydEonyJ0RtKqvtY9e
	but84UJwBCuGIicpu61h3zX50mkzV0GbP9vsd8BcCMA2y68PQy/krxzHX2Dw3rBn2YT32SbP6jqvy
	Lz+UoyI4sLRDRQT2fDF18zcxg3SE99yp21+qfrdAfgIZuHVtvzXK6g34ELeftYjED7zCRHEyUQgPf
	O+8/0i8whIPqK/vFv59Olzz9nwwWt5Al3tJwWwkKaC0gNr3IHt2qVEJgNlpYGUNbCsQuk+f50zYse
	THayhLCFdZSJgVWcHx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHua-0020Hr-6k; Thu, 09 Jun 2022 13:09:20 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHuO-0020B6-Qu
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 13:09:10 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 38EDD1BF20D;
	Thu,  9 Jun 2022 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654780147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cu0y7oQ2vHcP/y8NNS81XbvFLu+/x/uT3uP8zYZSXa8=;
	b=XXrkbjf2wBMMejW/6fIT2lORUjwp5oFIbuGDYgush3QFZ0xviOM3DWZqGeCFYXg6v3yrpq
	nyr3pX5pXBUpxw7ag6QciXK4uM+KQC+BKv30fZ7HVMQt/u2axECZAFymI5SvHELmj8udNL
	rSJ+GMtqeIlnKQigLpWNe9g3IWfX33MDLa3iMh8v8MqU9JoNA1K1LT2WlISNnCG9xEDbi+
	3oYZLRNyo3a9CWiASrpwBIFdLTQIp5R75va/RvhFuwTigyNFhrty8G0IDUgB5M4BjVuTWM
	/mr8PcUsnXHMO46NzVvB6W7SpxYhL5UEeq521TOEY4PYcf9lBbUjpk7rO8WxhQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arvind Yadav <arvind.yadav.cs@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	kernel@pengutronix.de
Subject: Re: [PATCH 1/4] mtd: st_spi_fsm: Add a clk_disable_unprepare() in .probe()'s error path
Date: Thu,  9 Jun 2022 15:09:05 +0200
Message-Id: <20220609130905.293042-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607152458.232847-2-u.kleine-koenig@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'28607b426c3d050714f250d0faeb99d2e9106e90'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060909_154909_33D23DC0 
X-CRM114-Status: UNSURE (   8.30  )
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

T24gVHVlLCAyMDIyLTA2LTA3IGF0IDE1OjI0OjU1IFVUQywgPT91dGYtOD9xP1V3ZV9LbGVpbmUt
Sz1DMz1CNm5pZz89IHdyb3RlOgo+IEZvciBhbGwgYnV0IG9uZSBlcnJvciBwYXRoIGNsa19kaXNh
YmxlX3VucHJlcGFyZSgpIGlzIGFscmVhZHkgdGhlcmUuIEFkZAo+IGl0IHRvIHRoZSBvbmUgbG9j
YXRpb24gd2hlcmUgaXQncyBtaXNzaW5nLgo+IAo+IEZpeGVzOiA0ODE4MTVhNjE5M2IgKCJtdGQ6
IHN0X3NwaV9mc206IEhhbmRsZSBjbGtfcHJlcGFyZV9lbmFibGUvY2xrX2Rpc2FibGVfdW5wcmVw
YXJlLiIpCj4gRml4ZXM6IDY5ZDVhZjhkMDE2YyAoIm10ZDogc3Rfc3BpX2ZzbTogT2J0YWluIGFu
ZCB1c2UgRU1JIGNsb2NrIikKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgoKQXBwbGllZCB0byBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0IG10ZC9uZXh0LCB0
aGFua3MuCgpNaXF1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
