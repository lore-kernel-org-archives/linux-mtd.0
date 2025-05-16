Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA8FC3ABC9
	for <linux-mtd@archiver.kernel.org>; Fri, 16 May 2025 14:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIxBN9Mgivqwc0ylxp6Js0S2Us3UbE+JxjdChtL/XUI=; b=NljzP0VJkfq9R/
	OMrLlXEA0BeCVVOBY5czOLE0YkJOfo7cxAHPFA89GITPZt5HHory709EWaxq+zTtLRW+xjGAzw8Yd
	uahmXo24qxKt6Lw1JezXK0iwW/8Q2gl8qZSuU4r7v16j+2qBeu0gVjcGb0Eoxttk6pWiiIa6mPQf2
	VH2ihyCIFDDaR6H+MRUEQcDv4jtigpiXObMOR3YYJxMbPRuMKkkWoEh8KuhLB4bUBAVim1r606SU7
	IiynlPOxOI/iezsYwf/XpMQcnMg1lKB/RgyCR+MsBcOvCAoii6WeEWkZuIKAs4GzHrDSq5S+kDJZO
	dJUvDqBjY6bggUAbIt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwT5-00000003jyT-0me3;
	Fri, 16 May 2025 14:55:23 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvp9-00000003dQP-2uMp
	for linux-mtd@lists.infradead.org;
	Fri, 16 May 2025 14:14:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F38F43B30;
	Fri, 16 May 2025 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747404843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nFxrTARUlK2wFNTl5JJRwfbFdvOaKS20BeXfCwf1OTM=;
	b=WbVJvmqx5SngaVM6UbdN+k9MvlZmejh+STd37xHqMa6/V80ztCv5TTyvQqSF2ZFbZuwKLG
	wqcf/iCEFmf8tLYq3LMumYMnGDFOseajphKL6i+k31pj7vzXlinRSTRo8CT9Z0F1SB40zI
	BHSk0xRU9k/soVzGY9kc3SAipmmXKrorQxSmg2aGvmDWSBguOJBCOn407tmRTQoOfqXv0n
	d9NWSnlxHF7WhTkWf8Qm1B+4bSnL3GejLkgtR1fC3GEQrtmP0adKgUX/P4EW0pMh7CgfPj
	NHTpSKDUXR1oQCOIhrvdO+6740uBOxG+S7nZM5LxV3WNBvF8uWtl1jPLG7wn7g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Varadarajan Narayanan <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  <linux-spi@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH next 2/2] spi: spi-qpic-snand: add support for 8 bits
 ECC strength
In-Reply-To: <007881c9-e03c-1473-d8eb-53fbad8c6a8e@quicinc.com> (Md Sadre
	Alam's message of "Tue, 13 May 2025 21:05:09 +0530")
References: <20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com>
	<20250502-qpic-snand-8bit-ecc-v1-2-95f3cd08bbc5@gmail.com>
	<8aa3d4da-da3e-2af4-e0f9-cd56d6259d8f@quicinc.com>
	<c1729d39-9f7f-4c6d-b8a4-72dfee4bfca5@gmail.com>
	<878qn2nsa0.fsf@bootlin.com>
	<16195524-1f31-4968-a3fd-f3d24f1c4223@gmail.com>
	<87msbhezjf.fsf@bootlin.com>
	<007881c9-e03c-1473-d8eb-53fbad8c6a8e@quicinc.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 16 May 2025 16:14:00 +0200
Message-ID: <87frh4ej87.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrnhhivhgrnhhnrghnrdhsrgguhhgrshhivhgrmheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhto
 hepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_071407_885178_BCB413F8 
X-CRM114-Status: UNSURE (   8.60  )
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

Cj4+PiBJbnRlcmVzdGluZ2x5IGVub3VnaCwgaXQgcmVwb3J0cyB0aGUgY29ycmVjdCBudW1iZXIg
b2YgYml0IGVycm9ycyBub3cuCj4+PiBGb3IgbWUgaXQgc2VlbXMsIHRoYXQgdGhlIGhhcmR3YXJl
IHJlcG9ydHMgdGhlIG51bWJlciBvZiB0aGUgY29ycmVjdGVkCj4+PiAqYnl0ZXMqIGluc3RlYWQg
b2YgdGhlIGNvcnJlY3RlZCAqYml0cyouCj4+IEkgZG91YnQgdGhhdCwgbm9ib2R5IGNvdW50cyBi
eXRlcyBvZiBlcnJvcnMuCj4+IFlvdSByZXN1bHRzIGFyZSBzdXJwcmlzaW5nLiBJIGluaXRpYWxs
eSB0aG91Z2ggaW4gZmF2b3VyIG9mIGEgc29mdHdhcmUKPj4gYnVnLCBidXQgdGhlbiBpdCBsb29r
cyBldmVuIHdlaXJkZXIgdGhhbiB0aGF0LiBBbGFtPwo+IEkgaGF2ZSBjaGVja2VkIHdpdGggSFcg
dGVhbSAsIHRoZSBRUElDIEVDQyBIVyBlbmdpbmUgcmVwb3J0cyB0aGUgYml0Cj4gZXJyb3IgYnl0
ZSB3aXNlIG5vdCBiaXQgd2lzZS4KPgo+IGUuZwo+ICAgICBCeXRlMCAtLT4gMi1iaXRmbGlwcyAt
LT4gUVBJQyBFQ0MgY291bnRzIDEgb25seQo+ICAgICBCeXRlMSAtLT4gMy1iaXRmbGlwcyAtLT4g
UVBJQyBFQ0MgY291bnRzIDEgb25seQo+ICAgICBCeXRlMiAtLT4gMS1iaXRmbGlwcyAtLT4gUVBJ
QyBFQ0MgY291bnRzIDEgb25seQo+ICAgICBCeXRlMyAtLT4gNC1iaXRmbGlwcyAtLT4gUVBJQyBF
Q0MgY291bnRzIDEgb25seSAoaW4gOC1iaXQgZWNjKQo+ICAgICBCeXRlNCAtLT4gNi1iaXRmbGlw
cyAtLT4gUVBJQyBFQ0MgY291bnRzIDEgb25seSAoaW4gOC1iaXQgZWNjKQo+Cj4gSG9wZSB0aGlz
IGNhbiBjbGVhcmlmeSB0aGUgdGhpbmdzIG5vdy4KCm9fTyA/Pz8/CgpIb3cgaXMgdGhhdCBldmVu
IHVzZWZ1bD8gVGhpcyBiYXNpY2FsbHkgbWVhbnMgVUJJIHdpbGwgbmV2ZXIgcmVmcmVzaCB0aGUK
ZGF0YSBiZWNhdXNlIHdlIHdpbGwgY29uc3RhbnRseSB1bmRlcmVzdGltYXRlIHRoZSBudW1iZXIg
b2YgYml0ZmxpcHMhIFdlCm5lZWQgdG8ga25vdyB0aGUgYWN0dWFsIG51bWJlciwgdGhpcyBhdmVy
YWdpbmcgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UKZm9yIExpbnV4LiBJcyB0aGVyZSBhbm90aGVy
IHdheSB0byBnZXQgdGhlIHJhdyBudW1iZXIgb2YgYml0ZmxpcHM/CgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
