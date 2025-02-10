Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71CB0C0219E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 15:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecVvaVWGiJ8pNrOnLPI9qfLfcCMsqKcEpdZMjPTBVW8=; b=XyGx3qbf0CFO98
	vuS+puInOyqnpzoKOwUKxfDzZuZOLCp1unYZFSDzXMVUEIePxTld4FUkTuqZc1kh8VQtXBtRqJRLd
	gD7KzVO/6zH7PAKg2sbPCGbvzswP2aaD4OMmJartpx2Qzi5Z3CMW5Mm/vFO1FF+tbnwlipQs6YBhx
	k2wrv0vEnlh1KDgNE6ayXbDktmbFO3BdN2eFeIXaJ8eklm1Y+H5vVPQEXScQy6n7t30/sNzSZOZCU
	4VC2pPYWZYI/fEAn6XThHU87imaAEmjAhocJ0c61yte1S9xlTbwwPoEXMKiRSXK8tH11Tv1LulsY3
	dOwEH6aOOs63M+232lrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVtp-00000000LnY-37j2;
	Mon, 10 Feb 2025 15:40:41 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVge-00000000J2K-3Npa
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 15:27:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF459204A1;
	Mon, 10 Feb 2025 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739201221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NfteH80PM3ST7bvqhv9G7FOT+Y/mpIyoF6NjchenmzY=;
	b=GBziaNKFwVWu+pN3NcdtktbCzUqKd/a2TjDy7/Y0bwj6Qj8RVV25qG74q1Yef/oo3wNPUX
	lmBtuKV3O/vjATJvuwo30PFzKTbxX68Ctwn4s4efgfoLQyRDyhukIn0lYHD930GFFd5DZS
	Wgq1kw/pI4CIw5HVPALE/xb/0VFT4nWTUD3DHbq6j1aiEREr9KFtg22LhIy2bx+DVCnwr/
	qNz1Pi+OExJ6Jq5Y8IiUBb8204pLhpRrmQrCdsYNOGyfu/tfbuwomMun0GpVKyja9hL6yV
	R4a5RnNEg1W0qLgOk7cjWrVmiOyIwQ2PPhCfCBefNH+vhWkEo0HxCScv1lT6NQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux@treblig.org,
	Shen Lichuan <shenlichuan@vivo.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	u.kleine-koenig@baylibre.com,
	nirav.rabara@altera.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	niravkumar.l.rabara@intel.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 0/3] mtd: rawnand: cadence: improvement and fixes
Date: Mon, 10 Feb 2025 16:26:53 +0100
Message-ID: <173920118908.61047.14353398163992295945.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250210053551.2399716-1-niravkumar.l.rabara@intel.com>
References: <20250210053551.2399716-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkeegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfeeugfdvffefhfduhfetfffgieeiudeugeffvdehvddvledujeejvedvgfdtvefgnecukfhppeelvddrudekgedrleekrdekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdekgedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigsehtrhgvsghlihhgrdhorhhgpdhrtghpthhtohepshhhvghnlhhitghhuhgrnhesvhhivhhordgtohhmpdhrtghpthhtoheprhhurghnjhhinhhjihgvsehhuhgrfigvihdrtghomhdprhgtphhtthhopehurdhklhgvi
 hhnvgdqkhhovghnihhgsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopehnihhrrghvrdhrrggsrghrrgesrghlthgvrhgrrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_072705_006082_2623A7F4 
X-CRM114-Status: UNSURE (   8.87  )
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

T24gTW9uLCAxMCBGZWIgMjAyNSAxMzozNTo0OCArMDgwMCwgbmlyYXZrdW1hci5sLnJhYmFyYUBp
bnRlbC5jb20gd3JvdGU6Cj4gRnJvbTogTmlyYXZrdW1hciBMIFJhYmFyYSA8bmlyYXZrdW1hci5s
LnJhYmFyYUBpbnRlbC5jb20+Cj4gCj4gVGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIGltcHJvdmVt
ZW50cyBhbmQgZml4ZXMgZm9yIGNhZGVuY2UgbmFuZCBkcml2ZXIuCj4gVGhlIGNoYW5nZXMgaW5j
bHVkZToKPiAKPiAxLiBSZXBsYWNlIGRtYV9yZXF1ZXN0X2NoYW5uZWwoKSB3aXRoIGRtYV9yZXF1
ZXN0X2NoYW5fYnlfbWFzaygpIGFuZCB1c2UKPiAgICBoZWxwZXIgZnVuY3Rpb25zIHRvIHJldHVy
biBwcm9wZXIgZXJyb3IgY29kZSBpbnN0ZWFkIG9mIGZpeGVkIC1FQlVTWS4KPiAyLiBSZW1hcCB0
aGUgc2xhdmUgRE1BIEkvTyByZXNvdXJjZXMgdG8gZW5oYW5jZSBkcml2ZXIgcG9ydGFiaWxpdHku
Cj4gMy4gRml4ZWQgZG1hX3VubWFwX3NpbmdsZSB0byB1c2UgY29ycmVjdCBwaHlzaWNhbC9idXMg
ZGV2aWNlLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoKWzEvM10g
bXRkOiByYXduYW5kOiBjYWRlbmNlOiBmaXggZXJyb3IgY29kZSBpbiBjYWRlbmNlX25hbmRfaW5p
dCgpCiAgICAgIGNvbW1pdDogMmI5ZGYwMGNkZWQ5MTFlMmNhMmNmYWU1YzQ1MDgyMTY2YjI0Zjhh
YQpbMi8zXSBtdGQ6IHJhd25hbmQ6IGNhZGVuY2U6IHVzZSBkbWFfbWFwX3Jlc291cmNlIGZvciBz
ZG1hIGFkZHJlc3MKICAgICAgY29tbWl0OiBkNzZkMjJiNTA5NmM1YjA1MjA4ZmQ5ODJiMTUzYjNm
MTgyMzUwYjE5ClszLzNdIG10ZDogcmF3bmFuZDogY2FkZW5jZTogZml4IGluY29ycmVjdCBkZXZp
Y2UgaW4gZG1hX3VubWFwX3NpbmdsZQogICAgICBjb21taXQ6IGYzN2QxMzViNDJjYjQ4NGJkZWNl
ZTkzZjU2YjlmNDgzMjE0ZWRlNzgKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10
ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhh
dCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
