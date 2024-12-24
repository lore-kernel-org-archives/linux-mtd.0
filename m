Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFFEE7718D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 16:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:CC:Subject
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X8J1bC5jXdWBWNZqB3ukfLrfBBuJbvcxHVFXnRJYmRk=; b=T9TBc56vGK4FYl
	6t62pp6owm+x0yfEjZurPs5DnvSvagC134LIZl6JlcsDaNm4CrPZq9xMCd+VDibNhZPcBjQfPrPd7
	bqYDmfQ44hKDqnwAnIHr2SiMc+VUslAhmZqAq8PxFrLmS3IcTqxd6O23fux3nNRtAZKx/eMxY9Lfa
	IFRJ0ES+yk2utNLGKqoHtHVFd1XL6tr0PCr10c//vjQ4InjAM26zvYiKkRaSyvZQ26b62OoeBY9w/
	h5jpFSyU+Q1qIz8+Uz4uQG02JBfZT8eFaf1XRWE2sThhknip6ndtnBimewjOUWPATB9ewo4jK/03H
	/Y4C9OKs2YPghHhuHTUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7fI-0000000CIR1-333D;
	Tue, 24 Dec 2024 16:21:48 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ7fF-0000000CIOh-3f87
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 16:21:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 603FC1C0005;
	Tue, 24 Dec 2024 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735057302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zacWYTH1KKoAoSFNbKaYi6ygHa5kvZSUGVZqJCenvWo=;
	b=YeLVitDiOw+2k4LyVJT5auwYUu2BPDNrFJ8oxYl8K7xRraob/t2nxU3JnRZF92VWClAKYB
	i+Jp06nbTsBRD4o0j7xqfJjpnAF2ZL7lDbDisVFpv1cnksqwvCRnvFS2fSRn7VJ86SmtDP
	DGZ/UT5CfgBvleFczcleM9kvUe89JOxOeOvEU4f0hi/Gp8OT66mSvrbF+oJnjr2B4u5ehC
	seR4hkGwH7aYa7tlGPss9RXhnbU0Idtg1XxHBscnYr+2EVdKFu0baTEeIddwxyhfshGXt0
	YxixKWYVIouM0wUBrZBQMzgHsXPqwhRdcr9OybO0VLimU0UldWaVWFj6Z28nhw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <broonie@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: <andersson@kernel.org>, <konradybcio@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
Cc: Richard Weinberger <richard@nod.at>, Tudor Ambarus
 <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Michael Walle <michael@walle.cc>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org
Subject: [GIT PULL] mtd: topic branch for spi with Qcom changes
User-Agent: mu4e 1.12.7; emacs 29.4
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Date: Tue, 24 Dec 2024 17:20:38 +0100
Message-ID: <87jzbp9hnt.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_082146_068407_81D2A215 
X-CRM114-Status: UNSURE (   8.57  )
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

SGVsbG8gTWFyaywKCkknbSBtZXJnaW5nIHRoZSBRY29tIHNlcmllcywgaW4gY2FzZSB5b3UgbmVl
ZCBhIHRvcGljIGJyYW5jaCB0byBhcHBseQp0aGUgc3BpIGJpdHMgKGJpbmRpbmcgYW5kIGRyaXZl
ciksIGhlcmUgaXQgaXMuCgpNZXJyeSBDaHJpc3RtYXMsCk1pcXXDqGwKClRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQgNDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNm
MGIzNzoKCiAgTGludXggNi4xMy1yYzEgKDIwMjQtMTItMDEgMTQ6Mjg6NTYgLTA4MDApCgphcmUg
YXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQgdGFncy9tdGQvcWNvbS1y
ZW9yZy1mb3Itc3BpLTYuMTQKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwYzA4MDgw
ZmQ3MWNkNWRkNTk2NDMxMDRiMzlkM2M4OWQ3OTNhYjNjOgoKICBtdGQ6IHJhd25hbmQ6IHFjb206
IHVzZSBGSUVMRF9QUkVQIGFuZCBHRU5NQVNLICgyMDI0LTEyLTI0IDE2OjIyOjAyICswMTAwKQoK
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpUb3BpYyBicmFuY2ggd2l0aCBwcmVwYXJhdGlvbiBjaGFuZ2VzIGZyb20gUWNvbSBp
biBvcmRlciB0byBhcHBseSBvbiB0b3AKdGhlIHNwaSBiaXRzIGFkZGluZyB0aGUgUWNvbSBTUEkt
TkFORCBjb250cm9sbGVyIGRyaXZlciByZS11c2luZyBhIGxvdApvZiBjb2RlIHRoYXQgaGFzIGJl
ZW4gc2hhcmVkLgoKV2l0aCB0aGlzIGdvYWwgaW4gbWluZCwgdGhlIHJhdyBOQU5EIGNvbnRyb2xs
ZXIgZHJpdmVyIGhhcyBiZWVuIGNsZWFuZWQKdXAgYW5kIHJlb3JnYW5pemVkLCBhbmQgb25seSB0
aGUgcmVsZXZhbnQgc3RydWN0dXJlcy9oZWxwZXJzIHdoaWNoIGhhdmUKbm90aGluZyByYXcgTkFO
RCBzcGVjaWZpYyBzaG91bGQgbm93IGJlIGV4cG9ydGVkLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpNZCBTYWRyZSBBbGFt
ICg0KToKICAgICAgbXRkOiByYXduYW5kOiBxY29tOiBjbGVhbnVwIHFjb21fbmFuZGMgZHJpdmVy
CiAgICAgIG10ZDogcmF3bmFuZDogcWNvbTogQWRkIHFjb20gcHJlZml4IHRvIGNvbW1vbiBhcGkK
ICAgICAgbXRkOiBuYW5kOiBBZGQgcXBpY19jb21tb24gQVBJIGZpbGUKICAgICAgbXRkOiByYXdu
YW5kOiBxY29tOiB1c2UgRklFTERfUFJFUCBhbmQgR0VOTUFTSwoKIGRyaXZlcnMvbXRkL25hbmQv
TWFrZWZpbGUgICAgICAgICAgICB8ICAgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcXBpY19jb21t
b24uYyAgICAgICB8ICA3NTkgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL210ZC9uYW5kL3Jh
dy9xY29tX25hbmRjLmMgICAgfCAxNzY5ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9tdGQvbmFuZC1xcGljLWNvbW1vbi5oIHwgIDQ3NSAr
KysrKysrKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMTU2MSBpbnNlcnRpb25zKCspLCAxNDQ0IGRl
bGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbXRkL25hbmQvcXBpY19jb21t
b24uYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbXRkL25hbmQtcXBpYy1jb21t
b24uaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
