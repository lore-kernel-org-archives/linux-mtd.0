Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C09C2D0CD
	for <linux-mtd@archiver.kernel.org>; Wed, 21 May 2025 07:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b6iFcP0zIOpaA5jjd0t5aacvnWKHlPRv/kfbaJl7bF4=; b=w1/H+dWQ6tuGBx
	Hn+VTvdOtxRWkYM86ThY7dRyvIbdlEorPiTE/Iw8Jq+Gib4i+T819DPoOb4xr1mOzbZ7bYakMk/si
	47wUl3PmQ3Doofr5uoAv0Ml4PVW6qTTQG+/Z+1zEr2mIUIkJ0B3yfdRLaHcaoB023kacy7vz1H4W2
	4rJQaeBzFqpxnB8eGOOmyFhbMNPXCMsGN0iUwVLfWH5IiWJKfgQPJF5vjbA6RU3pXYAPOQM61jfkg
	M6Hcvc0kT+QOrkzMkt7cjSBLImeTF9DoOSC2S16dSt814lZniPjG/VuD/k7gqpjrVBoko71LSa3Ry
	MaNsypnlxAwRGDkD27kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHeFj-0000000F6eY-13V7;
	Wed, 21 May 2025 07:52:39 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHeFf-0000000F6e9-43Ct
	for linux-mtd@lists.infradead.org;
	Wed, 21 May 2025 07:52:37 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7CB443E3A;
	Wed, 21 May 2025 07:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747813952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTX81h9G8aXD+7JUezIJElO7ofVmpUIJ9dOvTE7EZYU=;
	b=kEtrPH98gylBd4+JZ89TFaO4BcZthV9Wte4mp9eciEjpkdsnOFEF8MSv4ePIb8dfiQGS7H
	qKQVtn1ytcQT64zRU7moFryKdbHsJTIJfmg1WoYBwB66fOWVquEW+y4Xe213lo/2gH+Kxr
	NyBl7ZEpb2xzftcO9W7Me8ix1yX9tic+NUdZL0XWl16tQC4Cso9JSg1X+tdfMUDQN135LK
	qOr/YuP5KTErCd+EeS7lx5tS6xF7eL6ogeVKumVPyXpUc6BB+FYEiX1BYCIT/pLkPpkvil
	xZqE/cU4JyQnGJFuMsj07dRw9EfpQSTe7b9XABKFNrN1WcPt6FQJ1cdK5Ge7tg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  "Varadarajan Narayanan" <quic_varada@quicinc.com>,  Sricharan Ramabadhran
 <quic_srichara@quicinc.com>,  <linux-spi@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-msm@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH next 2/2] spi: spi-qpic-snand: add support for 8 bits
 ECC strength
