Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CBDC19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 08:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y34aAu8gg/a+nRditx8FIwzmDw0hI7GA/5qvGUlOcwQ=; b=aYh90xXZez9bVu
	umY5FmE/br+hELdHK9rX5h1I3li8/VpZ+CaBq1ZfTrIkosx31ldAambMo7MhLBI2sS8Ye64gr637D
	NqVAEMI+vS2lRHncOjfY19mJccpa0aPsuz1lxsb371GQg1BJctazhgMvNzunWFzakEOoBseeEVKip
	FZA2d0OksXJhAmMV4wPVFpDwGp1fw1M4m2ZbGbqrsWisCPINzw+Qgs/M+29RIjSoNM+S/8PvMoRvo
	G9NJoSYgz+Kl/B61zL52udY86ybimxQUZPUWpK9Gqi0zxhfGJoub3NLXHmy7MBdnviyE1dplGtQiP
	XGT4VGBCCKOXTADd1d7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSyk-0000000DYN8-3UwW;
	Fri, 07 Mar 2025 08:22:46 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqSyh-0000000DYMg-0zmt
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 08:22:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C98D443C4;
	Fri,  7 Mar 2025 08:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741335760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwokADQwoB6/27mEXv+drkcP5cM8HPpvh5R2RnDMhSU=;
	b=d7TLp2+tZrbmUG2iBgUYdDsQSDHPhwgBK9RLv48OoZ1h8hiPBfZS5WEwQyYxyVj49nD7wc
	mgOWOTVAmjDrYTW4nYK/J02zA0zaQhTfSj8wIz7O92CtJpX6OTXvkRFdwr5wYwiRjUErVi
	8GteliTw+2v0BwKNRBM2eHSlZQv+MEM3ejrX6IYmLznGCFKZWOOJkQ01/zNr+rWOzWyQcP
	+JIQoqGsMpXAavJUZ+iqrsuln+zCjBjeSEWDrFb6B7qox5exjuuM1C2y0UpxsUmjD+3RPZ
	b2yqctP6/+4LfRmoI8EmquCw8EpWyLCtkYBY19G5eU/Ebck92iiXj6YKpvel0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: explicitly include
 <linux/mod_devicetable.h>
In-Reply-To: <20250307-spi-nor-headers-cleanup-v1-2-c186a9511c1e@linaro.org>
	(Tudor Ambarus's message of "Fri, 07 Mar 2025 09:09:06 +0200")
References: <20250307-spi-nor-headers-cleanup-v1-0-c186a9511c1e@linaro.org>
	<20250307-spi-nor-headers-cleanup-v1-2-c186a9511c1e@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Mar 2025 09:22:37 +0100
Message-ID: <875xkltfle.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddujeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddujeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepthhuughorhdrrghmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepphhrrghthihushhhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmfigrlhhlvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_002243_408875_24C5A8F9 
X-CRM114-Status: UNSURE (   7.44  )
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

SGVsbG8gVHVkb3IsCgpPbiAwNy8wMy8yMDI1IGF0IDA5OjA5OjA2ICswMiwgVHVkb3IgQW1iYXJ1
cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKCj4gVGhlIGNvcmUgZHJpdmVyIGlz
IHVzaW5nICdzdHJ1Y3Qgb2ZfZGV2aWNlX2lkJyBhbmQgcmVsaWVzIG9uIGltcGxpY2l0Cj4gaW5j
bHVzaW9uIG9mIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4sIHdoaWNoIGNvbWVzIGZyb20KPiA8
bGludXgvb2ZfcGxhdGZvcm0uaD4uCgpJdCBpcyBhY3R1YWxseSBpbmNsdWRlZCBmcm9tIG9mLmgg
bm93IChzaW5jZSBwYXRjaCAxKSBhbmQgSSB3b25kZXIKd2hldGhlciB0aGVyZSBpcyBhIG5lZWQg
Zm9yIGl0IHRvIGJlIGluY2x1ZGVkIGV4cGxpY2l0bHkuIEFzIGEgdXNlciBpdApmZWVscyBsaWtl
ICJvZi5oIiBzaG91bGQgYWxyZWFkeSBpbmNsdWRlIHdoYXRldmVyIGlzIG5lZWRlZCBmb3IgdXMg
KGFuZAppdCdzIHRoZSBjYXNlKS4gTG9va2luZyBhdCB0aGUgbnVtYmVycywgYWJvdXQgMjUlIG9m
IHRoZSBkcml2ZXJzIGRvCmluY2x1ZGUgaXQgZXhwbGljaXRseS4gQnV0IGVpdGhlciB3YXlzIEkn
bSBmaW5lLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
