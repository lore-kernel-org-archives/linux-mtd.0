Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AAB3C021B3
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Feb 2025 14:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KooWKgJGwm+3Qrcpp3aEBCSACibofEuaIWNTPzV4Ac=; b=1CNXvNdGd76Ve9
	vFunGqVv1W9JwgXIXdsTRh3P1uRAUZq75khiTfMQPQoDrh2o+XKb3FIhUvOL0CohznnMjaOOHBC8Q
	tL238aSBHKuy2EGQvnij9tkOMUK396J6nHwdH7SgGa7gf5vQWp3Dl33TGqxX13oyazhLne42CWIh1
	YfnGSCOc++D3+0a7NFDVNVzzXSB2w6mlyaR+hmxTEn0Whl9goDkQPztzcTjbsky2Nn6kdeHsCK3f4
	KL6htzGdClTorCUmuGhMEIAszM7FqM4rn+SLsyM3/4Vk2246M0ZpbPIaRjMCD5zvBPfC+yGUsUyK8
	qrbX2lYOB4ceUqNGZ5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTZR-00000005jG1-0iQR;
	Fri, 21 Feb 2025 14:00:01 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTZN-00000005jDc-00Ib
	for linux-mtd@lists.infradead.org;
	Fri, 21 Feb 2025 13:59:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2BAA44275;
	Fri, 21 Feb 2025 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740146390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jPzBuw9UsBe99nwjSVKxaFyXXJIsLlYuHr4g0n0BOKE=;
	b=J+B8ftd8W/uUKRzfNpEGZm82vjg0m+a7zbdrRQIrI4q7z/IKhcDSBhL9AEAyNvx3dVt6KF
	AncIKgxMQOzO7iz8vsWqlnp2DrescSnIRGgfumgU33fO7MTGaJUKJDtG8vAns90AAATKE+
	uXJLU/rGzv8tVMQWK5UpwRrVqhVq0heHpeWaHqemC5kegbOCmvByaDBF9Kl3h6b7q9yKx3
	EM0kxekr+X83CrbE+uRMZDSm05Ufl+dRDzNdzN00TIzfbN7eqVjrPQqUDPwX4vPb9lqqQx
	Hey9efkSdK+2h8ou28EyjmZ8wYqAoXpPNmP2dkA3Ld0orMADdqRgFGaBDFJO8w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v4 0/2] Add support for read retry
In-Reply-To: <20250221093300.430994-1-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Fri, 21 Feb 2025 17:32:58 +0800")
References: <20250221093300.430994-1-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 21 Feb 2025 14:59:49 +0100
Message-ID: <87r03rfley.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejtddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_055957_812052_05B78409 
X-CRM114-Status: UNSURE (   8.23  )
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

SGVsbG8sCgpPbiAyMS8wMi8yMDI1IGF0IDE3OjMyOjU4ICswOCwgQ2hlbmcgTWluZyBMaW4gPGxp
bmNoZW5nbWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgoKPiBGcm9tOiBDaGVuZyBNaW5nIExpbiA8
Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+Cj4gV2hlbiB0aGUgaG9zdCBFQ0MgZmFpbHMgdG8g
Y29ycmVjdCB0aGUgZGF0YSBlcnJvciBvZiBOQU5EIGRldmljZSwKPiB0aGVyZSdzIGEgc3BlY2lh
bCByZWFkIGZvciBkYXRhIHJlY292ZXJ5IG1ldGhvZCB3aGljaCBjYW4gYmUgc2V0dXAKPiBieSB0
aGUgaG9zdCBmb3IgdGhlIG5leHQgcmVhZC4gVGhlcmUgYXJlIHNldmVyYWwgcmV0cnkgbGV2ZWxz
IHRoYXQKPiBjYW4gYmUgYXR0ZW1wdGVkIHVudGlsIHRoZSBsb3N0IGRhdGEgaXMgcmVjb3ZlcmVk
IG9yIGRlZmluaXRlbHkKPiBhc3N1bWVkIGxvc3QuCgpJIGFtIHNvcnJ5IGJ1dCB5b3UgbmVlZCB0
byByZWJhc2Ugb24gbGF0ZXN0IC1yYzEgb3IgbWF5YmUgZXZlbiBuYW5kL25leHQKYmVjYXVzZSBp
dCBkb2VzIG5vdCBhcHBseS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
