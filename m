Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB356F41819
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2026 17:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8ei62fcVCcubYWNezaTxEpdTB05sFEA9sYtPlFjsjY=; b=R3W/1srWeaRqpa
	sxuOa769XL+eM4NMkZTMFmBVdLRY/EONnh/zabTWeUTuDxcx1JoNaT9UKC9WzB6HMoi96pqZaBYC5
	pQE7uSvJAX2HjRZjEse5Eppii38vq6sPG2U38L1fBgh98cqoO1II+9b7Ajo4Cwr5BZW3g1rYF2B1x
	1Dj3D2JWoYz1EuY5DiHkvlnKNz6vQv3OTMnPMGrglpgsgg3q38qD9iwAkReZHfPC310hZ3RBSfFv0
	dpTuNIpFNdbFmKLGYShQ+rhD7AHboahOXmu/E596Ln7gfzz13Wiy2ViCNqkm3FFnCay4LrLhYRtCd
	a+IdwLFafgV2treyzFxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vze14-00000007mhQ-2lSD;
	Mon, 09 Mar 2026 17:03:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vze11-00000007mg7-2flH
	for linux-mtd@lists.infradead.org;
	Mon, 09 Mar 2026 17:03:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD5E31A2CF8;
	Mon,  9 Mar 2026 17:03:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97EE95FFB8;
	Mon,  9 Mar 2026 17:03:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7E6A10369820;
	Mon,  9 Mar 2026 18:03:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773075812; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a0ANqTqSXTqDV3jREv3lQZk2+0Yu8cvVpizEo4IZBWA=;
	b=y3A5iDFs/YaYIeaCg1ipbWbVlahMGpw2BKY4n1BVS1tlJaP/pg0IldPatQgcT2sjnOASXT
	EDyqiJN9rYfFedAVJIpvM88wHl8GiJS5xPxm5D1eWgpGsiFwbP1cM4uccccsMTnlbfLLw2
	sIhqYsM76QVQv74PM/BHsVaNSACaDG602s1BqH0penRtICX1ZP91KaKBZ7XPNyiURpM4Gm
	isR0FjscNI8TEhStJa2eyLEHmNBtWynZVsbdPchksgRfi0fZuN9LlkbpTssonYKc8By7Te
	RipidXTRFbZtUZI9Ev12sOrtgJ4vWSmOfkcqnkX4YxVWKjrCTpF9WJRz1G+ujA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Mikhail Kshevetskiy
 <mikhail.kshevetskiy@iopsys.eu>,  Pablo Martin-Gomez
 <pmartin-gomez@freebox.fr>,  Tianling Shen <cnsztl@gmail.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v8 0/3] mtd: spi-nand: Add support for randomizer feature
In-Reply-To: <20260305071042.1193522-1-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Thu, 5 Mar 2026 15:10:39 +0800")
References: <20260305071042.1193522-1-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 09 Mar 2026 18:03:23 +0100
Message-ID: <87y0k1lyuc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_100335_805270_07DA52CA 
X-CRM114-Status: GOOD (  10.80  )
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

SGVsbG8gQ2hlbmcgTWluZywKCk9uIDA1LzAzLzIwMjYgYXQgMTU6MTA6MzkgKzA4LCBDaGVuZyBN
aW5nIExpbiA8bGluY2hlbmdtaW5nODg0QGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZyb206IENoZW5n
IE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4KPiBUaGlzIHBhdGNoIHNlcmll
cyBpbnRyb2R1Y2VzIHJhbmRvbWl6ZXIgc3VwcG9ydCBmb3IgU1BJIE5BTkQgZGV2aWNlcy4KPgo+
IC0gUGF0Y2ggMTogYWRkIHRoZSBuYW5kLXJhbmRvbWl6ZXItZW5hYmxlIGFuZCBuYW5kLXJhbmRv
bWl6ZXItZGlzYWJsZQo+ICAgICAgICAgICAgYm9vbGVhbiBwcm9wZXJ0aWVzIHRvIHRoZSBnZW5l
cmljIG5hbmQtY2hpcC55YW1sIGJpbmRpbmdzLgo+IC0gUGF0Y2ggMjogYWRkIHRoZSBpbml0aWFs
aXphdGlvbiBsb2dpYyBhbmQgdGhlIHNldF9yYW5kb21pemVyIGNhbGxiYWNrCj4gICAgICAgICAg
ICB0byB0aGUgY29yZSBmcmFtZXdvcmsuIFRoZSBjb3JlIHdpbGwgbm93IHBhcnNlIHRoZSBkZXZp
Y2UgdHJlZQo+ICAgICAgICAgICAgcHJvcGVydGllcyBhbmQgZW5hYmxlIG9yIGRpc2FibGUgdGhl
IHJhbmRvbWl6ZXIgYWNjb3JkaW5nbHkKPiAgICAgICAgICAgIGR1cmluZyBzcGluYW5kX2luaXQu
Cj4gLSBQYXRjaCAzOiBpbXBsZW1lbnQgdGhlIHNldF9yYW5kb21pemVyIGNhbGxiYWNrIHNwZWNp
ZmljYWxseSBmb3IgTWFjcm9uaXgKPiAgICAgICAgICAgIGNoaXBzIChNWDM1TEYvVUYgc2VyaWVz
KSB0byBoYW5kbGUgdGhlIHZlbmRvci1zcGVjaWZpYyByZWdpc3Rlcgo+ICAgICAgICAgICAgb3Bl
cmF0aW9ucy4KCk1URCBwYXJ0IExHVE0uIExldCdzIHNlZSBpZiB0aGUgZHQtYmluZGluZyBhcmUg
b2ssIHRoZXkgbG9vayBmaW5lLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
