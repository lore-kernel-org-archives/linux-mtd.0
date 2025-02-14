Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0E5C02198
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Feb 2025 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctTE4+d1anTKOBnTHzKYmyBYjMuwvzKs97vyjkJk8YU=; b=iDr3CctFP0fcZ9
	hA9+cCWECXhKex1KtQltq49oXstL57zCXXiOO8clQsl8kYFxJyPis3/imSNFbeNUSPLt7jdLmyupy
	eMGlCAorJIRz9EYioAZLMwQ+PNZ/gP20lyqWhKVyOkLN8WUm2OpcRthGEP0DO6MbhpraUGt2SAcPN
	KWSjY4Fcu1smusSpgzUaBN5EZmiYPc2G6BfkGb2nqISSzPhOS2S+huiV9+t6c6jUeq0sJW7IgHegn
	/vEHaZPuT/P/WJI1H5rY1wd463+W+DLE7yE2bjRIIzrYC0e3a/14hRaw0KbN0SqPxnN1oWLBTz9rQ
	p5ZWp3cYUY7VVCtdbdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0yA-0000000FyKm-0ZHZ;
	Fri, 14 Feb 2025 19:03:22 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0Pv-0000000FsTV-2FB9
	for linux-mtd@lists.infradead.org;
	Fri, 14 Feb 2025 18:28:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 723364442A;
	Fri, 14 Feb 2025 18:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739557677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUy8H2TXFgYBHz9VYypM+bAWJmRV/WrtybTJ+h3s1f4=;
	b=Rhosxkk1SMWTYOQ+STvzgixJugox5srvE3afnwNLcfA7raIwFpwbBz00K0LU+BDT2uNAEt
	fATwbXx6zTUNhKBB1vCIVkUV3QQgrrT1mZWl8VqHVyIKmCmG6IyEVAXcyPasW9NqBbC5nt
	aU5xzAsp8LUg0fSQESnrhJOWxdA2+RNtBr+8mNC2qmhl3fu/+4kCCVu3EIswba5pRpHoEC
	EhnWNC6BrFyBwBDY8Za7bGFuWiCqTHqBQJyD5FOlDXAqMruJlIRc/Mg66wKOao9YH9DkAj
	6j3Essbbc/FF7Tn8vBjN+BiM3YNChEV5WlQckgv7HQ6JUhCpKZF+s01x5dlR3w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <quic_sridsn@quicinc.com>,
  <quic_mdalam@quicinc.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <p-mantena@ti.com>,
  <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spinand: winbond: Fix oob_layout for W25N01JW
In-Reply-To: <20250213060018.2664518-1-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 13 Feb 2025 11:30:18 +0530")
References: <20250213060018.2664518-1-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 14 Feb 2025 19:27:56 +0100
Message-ID: <875xlcnzyr.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtdefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegvdduleeihfettdfgieevtdffjeeggfefveetudeludekieffhfeiffduvdehffenucffohhmrghinhepfihinhgsohhnugdrtghomhenucfkphepledvrddukeegrdelkedrudeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedrleekrdduieejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeelpdhrtghpthhtohepshdqkheisehtihdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhiughsnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdri
 hhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehpqdhmrghnthgvnhgrsehtihdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_102759_720319_66E24A99 
X-CRM114-Status: UNSURE (   5.43  )
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

SGVsbG8gU2FudGhvc2gsCgpPbiAxMy8wMi8yMDI1IGF0IDExOjMwOjE4ICswNTMwLCBTYW50aG9z
aCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IEZpeCB0aGUgVzI1TjAxSlcncyBvb2Jf
bGF5b3V0IGFjY29yZGluZyB0byB0aGUgZGF0YXNoZWV0LiBbMV0KPgo+IFsxXSBodHRwczovL3d3
dy53aW5ib25kLmNvbS9ocS9wcm9kdWN0L2NvZGUtc3RvcmFnZS1mbGFzaC1tZW1vcnkvcXNwaW5h
bmQtZmxhc2gvP19fbG9jYWxlPWVuJnBhcnRObz1XMjVOMDFKVwo+Cj4gRml4ZXM6IDZhODA0ZmI3
MmRlNSAoIm10ZDogc3BpbmFuZDogd2luYm9uZDogYWRkIHN1cHBvcnQgZm9yIHNlcmlhbCBOQU5E
IGZsYXNoIikKPiBDYzogU3JpZGhhcmFuIFMgTiA8cXVpY19zcmlkc25AcXVpY2luYy5jb20+Cj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBTYW50aG9zaCBLdW1h
ciBLIDxzLWs2QHRpLmNvbT4KCkkgYW0gc29ycnkgdGhpcyBwYXRjaCBkb2VzIG5vdCBhcHBseSwg
YXJlIHlvdSBzdXJlIHlvdSByZWJhc2VkIG9uIG5leHQ/CgpDYW4geW91IHBsZWFzZSBmaXggYW5k
IHJlc2VuZCA/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
