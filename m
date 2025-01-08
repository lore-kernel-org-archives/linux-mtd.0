Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5F8E7719A
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2025 18:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fBfUgpfk/kPDniASkjrlSkWj484HmUPv3CQKn2qXKLw=; b=4i8mryl4dGOoSJ
	X8V3F++TlzPusaBoryFqmkqsJ9SXEK+7nCVaQssSzT0XVv7aMzku1ZTU3QNNq9i//wfG4NLJIYP37
	SszM1xl7ZsIymQStn6IgoOO/VBrb0yd63vHZTcST75gxBPYVcxj8a3RdtJOAYKwWyu1rPPROLDZ3X
	ADqI+yWq7ZWaBdsKJhVwI5QbAHourtNBbNEXEfhg7rfeLA2FZogsxWpEZGvJIlDzIDkytfvH+NxuJ
	CsgGFYQA+MQ9l0W/854XPO6C9EJ1FHdPP3VnzOAUK/bKH50OnQrGObwdYd+4VewA3r/HAr875QeY7
	VxuAqab529HRfibi9cNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVan4-00000009Wmn-1I00;
	Wed, 08 Jan 2025 18:28:26 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVan1-00000009Wm3-2eu5
	for linux-mtd@lists.infradead.org;
	Wed, 08 Jan 2025 18:28:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A5E7C0002;
	Wed,  8 Jan 2025 18:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736360900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nmc0sUt+IzGA27O1UuOdFTmwoDSneGKDria/2L5MBcU=;
	b=EHaX/Dc+8avBFNX/0ACfTNm6mjujXvF4lLUwOH63FZZPJzfSu59qxKVvD4qVnyr8WZjCo8
	57QyW7C1M3brAwDso0k7v7umuwcrhY6C3fTHMkLdVfSSX6gJZi19A2JqjjPlcAvZ6Fl9i0
	OvfoG+ufSqMkEhiDE+ODv8JfQKuiUrbHFOjjNvKErjG7BKXYo++1TYxKKn9VE2L7S6aNEJ
	5WD3sVUbNuqDCf7C9WyKlrn81FXw1pai18Hf99LHG1+Z6T2wRJI2U7GmQBYYrNDEwUfRxl
	/5R18jK2fC+u8R6thdz9ESDS7WfczTfc7paulOzB+PFlUwFSfydeC6UocaiRDA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: sfr@canb.auug.org.au, boris.brezillon@collabora.com, 
 quic_srichara@quicinc.com, quic_varada@quicinc.com
In-Reply-To: <20250106131558.2219136-1-quic_mdalam@quicinc.com>
References: <20250106131558.2219136-1-quic_mdalam@quicinc.com>
Subject: Re: [PATCH] mtd: rawnand: qcom: Fix build issue on x86
 architecture
Message-Id: <173636089824.2572698.14184710311387478008.b4-ty@bootlin.com>
Date: Wed, 08 Jan 2025 19:28:18 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_102823_796106_17E6FC31 
X-CRM114-Status: UNSURE (   8.92  )
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

T24gTW9uLCAwNiBKYW4gMjAyNSAxODo0NTo1OCArMDUzMCwgTWQgU2FkcmUgQWxhbSB3cm90ZToK
PiBGaXggYSBidWZmZXIgb3ZlcmZsb3cgaXNzdWUgaW4gcWNvbV9jbGVhcl9iYW1fdHJhbnNhY3Rp
b24gYnkgdXNpbmcKPiBzdHJ1Y3RfZ3JvdXAgdG8gZ3JvdXAgcmVsYXRlZCBmaWVsZHMgYW5kIGF2
b2lkIEZPUlRJRllfU09VUkNFIHdhcm5pbmdzLgo+IAo+IE9uIHg4NiBhcmNoaXRlY3R1cmUsIHRo
ZSBmb2xsb3dpbmcgZXJyb3Igb2NjdXJzIGR1ZSB0byB3YXJuaW5ncyBiZWluZwo+IHRyZWF0ZWQg
YXMgZXJyb3JzOgo+IAo+IEluIGZ1bmN0aW9uIOKAmGZvcnRpZnlfbWVtc2V0X2Noa+KAmSwKPiAg
ICAgaW5saW5lZCBmcm9tIOKAmHFjb21fY2xlYXJfYmFtX3RyYW5zYWN0aW9u4oCZIGF0Cj4gZHJp
dmVycy9tdGQvbmFuZC9xcGljX2NvbW1vbi5jOjg4OjI6Cj4gLi9pbmNsdWRlL2xpbnV4L2ZvcnRp
Znktc3RyaW5nLmg6NDgwOjI1OiBlcnJvcjogY2FsbCB0byDigJhfX3dyaXRlX292ZXJmbG93X2Zp
ZWxk4oCZCj4gZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgd2FybmluZzogZGV0ZWN0ZWQgd3JpdGUg
YmV5b25kIHNpemUgb2YgZmllbGQKPiAoMXN0IHBhcmFtZXRlcik7IG1heWJlIHVzZSBzdHJ1Y3Rf
Z3JvdXAoKT8gWy1XZXJyb3I9YXR0cmlidXRlLXdhcm5pbmddCj4gICA0ODAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICBfX3dyaXRlX292ZXJmbG93X2ZpZWxkKHBfc2l6ZV9maWVsZCwgc2l6ZSk7
Cj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiAgIExEIFtNXSAgZHJpdmVycy9tdGQvbmFuZC9uYW5kY29y
ZS5vCj4gICBDQyBbTV0gIGRyaXZlcnMvdzEvbWFzdGVycy9teGNfdzEubwo+IGNjMTogYWxsIHdh
cm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbmFu
ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IHFjb206IEZpeCBidWlsZCBpc3N1
ZSBvbiB4ODYgYXJjaGl0ZWN0dXJlCiAgICAgIGNvbW1pdDogYjkzNzE4NjY3OTlkNjdhODBiZTBl
YTllMDFiZDQxOTg3ZGIyMmYyNgoKUGF0Y2hlKHMpIHdpbGwgYmUgYXZhaWxhYmxlIHdpdGhpbiBo
b3VycyBvbjoKbXRkL2xpbnV4LmdpdAoKS2luZCByZWdhcmRzLApNaXF1w6hsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
