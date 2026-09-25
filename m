Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30F1C98321
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGJUwbJx/S30MAfhacz3QIzw30Dle1yt9kYe10whYek=; b=wWCHVqGXy4JZ3s
	LiC6hVxttQc2ztOjjJs+9NHf6R5gJrJzuLCZFNG2o/OMNTIpGzH+pnicBVu23vK9w40ECMPLtdK3K
	UaLGfJHSU2Aa6bNt2yoW6GgAPR30ELdEhBv1P8DPYMu+LMEgxLBEvS3Vd/i3clWVcFl7WbXdkK/d7
	sxDuTPYyJgmzrO5rrV2pvbVr2XVswGPiEoyXpjxbRGSMaP3MjOk1wH7AlrVxnewrkAkyIU2RNcFsu
	J77DNegYIh2BXYzp1q2kS+Dl206iryhpSFcDQrLpjx+YYa3Y0ZZMEBmhkJO+tYjcnpGe7nB5SV2e/
	RCCFFDyHUcDbe1PGagmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6v0-0000000DZpw-1gtP;
	Fri, 25 Sep 2026 14:28:54 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6uy-0000000DZmc-10Vr
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:28:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA1704E41074;
	Fri, 25 Sep 2026 14:28:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8DD3B6073B;
	Fri, 25 Sep 2026 14:28:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B98B3102F08C8;
	Fri, 25 Sep 2026 16:28:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=W/+kj95A0keJmlE1z/uE4wA1Qp+xDwWA7rtH1WDrO6I=;
	b=rOZLMA1cTjjK7cKnBvokDQC+LvYEHE1EEnHLZ7WYPOp3whhV6S37HNg4V8UgBqn8GStQ6U
	21bXHf6XNiFcO3X+wPcRefElmWdfibqRPPuEhfDdQTiD+5Y2jHVELnm45LTT7lO34eXg/z
	InV7R+UKswvRBKF5ZTVYVLL68QO9nViZwr7E2Xwi1g1jR2563/n70ep3uJRIErxdXSJOsI
	QRYojsIeqDigvRYY8riPsY291avt8h+oA/PciOz2IpodSbtYsxlIv2OwreDrewj+DRlJ8Y
	89+qJS56c80IfFMR41dG1wgJMBnyRXOf34P6FSFe/0lhlpnHhmRPifzw5K8BOQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: akpm@osdl.org, Wentao Liang <vulab@iscas.ac.cn>
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com, 
 stable@vger.kernel.org
In-Reply-To: <20260917102244.2146654-1-vulab@iscas.ac.cn>
References: <20260917102244.2146654-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: maps: l440gx: Fix double put of the ISA bridge in
 init_l440gx()
Message-Id: <179034652764.1166139.12125541879074181935.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:28:47 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072852_430743_0F9C1B2E 
X-CRM114-Status: UNSURE (   7.63  )
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

T24gVGh1LCAxNyBTZXAgMjAyNiAxMDoyMjo0NCArMDAwMCwgV2VudGFvIExpYW5nIHdyb3RlOgo+
IGluaXRfbDQ0MGd4KCkgdGFrZXMgYSBzaW5nbGUgcmVmZXJlbmNlIG9uIHRoZSBQSUlYNCBJU0Eg
YnJpZGdlIHdpdGgKPiBwY2lfZ2V0X2RldmljZSgpIGFuZCBkcm9wcyBpdCBhZ2FpbiByaWdodCBh
ZnRlciB0aGUgbG9va3VwcywgYmVmb3JlCj4gdGhlIGZsYXNoIHdpbmRvdyBpcyBzZXQgdXAuICBU
aGUgcGNpX2Fzc2lnbl9yZXNvdXJjZSgpIGZhaWx1cmUgcGF0aAo+IHRoZW4gY2FsbHMgcGNpX2Rl
dl9wdXQoKSBvbiB0aGUgc2FtZSBkZXZpY2UgYSBzZWNvbmQgdGltZSwgcmVsZWFzaW5nIGEKPiBy
ZWZlcmVuY2UgdGhhdCBpcyBubyBsb25nZXIgb3duZWQgYW5kIHVuZGVyZmxvd2luZyB0aGUgcmVm
ZXJlbmNlIGNvdW50Lgo+IAo+IFJlbW92ZSB0aGUgZXh0cmEgcGNpX2Rldl9wdXQoKS4KPiAKPiBb
Li4uXQoKQXBwbGllZCB0byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBtYXBzOiBsNDQw
Z3g6IEZpeCBkb3VibGUgcHV0IG9mIHRoZSBJU0EgYnJpZGdlIGluIGluaXRfbDQ0MGd4KCkKICAg
ICAgY29tbWl0OiA1MjFhZDk0OGUwNDkzNGIyZDcwYWU4OTliYzAxNmJiYjM4ODAyZTkwCgpQYXRj
aGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0IGFuZCB3aWxsIGJlCnBh
cnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3QgY29tcGxhaW5zIGJ5IHRo
ZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
