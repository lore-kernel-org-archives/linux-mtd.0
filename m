Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318C1C36008
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Mar 2025 15:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Qm7R5P1YoOv28/FBexJxVcMvZfhCKHX7h7EhtxgssY=; b=Ofgh6gFj6R7erC
	goVt43mOdM5AVisvohCzXN0K2j8hUy2ML5uEZ7Fe/Lzkbs5FZ/0w0nCDWkNt7rOL7wQtY3wibF6BS
	ySc7zKm0l+MeeOpjaRDUj4nhQszX5fuNwAUelYuY4JVTw4CpCFn/xmXYs8/l99Dm2vpWdxPuS4z68
	pi6vaSQI4KRuB2AMZJvDsSq53zFBLyJMJv6RaA2Zck7uLLRJiWgoni0yDhF8IpJf6yoaEWb8Nz2Mn
	dz1P+mhdoQ1n9WN9TcBXMuxeAVkdF1KvHNN6EX50iRUW58B+TEJRRjOEGB1GOXXM/r4tKOewJ/vTF
	IeECqFbxDKeUcF3ZOVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txSTQ-00000008oyq-3VPA;
	Wed, 26 Mar 2025 15:15:20 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txS4d-00000008kKf-0kCF
	for linux-mtd@lists.infradead.org;
	Wed, 26 Mar 2025 14:49:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B70C432EB;
	Wed, 26 Mar 2025 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743000578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BANocZLjlDV8/uTYp9TCbf/5ElQ8CaMKQxWJxwAP4dk=;
	b=LW6QP3il8PmsYf7iO9sdSOqh3v899p3W+wSflWLQEsjv9+HUkjPeMl9aZ21IoOf4dos2zN
	UwGXhgp3uO8wK5SVTm89rV/xdqz/kVjCEIophpqVcUiQTMTZCY6MkeJFEqufW4sjinAaBx
	69HhmCStAk782cdr6fcahYz73zZumTybI0Qmxe903YH5eRbKTZ4wnkF4SZeMqH0NbJQ7ne
	PFZUhsX+FSIhm95MaayEcJ2FYELAaHcQZ7D7Cb5BuO/ccA0vJ4c4i2us23wkw0HsRg4IES
	WT77u4QgNpEPUXeAczt9NJIUcnt0zPOYlV7AOUz5x0ov6wzNa0HqHfDtLMkG+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,  broonie@kernel.org,
  robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  richard@nod.at,  vigneshr@ti.com,  linux-arm-msm@vger.kernel.org,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v15 2/2] spi: spi-qpic: add driver for QCOM SPI NAND
 flash Interface
In-Reply-To: <CAMuHMdUOt8PxbRt-vGfeD5=uEtMVV0TLPUridu=nCkzX9iP24Q@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 26 Mar 2025 15:24:03 +0100")
References: <20250224111414.2809669-1-quic_mdalam@quicinc.com>
	<20250224111414.2809669-3-quic_mdalam@quicinc.com>
	<CAMuHMdUOt8PxbRt-vGfeD5=uEtMVV0TLPUridu=nCkzX9iP24Q@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 26 Mar 2025 15:49:37 +0100
Message-ID: <874izfrgn2.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieehkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgut
 heskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_074943_343561_13E77B3A 
X-CRM114-Status: UNSURE (   6.77  )
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

Cj4+IENoYW5nZSBpbiBbdjExXQo+Pgo+PiAqIENoYW5nZWQgImRlcGVuZHMgb24gTVREIiB0byAi
c2VsZWN0IE1URCIgaW4KPj4gICBkcml2ZXJzL3NwaS9LY29uZmlnIGZpbGUKPgo+IFdoeT8gVGhp
cyBpcyB0aGUgb25seSBkcml2ZXIgdGhhdCBzZWxlY3RzIE1URCBpbnN0ZWFkIG9mIGRlcGVuZGlu
ZyBvbiBpdC4KPgo+PiBDaGFuZ2UgaW4gW3Y3XQo+Pgo+PiAqIE1hZGUgQ09ORklHX1NQSV9RUElD
X1NOQU5EIGFzIGJvb2wKPgo+IFdoeT8gVGhlIGRyaXZlciB1c2VzIE1PRFVMRV8qLCBzbyBhIGph
bml0b3IgbWF5IHJlbW92ZSB0aGUgbGF0dGVyLgoKR29vZCBjYXRjaCwgSSBhZ3JlZSBvbiBib3Ro
IGNvbW1lbnRzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
