Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBF9D73E84
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 19:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiXeiLaV1fpCuJbKeazQYvxlFYClAR+8eProIi89pjI=; b=mCv83IglhXqJFj
	UBtYCNanRYKeqNcCHbCNqiFTTA/ZzqBFUvCHGyrMhjr0E8GwDPA5JmGBIt0/w7hfNdKVCJC4VbjMQ
	dYmnc7pF7MbZmz3euGE16vTvdJfErcSGPt0iruI66CGldGYvUgX8lXq62Yw8pAEEqV5s9k4BylwL1
	1hfWt0D+Cqtle4JC1esr7j7xDn1gK13Wz9MsCfgEJ3YEup4glRK6G2CFaVHMrm/qfgSRItLcFYdUJ
	AUdNzi+0CGgR0Nk+/+MBl0oOLC6kwWkNXIdHtZWM+TyisTYGD7Qvm2f3PlVXl1zpfCqOVild3q5LO
	k0WBmM9DINyHyl62oiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXUV-00000000YOj-0h5N;
	Thu, 29 Jan 2026 19:15:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlXUS-00000000YOO-3GpD
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 19:15:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 225414E42318;
	Thu, 29 Jan 2026 19:15:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D1A3560746;
	Thu, 29 Jan 2026 19:15:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9FF0119A880F;
	Thu, 29 Jan 2026 20:15:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769714138; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=f604bk2vZ1OYgARjjaC8vFTT2afGdXtldw+gIbc38WE=;
	b=ZI3UdqXkPujSuL1IObI0MspHg5JQ7UUy8EOQtylRXFQISuemglTw1M0YrlGuO6E7xaedvU
	h6nDru8mCskYPw4B6rSYhNvUSWgSHBW0E1QsG2zj9RGoI+Ic/gVOqqq45cWiVjxcSyfsJu
	tvSjFE+BefViCYT32FlEfmVDzP2ph9Q8bR+WSJ+yWN+jqX0DPnOvxkgpnCbvYIDRbSrprw
	Mel+ABWTgtKkXXw6TO2rzUEJtIcAc1jsdqTeX7+6+Ut4vR592ljKlplTN38rYedgN3zhNt
	bCkWlPAVM0FR7CWPEHQxISNh5PQwOtI/sGTpI9S3ieNjLs9yCoPZMYYECPqE+g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Michal Simek <monstr@monstr.eu>,
	Bernhard Frauendienst <kernel@nospam.obeliks.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 0/3] mtd: Add support for stacked memories
Date: Thu, 29 Jan 2026 20:15:32 +0100
Message-ID: <176971398683.256348.665652099075371899.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
References: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_111540_952130_1F5945DB 
X-CRM114-Status: GOOD (  13.64  )
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

T24gVGh1LCAyOSBKYW4gMjAyNiAxMzowOToyNiArMDEwMCwgTHVjYSBDZXJlc29saSB3cm90ZToK
PiBbVEw7RFIgZm9yIHYxNTogYXMgYWdyZWVkIHdpdGggQW1pdCBJJ20gc2VuZGluZyBhIG5ldyBp
dGVyYXRpb24gb2YgaGlzCj4gcGF0Y2hlcyB0byBmaXggdGhlIGJ1aWxkLXRpbWUgZmFpbHVyZSBk
dWUgdG8gYSBtb2R1bGUgZGVwZW5kZW5jeQo+IGxvb3AuIE9yaWdpbmFsIGNvdmVyIGZvbGxvd3Mu
XQo+IAo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgc3RhY2tlZCBzdXBwb3J0IGJ5IGVuaGFuY2lu
ZyB0aGUgZXhpc3RpbmcgbXRkLWNvbmNhdAo+IGRyaXZlciB0byBiZSBtb3JlIGdlbmVyaWMuCj4g
Cj4gWy4uLl0KClRoYW5rIHlvdSBmb3IgZmluYWxseSByZS1zZW5kaW5nIHRoZSBzZXJpZXMgYWZ0
ZXIgZml4aW5nIHRoZSByb2JvdAp3YXJuaW5nLCBJIHdpbGwgbm90IHdhaXQgZm9yIG1lcmdpbmcg
aXQgYmVjYXVzZSB0aGlzIG5lZWRzIHRvIGZpbmFsbHkKZ2V0IGluLCBhbmQgaXQncyBiZWVuIG92
ZXIgdGhlIG1haWxpbmcgbGlzdCBmb3IgOCBtb250aHMgd2l0aCBqdXN0IGEKS2NvbmZpZyBzeW1i
b2wgdG8gZml4LCBzbzoKCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEKClsxLzNdIGR0LWJp
bmRpbmdzOiBtdGQ6IERlc2NyaWJlIE1URCBwYXJ0aXRpb25zIGNvbmNhdGVuYXRpb24KICAgICAg
Y29tbWl0OiAxNDM1NTVkZWZiMDU4MzM2YTIyM2JhNDM0NjE5NzI0YjRjNmQ4MmIwClsyLzNdIG10
ZDogTW92ZSBzdHJ1Y3QgbXRkX2NvbmNhdCBkZWZpbml0aW9uIHRvIGhlYWRlciBmaWxlCiAgICAg
IGNvbW1pdDogYzgyMTAwNTk3ZjNjZTVlMzY2ZjJiYzg3NWU5MzMyYjcwMDlmNTIxMgpbMy8zXSBt
dGQ6IEFkZCBkcml2ZXIgZm9yIGNvbmNhdGVuYXRpbmcgZGV2aWNlcwogICAgICBjb21taXQ6IDI4
NTg3MWYxZmYzYzI1MWNiYTI4OGU3ZGQ5ZTM3M2MwNDE0OWE1MDkKClBhdGNoZShzKSBzaG91bGQg
YmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4
dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJl
Z2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
