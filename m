Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F79CD1288
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Apr 2024 07:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qt+SyVe5bv1DfLpvHx1HqDJGEmyWpIeFFBXNLA9Jvv8=; b=tQIjxXINkIQrPm
	fKWdofkHMkqiL1wL09gH5uXyTL+PYLbJpBU7F2fvBumcGyBxSSek8PqGBvbBzHxrFJAfgOlcu98IP
	GA88iA0R0Dr7TTpPjJByyKjoeUneH/JK3uqoqhPR7sCZ48JxYh3IInBzwIoRyPooeyMJ5jqW9qhVM
	BB8j5ecYwz4HWMfrgfqhdkHTIEjI/VjZzh9enXhJta+/XL5AmWIFwAwpkOrfrZAGsixzgGKFEJNpr
	5lA1El3pwCjIxx9atPuJLmc2Bd5Y1cQsgJR4JFdKotE7fMm6c0mhxwy5bAwdbvs0YrbDlPJjYasFd
	lEk1NV6vVm9X97ucVcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruyc-0000000EUZv-2aum;
	Wed, 03 Apr 2024 07:24:06 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rruyZ-0000000EUVJ-0H4Z
	for linux-mtd@lists.infradead.org;
	Wed, 03 Apr 2024 07:24:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0155A60007;
	Wed,  3 Apr 2024 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712129037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JwpvrR4xst+JurvZq9lJXg1ECrNmeKF2zXVGi9frShY=;
	b=NO1YjmOmNTSHopJhB1/cb1Uygh4/SetG1hQdoHDCCrB9+qhaRZTzGeS4k80NxAgazAPLV2
	X642w0kefoXUr+QXhfUkVpwg4DO0EH9hxGBbBW2xVDGYC9e3SmGA3C3sS/4VOWyKUJv6aI
	MKHcvWGcTcMLtvhMbIB2zJ0/ynweYnYl9cx30cuBYdFM32baQuyKS7OomicMXgJVjwg/ZT
	DV5Mr8RTyyqyQ/oU43mR5uoy8UyheGebmBV2KhL6V5J0rQ9qnXSboQ2SFE8MDos1MyDSXi
	o7NJ2+4wvBG0baY3fxhzp+kMCkHcq1kX5E3DsZXYKQPQNdvNcOOss81J3am+VQ==
Date: Wed, 3 Apr 2024 09:23:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Sricharan
 Ramabadhran <quic_srichara@quicinc.com>, Md Sadre Alam
 <quic_mdalam@quicinc.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: rawnand: qcom: Fix broken misc_cmd_type in
 exec_op
Message-ID: <20240403092356.496e07ec@xps-13>
In-Reply-To: <20240403063008.GA25309@thinkpad>
References: <20240402214136.29237-1-ansuelsmth@gmail.com>
	<20240403063008.GA25309@thinkpad>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_002403_372691_C55A38BB 
X-CRM114-Status: GOOD (  15.62  )
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

SGksCgptYW5pdmFubmFuLnNhZGhhc2l2YW1AbGluYXJvLm9yZyB3cm90ZSBvbiBXZWQsIDMgQXBy
IDIwMjQgMTI6MDA6MDgKKzA1MzA6Cgo+IE9uIFR1ZSwgQXByIDAyLCAyMDI0IGF0IDExOjQxOjM0
UE0gKzAyMDAsIENocmlzdGlhbiBNYXJhbmdpIHdyb3RlOgo+ID4gbWlzY19jbWRfdHlwZSBpbiBl
eGVjX29wIGhhdmUgbXVsdGlwbGUgcHJvYmxlbXMuIFdpdGggY29tbWl0IGE4Mjk5MGM4YTQwOQo+
ID4gKCJtdGQ6IHJhd25hbmQ6IHFjb206IEFkZCByZWFkL3JlYWRfc3RhcnQgb3BzIGluIGV4ZWNf
b3AgcGF0aCIpIGl0IHdhcwo+ID4gcmV3b3JrZWQgYW5kIGdlbmVyYWxpemVkIGJ1dCBhY3R1YWxs
eSBkcm9wcGVkIHRoZSBoYW5kbGluZyBvZiB0aGUKPiA+IE9QX1JFU0VUX0RFVklDRSBjb21tYW5k
Lgo+ID4gCj4gPiBUaGUgcmV3b3JrIGl0c2VsZiB3YXMgY29ycmVjdCB3aXRoIHN1cHBvcnRpbmcg
Y2FzZSB3aGVyZSBhIHNpbmdsZSBtaXNjCj4gPiBjb21tYW5kIGlzIGhhbmRsZWQsIGJ1dCBiZWNh
bWUgcHJvYmxlbWF0aWMgYnkgdGhlIGFkZGl0aW9uIG9mIGV4aXRpbmcKPiA+IGVhcmx5IGlmIHdl
IGRpZG4ndCBoYWQgYW4gT1BfQkxPQ0tfRVJBU0Ugb3IgYW4gT1BfUFJPR1JBTV9QQUdFIG9wZXJh
dGlvbi4KPiA+IAo+ID4gQWxzbyBhZGRpdGlvbmFsIGxvZ2ljIHdhcyBhZGRlZCB3aXRob3V0IGNs
ZWFyIGV4cGxhaW5hdGlvbiBjYXVzaW5nIHRoZQo+ID4gT1BfUkVTRVRfREVWSUNFIGNvbW1hbmQg
dG8gYmUgYnJva2VuIG9uIHRlc3RpbmcgaXQgb24gYSBpcHE4MDZ4IG5hbmRjLgo+ID4gCj4gPiBB
ZGQgc29tZSBhZGRpdGlvbmFsIGxvZ2ljIHRvIHJlc3RvcmUgT1BfUkVTRVRfREVWSUNFIGNvbW1h
bmQgaGFuZGxpbmcKPiA+IHJlc3RvcmluZyBvcmlnaW5hbCBmdW5jdGlvbmFsaXR5Lgo+ID4gICAK
PiAKPiBJJ2QgbGlrZSB0byByZXdvcmQgdGhlIGNvbW1pdCBzdWJqZWN0IGFuZCBkZXNjcmlwdGlv
biBhcyBiZWxvdy4gQnV0IEkgaG9wZQo+IE1pcXVlbCBjYW4gYW1tZW5kIGl0IHdoaWxlIGFwcGx5
aW5nOgoKSSdtIHByZXR0eSBidXN5LCBzZW5kaW5nIGEgdjQgb24gd2hpY2ggeW91IGJvdGggYWdy
ZWUgb24gd291bGQgYmUKc2ltcGxlciB0byBtZSA6LSkKClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
