Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD18DCE7A81
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Sep 2023 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7j+SLFKUvvlUljiykOshY/6ibYneE+SL8pW7yzqQ6YM=; b=FXmEglGv0nh6ZR
	l8guNWkwt/pR9E/YTMCZkUor734TnZviyXDubTxB0uvmq8T0Kj7tYqR9IcJkkhAwr2VuFeR5mP6Kz
	nVxkdthiTDtvrMAHx9Atx7LvrrHhbO2TurnHCPH9xJZHWoixtFt8zjiZxQu71FmSIkQ3S/q9Y+znJ
	D7dXTRM3CnLIb0Exf6yWONQOu5fJm8k1ws57veZ0M6kOvtvzBglHufkrkknwKN3XJXB0oqe+OxpcK
	RytpW/A3oFonKvtecZNy4Zwb85c97JUGxKXRCfxvP7tTfckFNZ50jMhnAoc3+WrM/fX/Z3upmxWBR
	imVALvQOlmP2xWTskRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qknAh-00EVPU-1I;
	Mon, 25 Sep 2023 15:06:51 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qknAe-00EVOr-11
	for linux-mtd@lists.infradead.org;
	Mon, 25 Sep 2023 15:06:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6555FFF803;
	Mon, 25 Sep 2023 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695654405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rx/EG4jd4jHL2lV5ytyB7NVrkU81Ryi4t8x6wQD0E/E=;
	b=HsdV5A7S5Cgx7iUEk3lGCspxarqh1ho6CpXYqe/XNNmsKYYGuLVxCixkU9gbapjj4FzsMb
	SUE+yJ3BxURbBBgiCRzCdLACu4dQbvSDPNd4nB0hofgVbjzpiZYyMU6TmqRpAbtJFvLU3T
	3f/pGSp6GtmFp/WN2HfSL7p7k2727RHv3pQFXe71L/X+Y3tohV/3qBMNT9LnlXGqPPG6vN
	ZjQYgJNTBURvL+ONmsaAcNsYa8tOT6vQRoE0uStY/dm5J6/d1WSPI1yRQrB0700uTkNUgL
	jrqJkmxuXFA0z0pHXddE3UsglfFXUU4xOEHu4pO+0R02Ts8EuM4fYxvETQB50A==
Date: Mon, 25 Sep 2023 17:06:42 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: ZhaoLong Wang <wangzhaolong1@huawei.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, chengzhihao1 <chengzhihao1@huawei.com>, yi
 zhang <yi.zhang@huawei.com>, yangerkun <yangerkun@huawei.com>
Subject: Re: [RFC] mtd: Fix error code loss in mtdchar_read() function.
Message-ID: <20230925170642.089e543b@xps-13>
In-Reply-To: <488305749.81257.1695653971403.JavaMail.zimbra@nod.at>
References: <20230923005856.2538223-1-wangzhaolong1@huawei.com>
	<1131184426.81026.1695650583370.JavaMail.zimbra@nod.at>
	<20230925163727.7ecebe9a@xps-13>
	<488305749.81257.1695653971403.JavaMail.zimbra@nod.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_080648_654161_43507B64 
X-CRM114-Status: GOOD (  14.83  )
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

CnJpY2hhcmRAbm9kLmF0IHdyb3RlIG9uIE1vbiwgMjUgU2VwIDIwMjMgMTY6NTk6MzEgKzAyMDAg
KENFU1QpOgoKPiAtLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJNaXF1
ZWwgUmF5bmFsIiA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gIAo+ID4+IEdpdmVuIHRoaXMg
YSBzZWNvbmQgdGhvdWdodC4gSSBkb24ndCB0aGluayBhIE5BTkQgZHJpdmVyIGlzIGFsbG93ZWQg
dG8gcmV0dXJuCj4gPj4gbGVzcyB0aGFuIHJlcXVlc3RzIGJ5dGVzIGFuZCBzZXR0aW5nIEVCQURN
U0cuCj4gPj4gVUJJJ3MgSU8gcGF0aCBoYXMgYSBjb21tZW50IG9uIHRoYXQ6Cj4gPj4gCj4gPj4g
ICAgICAgICAgICAgICAgIC8qCj4gPj4gICAgICAgICAgICAgICAgICAqIFRoZSBkcml2ZXIgc2hv
dWxkIG5ldmVyIHJldHVybiAtRUJBRE1TRyBpZiBpdCBmYWlsZWQgdG8gcmVhZAo+ID4+ICAgICAg
ICAgICAgICAgICAgKiBhbGwgdGhlIHJlcXVlc3RlZCBkYXRhLiBCdXQgc29tZSBidWdneSBkcml2
ZXJzIG1pZ2h0IGRvCj4gPj4gICAgICAgICAgICAgICAgICAqIHRoaXMsIHNvIHdlIGNoYW5nZSBp
dCB0byAtRUlPLgo+ID4+ICAgICAgICAgICAgICAgICAgKi8KPiA+PiAgICAgICAgICAgICAgICAg
aWYgKHJlYWQgIT0gbGVuICYmIG10ZF9pc19lY2NlcnIoZXJyKSkgewo+ID4+ICAgICAgICAgICAg
ICAgICAgICAgICAgIHViaV9hc3NlcnQoMCk7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAg
ZXJyID0gLUVJTzsKPiA+PiAgICAgICAgICAgICAgICAgfSAgCj4gPiAKPiA+IEludGVyZXN0aW5n
LiBTaGFsbCB3ZSBhZGQgdGhpcyBjaGVjayB0byB0aGUgbXRkX3JlYWQoKSBwYXRoIGFzIHdlbGw/
Cj4gPiAKPiA+IE1heWJlIHdpdGggYSBXQVJOX09OKCk/ICAKPiAKPiBXQVJOX09OX09OQ0UoKSwg
cGxlYXNlLiBCdXQgeWVzLCBsZXQncyBhZGQgaXQuCgpaaGFvbG9uZywgY2FuIHlvdSB0YWtlIGNh
cmUgb2YgaXQ/Cgo+IAo+IFRoYW5rcywKPiAvL3JpY2hhcmQKCgpUaGFua3MsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
