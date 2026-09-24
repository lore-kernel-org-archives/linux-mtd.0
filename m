Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAE9C9830E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zivKsQRNVEhM6z1zf9vDT0yWSNCH5nTI4IpAr8bCCSU=; b=dRovbi2e9jc/wt
	r4lQuTnCjzegW2KJz4dvpZ1tSMhQBgLOmmaOBPIqfishdfr8q1DzDxGkwN9dmtjfwtKLS+x/8FFNe
	oHzoj84tHZBoQXl7l9XSZJnlXcInzPMa13wcFa5b4XaWVO/Z/CNxZer4mjxM6un1IzcczWh77AJQZ
	1xxAhky11XwlsftgpnU4zlufv1uGu7Rjz0sN1uZgWQSsdtL8h9fFHufZKJk7QLDvPzZl6J4QTFnw8
	bWJrkQMyCSib7ed8qQ1fnuBhoqL2x7VC70+y/DO9mQg7xrWRwenohDzLOg2z/Gx/RWGoXSnVhL6pM
	Q8n+Gc8Jg2I9xySENKLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9plS-0000000C72b-3ssW;
	Thu, 24 Sep 2026 20:09:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9plS-0000000C72A-06U4
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:09:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41CD7601FE;
	Thu, 24 Sep 2026 20:09:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747331F000FF;
	Thu, 24 Sep 2026 20:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790280593;
	bh=JqYrY2fUa+YS7VUIxLE/rJCbq/fx0K/pCxLNjYwJ6rs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eMN7qiRz679C2wcwMJQREkQCNzW7PfrAAL/QMxBvyIL6qGSBguaO0CXTYlgPeD7Db
	 tGW27wOXgjF69dCIJarksJQyarJ/8ff6joU7/bVOXLJvp062BYlcB916fsZ+cguaZq
	 ocbA69HRjWCJKM/pJq7LJcTEVFK3TspYcUti0yg6jeHyqtZ66aF5DNQyjWd4QUCiRe
	 27FwwcN15aMO/aNLyb3IKitAcAwSfsStTO4FYaXjLyfGuDXRcSwRN2elNASpxDStgF
	 3n5XiUDf/mN3g9//edgI6FZ7D3MIj0bpXzfl+mfSoFfFeOAshh7wU96Ns65aGJ40ls
	 w29V66D/AiC0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/8] mtd: rawnand: qcom: make config_nand_page_write()
 more generic
To: "Richard Weinberger" <richard@nod.at>, "Gabor Juhos" <j4g8y7@gmail.com>, "Manivannan
 Sadhasivam" <mani@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, "Md
 Sadre Alam" <md.alam@oss.qualcomm.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-3-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
 <20260924-qcom_nandc-share-more-code-v1-3-f3012199b161@gmail.com>
