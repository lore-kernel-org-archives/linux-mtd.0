Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B736C021A4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 15:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4u87d+E+Ejyo5vvpLR4kcI+hLYcVSOlWi5h7kNvWqx8=; b=0FTEtWh3//CCE6
	jjdEbl2yHWNBDi/l6LFqbHA48/h1Y1HHcIZvup2s+N8t6ogOiTMKOLH9uW+IwkPPrphFlt3hVnhNW
	QzUN0uV+RKt4zgxjwGyB+sTCRLnxT3KslgFuxpA+xVStL9Mmankw0dTlD57Y6LYSDbHj8GvprQJ49
	xmvdJI8qSmFehWtcqX2GooXjT+/5xHsJY/yfsuhLJMBPxzzM1v5VSs6NFDFnEc2UvmAtUQrhrhqom
	0mAZWDeUkcVBjGih/8sXrJCsL8pDznZIDHg+jwd1kC8OOqG4yiHyIvAQ+4oEUXomnJ+6I3Y+IlSQ1
	f/DprBg+j/9mt3jRXK+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaZ7-0000000EJdk-2YYs;
	Mon, 24 Feb 2025 15:40:17 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaZ4-0000000EJaK-0EoP
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 15:40:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB3962047A;
	Mon, 24 Feb 2025 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740411611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7cD5jnagQpjGIDB/UD6+u0Yqk/KcOgrOzgdVnhZmRw=;
	b=RgvXwS8YZ/U9eCHs540yVO4bw0v1h6oAaOy3T232FQSJuzLeRYPo8Gtx5/ZrcePEdRPmSR
	ZanniuJaqdY0oMtU16+puHTHKgfOG6+G/W4DcFb+b+0LuU5mQ32e4MvEyONYOgVmH+/IsH
	Ktla81mIzsdkLXMZTyF0nfx8h8lpFHRuJH4RxNAvuo7kzaJnpv+KRLGPZRDYhJFnWZfQ1v
	T2VwjD+WixbBYUyermJkUmxIF0MsNMHVCYemkIIEIO/Ac3x7/F1hO4wEokbwTiiWXpNur7
	XeW3T5EVRpsIor6tEK43Qtgs4oOK6ur4aXt2Uzlty1xtL2ZbUwmV7Dy5YTE/7Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org
In-Reply-To: <20250222-mtd-nand-kzalloc-v1-1-fbb41db6fd8e@ethancedwards.com>
References: <20250222-mtd-nand-kzalloc-v1-1-fbb41db6fd8e@ethancedwards.com>
Subject: Re: [PATCH] mtd: rawnand: use kcalloc() instead of kzalloc()
Message-Id: <174041161086.1746756.7095949485766246490.b4-ty@bootlin.com>
Date: Mon, 24 Feb 2025 16:40:10 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejledujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvegjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgedtfeeukeeuvdegueejueeftdegtefhtdeileeutedtleegiefhhfdvjeeukeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecukfhppedvudejrdduuddvrddukeelrddukedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddujedrudduvddrudekledrudekuddphhgvlhhopegludejvddrudelrdefrddvfedvngdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegvthhhrghnsegvthhhrghntggvugifrghrughsrdgtohhmpdhrtghpthhtohepl
 hhinhhugidqhhgrrhguvghnihhnghesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrght
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_074014_257719_93FE1C1F 
X-CRM114-Status: UNSURE (   7.08  )
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

T24gU2F0LCAyMiBGZWIgMjAyNSAxNDoxOTo0MyAtMDUwMCwgRXRoYW4gQ2FydGVyIEVkd2FyZHMg
d3JvdGU6Cj4gV2UgYXJlIHRyeWluZyB0byBnZXQgcmlkIG9mIGFsbCBtdWx0aXBsaWNhdGlvbnMg
ZnJvbSBhbGxvY2F0aW9uCj4gZnVuY3Rpb25zIHRvIHByZXZlbnQgaW50ZWdlciBvdmVyZmxvd3Nb
MV0uIEhlcmUgdGhlIG11bHRpcGxpY2F0aW9uIGlzCj4gb2J2aW91c2x5IHNhZmUsIGJ1dCB1c2lu
ZyBrY2FsbG9jKCkgaXMgbW9yZSBhcHByb3ByaWF0ZSBhbmQgaW1wcm92ZXMKPiByZWFkYWJpbGl0
eS4gVGhpcyBwYXRjaCBoYXMgbm8gZWZmZWN0IG9uIHJ1bnRpbWUgYmVoYXZpb3IuCj4gCj4gTGlu
azogaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzE2MiBbMV0KPiBMaW5rOiBo
dHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL25leHQvcHJvY2Vzcy9kZXByZWNhdGVkLmh0
bWwjb3Blbi1jb2RlZC1hcml0aG1ldGljLWluLWFsbG9jYXRvci1hcmd1bWVudHMKPiAKPiBbLi4u
XQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogcmF3bmFuZDogdXNl
IGtjYWxsb2MoKSBpbnN0ZWFkIG9mIGt6YWxsb2MoKQogICAgICBjb21taXQ6IDM0Njg0YmI1ZTQz
NjA5YmE4YWMxYTU0YzRlNTg1NDkzYzU0ODZjYWIKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxh
YmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJv
dmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1p
cXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
