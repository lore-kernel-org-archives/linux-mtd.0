Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EA7CC6B08
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=da81j/1sngL1a2V7u5RQ8TDpne7Ao2M7mXZP1jqchpQ=; b=Gu2uo+f+QDHEUI
	giWDXZXpb5SDt/RBszCP1f86TChORsA2vviVPFfvXLS9xdYwdgN4xzVesb239JWAHtS5B34ffrNwm
	2iohY50Jy2jD8m0cNg3MX9WW5mKiy+vsx/TpFflE133szKTQ51pFwPBh7RbBeytCYJwWVbBUCbjdG
	BvzxXna67Xq1LKFolNu8fEu7fkP767RV2rUfpCjNkzNCK1Kmbr9XxPzOqwU7PRmz6SXUBpzxfnVbK
	/pLnaq4hlB8gXFp1c6LfOXC6Bl6PRjOlnEaPHXwpmx+FnN8q9lyLwnZy4j1lp4IRxysrAbhgiekz8
	/CD5AdYpp2nCH122k7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdMN-0000000D4LD-0GkV;
	Tue, 13 Oct 2026 14:20:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdML-0000000D4Kv-2Imd
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:20:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9323B60A59;
	Tue, 13 Oct 2026 14:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93E61F00898;
	Tue, 13 Oct 2026 14:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901204;
	bh=fjXiG6sSkgFdgqTjba/VCSUErkiqrDOoHtUEuMFICos=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B6L9C5AA6RNzYlBxY7p1LyxUI8czrXcHmqUqeGS8CHB3yIKglx9T0eKwv+0AqeMX8
	 mSeA4Sya8sCCQnzOR+bgRJXHMQpHq89Hq5v6UThcwmV37fBKnP2PxhZc8ZgdNlqHR/
	 nmp1CHXvX3DZB0dckHPmtRDaxZiXpjOpNAygcFwWThTKsUrNvKAX7MT7LxsS55INYj
	 9xErZC4dCsRU16R/g31V8z2b1SD422uQBRoc+cyFJ3MNccI6RgLa5webmplYz2Mtfz
	 Q3BH5ach3WLOhfvL2on0z4UQhdzU+DysK8xn5KHCtobxZRI7vVU6fV28Khq3hwW6O6
	 P60+uGuh0fTmw==
Message-ID: <sashiko-outbox-169897@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] spi: dt-bindings: cadence: Make XSPI's IRQ line
 optional
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261013141350.189996-8-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
 <20261013141350.189996-8-paul.cercueil@bootlin.com>
Date: Tue, 13 Oct 2026 14:20:03 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0xvd10gZHQtYmluZGluZ3M6IGp1
c3RpZnlpbmcgb3B0aW9uYWwgaGFyZHdhcmUgcHJvcGVydHkgd2l0aCBkcml2ZXIgY2FwYWJpbGl0
eQotLQoKY29tbWl0IGQzNTUyZGUzNThiMjA5MTYwMmU4MTc1YzI5YzYwYjE4MmFkMWFhMmEKQXV0
aG9yOiBUYW5tYXkgSmFnZGFsZSA8dGFubWF5QG1hcnZlbGwuY29tPgoKc3BpOiBkdC1iaW5kaW5n
czogY2FkZW5jZTogTWFrZSBYU1BJJ3MgSVJRIGxpbmUgb3B0aW9uYWwKClRoZSBjb21taXQgbWFr
ZXMgdGhlICdpbnRlcnJ1cHRzJyBwcm9wZXJ0eSBvcHRpb25hbCBpbiB0aGUgQ2FkZW5jZSBYU1BJ
CmJpbmRpbmcgYmVjYXVzZSB0aGUgZHJpdmVyIGNhbiBvcGVyYXRlIGluIHBvbGxpbmcgbW9kZS4K
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkvY2Ru
cyx4c3BpLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2NkbnMs
eHNwaS55YW1sCj4gaW5kZXggMzhhNTc5NTU4OWRlMi4uZGQ4ZDAzYzA3ZTY4OCAxMDA2NDQKPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc3BpL2NkbnMseHNwaS55YW1s
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9jZG5zLHhzcGku
eWFtbAo+IEBAIC00Myw3ICs0Myw2IEBAIHByb3BlcnRpZXM6Cj4gIHJlcXVpcmVkOgo+ICAgIC0g
Y29tcGF0aWJsZQo+ICAgIC0gcmVnCj4gLSAgLSBpbnRlcnJ1cHRzCgpbU2V2ZXJpdHk6IExvd10K
RGV2aWNlIHRyZWUgYmluZGluZ3MgYXJlIGludGVuZGVkIHRvIGRlc2NyaWJlIGhhcmR3YXJlIHJh
dGhlciB0aGFuIHNvZnR3YXJlCmRyaXZlciBjYXBhYmlsaXRpZXMuCgpUaGUgY29tbWl0IG1lc3Nh
Z2UganVzdGlmaWVzIHJlbW92aW5nIHRoaXMgY29uc3RyYWludCBiZWNhdXNlIHRoZSBkcml2ZXIK
IndpbGwgaGFwcGlseSB3b3JrIHdpdGhvdXQgYW4gSVJRIGxpbmUgcmVnaXN0ZXJlZCIuIERvZXMg
cmVtb3ZpbmcgdGhpcwpjb25zdHJhaW50IGJhc2VkIG9uIHNvZnR3YXJlIGNhcGFiaWxpdHkgbGVh
ZCB0byBhbiBpbmFjY3VyYXRlIGhhcmR3YXJlCmRlc2NyaXB0aW9uIGlmIHRoZSBpbnRlcnJ1cHQg
bGluZSBpcyBhbHdheXMgcHJlc2VudCBpbiB0aGUgaGFyZHdhcmU/CgpTaG91bGQgdGhlIGp1c3Rp
ZmljYXRpb24gZm9yIG1ha2luZyB0aGlzIHByb3BlcnR5IG9wdGlvbmFsIGJlIGJhc2VkIG9uCmhh
cmR3YXJlIGluc3RlYWQsIHN1Y2ggYXMgd2hldGhlciB0aGUgSVJRIGlzIHBoeXNpY2FsbHkgb21p
dHRlZCBvcgpkaXNjb25uZWN0ZWQgb24gY2VydGFpbiBib2FyZHM/Cgo+ICAKPiAgYWxsT2Y6Cj4g
ICAgLSAkcmVmOiBzcGktY29udHJvbGxlci55YW1sIwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3
IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAxMzE0MTM1MC4xODk5OTYtMS1w
YXVsLmNlcmN1ZWlsQGJvb3RsaW4uY29tP3BhcnQ9NwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
