Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB7BC87FCF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Aug 2025 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uboU0q3SOX3+5jXr/040djQFBVKhWSAHVQhLXVDb0F0=; b=iTh/iCe4FG+5rH
	BeIbc8sJad+K7sUulmqcs4wiClTZhgGYz9dbN9L3ktsljEn1QY0EA78QxUtbkoRKwaUxqAYEndrQ8
	z/Q+s1v9ONhbWUpi8DNCJoikga1XsiuRKJ1iWNr93RwPf4UhIz8YJse8crqE/zU7VS+w6WXSd6f3x
	C7OgRdSebxEXQzNcTGtjadGkPw2VNTwy9Sfx/0YM5HW3xUEeG9ycXSoAT6VRFeC2MIpplypq/CslW
	Vc8sB7/4uU5ldrwEmB/piqbu0yPio63ROnHzmaVoUCCUH7bSWVpXGFkVhsbrg67qTuWylL5ziqWRQ
	502UO7Ny3DtHF/ReUtQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvQT-0000000HW17-0cC1;
	Thu, 07 Aug 2025 07:52:37 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujvOv-0000000HVtC-1Kl5
	for linux-mtd@lists.infradead.org;
	Thu, 07 Aug 2025 07:51:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 276E81F68F;
	Thu,  7 Aug 2025 07:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754553058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGKstv3GuAM43Nh+BV2LNRRufA5d5mb33q0ZpOcVjS8=;
	b=dAECNntGaaM4+2vbuxBwqgOyZhzw2ZjN6fYACuipFs0k5F3vaBccp4MMIdhbnuw/MyTSpu
	6MwANAT/S/hTUTSHFdQJZp0TEeVlpwhNufZIw4fGuhB2rMMcfryrXTYY3xLaUK8dnpAPSK
	tr1NhKeMBagC8Ck/g9IkP9mobQDX7C5ho6djxH5Sj2/y1OenhQMetphs/b6O+IzOPq1qEG
	hVyULqNmB3yHADZCyw1p3F1Aju96ui7z3k3e+MbRpkVEhDbij8yxTNs6W8he4YTZSQygwF
	ehGp1Ctv5BK84CCM0l4Mv2ILdAMvDhG6BfgK6q9mAJRIzKjTZxPMs/cNwVFxoQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: expose ooblayout information via sysfs
In-Reply-To: <25dcf103-3cd3-400a-b402-cbb5f23006c9@gmail.com> (Gabor Juhos's
	message of "Wed, 6 Aug 2025 20:40:21 +0200")
References: <20250719-mtd-ooblayout-sysfs-v1-1-e0d68d872e17@gmail.com>
	<87tt2ley48.fsf@bootlin.com>
	<25dcf103-3cd3-400a-b402-cbb5f23006c9@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 07 Aug 2025 09:50:57 +0200
Message-ID: <878qjvefj2.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtfeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_005102_304669_99E0C62C 
X-CRM114-Status: GOOD (  11.57  )
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

SGkgR2Fib3IsCgo+PiBJIHdvdWxkIHByZWZlciBhIGRlYnVnZnMgZW50cnksIGFzIHRoaXMgaXMg
bW9zdGx5IGZvY3VzaW5nIG9uCj4+IGRldmVsb3BtZW50IGFuZCBkZWJ1Z2dpbmcgcHVycG9zZXMu
IHN5c2ZzIGhhcyBhIHN0YWJsZSBBUEksIHdoaWNoIG1ha2VzCj4+IGl0IGEgbGVzcyByZWxldmFu
dCBwbGFjZSBpbiB0aGlzIGNhc2UuCj4KPiBTb3JyeSwgaXQgc2VlbXMgdGhhdCBJIG1pc3VuZGVy
c3Rvb2QgdGhlIEFCSSBkb2N1bWVudGF0aW9uLgo+Cj4gU2luY2UgdGhlICdzeXNmcy1jbGFzcy1t
dGQnIGZpbGUgaXMgdW5kZXIgdGhlICd0ZXN0aW5nJyBkaXJlY3RvcnkKPiB3aXRoaW4KCkl0IGlz
IGluZGVlZCB1bmNsZWFyLiBJJ20gbm90IHN1cmUgbXlzZWxmIHdoYXQgdGhhdCBleGFjdGx5IG1l
YW5zIFRCSCwKYnV0IGl0J3MgYmVlbiB0aGVyZSBmb3IgYSBsb25nIHRpbWUgYW5kIGNhbiBmb3Ig
c3VyZSBiZSBjb25zaWRlcmVkCnN0YWJsZS4gU3lzZnMgaW4gZ2VuZXJhbCBpcyBub3QgZm9yIGRl
YnVnZ2luZy4KCj4gJ0RvY3VtZW50YXRpb24vQUJJJyBJIHRob3VnaHQgdGhhdCBpdCBjYW4gYmUg
ZXh0ZW5kZWQgYnkgYXR0cmlidXRlcyB1c2VkIGZvcgo+IHRlc3RpbmcgcHVycG9zZXMuIEFkZGl0
aW9uYWxseSwgdGhlICdvb2JhdmFpbCcgYW5kICdvb2JzaXplJyBhdHRyaWJ1dGVzIGFyZQo+IGV4
cG9zZWQgdmlhIHN5c2ZzLCBzbyBpdCBzZWVtZWQgdG8gYmUgYSBsb2dpY2FsIHBsYWNlIGZvciB0
aGUgbmV3IG9vYiByZWxhdGVkIG9uZXMuCj4KPiBOZXZlcnRoZWxlc3MsIEkgd2lsbCBjaGVjayB3
aGF0IGNhbiBJIGRvIHdpdGggdGhlIGRlYnVnZnMgYmFzZWQKPiBhcHByb2FjaC4KClN1cmUsIHRo
YW5rcyEKCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