In-Reply-To: <e9f460c3-a575-1014-cca7-27f1d79024e2@quicinc.com> (Md Sadre
	Alam's message of "Wed, 21 May 2025 11:08:02 +0530")
References: <20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com>
	<20250502-qpic-snand-8bit-ecc-v1-2-95f3cd08bbc5@gmail.com>
	<8aa3d4da-da3e-2af4-e0f9-cd56d6259d8f@quicinc.com>
	<c1729d39-9f7f-4c6d-b8a4-72dfee4bfca5@gmail.com>
	<878qn2nsa0.fsf@bootlin.com>
	<16195524-1f31-4968-a3fd-f3d24f1c4223@gmail.com>
	<87msbhezjf.fsf@bootlin.com>
	<007881c9-e03c-1473-d8eb-53fbad8c6a8e@quicinc.com>
	<87frh4ej87.fsf@bootlin.com>
	<e9f460c3-a575-1014-cca7-27f1d79024e2@quicinc.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 21 May 2025 09:52:31 +0200
Message-ID: <87h61e8kow.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvhedvucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepjhegghekhiejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrnhhivhgrnhhnrghnrdhsrgguhhgrshhivhgrmheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhou
 gdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehquhhitggpvhgrrhgruggrsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_005236_155916_C4D046A1 
X-CRM114-Status: GOOD (  13.93  )
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

T24gMjEvMDUvMjAyNSBhdCAxMTowODowMiArMDUzMCwgTWQgU2FkcmUgQWxhbSA8cXVpY19tZGFs
YW1AcXVpY2luYy5jb20+IHdyb3RlOgoKPiBIaSwKPgo+IE9uIDUvMTYvMjAyNSA3OjQ0IFBNLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiAKPj4+Pj4gSW50ZXJlc3RpbmdseSBlbm91Z2gsIGl0IHJl
cG9ydHMgdGhlIGNvcnJlY3QgbnVtYmVyIG9mIGJpdCBlcnJvcnMgbm93Lgo+Pj4+PiBGb3IgbWUg
aXQgc2VlbXMsIHRoYXQgdGhlIGhhcmR3YXJlIHJlcG9ydHMgdGhlIG51bWJlciBvZiB0aGUgY29y
cmVjdGVkCj4+Pj4+ICpieXRlcyogaW5zdGVhZCBvZiB0aGUgY29ycmVjdGVkICpiaXRzKi4KPj4+
PiBJIGRvdWJ0IHRoYXQsIG5vYm9keSBjb3VudHMgYnl0ZXMgb2YgZXJyb3JzLgo+Pj4+IFlvdSBy
ZXN1bHRzIGFyZSBzdXJwcmlzaW5nLiBJIGluaXRpYWxseSB0aG91Z2ggaW4gZmF2b3VyIG9mIGEg
c29mdHdhcmUKPj4+PiBidWcsIGJ1dCB0aGVuIGl0IGxvb2tzIGV2ZW4gd2VpcmRlciB0aGFuIHRo
YXQuIEFsYW0/Cj4+PiBJIGhhdmUgY2hlY2tlZCB3aXRoIEhXIHRlYW0gLCB0aGUgUVBJQyBFQ0Mg
SFcgZW5naW5lIHJlcG9ydHMgdGhlIGJpdAo+Pj4gZXJyb3IgYnl0ZSB3aXNlIG5vdCBiaXQgd2lz
ZS4KPj4+Cj4+PiBlLmcKPj4+ICAgICAgQnl0ZTAgLS0+IDItYml0ZmxpcHMgLS0+IFFQSUMgRUND
IGNvdW50cyAxIG9ubHkKPj4+ICAgICAgQnl0ZTEgLS0+IDMtYml0ZmxpcHMgLS0+IFFQSUMgRUND
IGNvdW50cyAxIG9ubHkKPj4+ICAgICAgQnl0ZTIgLS0+IDEtYml0ZmxpcHMgLS0+IFFQSUMgRUND
IGNvdW50cyAxIG9ubHkKPj4+ICAgICAgQnl0ZTMgLS0+IDQtYml0ZmxpcHMgLS0+IFFQSUMgRUND
IGNvdW50cyAxIG9ubHkgKGluIDgtYml0IGVjYykKPj4+ICAgICAgQnl0ZTQgLS0+IDYtYml0Zmxp
cHMgLS0+IFFQSUMgRUNDIGNvdW50cyAxIG9ubHkgKGluIDgtYml0IGVjYykKPj4+Cj4+PiBIb3Bl
IHRoaXMgY2FuIGNsZWFyaWZ5IHRoZSB0aGluZ3Mgbm93Lgo+PiBvX08gPz8/Pwo+PiBIb3cgaXMg
dGhhdCBldmVuIHVzZWZ1bD8gVGhpcyBiYXNpY2FsbHkgbWVhbnMgVUJJIHdpbGwgbmV2ZXIgcmVm
cmVzaAo+PiB0aGUKPj4gZGF0YSBiZWNhdXNlIHdlIHdpbGwgY29uc3RhbnRseSB1bmRlcmVzdGlt
YXRlIHRoZSBudW1iZXIgb2YgYml0ZmxpcHMhIFdlCj4+IG5lZWQgdG8ga25vdyB0aGUgYWN0dWFs
IG51bWJlciwgdGhpcyBhdmVyYWdpbmcgZG9lcyBub3QgbWFrZSBhbnkgc2Vuc2UKPj4gZm9yIExp
bnV4LiBJcyB0aGVyZSBhbm90aGVyIHdheSB0byBnZXQgdGhlIHJhdyBudW1iZXIgb2YgYml0Zmxp
cHM/Cj4gSSBoYXZlIHJlLWNoZWNrZWQgd2l0aCBIVyB0ZWFtLCB1bmZvcnR1bmF0ZWx5IGN1cnJl
bnRseSB0aGVyZSBpcyBubwo+IHJlZ2lzdGVyIGZpZWxkcyBhdmFpbGFibGUgdG8gZ2V0IHRoZSBy
YXcgbnVtYmVyIG9mIGJpdCBmbGlwcy4gQnV0Cj4gZm9yIG5ld2VyIGNoaXBzZXQgdGhleSBoYXZl
IGZpeGVkIHRoaXMgaXNzdWUuIEJ1dCBjdXJyZW50bHkgdGhlIFFQSUMKPiBRUElDX05BTkRDX0JV
RkZFUl9TVEFUVVMgfCAweDc5QjAwMTggcmVnaXN0ZXIgYml0LTggd2lsbCBnZXQgc2V0IGlmCj4g
dGhlcmUgaXMgdW5jb3JyZWN0YWJsZSBiaXRmbGlwcyBoYXBwZW5lZC4KPgo+IEZvciA0LWJpdCBF
Q0MgaWYgNS1iaXQgcmF3IGJpdCBmbGlwcyBoYXBwZW5lZCB0aGVuIGJpdC04IHdpbGwgZ2V0IHNl
dCBpbgo+IFFQSUNfTkFORENfQlVGRkVSX1NUQVRVUy4KPgo+IHNpbWlsYXIgZm9yIDgtYml0IEVD
QyBpZiA5LWJpdCByYXcgYml0IGZsaXBzIGhhcHBlbmVkIHRoZW4gYml0LTggd2lsbAo+IGdldCBz
ZXQgaW4gUVBJQ19OQU5EQ19CVUZGRVJfU1RBVFVTLgoKSSBiZWxpZXZlIHRoZSB1bnJlY292ZXJh
YmxlIHNpdHVhdGlvbiBpcyBoYW5kbGVkIGNvcnJlY3RseS4gV2hhdCBpcyBub3QKaXMgdGhlIGZh
Y3QgdGhhdCB3ZSBjYXJlIGFib3V0IHRoZSBudW1iZXIgb2YgYml0ZmxpcHMgYmVmb3JlIGhhdmlu
ZyBhCmZhaWx1cmUgYmVjYXVzZSBpZiBpdCByZWFjaGVzIGEgY2VydGFpbiB0aHJlc2hvbGQgKHR5
cGljYWxseSAyLzMgb2YgdGhlCnN0cmVuZ3RoKSB0aGUgdXBwZXIgbGF5ZXIgaXMgcmVzcG9uc2li
bGUgb2YgbW92aW5nIHRoZSBkYXRhIGFyb3VuZCB0bwphdm9pZCBsb29zaW5nIGl0LgoKWW91IG5l
ZWQgdG8gaWRlbnRpZnkgdGhlIGhhcmR3YXJlIHJldmlzaW9uIHRoYXQgZml4ZWQgaXQgYW5kIHBy
b3ZpZGUgYQp3YXJuaW5nIG90aGVyd2lzZSwgb3IgYXQgbGVhc3QgYSBjb21tZW50IGluIHRoZSBj
b2RlLi4uCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
