Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E602CCD185
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=055GPl1E3fqBD9n0p4kxwbp0oZiq/EyczIfGnUNN9lc=; b=GDcCTKKTUgMeta
	hqIUfWtxU9vVkKdYgJZjwYf6IokHPHAw4RuvPbhu75rkTnMqrmy0lyXdRQqt1JN/Lzu3PWMRi3ATb
	qNk+E2ZV+3/1pw8OPjlUq1fW5nvXAuIgKV9wGpTWu2q2zhJZwmsVk76Nr05TxoObbOWZ2GX+zln4n
	XqCyrQ9inARncA2Y7EyynX4iE6JU4cononjqdFMznrHds0pheFH5WGAnJwrSvSJrC/6xPNM9TrB4A
	EGuEmsdr+rFDXz9nHE7bimXvjtaOF2PDesq9u0wiLQF0JXkNjuGe2NZ5sHHkpUr6p14affdQGvblh
	vh5ZjkQnRDo6rdHX9KuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HAe-0000000D3RB-2urO;
	Mon, 13 Oct 2025 11:56:56 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HAb-0000000D3QD-2D5D;
	Mon, 13 Oct 2025 11:56:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 843E4C093AA;
	Mon, 13 Oct 2025 11:56:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 640BC606C6;
	Mon, 13 Oct 2025 11:56:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1241A102F225F;
	Mon, 13 Oct 2025 13:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760356607; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=kSqZsCaeyifb+phyADiRq9RCwi01zTsrsstZYJCLh5I=;
	b=FGIlVqU1ARC0txcIqhMgTCjEbnmOVsxYuNtwj3DQgf8sZXgaaZOsT+IH5cYN8NFKOjFq0W
	8tFHXq6dBMsgZuEjA5cKfs8KAtznSjE6zYK2fVYypXpbZY72lOeTXsU9MyXsH4J11LceJs
	qryByDgxrbQ5xXcCBMtpxA5iy3zlB8ubkI5SRUh+Zy8FeDMcpoWK7cDOH81KUy+TC/28vI
	ujo/wDRKpM6yH2Bnljp9vqrHB8lLAEVQpN0G4FLS2WBFnzl3s0qbZyrokDatVIEAKWRJeC
	r7mB0cIXaQF03TFJh+8YEw4lxrZVMZQ82D7MgU9nAr3WF6ML27205iTmBE7pkQ==
Message-ID: <1753a54d-907c-4861-b83b-89a6b77b589e@bootlin.com>
Date: Mon, 13 Oct 2025 13:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
 <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
 <12756400.O9o76ZdvQC@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <12756400.O9o76ZdvQC@jernej-laptop>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_045653_748371_8F289EC3 
X-CRM114-Status: UNSURE (   7.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMTEvMTAvMjAyNSDDoCAxMjoyNywgSmVybmVqIMWga3JhYmVjIGEgw6ljcml0wqA6Cj4gSGks
Cj4gCj4gRG5lIHBldGVrLCAxMC4gb2t0b2JlciAyMDI1IG9iIDEyOjE4OjU2IFNyZWRuamVldnJv
cHNraSBwb2xldG5pIMSNYXMgamUgUmljaGFyZCBHRU5PVUQgbmFwaXNhbChhKToKPj4gTGUgMTAv
MTAvMjAyNSDDoCAxMDo0OSwgS3J6eXN6dG9mIEtvemxvd3NraSBhIMOpY3JpdCA6Cj4+PiBPbiAx
MC8xMC8yMDI1IDEwOjQwLCBSaWNoYXJkIEdlbm91ZCB3cm90ZToKPj4+PiArCj4+Pj4gICAgcHJv
cGVydGllczoKPj4+PiAgICAgIGNvbXBhdGlibGU6Cj4+Pj4gICAgICAgIGVudW06Cj4+Pj4gICAg
ICAgICAgLSBhbGx3aW5uZXIsc3VuNGktYTEwLW5hbmQKPj4+PiAgICAgICAgICAtIGFsbHdpbm5l
cixzdW44aS1hMjMtbmFuZC1jb250cm9sbGVyCj4+Pj4gKyAgICAgIC0gYWxsd2lubmVyLHN1bjUw
aS1oNjE2LW5hbmQtY29udHJvbGxlcgo+Pj4KPj4+Cj4+PiBBbHNvOgo+Pj4gMS4gbWlzc2luZyBu
ZXcgbGluZSAtIHdoeSBkaWQgeW91IHJlbW92ZSBpdD8KPj4+IDIuIEtlZXAgZXhpc3Rpbmcgc3Vu
eGkgcHJlZmVycmVkIG9yZGVyIG9mIGVudHJpZXMuIEluIG90aGVyIHBsYXRmb3JtcyBpdAo+Pj4g
aXMgYWxwaGFudW1lcmljYWwsIG5vdCBuYXR1cmFsLiBJbiBjYXNlIHN1bnhpIHVzZXMgc29tZXRo
aW5nIGVsc2UsIGp1c3QKPj4+IGJlIHN1cmUgeW91IHVzZSBzdW54aSBvcmRlci4KPiAKPiBTdW54
aSBvcmRlciBpcyBmcm9tIG9sZGVzdCBnZW5lcmF0aW9uIHRvIG5ld2VzdCBhbmQgdGhlbiBhbHBo
YWJldGljYWxseQo+IGJ5IHNvYyBuYW1lLgo+IAo+IFRoaXMgaXMgYWxyZWFkeSBjb3JyZWN0bHkg
b3JkZXJlZC4KT2suCgpUaGFua3MhCgo+IAo+IEJlc3QgcmVnYXJkcywKPiBKZXJuZWoKPiAKPj4g
b2ssIG1ha2Ugc2Vucwo+Pgo+PiBUaGFua3MhCj4+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzLAo+Pj4g
S3J6eXN6dG9mCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
