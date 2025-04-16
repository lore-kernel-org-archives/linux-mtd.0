Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE2EC369C2
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Apr 2025 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bWdfr3dLPLDZaF05CqX8xweuMnaPRucC5XhCRftMPEA=; b=CuE9EZV8XEU623SElmbxp80A5E
	x4P0MUwTi7sbP4HW2VWKgxrscGlqO2bjBLBIDNbvuSQ2hHisD62wzScH33th0wbKAdmG1ASwEuKay
	vrGhh3gSBRg8rcZdP4/kDDgAZqQA8NLPfL2EU+vU+4Ruud2Q1KQtic+io0AwBzNfrWmA9xzSHNSAs
	UyPRFUobkyaeWJ9zI3zlzmKCnJcJ2vKqbNMMpCE/HBCv5N55NjYy14bewPA/jAoOvCASLUbeH37bM
	uhqPFkpFcGBX3TmryUx9RpPhejLOa6TQD636LWcMaetUUddcOA52B3fNwgUm8FW+UtmkPK2QoMmKf
	2z/BDQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52Vs-00000009bwP-3PGg;
	Wed, 16 Apr 2025 13:09:12 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u52Vq-00000009bv9-0SJr
	for linux-mtd@lists.infradead.org;
	Wed, 16 Apr 2025 13:09:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id C482E294730;
	Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vqjfnlm228wd; Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 67B63298566;
	Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id u3ActQa5Oaya; Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3E1EB294730;
	Wed, 16 Apr 2025 15:09:04 +0200 (CEST)
Date: Wed, 16 Apr 2025 15:09:03 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: =?utf-8?B?Q3PDs2vDoXM=?= Bence <csokas.bence@prolan.hu>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	=?utf-8?Q?Szentendrei=2C_Tam=C3=A1s?= <szentendrei.tamas@prolan.hu>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, 
	pratyush <pratyush@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <373620122.295980015.1744808943985.JavaMail.zimbra@nod.at>
In-Reply-To: <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
References: <20250415180434.513405-1-csokas.bence@prolan.hu> <D981O3AA6NK9.2EEVUPM62EV6S@kernel.org> <dd3c7cc0-a568-4046-b105-e6786b5c80f8@prolan.hu>
Subject: Re: [PATCH] spi-nor: Verify written data in paranoid mode
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF136 (Linux)/8.8.12_GA_3809)
Thread-Topic: spi-nor: Verify written data in paranoid mode
Thread-Index: 93VulI8MDViHseErL85xPb6FAYhpBQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_060910_287929_C9939252 
X-CRM114-Status: GOOD (  11.85  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkNzw7Nrw6FzIEJlbmNlIiA8
Y3Nva2FzLmJlbmNlQHByb2xhbi5odT4KPj4+IEFkZCBNVERfU1BJX05PUl9QQVJBTk9JRCBjb25m
aWcgb3B0aW9uIGZvciB2ZXJpZnlpbmcgYWxsIHdyaXR0ZW4gZGF0YSB0bwo+Pj4gcHJldmVudCBz
aWxlbnQgYml0IGVycm9ycyB0byBiZSB1bmRldGVjdGVkLCBhdCB0aGUgY29zdCBvZiBoYWx2aW5n
IFNQSQo+Pj4gYmFuZHdpZHRoLgo+PiAKPj4gV2hhdCBpcyB0aGUgdXNlIGNhc2UgZm9yIHRoaXM/
IFdoeSBpcyBpdCBzcGVjaWZpYyB0byBTUEktTk9SCj4+IGZsYXNoZXM/IE9yIHNob3VsZCBpdCBy
YXRoZXIgYmUgYW4gTVREICJmZWF0dXJlIi4gSSdtIG5vdCBzdXJlCj4+IHdoZXRoZXIgdGhpcyBp
cyB0aGUgcmlnaHQgd2F5IHRvIGRvIGl0LCB0aHVzIEknZCBsb3ZlIHRvIGhlYXIgbW9yZQo+PiBh
Ym91dCB0aGUgYmFja2dyb3VuZCBzdG9yeSB0byB0aGlzLgo+IAo+IFdlbGwsIG91ciBjYXNlIGlz
IHF1aXRlIHNwZWNpZmljLCBidXQgd2Ugd2FudGVkIHRvIHByb3ZpZGUgYSBnZW5lcmFsCj4gc29s
dXRpb24gZm9yIHVwc3RyZWFtLiBJbiBvdXIgY2FzZSB3ZSBoYXZlIGEgY29tcG9uZW50IGluIHRo
ZSBkYXRhIHBhdGgKPiB0aGF0IGNhbiBjYXVzZSBhIGJ1cnN0IGJpdCBlcnJvciwgb24gYXZlcmFn
ZSBhZnRlciBhYm91dCBhIGh1bmRyZWQKPiBtZWdhYnl0ZXMgd3JpdHRlbi4KCkhtbS4gU28sIHRo
ZXJlIGlzIGEgc2VydmUgaGFyZHdhcmUgaXNzdWUgeW91J3JlIHdvcmtpbmcgYXJvdW5kLgoKPiBX
ZSBfY291bGRfIG1ha2UgaXQgTVRELXdpZGUsIGluIG91ciBjYXNlIHdlIG9ubHkgaGF2ZSBhIE5P
UiBGbGFzaAo+IG9uYm9hcmQgc28gdGhpcyBpcyB3aGVyZSB3ZSBhZGRlZCBpdC4gSWYgaXQgd2Vy
ZSBpbiB0aGUgTVREIGNvcmUsIHdoZXJlCj4gd291bGQgaXQgbWFrZSBzZW5zZT8KCkknbSBub3Qg
c28gc3VyZSB3aGV0aGVyIGl0IG1ha2VzIHNlbnNlIGF0IGFsbC4KSW4gaXQncyBjdXJyZW50IGZv
cm0sIHRoZXJlIGlzIG5vIHJlY292ZXJ5LiBTbyBhbnl0aGluZyBub24tdHJpdmlhbApvbiB0b3Ag
b2YgdGhlIE1URCB3aWxsIGp1c3Qgc2VlIGFuIC1FSU8gYW5kIGhhcyB0byBnaXZlIHVwLgpFLmcu
IGEgZmlsZXN5c3RlbSB3aWxsIHJlbW91bnQgcmVhZC1vbmx5LgoKVGhhbmtzLAovL3JpY2hhcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
