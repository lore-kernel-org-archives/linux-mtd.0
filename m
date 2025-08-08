Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAC0C87FD2
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ch6KZV7lUGFrayKsrMZyxFXRmGvKTGTa76Gh/56VSpc=; b=zmtBQMbzo344/p
	VXX3L/dudCtXhM7L48jmBc3/gCGtjBLnS8tkooLKs40+edO+cRlB50UJK2v/pfr3oMljFb15BGgCa
	WQ54Br7b7OMn3osTtbCUPmpgfvfmvWXmmXm/05Mc+aJD+E+olXdSKEa2duYYRa1wGcxi01TJQoMq8
	mTBm5WxBlvu81Z0PhI9nq6vr6hB2tx28ZyGdMr/cg03HPBEirUc1MOBQyZew+p9dhbLNuSDsev5W9
	XT/+GEH7oZ1H8W7Mzq7oqT8VsUrgflmsY9JMvKFIn9oBhHp3coS1uY+8w7F+I9Z0uK9c4ZTc+wHiW
	Kr4u4nL3FDK1ByjtpPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKcW-00000002asx-33P2;
	Fri, 08 Aug 2025 10:46:44 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKCA-00000002YK6-111H
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 10:19:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4A984320D;
	Fri,  8 Aug 2025 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754648367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfxpN6ZiqcVyW4i6uW3ZKSO2WB/dwXVU69neRz5alTU=;
	b=de0HcDcgkFyNffryiXNWtj9t9e6pkWr4eO+Ju24QUompQtVAHzWdirHO5b3WoIrsoFdMM/
	xMgS9HjJk3e4qsvLaXstVbszXWHSekkXHjX8frJOjK+sHgFPNmjyDVpd2ZeFz84eCUifXU
	V50emlFWTl0JDzRZ8vomXmgBRRx+DXBiosIJ826gNeXX3ZDqaNoH8ZKqWd8xc1T7Xp62XE
	i65Kl5n/ORw2ShJMKvvCS9NE7y/OAL6BUPIv3dQJHN3zA6ZU88/e7OeymDnWRFeHy4wgwS
	E4u8DIaZF6T1VRZXGy0bBnqtzDJ6ZCQvN+zYFIBFjZsMrefmmbkkIvz0ibkg1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 2/2] mtd: spi-nand: macronix: Add randomizer support
In-Reply-To: <20250808095503.906244-3-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Fri, 8 Aug 2025 17:55:03 +0800")
References: <20250808095503.906244-1-linchengming884@gmail.com>
	<20250808095503.906244-3-linchengming884@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Fri, 08 Aug 2025 12:19:24 +0200
Message-ID: <87zfca9kur.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvdefheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrdeiheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrieehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtoheplhhinhgthhgvnhhgmhhinhhgkeekgeesghhmrghilhdrtghomhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrt
 hdprhgtphhtthhopegrlhhvihhniihhohhusehmgihitgdrtghomhdrthifpdhrtghpthhtoheplhgvohihuhesmhigihgtrdgtohhmrdhtfidprhgtphhtthhopegthhgvnhhgmhhinhhglhhinhesmhigihgtrdgtohhmrdhtfi
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_031930_412749_1DDD4251 
X-CRM114-Status: UNSURE (   8.70  )
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

T24gMDgvMDgvMjAyNSBhdCAxNzo1NTowMyArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21p
bmc4ODRAZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWlu
Z2xpbkBteGljLmNvbS50dz4KPgo+IEVuYWJsZSByYW5kb21pemVyIGZ1bmN0aW9uIGJ5IHNwZWNp
ZmljIGZsb3djaGFydCB0byBzZXQgdGhlIGRlZmF1bHQgdmFsdWUKPiBvZiBSQU5ERU4gdG8gMS4K
Pgo+IFJhbmRvbWl6ZXIgaW50cm9kdWNlcyB0d28gbmV3IERUIHByb3BlcnRpZXMgZm9yIGNoaWxk
IG5vZGVzIHRvIGNvbmZpZ3VyZQo+IHRoZSByYW5kb21pemVyIGZ1bmN0aW9uYWxpdHkgYW5kIGNv
dmVyYWdlIG9wdGlvbnMuCj4gIC0gbXhpYyxlbmFibGUtcmFuZG9taXplci1vdHA6IFNwZWNpZnkg
d2hldGhlciB0byBhY3RpdmF0ZSB0aGUgcmFuZG9taXplcgo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmZWF0dXJlLgo+ICAtIG14aWMscmFuZG9wdDogRGVmaW5lIHRoZSByYW5kb21p
emVyIGFyZWEgcGVyIHBhZ2UuCgpDYW4gd2UgY3JlYXRlIGEgZ2xvYmFsIE5BTkQgRFQgcHJvcGVy
dHkgZm9yIHRoYXQ/IEVuYWJsaW5nIGEgcmFuZG9taXplcgppcyBxdWl0ZSBhIGdlbmVyaWMgc3Rl
cC4KCj4gVGhlIHBlbmFsdHkgb2YgcmFuZG9taXplciBhcmUgc3VicGFnZSBhY2Nlc3NlcyBwcm9o
aWJpdGVkIGFuZCBtb3JlIHRpbWUKPiBwZXJpb2QgaXMgbmVlZGVkIGluIHByb2dyYW0gb3BlcmF0
aW9uIGFuZCBlbnRlcmluZyBkZWVwIHBvd2VyLWRvd24gbW9kZS4KPiBpLmUuLCB0UFJPRyAzMjB1
cyB0byAzNjB1cyAocmFuZG9taXplciBlbmFibGVkKS4KCkRvIHlvdSB3YW50IHRvIHNoYXJlIHdo
YXQgaXMgdGhlIGFkZGVkIHZhbHVlIGluIHRlcm1zIG9mIGxpZmV0aW1lIHRvCmVuYWJsZSB0aGUg
cmFuZG9taXplciwgZ2l2ZW4gdGhlIGRyYXdiYWNrcyB3aGljaCBhcmUgc2lnbmlmaWNhbnQ/CgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
