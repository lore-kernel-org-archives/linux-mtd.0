Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280DEC36014
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 10:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXF4BD7pT6JU0iTs+18SAUjiiCYPMwS4oHmSRmCFoTg=; b=BbyzzJPqk49DZs
	LW9iIKCDWTIQFcaqg2+VEzZyo/SqteswBTkIDUZocxGafkW1lpQcM+cC5R+4r6rGKOAJrqrZojKni
	EYCM85N6r427tR5a83lzq0yl6vgQyDl/rlE0GLM9fPb2UJwuc3SjRi2KfgJ0CZQK0VmcqXiAuVrgQ
	DWmaKr3Lpgbs92LCuFmXWRCaXt0iAzrKXqO6fR8Nd9PzXeaTYytSyco4o37KnzJf2YNl9zHEP98R+
	wW3NLQ5L2EkEIMUqpV8gzyswnfzNrSy+k4Etkx0pKAZECuOS0Rs4tgX7JosR3ce7jeCogg11Bm36f
	B+h8IU/EHKt+Y63rOOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvIt-00000005nUU-13Uq;
	Wed, 02 Apr 2025 10:26:39 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzvIp-00000005nSh-3pxh
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 10:26:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AA5A43224;
	Wed,  2 Apr 2025 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743589593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6IZ5+sax5zI/ZhFcVwPs9GrchfwkbUQpoOiho1sU2bQ=;
	b=Vu2i+62zBLCHmz6q2CNLMmIiqcbdWwnllP5X/VDhqcmbPQUg+zkKtnvQXo/m68CWmybuHA
	HCk6nBHojxBsr4HRCXFqpzWSmy/cutgc8VEtpwfJ7tBrZPGueskSTJeq7ei+rIJK3SdO3t
	vcg7Z/pb/z8dQeAmxCge6GoQhOF4eEp4R+s4fHIKRTqI1l+v3VXa0EY4UgO0xun5OOCn20
	eatOsknyoyi2UUFjvLfhOMDYkvXRMjesWmj7wJiYxrciEQI8mxc8O2UNqVtYNujKFrKiNH
	JrCRG5Hlgp/e3RvSO1vWk06jf7ocsbgjzpD/y3+IQkreoqKIeD/ju+b9PpalAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd spinand build breakage
In-Reply-To: <20250331112612.4d230483@endymion> (Jean Delvare's message of
	"Mon, 31 Mar 2025 11:26:12 +0200")
References: <20250331112612.4d230483@endymion>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 02 Apr 2025 12:26:32 +0200
Message-ID: <87a58yrh9j.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvdevueffgfehledtffeiudevvdekveeltdelkeefueefiefhieegveejkeekjeenucffohhmrghinhepmhgrrhgtrdhinhhfohenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhguvghlvhgrrhgvsehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_032636_805777_D3DE9DDD 
X-CRM114-Status: UNSURE (   8.96  )
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

SGkgSmVhbiwKCj4gICAgIG10ZDogc3BpbmFuZDogQWRkIGFuIG9wdGlvbmFsIGZyZXF1ZW5jeSB0
byByZWFkIGZyb20gY2FjaGUgbWFjcm9zCj4KPiBicmVha3MgdGhlIGJ1aWxkIGZvciBtZSAodXNp
bmcgZ2NjIDcuNS4wKS4gSSBzZWUgdGhpcyBoYXMgYWxzbyBiZWVuCj4gcmVwb3J0ZWQgYnkgdGhl
IEludGVsIHRlc3Qgcm9ib3QgaGVyZToKPgo+IGh0dHBzOi8vbWFyYy5pbmZvLz9sPWxpbnV4LWtl
cm5lbCZtPTE3NDIyNzYxMDgxMDYzNSZ3PTIKPgo+IERvIHlvdSBoYXZlIGEgZml4IGZvciB0aGlz
IGFscmVhZHksIG9yIHNob3VsZCB3ZSByZXZlcnQgdGhpcyBjb21taXQKPiAocGx1cyAxZWE4MDhi
NGQxNWI5IHdoaWNoIGRlcGVuZHMgb24gaXQpIGZvciB0aGUgdGltZSBiZWluZz8KCkkgc2VudCBh
IGZpeCB5ZXN0ZXJkYXksIG5vcm1hbGx5IHlvdSB3ZXJlIGluIENjLiBMZXQgbWUga25vdyBpZiB0
aGF0CmZpeGVzIHRoZSBpc3N1ZSBvbiB5b3VyIHNpZGUgYXMgd2VsbC4KClRoYW5rcywKTWlxdcOo
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
