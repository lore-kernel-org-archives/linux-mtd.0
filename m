Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735ADC02194
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Feb 2025 17:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEy2g6qBX5wwwF0aD0dYNRzAaTYGo1qYo+CvaHI44bQ=; b=mbY7ZXW9Af5Dil
	Sg3aJwsMgtp4sac70QxpQcogL/8iW815R0ymEQLpG5/ofF6L47aJnMz518x1BcAE1ctY0Hi4yS040
	B470KYvMZ0cd6PVnG7SBLi0Rw2y/p2TIjL2PgWj4lvdYuNptJrUue2jFMYAQ3WqTK/2qAQaKjERwV
	kUvqTZ1T6AjbODpsUiJM/mMQFJu96KtGZ8YUAY0OycICOPmUi7nXyg5rwIHehzMdWlrW00KWBEnoL
	ZIkzMc6g4pQO7iCwOJdSbbsYvc291M+tCa4fzxEBNJNarDcRarP5nUvZbEkDZgEPlbdPGvR5K2QCT
	zypz3vv3IIkdR7D1Oh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5RV-00000006xa4-1xkj;
	Thu, 06 Feb 2025 17:13:33 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg5RT-00000006xYK-13je
	for linux-mtd@lists.infradead.org;
	Thu, 06 Feb 2025 17:13:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6D7644346;
	Thu,  6 Feb 2025 17:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738862008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n8qcVxq458N/mAEJuBQV6f51SQeiq0Xrop5ehm7xdCc=;
	b=G7T7OGzlVio7+/xgaozWsxRnF2LyR3WtY50zNi+iuSGIl27pCtu0FwTJG49dy8DwikeJMz
	5pQHFZY84tUItYqhx73EP5X5O3VSPIyMDBnFayxIgHQ2yF5PELNeC2+VtUgVD7BArInjSl
	bhZ1bnPitEzbncv/yTjPrYvDiqAn2bKu5dT1LyoD3vQ0k0nw9cQo5ArwckVhg6YYWHi9Lx
	g7tSf654ksf1Hd5QrQduEEnuz421qrbCcik3bYvHTWzqJKDnWJb3Z+DzgDiaNg90sNEUto
	PvtyiKC39tDOjthvsj8AwdRc1tKZTWKHU4q2hNoHbK5a/pCfex72OMg9yMJ6EA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v3 1/2] mtd: spi-nand: Add read retry support
In-Reply-To: <20250122065605.285145-2-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Wed, 22 Jan 2025 14:56:04 +0800")
References: <20250122065605.285145-1-linchengming884@gmail.com>
	<20250122065605.285145-2-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 06 Feb 2025 18:13:25 +0100
Message-ID: <878qqj3sju.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehlihhntghhvghnghhmihhnghekkeegsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtp
 dhrtghpthhtoheprghlvhhinhiihhhouhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopehlvghohihusehmgihitgdrtghomhdrthifpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_091331_422857_5296042B 
X-CRM114-Status: UNSURE (   9.37  )
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

SGVsbG8gQ2hlbmcsCgo+IEBAIC02ODcsMTggKzY5MSw0MyBAQCBzdGF0aWMgaW50IHNwaW5hbmRf
bXRkX3JlZ3VsYXJfcGFnZV9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QgZnJvbSwK
PiAgCQlpZiAocmV0KQo+ICAJCQlicmVhazsKPiAgCj4gK3JlYWRfcmV0cnk6Cj4gIAkJcmV0ID0g
c3BpbmFuZF9yZWFkX3BhZ2Uoc3BpbmFuZCwgJml0ZXIucmVxKTsKPiAgCQlpZiAocmV0IDwgMCAm
JiByZXQgIT0gLUVCQURNU0cpCj4gIAkJCWJyZWFrOwo+ICAKPiAtCQlpZiAocmV0ID09IC1FQkFE
TVNHKQo+ICsJCWlmIChyZXQgPT0gLUVCQURNU0cgJiYgc3BpbmFuZC0+c2V0X3JlYWRfcmV0cnkp
IHsKPiArCQkJaWYgKHNwaW5hbmQtPnJlYWRfcmV0cmllcyAmJiAoKytyZXRyeV9tb2RlIDwgc3Bp
bmFuZC0+cmVhZF9yZXRyaWVzKSkgewoKSSBiZWxpZXZlIHRoZSBjb25kaXRpb24gc2hvdWxkIGJl
OgoKICAgICAgICAgICAgICAgICAgICAgICAgaWYgKHNwaW5hbmQtPnJlYWRfcmV0cmllcyAmJiAo
KytyZXRyeV9tb2RlIDw9IHNwaW5hbmQtPnJlYWRfcmV0cmllcykpIHsKClNvIGlmIHlvdSBoYXZl
IDUgcmV0cnkgbW9kZXMsIHlvdSBjYW4gcHJvdmlkZSA1IGluIHRoZSBtYW51ZmFjdHVyZXIgZHJp
dmVyLAphbmQgbm90IDYuCgo+ICsJCQkJcmV0ID0gc3BpbmFuZC0+c2V0X3JlYWRfcmV0cnkoc3Bp
bmFuZCwgcmV0cnlfbW9kZSk7Cj4gKwkJCQlpZiAocmV0IDwgMCkgewo+ICsJCQkJCWVjY19mYWls
ZWQgPSB0cnVlOwo+ICsJCQkJCXJldHVybiByZXQ7CgpTaGFsbCB3ZSB0cnkgdG8gc2V0IHRoZSBy
ZWFkX3JldHJ5IGxldmVsIHRvIDAgdXBvbjoKCiAgICAgIGlmIChyZXQgPCAwICYmIHJldHJ5X21v
ZGUgPiAxKQoKPwoKPiArCQkJCX0KPiArCj4gKwkJCQkvKiBSZXNldCBlY2Nfc3RhdHM7IHJldHJ5
ICovCj4gKwkJCQltdGQtPmVjY19zdGF0cyA9IG9sZF9zdGF0czsKPiArCQkJCWdvdG8gcmVhZF9y
ZXRyeTsKPiArCQkJfSBlbHNlIHsKPiArCQkJCS8qIE5vIG1vcmUgcmV0cnkgbW9kZXM7IHJlYWwg
ZmFpbHVyZSAqLwo+ICsJCQkJZWNjX2ZhaWxlZCA9IHRydWU7Cj4gKwkJCX0KPiArCQl9IGVsc2Ug
aWYgKHJldCA9PSAtRUJBRE1TRykgewoKUmVzdCBsZ3RtLgoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
