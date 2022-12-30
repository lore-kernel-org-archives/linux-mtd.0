Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1DDC4167B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Dec 2022 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEAEyK08QNK5V9sdW5SdtlPH0rjmxBLojgi95J5QQvg=; b=YU0eUwHSjnnFSD
	EQVE0jFJpLiLyHKnDsB2EsaCW/EoMLFVydPhvGGmFgakaDjgs8X37YggWhojOBlZnVq6959ev8ax0
	F1Opoj+Ycp1agdqJOB1Ho2U+P8eDT2Tmz8KK425+KYWTHeiIpFsbaktNt+hNjijNzsgfK7u3CvhQ1
	G2zz7E3Vz3Cq7jKSgJ2uCGHFcVaH0T3r71f0Lfsk3ml0Ib7OlFhOGkbWZ0YOiCBSvqeWEIh+06E0s
	0laTPrD2ZSCXqc0T0j7AnfmLzHWMRWQfmCjwRv56VRg5ZJ+Z/1sK0ZHZA8vjZ7H0DKZDKT+wuMW6k
	JFx02neFyViQNKUQ5u2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBEsH-0099a3-Ic; Fri, 30 Dec 2022 12:52:37 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBEmk-009640-0f
	for linux-mtd@lists.infradead.org; Fri, 30 Dec 2022 12:47:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id CA7841BF203;
	Fri, 30 Dec 2022 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672404409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OBAWrHGDoneNwgVavowtFEiZqaQWcMW84NmbAGpQ9ds=;
	b=ijPM2fanJBYP6mqQvoTSnKJSCYm3sLIPwyXvj5kOeVPOUaQTXcOEQZ4VRw+h8lnPZmz8Qz
	nmWwQhM2sMmSYEQ+l28aumtHlf7Fo6OVWzx9QmXJbh6zGW5fM523TZeRTZ87mvH5yS4q/1
	9pLSSA2/UaNVT4UJByLCfxjR13h2xJWVi4SqUqSCwJPiBwpoSTqwJQOlHDP6MUbfYI/L9k
	ARB4Wo0c5oA7tjD0TCISsX2JWrNna0LJcyuawW5aypYdWiUp/6iaD8xZl9+EAqCEB8LVLb
	N7ph1jO+OV9Du/maWujc7FgDP4qF71xIG1enwtYlqeU7MwDUtRHC3i4CtWtdCA==
Date: Fri, 30 Dec 2022 13:46:46 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mtd: rawnand: hynix: Add support for
 H27UCG8T2FTR-BC MLC NAND
Message-ID: <20221230134646.2e07bcc6@xps-13>
In-Reply-To: <20221230134507.719edeae@xps-13>
References: <20221229190906.6467-1-samuel@sholland.org>
	<20221229190906.6467-2-samuel@sholland.org>
	<20221230134507.719edeae@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_044659_656789_D8523E34 
X-CRM114-Status: GOOD (  12.91  )
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

SGkgYWdhaW4sCgptaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tIHdyb3RlIG9uIEZyaSwgMzAgRGVj
IDIwMjIgMTM6NDU6MDcgKzAxMDA6Cgo+IEhpIFNhbXVlbCwKPiAKPiBzYW11ZWxAc2hvbGxhbmQu
b3JnIHdyb3RlIG9uIFRodSwgMjkgRGVjIDIwMjIgMTM6MDk6MDMgLTA2MDA6Cj4gCj4gPiBIMjdV
Q0c4VDJGVFItQkMgaXMgc2ltaWxhciB0byB0aGUgYWxyZWFkeS1zdXBwb3J0ZWQgSDI3VUNHOFQy
RVRSLUJDLCBidXQKPiA+IHJlcG9ydHMgYSBkaWZmZXJlbnQgSUQuCj4gCj4gQ2FuIHlvdSBwcm92
aWRlIGEgZGF0YXNoZWV0IGZvciB0aGlzIHBhcnQ/IEkgYW0gc3VycHJpc2VkIGJ5IHRoZSBwYWdl
Cj4gc2l6ZS4gSW4gZ2VuZXJhbCBhbnl3YXksIGl0J3MgYmVzdCB0byBwcm92aWRlIGEgbGluayB3
aGVuIGFkZGluZwo+IHN1cHBvcnQgZm9yIGEgbmV3IGNvbXBvbmVudC4KPiAKPiBBbHNvLCBmb3Ig
eW91ciB0d28gc2VyaWVzLCBubyBuZWVkIHRvIHJlc2VuZCB0aGlzIHRpbWUsIGJ1dCBwbGVhc2Ug
dXNlCj4gZ2l0LWZvcm1hdC1wYXRjaCBhbmQgZ2l0LXNlbmQtZW1haWwgdG8gY3JlYXRlIHlvdXIg
c2VyaWVzLCBzbyB0aGF0IGFsbAo+IHRoZSBwYXRjaGVzIGFyZSBhbnN3ZXJzIG9mIHRoZSBjb3Zl
ciBsZXR0ZXIuIEl0IGhlbHBzIGtlZXBpbmcgYWxsCj4gcGF0Y2hlcyBhbmQgYW5zd2VycyBpbiB0
aGUgc2VyaWVzIHBhY2tlZCB0b2dldGhlci4KCllvdSBjYW4gaWdub3JlIHRoaXMsIEkgZGlkIG1v
bWVudGFyaWx5IGNoYW5nZSB0aGUgZGlzcGxheSBpbmFkdmVydGVudGx5Cm9uIG15IHNpZGUsIHlv
dXIgc2VyaWVzIGFyZSBwZXJmZWN0bHkgZmluZS4KClNvcnJ5IGZvciB0aGUgbm9pc2UuCk1pcXXD
qGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
