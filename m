Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD478C87FCB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Aug 2025 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rEsEjqjJ3uOlpAoR0d+w7B02q0wrboCr0akGAxHp+7s=; b=5CbTMDvHNisHGl
	Y9A+Jo7c2eBaHUuDE5jTCIiKQt+E7gvC8FQDiEmac1mWB1hOEsswNESIg0tME2fZuRXkLKIlgXB1e
	ud0Or0cFcmPnPC0Ap6S07OISUT3WsAW0sSPVr/pTccVOpKPYCslSBOXszz+nEpxCamZtN5VlPMJS0
	L9iAWypey6t6qmsuGxzrNV0RKmphFo8wBfbODHeDa37HDO2uV/XqIsLLwRR2IbtvhPT1BHHNXw+Wh
	y6s8o66BHUGaOQclcGhtwSpOx/RFrZbi0CSr4w8Wl/EhoxK0IOHvWx0cgd+nVQM3NmtXWQ+G0ad1E
	+P0i6fG2Z2EHBpx4pXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCSN-0000000C4tg-1Mva;
	Tue, 05 Aug 2025 07:51:35 +0000
Received: from relay16.mail.gandi.net ([217.70.178.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujCOL-0000000C3px-2KrH
	for linux-mtd@lists.infradead.org;
	Tue, 05 Aug 2025 07:47:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A3DC4386A;
	Tue,  5 Aug 2025 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754380043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EGBoETZeMSGMwzcc7qB5a9vKg/xs1NgWBNZ3Tpd+Dho=;
	b=kQWQwH7sn/5PMpjy6GC/5ITTZ/ozd91/lziugHOgyN86Dxhwe2seRDO6E+zodyu6kgZlQN
	nSSGNCpPY0PCe0w49keWBK08jq4CdLSbvW4c4IPQYA/+VHYidQGtXt9khUMAgvm5LBYIV8
	VqI9m627TFpbYBCjU8njqOiXXhBNgga5osMxjbOcbjfxyDHddAE95bPCfDvxswA5FfktKQ
	dwQquAClznxVAP44b6MTz5uttpgdzTmDQNxoojv6ebFwhVJKMmhweSpIgoeoEmg+4QKfCZ
	guiiyTUtCyDjhG4HE23H7GZDxg+vecLeGXGNBjgkKuBc+amuARZsD1DWsYB2eA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Richard Weinberger
 <richard@nod.at>,  Tudor Ambarus <Tudor.Ambarus@linaro.org>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  Frieder Schrempf
 <frieder.schrempf@kontron.de>,  Michael Walle <michael@walle.cc>,
  linux-mtd@lists.infradead.org
Subject: Re: [GIT PULL] mtd: Changes for 6.17
In-Reply-To: <CAHk-=wjxPV1NGZokCyg2su=y1nmJFXTb4asrosw_W+yyqNaq_w@mail.gmail.com>
	(Linus Torvalds's message of "Mon, 4 Aug 2025 08:53:14 -0700")
References: <87o6t08fen.fsf@bootlin.com> <mafs0v7n7cd5a.fsf@kernel.org>
	<87cy9f5bmj.fsf@bootlin.com> <mafs0qzxrcfq2.fsf@kernel.org>
	<CAHk-=wjxPV1NGZokCyg2su=y1nmJFXTb4asrosw_W+yyqNaq_w@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Tue, 05 Aug 2025 09:47:21 +0200
Message-ID: <87fre6i512.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudegieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehprhgrthihuhhshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvfhuughorhdrtehmsggrrhhusheslhhinhgrrhhordhorhhgpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehfr
 hhivgguvghrrdhstghhrhgvmhhpfheskhhonhhtrhhonhdruggvpdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_004725_787931_F83E5095 
X-CRM114-Status: GOOD (  17.60  )
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

SGVsbG8sCgpPbiAwNC8wOC8yMDI1IGF0IDA4OjUzOjE0IC0wNywgTGludXMgVG9ydmFsZHMgPHRv
cnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiB3cm90ZToKCj4gT24gTW9uLCA0IEF1ZyAyMDI1
IGF0IDA3OjQwLCBQcmF0eXVzaCBZYWRhdiA8cHJhdHl1c2hAa2VybmVsLm9yZz4gd3JvdGU6Cj4+
Cj4+ID4KPj4gPiBJJ20gZmluZSBlaXRoZXIgd2F5cywgYnV0IEkgYXNzdW1lZCB1bnRpbCBub3cg
dGhhdCB0aGUgcHJlZmVycmVkIGZvcm0KPj4gPiB3YXMgcGxhaW4gdGV4dCBkZXNjcmlwdGlvbnMu
Cj4+Cj4+IE9rYXksIGZhaXIgZW5vdWdoLiBJIGNhbiBkbyBwbGFpbiB0ZXh0IG5leHQgdGltZSBh
cm91bmQuCj4KPiBJJ20gYWN0dWFsbHkgZmluZSBlaXRoZXIgd2F5IC0gd2hhdCBJIGNhcmUgYWJv
dXQgaXMgdGhhdCBpdCdzIGEKPiBodW1hbi1yZWFkYWJsZSBleHBsYW5hdGlvbiBvZiB3aGF0IGlz
IGdvaW5nIG9uLCBhbmQgd2hhdCBJIGdldCB3aGVuIEkKPiBwdWxsLgoKWy4uLl0KCj4gKEFuZCB5
ZXMsIEkgb2Z0ZW4gZmluZCBteXNlbGYgdG8gYmUgdGhhdCBwZXJzb246IEkgYmlzZWN0IHNvbWUg
aXNzdWUKPiBwcmV0dHkgbXVjaCBldmVyeSBzaW5nbGUgbWVyZ2Ugd2luZG93LCBhbmQgd2hpbGUg
SSB1c3VhbGx5IGhhdmUgYSBnb29kCj4gaWRlYSBvZiB3aGF0IGlzIGdvaW5nIG9uLCBhbmQganVz
dCB0cnVzdCAiZ2l0IGJpc2VjdCIgdG8gZG8gdGhlIHJpZ2h0Cj4gdGhpbmcsIEkgKmRvKiBlbmQg
dXAgbG9va2luZyBiYWNrIGF0IG1lcmdlcyB0byBzZWUgd2hlcmUgSSBhbSBpbiB0aGUKPiBiaXNl
Y3Rpb24gcHJvY2VzcykKCjopCgo+IEl0IGNhbiBiZSBidWxsZXQgcG9pbnRzIHdoZW4gdGhhdCBt
YWtlcyBzZW5zZSwgb3IgaXQgY2FuIGJlIG1vcmUgb2YgYQo+IHBsYWluIHRleHQgZXhwbGFuYXRp
b24gb2YgdGhlIGJhY2tncm91bmQgdG8gYSBjaGFuZ2UuCgpUaGFua3MgTGludXMgZm9yIHRoZSBk
ZXRhaWxlZCBhbnN3ZXIuCgpQcmF0eXVzaCwgSSBndWVzcyBJJ2xsIHN3aXRjaCBiYWNrIHRvIGJ1
bGxldCBwb2ludHMgdG8gaGlnaGxpZ2h0IHdoYXQKYXJlIHRoZSBpbXBvcnRhbnQgY2hhbmdlcywg
c28geW91IGNhbiBzdGljayB0byB3aGF0IHlvdSB3ZXJlIGRvaW5nLiBJZiBJCmZlZWwgbGlrZSBw
bGFpbiB0ZXh0IHdvdWxkIGJlIHNvbWV0aW1lcyBiZXR0ZXIgSSBtaWdodCBtaXggYm90aApvY2Nh
c2lvbmFsbHkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
