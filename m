Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CF8C02193
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Feb 2025 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DPrp4ifx0lxnyRmLa2h/OcB5inG4FgSTFr0PuXHdBFA=; b=TgeAp/W7uNhSZb
	kc+j5Ay27roWeMB+t6PvGDEDtb74EVpvVNLm9btWGXQ9G/WkgaaB623he1Yx9o+XPtCIjkSXAYqk8
	c/SMoPx2uS0tPQGMpLxblEwh5C6KJlhp1/pvvLGCk+pXL3T3JUqzAKJFj3tIyoLHoUyauXQ1DezLc
	mdE3CWcTsCO1sF/SjN/Df83iRhweJnKmx4awlB4IDWYnM7ftWfUX200uJ93ML4KoacOFAd8PZKGXi
	FtG+v5TCGkpLxrAANFcgbwqV31UZ58rl0HnmeDASw2xDFT3kG3Oggo9LENwcKAn83unFjxKw8t2pk
	aQ4VLYNZEVDgsZr+Ps5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tertm-0000000Er3z-3RgT;
	Mon, 03 Feb 2025 08:33:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tersU-0000000EqkV-3Zte
	for linux-mtd@lists.infradead.org;
	Mon, 03 Feb 2025 08:32:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D157E442DA;
	Mon,  3 Feb 2025 08:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738571538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Z+RDbiHqCFhfJq8P1RIqpEAdpRuAUP5aDcHfXI4AB8=;
	b=RRLxeaa9XOyXSAbOIsJ2MP1Ljw9F/Nxhqi6hQW2NcFbRLlta/RFiMCmdJT6ligIzAZxNsH
	j0U0SkE7Uos21jkvYdsAl2LF8fO7D22p0V4SmkfxWi6lXHCAcLL/bCqaYacCiIhsNnBVwO
	StPQ/r32tSeFrfKh79b90ghiPgzVciUI5Nmq5qFA5EYoBCT+9o9zGrEO165HVy2+f3+PIJ
	9AeSr8/2r653L1rYRVH23enVBw0kfkCNBi7AbyMA+AIFTAqqtoAbuXG+lIQjSM/PFvjpNR
	QHct/ioFJPNZBEg+o7nQDz2FfPXs7kjsdhYf38un0lQutEZxxNRpiMR5kLzI1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Cc: richard@nod.at,  vigneshr@ti.com,  gmpy.liaowx@gmail.com,
  kees@kernel.org,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: Add check for kcalloc()
In-Reply-To: <20250202205456.40790-1-jiashengjiangcool@gmail.com> (Jiasheng
	Jiang's message of "Sun, 2 Feb 2025 20:54:56 +0000")
References: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Feb 2025 09:32:15 +0100
Message-ID: <87tt9bxwc0.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrddvtdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrddutdekrddvtdehpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepjhhirghshhgvnhhgjhhirghnghgtohholhesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepghhmphihrdhlihgrohifgiesghhmrghilhdrtghomhdprhgtphhtthhopehkvggvsheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrg
 hdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_003223_563453_0D75CEB8 
X-CRM114-Status: GOOD (  15.12  )
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

T24gMDIvMDIvMjAyNSBhdCAyMDo1NDo1NiBHTVQsIEppYXNoZW5nIEppYW5nIDxqaWFzaGVuZ2pp
YW5nY29vbEBnbWFpbC5jb20+IHdyb3RlOgoKPiBBZGQgYSBjaGVjayBmb3Iga2NhbGxvYygpIGFu
ZCBwcmludCBhbiBlcnJvciBtZXNzYWdlIGlmIGl0IGZhaWxzLgoKQ2hlY2tpbmcsIHllcywgYnV0
IGxvZ2dpbmcsIG5vLiBJSVJDIHRoZSBjb3JlIGRvZXMgaXQgYWxyZWFkeSBpZiByZXF1aXJlZC4K
Cj4gRml4ZXM6IDc4YzA4MjQ3YjlkMyAoIm10ZDogU3VwcG9ydCBrbXNnIGR1bXBlciBiYXNlZCBv
biBwc3RvcmUvYmxrIikKCkNjOiBzdGFibGUgaXMgbWlzc2luZwoKPiBTaWduZWQtb2ZmLWJ5OiBK
aWFzaGVuZyBKaWFuZyA8amlhc2hlbmdqaWFuZ2Nvb2xAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL210ZC9tdGRwc3RvcmUuYyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZHBzdG9yZS5jIGIvZHJpdmVy
cy9tdGQvbXRkcHN0b3JlLmMKPiBpbmRleCA3YWM4YWM5MDEzMDYuLjM2ODk5NzE1NWMwNyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9tdGRwc3RvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210
ZHBzdG9yZS5jCj4gQEAgLTQyMyw2ICs0MjMsMTEgQEAgc3RhdGljIHZvaWQgbXRkcHN0b3JlX25v
dGlmeV9hZGQoc3RydWN0IG10ZF9pbmZvICptdGQpCj4gIAlsb25nY250ID0gQklUU19UT19MT05H
UyhkaXZfdTY0KG10ZC0+c2l6ZSwgbXRkLT5lcmFzZXNpemUpKTsKPiAgCWN4dC0+YmFkbWFwID0g
a2NhbGxvYyhsb25nY250LCBzaXplb2YobG9uZyksIEdGUF9LRVJORUwpOwo+ICAKPiArCWlmICgh
Y3h0LT5ybW1hcCB8fCAhY3h0LT51c2VkbWFwIHx8ICFjeHQtPmJhZG1hcCkgewo+ICsJCWRldl9l
cnIoJm10ZC0+ZGV2LCAiZmFpbGVkIHRvIGFsbG9jYXRlIG1lbW9yeSBmb3IgbWFwXG4iKTsKPiAr
CQlyZXR1cm47Cj4gKwl9Cj4gKwo+ICAJLyoganVzdCBzdXBwb3J0IGRtZXNnIHJpZ2h0IG5vdyAq
Lwo+ICAJY3h0LT5kZXYuZmxhZ3MgPSBQU1RPUkVfRkxBR1NfRE1FU0c7Cj4gIAljeHQtPmRldi56
b25lLnJlYWQgPSBtdGRwc3RvcmVfcmVhZDsKCldoYXQgaWYgcmVnaXN0ZXJfcHN0b3JlX2Rldmlj
ZSgpIGZhaWxzPyBZb3VyIG9ubHkgcGFydGlhbGx5IGZpeGluZyB0aGUKcHJvYmxlbSBpZiB5b3Ug
ZG9uJ3QgaGFuZGxlIHRoZSBmcmVlKClzIHRoZXJlIGFzIHdlbGwuCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
