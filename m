Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D33C021AA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ji8WAD3Jjp1SfOYP3HwXOyCh8bppQjonpCV9rMIUzSE=; b=QVWYNgu+LPBvnn
	2KjjCdEPh+ZYRpIQLupaaD/RjlF8V4WN1DiJGQ9Owe7oYy3xl6bR8i3IlkuyQA1kpnc4OaCYic2+T
	SkUaVCyn4vSyCk0HUMZCsRWLTWks/5uFnNvRilGVceZ0s6IX+f3cH8c0V5nCreRObfnVM7Qz+C1FD
	nQi6yWWXDv4gJLF9hBR2Dh6fDSIc51tjOEcse1LnqbmJk+XM9sm2zX3zIh9lZjDIghx5er9qS6TlX
	QLS25ki8pZgAGT+vzpRYpNgu10lx2BCxjuUDeXkGNuyO5s332AURBWuICCxpyDeyAhc0du3VMkYlH
	UD3S3dZm0QAmJKws3yrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkIO-0000000D0Z3-0PIP;
	Wed, 19 Feb 2025 13:39:24 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkGx-0000000D02L-2tae
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 13:37:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 88687441A1;
	Wed, 19 Feb 2025 13:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739972273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5NKhJ/Q8IUhIvUPdebLpQjQhKk2oKj3YTLMTrfN7R7g=;
	b=R/XiG+vcgXEwoHPPxo7DQgQOu364eE0gUT7tOlyJQ1UJhTtObADApSOUrY5LEaubgLC2fC
	vNbKpASviEuUl1WJYUjKd5L8PQEVjU8OZRH3JLR7cTAQ+ki3yJqvk0ACFq+VAuR+Zwm1HO
	lNDrNG0m5UKM4yJQDPobCOnxuQ0mGJZ++enLNJnJLaQihtcPLUANYdgYub45jLDSHgnph7
	mc+oCIsY+7VPDqzmPQv8MTdsJMj7QQLzPRUvK4MZsA+rDvxCmxAYQMmkavt8XR8pUWgd60
	YaUZy4OCymUOAPkqsJeRD7YlnfJ8QqA11tHWSRIEDgIjSpstEuS09VUC6iVO+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Terence Eden <terence.eden@shkspr.mobi>
Cc: maximlevitsky@gmail.com,  richard@nod.at,  vigneshr@ti.com,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org
Subject: Re: mtd: rawnand: r852: [PATCH] Fixed a spelling error in the comments
In-Reply-To: <CAPFVDHob_mna4DRc91cNVAF85px91NV7gjJr-kbY63EYCnJ=EA@mail.gmail.com>
	(Terence Eden's message of "Wed, 19 Feb 2025 11:59:10 +0000")
References: <CAPFVDHokn+kfyk9AxTHuBJjRKMNJjZy8w=e-qzvXaA8Vfcq6Dg@mail.gmail.com>
	<87o6yzs6c8.fsf@bootlin.com>
	<CAPFVDHob_mna4DRc91cNVAF85px91NV7gjJr-kbY63EYCnJ=EA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 19 Feb 2025 14:37:52 +0100
Message-ID: <874j0qqclr.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeigeefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeegfedtfeelvdeigedvjeelgfelgeejhffgueelvefgtdejheduffehvdehgeeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepthgvrhgvnhgtvgdrvgguvghnsehshhhkshhprhdrmhhosghipdhrtghpthhtohepmhgrgihimhhlvghvihhtshhkhiesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvr
 hdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_053755_876627_40EB54B0 
X-CRM114-Status: UNSURE (   7.83  )
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

SGVsbG8gVGVyZW5jZSwKCk9uIDE5LzAyLzIwMjUgYXQgMTE6NTk6MTAgR01ULCBUZXJlbmNlIEVk
ZW4gPHRlcmVuY2UuZWRlbkBzaGtzcHIubW9iaT4gd3JvdGU6Cgo+IENvbnRpbnVpbmcgdGhlIHdv
cmsgb2YgQ29tbWl0ICM4YWIxYjUxIC8KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
dGQvMjAyNDA5MjMwNjU2NDkuMTE5NjYtMS1zaGVubGljaHVhbkB2aXZvLmNvbS8KPgo+IFRoaXMg
Zml4ZXMgYSBzcGVsbGluZyBlcnJvciBpbiB0aGUgY29tbWVudHMgYW5kIHJlbW92ZXMgYW4gZXJy
YW50IG5ld2xpbmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUZXJlbmNlIEVkZW4gPHRlcmVuY2UuZWRl
bkBzaGtzcHIubW9iaT4KCkknbSBzb3JyeSBidXQgdGhlIGZvcm1hdHRpbmcgaXMgc3RpbGwgd3Jv
bmc6Ci0gWW91ciBjb21taXQgdGl0bGUgc2hvdWxkIGJlICJtdGQ6IHJhd25hbmQ6IHI4NTI6IEZp
eCBhIHNwZWxsaW5nIGVycm9yIGluIHRoZSBjb21tZW50cyIKLSBJIHJlY29tbWVuZCB5b3UgdXNl
IGdpdC1mb3JtYXQtcGF0Y2ggb3IgYjQgdG8gZm9ybWF0IHlvdXIgcGF0Y2hlcywKICB3aGljaCB3
aWxsIHByZWZpeCBbUEFUQ0hdIGF1dG9tYXRpY2FsbHkuCi0gWW91IG5lZWQgdG8gaW5jcmVhc2Ug
dGhlIHZlcnNpb24gd2hlbiB5b3Ugc2VuZCBhbiBpdGVyYXRpb24sIHRoaXMgaXMKICB2MiwgbmV4
dCB3aWxsIGJlIHYzIGFuZCB0aGlzIG11c3QgYmUgYWxzbyBkb25lIGF1dG9tYXRpY2FsbHkgYnkg
dGhlCiAgdG9vbHMsIHRoZSBmaW5hbCByZXN1bHQgc2hvdWxkIGxvb2sgbGlrZSAiW1BBVENIIHZY
XSIuCi0gV2hlbiBzZW5kaW5nIGEgbmV3IGl0ZXJhdGlvbiB5b3UgbmVlZCB0byBnaXZlIGEgY2hh
bmdlbG9nLCBhbmQgZG8gdGhhdApvdXRzaWRlIG9mIHRoZSBjb21taXQgbG9nLCBpZS4uLgoKPiAt
LS0KCiAgXl5eCkJlbG93IHRoZXNlICctLS0nCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