Date: Thu, 24 Sep 2026 20:09:52 +0000
Message-Id: <20260924200952.747331F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBjb21taXQg
bWVzc2FnZSBjbGFpbXMgcXBpY19uYW5kYyBwcmVmaXggYnV0IGFwcGxpZXMgcWNvbV9uYW5kYwot
LQoKY29tbWl0IDJjZDQ3YjkwYWEyM2U1ODdhYTcyMGIyZDA0YzljYTAyNGQ4MTc4ZDUKQXV0aG9y
OiBHYWJvciBKdWhvcyA8ajRnOHk3QGdtYWlsLmNvbT4KCm10ZDogcmF3bmFuZDogcWNvbTogbWFr
ZSBjb25maWdfbmFuZF9wYWdlX3dyaXRlKCkgbW9yZSBnZW5lcmljCgpUaGlzIGNvbW1pdCB1cGRh
dGVzIGNvbmZpZ19uYW5kX3BhZ2Vfd3JpdGUoKSB0byB0YWtlIGEgcG9pbnRlciB0byB0aGUKcWNv
bV9uYW5kX2NvbnRyb2xsZXIgZGlyZWN0bHkgaW5zdGVhZCBvZiBleHRyYWN0aW5nIGl0IGZyb20g
bmFuZF9jaGlwLgpJdCBhbHNvIHJlbmFtZXMgdGhlIGZ1bmN0aW9uIHRvIHByZXBhcmUgZm9yIGZ1
dHVyZSBjb2RlIHJldXNlLgoKPiAgICAgSW4gb3JkZXIgdG8gbWFrZSB0aGUgZnVuY3Rpb24gbW9y
ZSBnZW5lcmljLCBjaGFuZ2UgdGhlIGRlY2xhcmF0aW9uCj4gICAgIHRvIGdldCBhICdxY29tX25h
bmRjX2NvbnRyb2xsZXInIHBvaW50ZXIgZGlyZWN0bHksIGFuZCB1cGRhdGUgdGhlCj4gICAgIGNh
bGxlcnMgYWNjb3JkaW5nbHkuIFdoaWxlIGF0IGl0LCBhbHNvIGNoYW5nZSB0aGUgZnVuY3Rpb24g
bmFtZSB0bwo+ICAgICB1c2UgYSAncXBpY19uYW5kYycgcHJlZml4LgoKW1NldmVyaXR5OiBNZWRp
dW1dClRoaXMgaXNuJ3QgYSBidWcgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNoLCBidXQgdGhlcmUg
aXMgYSBkaXNjcmVwYW5jeSBiZXR3ZWVuCnRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGhlIGFjdHVh
bCBjb2RlIGNoYW5nZXMuIFRoZSBjb21taXQgbWVzc2FnZSBzdGF0ZXMgdGhlCmZ1bmN0aW9uIGlz
IGJlaW5nIHJlbmFtZWQgdG8gdXNlIGEgJ3FwaWNfbmFuZGMnIHByZWZpeCwgYnV0IGFzIHNlZW4g
YmVsb3csIGl0CmlzIGFjdHVhbGx5IHJlbmFtZWQgdG8gcWNvbV9uYW5kY19jb25maWdfcGFnZV93
cml0ZSgpIHVzaW5nIGEgJ3Fjb21fbmFuZGMnCnByZWZpeC4gCgpDb3VsZCB0aGUgY29tbWl0IG1l
c3NhZ2UgYmUgdXBkYXRlZCB0byBtYXRjaCB0aGUgY29kZSwgb3Igc2hvdWxkIHRoZSBjb2RlIGJl
CnVwZGF0ZWQgdG8gdXNlIHRoZSBpbnRlbmRlZCBwcmVmaXg/Cgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL210ZC9uYW5kL3Jhdy9xY29tX25hbmRjLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9xY29t
X25hbmRjLmMKPiBpbmRleCBjNjVhODQxNmMzZjVkLi4xZjNjMDA4MjMzMDlmIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L3Fjb21fbmFuZGMuYwo+IEBAIC0zNjUsMTAgKzM2NSw4IEBAIGNvbmZpZ19uYW5k
X3NpbmdsZV9jd19wYWdlX3JlYWQoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKPiAgICogSGVscGVy
IHRvIHByZXBhcmUgRE1BIGRlc2NyaXB0b3JzIHVzZWQgdG8gY29uZmlndXJlIHJlZ2lzdGVycyBu
ZWVkZWQgZm9yCj4gICAqIGJlZm9yZSB3cml0aW5nIGEgTkFORCBwYWdlLgo+ICAgKi8KPiAtc3Rh
dGljIHZvaWQgY29uZmlnX25hbmRfcGFnZV93cml0ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQo+
ICtzdGF0aWMgdm9pZCBxY29tX25hbmRjX2NvbmZpZ19wYWdlX3dyaXRlKHN0cnVjdCBxY29tX25h
bmRfY29udHJvbGxlciAqbmFuZGMpCj4gIHsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjQtcWNvbV9uYW5kYy1zaGFyZS1tb3Jl
LWNvZGUtdjEtMC1mMzAxMjE5OWIxNjFAZ21haWwuY29tP3BhcnQ9MwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
