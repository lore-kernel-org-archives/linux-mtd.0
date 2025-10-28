Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6B1CCF9E0
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Oct 2025 16:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dywj3Y/KqgEvpwz2ekIfMq7wk1eAGgX/QmfFhgpAbCA=; b=BAsRLAO5SN3fqF
	cPQBSBTpdxOIsni7YRHsaUqrUxVWLXU+5VfR+JgCEFBzFNWmKxQptqRVDm2qvVk4ZjDTVlVsKdwXT
	5fyutFtIXxVTHv0R4RHa37qE4Iv4JCcwQtD6LgFEJi6u2AlVowNdB+OvJkmoRoI0wrXMoSlK04dnt
	MAUkO06rPZHF1lU4JMfjeWMZv2SS8LfCPKSTRMVyUcHeOygK56gn3gHDbQgFJcTP3W2e0rWeGYHQs
	PHklyx/bTL1f7rcPGNW3BNaib2oUCEGykb2WfF5d/L+z7xRGQgby108uiKRxswZSfSn61hISHOwZP
	Qk/mJqEPx2GqWRzalxiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmTc-0000000GJSE-0JNB;
	Tue, 28 Oct 2025 16:23:16 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmTZ-0000000GJRL-1QEo
	for linux-mtd@lists.infradead.org;
	Tue, 28 Oct 2025 16:23:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD5031A170E;
	Tue, 28 Oct 2025 16:23:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 958E4606AB;
	Tue, 28 Oct 2025 16:23:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D24BA117AC5D9;
	Tue, 28 Oct 2025 17:23:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761668590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=39Q4QJAbuaHwdppokZlTMSHTUZpVg9kkFS9isAIE9G0=;
	b=ldOj4Yzdmox9S8RzQVtCR1Pl/eps9aaUcg+kOLQRCh6F0fGqutlY7MBEcwLDtqX2WSMAyn
	BWbNdnoXCq/KnEmVcfE0C2IJB8DaED/lNqryn8HTZ9rJDwg6212YWyqrHBczBgelTiSWE+
	JilJPeNXAYSCN59mw8RLo9MbNd/wgh8A1UDKzdBX7+vqOCnLQAOcjS+6stgVBMqJeKLUye
	VG3ow2UkTPfMF+/UCPxrY53QKtuHESI6Ggky06v2QvN13H2LQ+jnefQyi91tw2NZCb7hyD
	/Cl2bBeT8MaT9kEDLU63bN//W3k7IFey7jBOuiQC8yIUr+WkDYlqO0WOulL6Jg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] Introduce Allwinner H6/H616 NAND controller support
Date: Tue, 28 Oct 2025 17:23:02 +0100
Message-ID: <176166832292.369296.13474664579564092602.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092313_510660_D38439BB 
X-CRM114-Status: GOOD (  10.43  )
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

