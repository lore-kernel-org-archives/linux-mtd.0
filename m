Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA043C02198
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 19:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnXfE497G/3a1y2+tWVLDpCErgzzpu6WP4fz79S0OlY=; b=EdaEAYlcOSP0IF
	vKBL7i2oJ2M+hzydi1rRpzUGn4reVr8Ukr9R2wAVU008DANX6blD40pZUnGYyCYT7yHiLVO/pkyF5
	a6DdM9KK6XmDOcjvlbv76UfguhhYQLUNTYsCj4PGr0kLBHRI3DCX5C4NtLZZxs7f4Uw8QYEX2hvom
	JAoMdTHmbbgZmvRquKvxiYGTFb+VaaABYMFT7N2gL/oBWE1Zv8TL13/d9+JlQzxxM3GVFp14vIF72
	bKD7hPA/Aao4+LWTOb3PELLmhDemu2r09DHY5rBvQggAl3dIN0IhC0oRTGJXMRlpgHkbFneY4yPSM
	tNtOmDAQ+tZtMYx6FD+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0vL-0000000Fxxi-03zf;
	Fri, 14 Feb 2025 19:00:27 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0NY-0000000Frp3-1Lm1
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 18:25:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 560A544414;
	Fri, 14 Feb 2025 18:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739557529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2RTZUt1Fez8fLySGHYZ7rwtZmq2cugowgiBqVWj1IQ=;
	b=JQ8ZA9a5xrDAF1OoPMDX5TlshSu53HN8BI5VjSKV9m/MdIFHVnv6de0aQWIP7jZhuiT8QF
	rERbiTEolhMmL7UcwPgUtzhc7kygYoC1zGSxyamhoDrXrSIKV0g1Ym0CgnDb2iwJTUeFx4
	G8t02xxj0SK+nqWRNxlJzQzLm3QWreuuyEVa8kPYdQ5Pf7eqR96Xi01kooIJTU3Bzmthyq
	BdTTYSMO/n9jcDnalMzwk1CNsSVRLaEmeaO+xjQjztzHxaW/IfQ04eRqRaoEdQTNfndkSB
	71bnPbXCKY1rKoVedZUk5XZL7gqO3QQAwIyyiEZiTHZzG7s6fiyJSr0chkkvSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	niravkumar.l.rabara@intel.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] add clock-names property to nand node
Date: Fri, 14 Feb 2025 19:25:21 +0100
Message-ID: <173955748391.979249.16358494428797372077.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250212112535.2674256-1-niravkumar.l.rabara@intel.com>
References: <20250212112535.2674256-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeugfdvffefhfduhfetfffgieeiudeugeffvdehvddvledujeejvedvgfdtvefgnecukfhppeelvddrudekgedrleekrdduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdelkedrudeijedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhrrghvkhhumhgrr
 hdrlhdrrhgrsggrrhgrsehinhhtvghlrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnihhrrghvrdhrrggsrghrrgesrghlthgvrhgrrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_102532_514596_55E303FC 
X-CRM114-Status: GOOD (  10.22  )
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

T24gV2VkLCAxMiBGZWIgMjAyNSAxOToyNTozMyArMDgwMCwgbmlyYXZrdW1hci5sLnJhYmFyYUBp
bnRlbC5jb20gd3JvdGU6Cj4gRnJvbTogTmlyYXZrdW1hciBMIFJhYmFyYSA8bmlyYXZrdW1hci5s
LnJhYmFyYUBpbnRlbC5jb20+Cj4gCj4gMSkgRG9jdW1lbnQgdGhlIHJlcXVpcmVkIGNsb2NrLW5h
bWVzIHByb3BlcnR5IGJlY2F1c2UgdGhlIGRyaXZlcgo+ICAgIHJlcXVlc3RzIHRoZSBjbG9jayBi
eSBuYW1lIGFuZCBub3QgdGhlIGluZGV4Lgo+IDIpIEFkZCByZXF1aXJlZCBjbG9jay1uYW1lcyBw
cm9wZXJ0eSB0byB0aGUgbmFuZCBub2RlIGluIGRldmljZSB0cmVlLgo+IAo+IENoYW5nZXMgaW4g
djM6Cj4gICAqIEluY2x1ZGUgbWlzc2luZyBGaXhlcyB0YWcuCj4gCj4gWy4uLl0KClRoZSBmb2xs
b3dpbmcgcGF0Y2ggaGFzIGJlZW4gYXBwbGllZCB0byBtdGQvZml4ZXM6CgpbMS8yXSBkdC1iaW5k
aW5nczogbXRkOiBjYWRlbmNlOiBkb2N1bWVudCByZXF1aXJlZCBjbG9jay1uYW1lcwogICAgICBj
b21taXQ6IDIxMWI4NDFmMzRjY2U2NTIyNThkZGVjN2ZhNDc1MGE3NDhiMjg0NzEKClBhdGNoZShz
KSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBv
ZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbiku
CgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
