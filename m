Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A821C369DC
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=59GrKhKOkUTzdf7tZCsj6wmlS0ZowY2WCJmVXc82CSo=; b=gsIZMgX+375yfc
	E8wkqwV/xb7h9VCsTuygLnI50IqwOPYNzTaPzWmCASsO05EJaNnK49BMGnH936j+s1nAsEbtu0k4V
	h6bQmdlTsCApg39VkXmVjHG7VSbcz69Ft1SBRrp1X6kR2DPCSFWAcaortt3X33qBKzGcmJZjMux6G
	3vQFqEsEpXOAeKORxz7qBhwiDXEyaGwj31NJUetyB1OllBQhJ77fFjSIfUf9u09mkNOj8L1X8ol3A
	4FOouMHnsJ7AaimsmtST6DA7kvhNyw8qoI4sbDdbXYcMyXGZSOmhNMMIn1R3o+9ID5jiBjVFVSVnN
	2Y9WuIu1FlHy0KhjXfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hFB-0000000989H-1Q5m;
	Tue, 29 Apr 2025 09:27:13 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9hF8-0000000987o-1uMm
	for linux-mtd@lists.infradead.org;
	Tue, 29 Apr 2025 09:27:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A2EA24330A;
	Tue, 29 Apr 2025 09:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745918827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2BEsZEXCs1M05aaWraZX8cJyox+y1wvJ/ugKyQkcHbk=;
	b=VGhUfXtxFKlop6RasrXGGIa4QPusXTmg13rZxFcrkSxVIv6k82G+oj10XdYEL6KgV5GkDM
	FohdJRKPRI0x+H+7xgSMGj4qeH4ZFF4MUHhSct/4EEM0hOGs7WSyVH5cMdpL8xCFhLOvDd
	Q0C5Aquva6Z27TRWbMhWwJLDupysLbtNt32/DDgV1taCGmxZ3Xy2FvWzLX26CKhFins1PT
	FqqL2iHODiHk+lZm2q5Uo8LxtTa6kgZNQuH3XYgCb03/gdnS9cLZ9fnC/Xbu4+Q5a43W7Z
	QBzuDy7CdNgyDmNRpOuFthm4ATyw2kNM+iV5PMTBIBVo4WHH/bL8144dzVQTAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, manivannan.sadhasivam@linaro.org, 
 broonie@kernel.org, absahu@codeaurora.org, bbrezillon@kernel.org, 
 architt@codeaurora.org, quic_srichara@quicinc.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
In-Reply-To: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
Subject: Re: [PATCH v4 0/3] QPIC v2 fixes for SDX75
Message-Id: <174591882547.993955.17062615074678307127.b4-ty@bootlin.com>
Date: Tue, 29 Apr 2025 11:27:05 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieefgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfgjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepfffhudefgfeuueehueevudeiieejhfejudevudevieetvdetfedtfffhjeeileefnecukfhppeelvddrudekgedruddtkedrvdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrvdehhedphhgvlhhopegludelvddrudeikedruddruddtiegnpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrnhhivhgrnhhnrghnrdhsrgguhhgrshhivhgrmheslhhinhgrrhhordhorhhgpdhrt
 ghpthhtoheprggsshgrhhhusegtohguvggruhhrohhrrgdrohhrghdprhgtphhtthhopehquhhitggpmhgurghlrghmsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepqhhuihgtpghsrhhitghhrghrrgesqhhuihgtihhntgdrtghomhdprhgtphhtthhopegrrhgthhhithhtsegtohguvggruhhrohhrrgdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_022710_656029_7FECE144 
X-CRM114-Status: UNSURE (   8.29  )
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

T24gVGh1LCAxMCBBcHIgMjAyNSAxNTozMDoxNiArMDUzMCwgTWQgU2FkcmUgQWxhbSB3cm90ZToK
PiBUaGUgQkFNIGNvbW1hbmQgZGVzY3JpcHRvciBwcm92aWRlcyBvbmx5IDE4IGJpdHMgdG8gc3Bl
Y2lmeSB0aGUgTkFORAo+IHJlZ2lzdGVyIG9mZnNldC4gQWRkaXRpb25hbGx5LCBpbiB0aGUgQkFN
IGNvbW1hbmQgZGVzY3JpcHRvciwgdGhlIE5BTkQKPiByZWdpc3RlciBvZmZzZXQgaXMgc3VwcG9z
ZWQgdG8gYmUgc3BlY2lmaWVkIGFzICIoTkFORGMgYmFzZSAtIEJBTSBiYXNlKQo+ICsgcmVnX29m
ZiIuIFNpbmNlLCB0aGUgQkFNIGNvbnRyb2xsZXIgZXhwZWN0aW5nIHRoZSB2YWx1ZSBpbiB0aGUg
Zm9ybSBvZgo+ICJOQU5EYyBiYXNlIC0gQkFNIGJhc2UiLCBzbyB0aGF0IGFkZGVkIGEgbmV3IGZp
ZWxkICdiYW1fb2Zmc2V0JyBpbiB0aGUKPiBOQU5EIHByb3BlcnRpZXMgc3RydWN0dXJlIGFuZCB1
c2UgaXQgd2hpbGUgcHJlcGFyaW5nIHRoZSBjb21tYW5kIGRlc2NyaXB0b3IuCj4gCj4gWy4uLl0K
CkFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MhCgpbMS8zXSBtdGQ6IHJhd25hbmQ6IHFjb206
IFBhc3MgMTggYml0IG9mZnNldCBmcm9tIE5BTkRjIGJhc2UgdG8gQkFNIGJhc2UKICAgICAgY29t
bWl0OiBlZTAwMDk2OWYyOGJmNTc5ZDM3NzJiZjdjMGFlOGFmZjg2NTg2ZTIwClsyLzNdIG10ZDog
cmF3bmFuZDogcWNvbTogRml4IGxhc3QgY29kZXdvcmQgcmVhZCBpbiBxY29tX3BhcmFtX3BhZ2Vf
dHlwZV9leGVjKCkKICAgICAgY29tbWl0OiA0N2JkZGFiYmY2OWRhNTA5OTllYzY4YmU5MmI1ODM1
NmM2ODdlMWQ2ClszLzNdIG10ZDogcmF3bmFuZDogcWNvbTogRml4IHJlYWQgbGVuIGZvciBvbmZp
IHBhcmFtIHBhZ2UKICAgICAgY29tbWl0OiBlNjAzMWIxMTU0NGI0NDk2NmJhMDIwYzg2N2ZlNDM4
YmNjZDNiZGZhCgpQYXRjaGUocykgc2hvdWxkIGJlIGF2YWlsYWJsZSBvbiBtdGQvbGludXguZ2l0
IGFuZCB3aWxsIGJlCnBhcnQgb2YgdGhlIG5leHQgUFIgKHByb3ZpZGVkIHRoYXQgbm8gcm9ib3Qg
Y29tcGxhaW5zIGJ5IHRoZW4pLgoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
