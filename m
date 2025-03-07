Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7EAC28B23
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qt4qbvFpGVFcvNWRVCVhzAs7owHVemzii3gHt2p6Zs=; b=ql/VRTxc4Za1+c
	b4hdTYQdePn6XYmcx+aTrAQkP/PN13kzeqD4LT5WxqLhIeqv5PO51fEXYam8Kqv5F7I0mOImoYotn
	pYIg07UI/5T26LxCCz7u0QYSy3DYQ43LsROVtFaIYiWTSFO4AtiJhEQUdADPpMGcsN4XEGHFdcSEw
	j/xtwbHRu3IuX8r1bNvlAEPS6Q0LZDuuthvkGy/s6WnZ2ysX86pKs1yktSbnFfriwA+NI+NjM9NwO
	Hy1lStc82AKPNaayAyCCCncg/NyDT+4SDeU74GEz1L2IOsqdXisLLs2/zOH4lLf3rvosM3CEZ3I0U
	QpJmWJOkT0gGgzHYIiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZz0-0000000Elar-1UTq;
	Fri, 07 Mar 2025 15:51:30 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqZsu-0000000EkLK-1n70
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 15:45:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DDBA443B4;
	Fri,  7 Mar 2025 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741362310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6OjuWZXi6cWhgssI2+VsPPFlins6SAB/6GLoccrMh4c=;
	b=gd5HiUh2uWuQrp2x1ZoVKEQF8UqNMs7UrM8oYx9boARoxCDMuFGa9hYTkoYypch+e3fhf3
	LB8i1kNLhzTOwkeWxJ+kXoY7gA1Vkvh1zCwI8G4aDdnBnjDPgWsQfyoy5raQMx48he/MvG
	4WQTa3jO01616/0wA6AaxBU698Ys7qiqYSgJYcmTF43Djchk1BmPP3ZX1ExpkdfFOqfsAa
	1fvBDFiJm5CHpf7TpJIBZAT3PI9rtEW+r8xtaXl8cQdtEXPmV7UlSth9anaEbgWqxJKhjG
	q60D7nh01Mr2n8nNXKPbrDLAff6wcnT+nIgdtsDci81sdoVEGawJwHWeOoz6JQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <michael@walle.cc>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin <stlin2@winbond.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/21] mtd: spinand: Use more specific naming for the
 reset op
In-Reply-To: <9004166e-5535-4024-8114-9fdb217407bb@linaro.org> (Tudor
	Ambarus's message of "Fri, 7 Mar 2025 15:38:45 +0000")
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
	<20250307-winbond-6-14-rc1-octal-v1-1-45c1e074ad74@bootlin.com>
	<9004166e-5535-4024-8114-9fdb217407bb@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 07 Mar 2025 16:45:02 +0100
Message-ID: <87v7skrgjl.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddutdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddujeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddujeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepshdqkheisehtihdrtghomhdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtp
 dhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhtlhhinhdvseifihhnsghonhgurdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_074512_618325_0C052874 
X-CRM114-Status: GOOD (  11.74  )
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

SGkgVHVkb3IsCgo+PiAtI2RlZmluZSBTUElOQU5EX1JFU0VUX09QCQkJCQkJXAo+PiArI2RlZmlu
ZSBTUElOQU5EX1JFU0VUXzFTXzBfMF9PUAkJCQkJCVwKPiBIaSwgTWlxdWVsLAo+Cj4gSGF2ZSB5
b3Ugc2VlbiBhbnkgcmVzZXQgb3Agd2l0aCBhZGRyZXNzIG9yIGRhdGE/IElmIG5vdCwgSSdtIG5v
dCByZWFsbHkKPiBzdXJlIHdoZXRoZXIgd2Ugc2hhbGwgY2hhbmdlIHRoZSBuYW1lIGZvciB0aGVz
ZSBiYXNpYyBvcGVyYXRpb25zLgo+Cj4gQ2hhbmdpbmcgdGhlbSB0byAxUy0wLTAgbWF5IGFsc28g
aW5kaWNhdGUgdGhhdCB0aGVyZSBhcmUgcmVzZXRzIHdpdGgKPiBhZGRyZXNzIG9yIGRhdGEgZmll
bGRzLCB3aGljaCBJIGZpbmQgY29uZnVzaW5nLgo+Cj4gSSB0aGluayB0aGUgY2hhbmdlIGlzIGdv
b2QgZm9yIHJlYWRzIGFuZCB3cml0ZXMuIEknbGwgY2hlY2sgZnVydGhlciBpbgo+IHRoZSBzZXJp
ZXMgYW5kIGxldCB5b3Uga25vdy4KCkkgd2FudCB0byByZW5hbWUgdGhpcyBtYWNybyBmb3IgdHdv
IHJlYXNvbnM6Ci0gV2UgbWlnaHQgc2VlIGluIHRoZSBuZWFyIGZ1dHVyZSB0aGUgYWRkaXRpb24g
b2YgOEQtMC0wIG9wcyAoSSBwbGFuIG9uCiAgd29ya2luZyBvbiBpdCkuCi0gSSB3b3VsZCBsaWtl
IHNvbWUga2luZCBvZiBoYXJtb255IGFtb25nIHRoZXNlIG1hY3Jvcy4KCk5vdywgd2hldGhlciBp
cyBzaG91bGQgYmUgbmFtZWQgbGlrZSBJIHByb3Bvc2VkIG9yIGp1c3QKU1BJTkFORF9SRVNFVF9P
UF8xUywgSSBoYXZlIG5vIHN0cm9uZyBwcmVmZXJlbmNlIGFuZCBJIGNhbiBjaGFuZ2UgdGhhdApp
biBhbiB1cGNvbWluZyB2ZXJzaW9uLgoKV2hpY2ggb25lIHdvdWxkIHlvdSBwcmVmZXI/CgpDaGVl
cnMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
