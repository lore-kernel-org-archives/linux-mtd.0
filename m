Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C04C7115D
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Jun 2025 18:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yz8ec3kxKb1YGX+84C3Yv/ZTTLhyivPi7zDXjABAJ60=; b=ye+MGU+srWlhxA
	RO3QyjR1DM8fqA/QCZFCsLS8cac1ohJDDuy+A+n5fH6sCIFYskeSDHpCl1Mz++BdUz8xQ1O9edWXm
	ZfMFCEsVJKonyrkAVeGPwuNqwtV/EplN4ANhnsJAZgLHZlZ4gECdwcEqv8XhFBjjkrNs+DVCKaAvI
	vJbS9tRwlYS8O5Ndp3WJyFuh9zSeAE70KCQA+8qIUZ8NjuU5psDMrc/C19dj/IPg7RE8jdggicfMb
	iA1RoVh/tB7qo6IuttjFZaKUA5jrvWAEzCpWBjxuHv7NzsRZwcmXEbnSl11206OOB4Rq3TQUHwTOQ
	l2lGXSY6wAC5mjyolUxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKC4-0000000DykQ-3fjM;
	Thu, 19 Jun 2025 18:41:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIhE-0000000Dhwv-2FgE
	for linux-mtd@bombadil.infradead.org;
	Thu, 19 Jun 2025 17:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0gW0E+8EdNxskgZ4Hbgae3VgklRgsaBehOS8/OoR1GE=; b=giUMJF98N90c/765ff/xV7pjc+
	pb29mg5n4lMkeDfRDRzEPePjbkyfX/xd6m8PL35HHWpT1ZCzfPB1JEazTxvuk3OthMj36xovKI9Uu
	G+2sgvCCRvDohKL+DiWsypAfkCAyi+5zp4BMqMkHWqKnu2M9+6frN4mmAWOsIKhvPqbAYZavNvb+R
	xtPze3Ozlv6o2okNd6nXiKjA5nUZjGGexuzkN/zk/kO/eXsgSc0vqNBXdSuVyxZZoOKrZZh/dkdQY
	yPX+I6P9PK4yFODMX2ZU08zvHJLfm0dMexXpTgvNmGCcsoboOn0gEt4fsqmIZjRAWFNvMN+CcuzH0
	8edyLiDQ==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIhB-00000004U2A-3RqQ
	for linux-mtd@lists.infradead.org;
	Thu, 19 Jun 2025 17:05:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A87843121;
	Thu, 19 Jun 2025 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750352698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0gW0E+8EdNxskgZ4Hbgae3VgklRgsaBehOS8/OoR1GE=;
	b=LH8hsriQM35rPe6u8Z71tlfpnEni9mJue0YuVWDgnWy067McbCS9HimC0Gn+bklv6qnpbL
	1P05vN1Qx4cpx8X7I8VsLdr7aF2q6t8Zx+Ai5FJlzP/+5mA4yCNr1wZG7srShOFi81tvVH
	Y7PqzQmYODiQS/uR9JOmf5b/BOTSLpRxx5Menu2YcEQND85+lG2oUnQAJwcS2KfzVNCtt1
	Pb3/mOoyAnrIBBEwr9hgJIOfFNDqT2LxnlOmT0a/vSSjs8w1OTmtD0QSNRik4XVxvM4o6O
	EMLfAqifvm0nDn6vg58ndgnqBo4JR/5FTnN8Cw/YAp/0dj9UEPu6gDX0/BVftw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,  vigneshr@ti.com,  gch981213@gmail.com,
  richard@nod.at,  linux-mtd@lists.infradead.org,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>
Subject: Re: [PATCH 1/1] mtd: spi-nand: macronix: disable continuous read
 for MX35LFxGE4AD
