Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAF5ECD992
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=endPscy6N18EYheXCNRCStI1GhoO+CgpKFdYDiSG4wU=; b=jYDujbKcet7ghU
	VWr5SIfRxU1SOA/8NxdjJCM8wOGcL1sGl0Miadv0wjP6HkRNM2M6Rdfj55mBucvGYDLIoKTyOKg8C
	2RLo7bMnTBExAIeLEuJUqcJL47okejp0MFPj/KFU7Kkjdr16RJ0f2uAofIN1wJEN07LfYi/afQnrY
	4linQpjteyQzzVE2ud94fgfRE9vYB00LjNeBTP2H6IMZUVaUoHOOeKqeeczMvJ1QhTtUbMiWFZcl4
	6I+bQpR54v0G/mnFqkJNe9ETaoYOyZMqhPEhRLNe92O9f4EtoFHj1PMYjXQqj/56E0y1Jc8NysYHM
	IBycYI0JfZDtnRZnsBmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3S5-0000000AK5l-0hOG;
	Thu, 05 Feb 2026 17:47:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3S2-0000000AK4b-1VqI
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:47:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 70AE3C243B0;
	Thu,  5 Feb 2026 17:47:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 295CD6074D;
	Thu,  5 Feb 2026 17:47:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2FE2119D16C5;
	Thu,  5 Feb 2026 18:47:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770313650; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V7bxEkRAtCnT9zU9zuvhxCFwkCKSUQxYHkKN7TjR5ZQ=;
	b=xcz1K2qtsOGLWJ2JkEZu6PyuPKSu6fE8XhI5yRP/Q/jTq/nAAojDNwuMhM/8BeD/3S5HXC
	yw1M3CJki/NDYTGSIzBOKfj49Bwty5iRocM05Ag1sAQm+mWzyEMdZnkWo115eV9wdYUcBz
	tXEWvo1YJ9voChSAujvxdRwlFifR/dIzWMGfdJgU/LtEnqBmg4NPC3HYyjA3K+kSVSPhFh
	oZp9tzWT41nlkBb8ina/Mj1CiFZvjI8Ao4fGjzL0BHwSz9AHS9u4O/qiXHdg+BDlPp5pqo
	UGTI+1iogAhoyaee8AjaRHY+Eb01YorRk3kxUHJD7cCJlS6t/Qm9tqqZirr8tw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 11/12] spi: cadence-quadspi: restrict PHY
 frequency to tuned operations
In-Reply-To: <20260113141617.1905039-12-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:16 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-12-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:47:26 +0100
Message-ID: <87zf5nf5g1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_094734_539763_51CA9800 
X-CRM114-Status: GOOD (  12.16  )
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

SGkgU2FudGhvc2gsCgo+ICsJLyoKPiArCSAqIFBIWSB0dW5pbmcgYWxsb3dzIGhpZ2gtZnJlcXVl
bmN5IG9wZXJhdGlvbiBvbmx5IGZvciBjYWxpYnJhdGVkCj4gKwkgKiBjb21tYW5kcy4gVW5jYWxp
YnJhdGVkIG9wZXJhdGlvbnMgdXNlIHNhZmUgbm9uLVBIWSBmcmVxdWVuY3kgdG8KPiArCSAqIGF2
b2lkIHRpbWluZyB2aW9sYXRpb25zLgo+ICsJICovCj4gKwlpZiAoY3FzcGktPmRkYXRhLT5leGVj
dXRlX3R1bmluZyAmJiBmX3BkYXRhLT51c2VfcGh5ICYmCj4gKwkgICAgKGNxc3BpX29wX21hdGNo
ZXNfdHVuZWQob3AsICZmX3BkYXRhLT5waHlfcmVhZF9vcCkgfHwKPiArCSAgICAgY3FzcGlfb3Bf
bWF0Y2hlc190dW5lZChvcCwgJmZfcGRhdGEtPnBoeV93cml0ZV9vcCkpKSB7Cj4gKwkJY3FzcGlf
Y29uZmlndXJlKGZfcGRhdGEsIG9wLT5tYXhfZnJlcSk7Cj4gKwl9IGVsc2UgaWYgKGNxc3BpLT5k
ZGF0YS0+ZXhlY3V0ZV90dW5pbmcpIHsKPiArCQkvKiBVc2Ugc2FmZSBmcmVxdWVuY3kgZm9yIHVu
dHVuZWQgb3BlcmF0aW9ucyAqLwo+ICsJCWNxc3BpX2NvbmZpZ3VyZShmX3BkYXRhLCBmX3BkYXRh
LT5ub25fcGh5X2Nsa19yYXRlKTsKPiArCX0gZWxzZSB7Cj4gKwkJLyogTm8gdHVuaW5nIHN1cHBv
cnQsIGFsd2F5cyB1c2UgcmVxdWVzdGVkIGZyZXF1ZW5jeSAqLwo+ICsJCWNxc3BpX2NvbmZpZ3Vy
ZShmX3BkYXRhLCBvcC0+bWF4X2ZyZXEpOwo+ICsJfQoKU2hvdWxkbid0IHdlIGhhbmRsZSB0aGlz
IGF0IHRoZSBjb3JlIGxldmVsPyBXZSBrbm93IHdoYXQga2luZCBvZgpvcGVyYXRpb24gcGF0dGVy
biB3ZSBwcm92aWRlZCwgc28gaXQgaXMgZWFzeSB0byBzZXQgdGhlIGNvcnJlY3QKZnJlcXVlbmN5
IGluIHRoZSBvcGVyYXRpb24gc3RydWN0dXJlLgoKQ2FuIHlvdSBwbGVhc2UgbWFrZSB0aGlzIGhh
cHBlbj8gUGVyaGFwcyB5b3UgY2FuIHJldHVybiB0aGUgb3BlcmF0aW9uCmZyZXF1ZW5jeSBvbmNl
IHRoZSBjYWxpYnJhdGlvbiBpcyBzdWNjZXNzZnVsIChpbiB0aGUgcmVhZCBhbmQgd3JpdGUgb3AK
dGVtcGxhdGVzIG1heWJlPykgc28gdGhpcyBjYW4gYmUgcGlja2VkIHVwIGJ5IHRoZSBjb3JlIGFu
ZCB1c2VkIGZvciB0aGUKZm9sbG93aW5nIG9wZXJhdGlvbnMuIFRoaXMgd2F5IHRoZSBjb250cm9s
bGVyIGRyaXZlciBubyBsb25nZXIgbmVlZHMgdG8KY2hlY2sgaWYgdGhlIG9wZXJhdGlvbiBoYXMg
YmVlbiB0dW5lZCBvciBub3QsIGl0IGNhbiBqdXN0IGxvb2sgYXQgdGhlCmZyZXF1ZW5jeS4gV2hl
biB1c2luZyB0aGUgaGlnaGVzdCBmcmVxdWVuY3ksIFBIWSB0dW5pbmcgbXVzdCBiZQp1c2VkL2Vu
YWJsZWQsIG90aGVyd2lzZSBub3QuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
