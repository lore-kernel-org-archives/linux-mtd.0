Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC634CCFA0D
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Nov 2025 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xb7MNipf0avDYju2F2JMRQTY1AjvKKUv+lIRjp/bA5A=; b=NDbw0weF+QrZzW
	J1vajOexcU2FhKKk5GeTezwpdl4rGZdTQDoe9i9L4dd/CKWMRU2lFRnUBU2m6PHNmtft5Ijuz3h9y
	2RYoxFRt+BuYKQQANrtoYCb3lW9MTOF/FSmSGWogbkrY8+MIolKbLgzNAtwQmnhKwWwqbqWWF7fD0
	eELlZBxAA6N695kJ8V0CFO3QjxcIO84iSJ0L//zkP1of9Ap1TV1TtD6RmJ0wLTuap9MlZJiXIQO7t
	fRxqGCA5XDQIHDSE6Nm4w1Vm6U+7rKn4UPkX/UqlosNVySbwFOY/E7twJUro/D6Xgi9roU0YouROJ
	LFULeCmk76fvNpiKXDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhMX-0000000EBUw-3Za3;
	Wed, 05 Nov 2025 17:32:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhMT-0000000EBUX-3Y8R
	for linux-mtd@lists.infradead.org;
	Wed, 05 Nov 2025 17:31:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2321C1A1871;
	Wed,  5 Nov 2025 17:31:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E550D60693;
	Wed,  5 Nov 2025 17:31:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B97410B5046F;
	Wed,  5 Nov 2025 18:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762363915; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6DsMjnjPhm3brsPt9ZCGpGkglGjc7zDVL11qn07tX8Q=;
	b=kUMlPEXbYh8t1eG6isMDEM8WHOEMkx7ruwtDrHj5hF4Lj5KSce+BixtSgx4LI3k67zfiUi
	x/Ml5kb5FOsm9bDqBigIvdohD2b7m4WRd2WIJSZHpICQjnzsguW0pNh9oRlQziasSvgrOS
	AVG5uXQauQQQOCLi1BNgsHX4kD9TwvFWJQO4bD5eP3u89cZR3Lmeib/E1QBLK2MUDwlw0T
	0Sc2Ox0jENuYfv9NBPQK7p+C+zdHeUG2+rSyTuq6RZO6DdACEAKmuL7wUZUfulhp2B6XAF
	pF84g5x35rLKtTfVr6KvgEAFPYCnbCkqnccreY6YI3go66fenguyUOjPYNRo6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Steam Lin <STLin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH 0/6] Hello,
In-Reply-To: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
	(Miquel Raynal's message of "Wed, 05 Nov 2025 18:26:59 +0100")
References: <20251105-winbond-v6-18-rc1-spi-nor-v1-0-42cc9fb46e1b@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 05 Nov 2025 18:31:53 +0100
Message-ID: <878qgk9yie.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_093158_041064_825E27BF 
X-CRM114-Status: UNSURE (   7.55  )
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

SGVsbG8sCgpPbiAwNS8xMS8yMDI1IGF0IDE4OjI2OjU5ICswMSwgTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cgo+IEhlcmUgaXMgYSBzZXJpZXMgYWRkaW5n
IHN1cHBvcnQgZm9yIDYgV2luYm9uZCBTUEkgTk9SIGNoaXBzLiBEZXNjcmliaW5nCj4gdGhlc2Ug
Y2hpcHMgaXMgbmVlZGVkIG90aGVyd2lzZSB0aGUgYmxvY2sgcHJvdGVjdGlvbiBmZWF0dXJlIGlz
IG5vdAo+IGF2YWlsYWJsZS4gRXZlcnl0aGluZyBlbHNlIGxvb2tzIGZpbmUgb3RoZXJ3aXNlLgoK
Wy4uLl0KClNvcnJ5IGZvciBtZXNzaW5nIHVwIGEgYml0IHRoZSBjb3ZlciBsZXR0ZXIsIEkgZGlk
bid0IHBheSBlbm91Z2gKYXR0ZW50aW9uIG15IGZpcnN0IGxpbmUgZ290IHRha2VuIGJ5IGI0IGFz
IFN1YmplY3QgYW5kIGZvcmdvdCB0byBwdXQgYQpyZWFsIHRpdGxlLgoKU3ViamVjdCBzaG91bGQg
aGF2ZSBiZWVuOgoibXRkOiBzcGktbm9yOiB3aW5ib25kOiBTdXBwb3J0IGZvciBjaGlwcyB3aXRo
IGJsb2NrIHByb3RlY3Rpb24gY2FwYWJpbGl0aWVzIgoKVGhpcyB3aWxsIGJlIGZpeGVkIGluIGNh
c2Ugd2UgbmVlZCBhIHYyLgoKQ2hlZXJzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