In-Reply-To: <CAAyq3SaSYMed-NrHHu0UCyphnxGwdb9YJpQkmoX3Us6=K31erg@mail.gmail.com>
	(Cheng Ming Lin's message of "Fri, 20 Jun 2025 00:56:03 +0800")
References: <5c7ad4dc-a80b-488a-87aa-ecd6389e86c8@ti.com>
	<20250619140003.103637-1-amadeus@jmu.edu.cn>
	<87zfe3zney.fsf@bootlin.com>
	<CAAyq3SaSYMed-NrHHu0UCyphnxGwdb9YJpQkmoX3Us6=K31erg@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Thu, 19 Jun 2025 19:04:55 +0200
Message-ID: <87qzzfzmq0.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeitdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrdduuddtrdduudejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledvrddukeegrdduuddtrdduudejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtoheplhhinhgthhgvnhhgmhhinhhgkeekgeesghhmrghilhdrtghomhdprhgtphhtthhopegrmhgruggvuhhssehjmhhurdgvughurdgtnhdprhgtphhtthhopehvihhgnhgvshhhrhesthhirdgtohhmpdhrtghpthhtohepghgthhelkeduvddufeesghhmrghilhdrtghomhdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehlihhnuhigqdhmthgusehli
 hhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghhvghnghhmihhnghhlihhnsehmgihitgdrtghomhdrthif
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_180502_043203_A0E3D217 
X-CRM114-Status: GOOD (  11.93  )
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

Cj4+ID4gQWZ0ZXIgZGlzYWJsaW5nIGNvbnRpbnVvdXMgcmVhZCwgdGhpcyBmbGFzaCB3b3JrcyBm
aW5lLgo+PiA+IFNvIGRlc3BpdGUgdGhlIGRhdGFzaGVldCBzdGF0aW5nIHN1cHBvcnQsIEkgdGhp
bmsgaXQgd291bGQgYmUKPj4gPiBiZXR0ZXIgdG8gZGlzYWJsZSBpdCBmaXJzdCB0byBhdm9pZCBi
cmlja2luZyBNVDc5ODEgZGV2aWNlcwo+PiA+IHdpdGggTVgzNUxGeEdFNEFEIGZsYXNoLgo+Pgo+
PiBJIGFtIHNvcnJ5IGJ1dCBkaXNhYmxpbmcgdGhlIGZlYXR1cmUgZm9yIGV2ZXJ5IHVzZXIgb2Yg
dGhlIGNoaXAgZG9lcyBub3QKPj4gd29yayBpZiB0aGUgcHJvYmxlbSBjb21lcyBmcm9tIHRoZSBT
UEkgY29udHJvbGxlci4KPj4KPj4gSSBqdXN0IGFkZGVkIENoZW5nIE1pbmcgZnJvbSBNYWNyb25p
eC4gQ2hlbmcgTWluZywgY2FuIHlvdSBjb25maXJtIHRoZXNlCj4+IGNoaXBzIHN1cHBvcnQgY29u
dGludW91cyByZWFkPyBJcyB0aGVyZSBhbnl0aGluZyBzcGVjaWZpYyBhYm91dCB0aGVtCj4+IHRo
YXQgbWlnaHQgY2F1c2UgdGhpcyBicmVha2FnZT8KPgo+IFllcywgSeKAmXZlIGNvbmZpcm1lZCBm
cm9tIHRoZSBkYXRhc2hlZXRzIHRoYXQgdGhlc2UgY2hpcHMgZG8gc3VwcG9ydAo+IGNvbnRpbnVv
dXMgcmVhZC4gQWRkaXRpb25hbGx5LCBJ4oCZdmUgdmFsaWRhdGVkIHRoaXMgb24gdGhlIFp5bnEg
cGxhdGZvcm0KPiB3aGVuIHVzaW5nIHViaWF0dGFjaCwgdGhlIGNoaXAgb3BlcmF0ZXMgbm9ybWFs
bHkgYW5kIGNvbnRpbnVvdXMgcmVhZAo+IHdvcmtzIGFzIGV4cGVjdGVkLgo+Cj4gVGhhdOKAmXMg
d2h5IEkgZm9sbG93ZWQgdXAgd2l0aCBoaW0gdG9kYXkgdG8gY29uZmlybSB0aGUgZXhhY3QgZXhw
ZXJpbWVudAo+IHByb2NlZHVyZS4gSeKAmWQgbGlrZSB0byB1bmRlcnN0YW5kIGhvdyB0aGUgdGVz
dCB3YXMgY29uZHVjdGVkIHRoYXQgbGVkIHRvCj4gdGhlIG9ic2VydmVkIGlzc3VlLgoKRXhjZWxs
ZW50LCB0aGFua3MgZm9yIHRoZSB2ZXJ5IGZhc3QgYW5zd2VyLCBsZXQgdXMga25vdyB0aGUgb3V0
Y29tZSBpZgp5b3UgZmluZCBzb21ldGhpbmcuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