T24gVHVlLCAyOCBPY3QgMjAyNSAwODozNDo1MyArMDEwMCwgUmljaGFyZCBHZW5vdWQgd3JvdGU6
Cj4gVGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlIEg2L0g2MTYgTkFORCBjb250cm9sbGVyIHN1
cHBvcnQgKGJ1dCBub3QgeWV0Cj4gdGhlIERNQS9NRE1BIHBhcnQpLgo+IAo+IEFsbCB0aGUgd29y
ayB3YXMgZG9uZSBvbiBhIEg2MTYgYm9hcmQgd2l0aCBhIEtpb3hpYSBUQzU4TlZHMVMzSFRBMDAg
TkFORAo+IGNoaXAuCj4gRUNDIGlzIHN1cHBvcnRlZCwgYXMgd2VsbCBhcyBzY3JhbWJsaW5nLgo+
IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG5hbmQvbmV4dCBhZnRlciBmaXhpbmcgdGhlIExpbmtzOiwg
dGhhbmtzIQoKWzAxLzE2XSBkdC1iaW5kaW5nczogbXRkOiBzdW54aTogQWRkIEg2MTYgY29tcGF0
aWJsZQogICAgICAgIGNvbW1pdDogN2M5OTc0M2EwYjEwZDE4YWJlNjg5NWMwMTg0M2FhNWQ3Zjhh
MmE2ZgpbMDIvMTZdIG10ZDogcmF3bmFuZDogc3VueGk6IFJlbW92ZSBzdXBlcmZsdW91cyByZWdp
c3RlciByZWFkaW5ncwogICAgICAgIGNvbW1pdDogZGVhYTc3ZWQ2NmJmNmVkMWY3YzA2YzE4M2Jk
N2E1YmMwZDkzMWM2MgpbMDMvMTZdIG10ZDogcmF3bmFuZDogc3VueGk6IFJlcGxhY2UgaGFyZCBj
b2RlZCB2YWx1ZSBieSBhIGRlZmluZQogICAgICAgIGNvbW1pdDogMWJlN2FjNzhiNzJmMjVlMGUy
YWUyMjg4OTQ0ZGEzMWQwOGVkYzJmNgpbMDQvMTZdIG10ZDogcmF3bmFuZDogc3VueGk6IG1vdmUg
RUNDIHN0cmVuZ2h0cyBpbiBzdW54aV9uZmNfY2FwcwogICAgICAgIGNvbW1pdDogOTRkYzA4YWRh
ZjkyN2I4YTFkNGRlNjA2MDU1Y2YxYTljNzI1NjQyNQpbMDUvMTZdIG10ZDogcmF3bmFuZDogc3Vu
eGk6IGludHJvZHVjZSByZWdfZWNjX2Vycl9jbnQgaW4gc3VueGlfbmZjX2NhcHMKICAgICAgICBj
b21taXQ6IDRhM2EwNTY4MTQzMmM0YTNiZjlmN2FmM2M4MTNiYWYzM2JiMTQzZTgKWzA2LzE2XSBt
dGQ6IHJhd25hbmQ6IHN1bnhpOiBpbnRyb2R1Y2UgcmVnX3VzZXJfZGF0YSBpbiBzdW54aV9uZmNf
Y2FwcwogICAgICAgIGNvbW1pdDogZjUzYzc0ZDA1Nzc0MjZiY2Y2MDRkZDJmMDg3ZGE4MTI4MTJh
NjUzOApbMDcvMTZdIG10ZDogcmF3bmFuZDogc3VueGk6IHJld29yayBwYXR0ZXJuIGZvdW5kIHJl
Z2lzdGVycwogICAgICAgIGNvbW1pdDogNmZjMjYxOWFmMWViNmY1OTk0YTI3ZTg2MTdhYzA5MTFj
ZGJhODFiOApbMDgvMTZdIG10ZDogcmF3bmFuZDogc3VueGk6IGFkZCBoYXNfZWNjX2Jsb2NrXzUx
MiBjYXBhYmlsaXR5CiAgICAgICAgY29tbWl0OiA4YzFiMjhhYjNlNGVjOGQ3MDljNDc5MjhlMWU2
ZWNhZWU4NzNkNzRiClswOS8xNl0gbXRkOiByYXduYW5kOiBzdW54aTogaW50cm9kdWNlIGVjY19t
b2RlX21hc2sgaW4gc3VueGlfbmZjX2NhcHMKICAgICAgICBjb21taXQ6IGQyMWI0MzM4MTU5ZmY3
ZDc5NmUwYzgwOWEyOWQzNDI1YjI4NjQxMTUKWzEwLzE2XSBtdGQ6IHJhd25hbmQ6IHN1bnhpOiBp
bnRyb2R1Y2UgcmFuZG9tIGVuL2RpciBpbiBzdW54aV9uZmNfY2FwcwogICAgICAgIGNvbW1pdDog
MTM0MGZhODcyMTAyY2Q3ZWViZGNjMzU4OTY1MzgxZDU5Mjg4MDNjMApbMTEvMTZdIG10ZDogcmF3
bmFuZDogc3VueGk6IGludHJvZHVjZSByZWdfcGF0X2lkIGluIHN1bnhpX25mY19jYXBzCiAgICAg
ICAgY29tbWl0OiBlZTYxYmJhNGVlN2NhNmE4NjJlYzhjOGU3NmIyMDUxNjA2ZjI1ZTk3ClsxMi8x
Nl0gbXRkOiByYXduYW5kOiBzdW54aTogaW50cm9kdWNlIHJlZ19zcGFyZV9hcmVhIGluIHN1bnhp
X25mY19jYXBzCiAgICAgICAgY29tbWl0OiA2MjA4Mjc0ZDBhMjdiODFhZTU0MjVjODE5ODEwZmNk
N2JmODk2MzZhClsxMy8xNl0gbXRkOiByYXduYW5kOiBzdW54aTogaW50cm9kdWNlIGVjY19lcnJf
bWFzayBpbiBzdW54aV9uZmNfY2FwcwogICAgICAgIGNvbW1pdDogOTdkMTNiY2VhMjMwNmY0N2Q1
ZTU0ZTVhMzQ3ZDVjYTU4MTdkZWIwZApbMTQvMTZdIG10ZDogcmF3bmFuZDogc3VueGk6IGludHJv
ZHVjZSBzcmFtX3NpemUgaW4gc3VueGlfbmZjX2NhcHMKICAgICAgICBjb21taXQ6IDVkZGZiYzY4
ZWM3YWM5MmZmNjRkODQyMDkwOWIxMjU4YmUzY2E4YTEKWzE1LzE2XSBtdGQ6IHJhd25hbmQ6IHN1
bnhpOiBBZGQgc3VwcG9ydCBmb3IgSDYxNiBuYW5kIGNvbnRyb2xsZXIKICAgICAgICBjb21taXQ6
IDg4ZmQ0ZTRkZWFlODdmYTY2ZTBlMDBlMmJmNmE0YzM2MmQyNDEyMTUKClBhdGNoZShzKSBzaG91
bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUg
bmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5k
IHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
