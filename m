Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23EBC4167D
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgYqSDHoNAsbRsqvNrJo43FaAHSUv4B8oDLWepJVnuI=; b=N787tZr1t2HWhF
	1Ds3YZtroCSnh/grIVL8k45IXjVL+AjBln5AcOuWabBtFKSvxZN0i07WoH91ThWsvTz6SQQTHB/nd
	+BEXuRipVEE9ymN64r3j2Zfr4zl7FpP/n2q/a+tPF1yxAzdn/kuJChDf+eZUq7x2OpH2wa60swA5B
	y/+XG2x38bXsja/b7zJgWkD6fGW5tf07Lp2u7A5MyLj4zT3g9FZ6l8u9grzNHM+Ka9xFR4xCjnK2b
	fvj0lqSVyLUyIZYtpCGj60sqJvt1Azz6ns5A3eS1dTj8oKsrh8v+/BP1qReZlzP9iGN6Hzz4wawgn
	NxHl7VSfZqofkNhCiiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuVh-00BVIA-39;
	Fri, 03 Nov 2023 13:46:53 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuVc-00BVHX-0K
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 13:46:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5735640013;
	Fri,  3 Nov 2023 13:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1699019204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0MWVWZN94e51Kb18auyRiLeqhoOf2GJa5P8GvtHKBzk=;
	b=dUzPAqLztbdKOYCaw6nMFwqeACnAxtAeWsRQkQvZgQL4rJSrFiAd+q4Ux6sLbx3JIAdQ1q
	FnDh7IqUElNHzqoKKsW+N/HZbvIwVmH1DoHXzjaarVzctf3fZnR0YhdFtZSNoikHI/i/tI
	aF25Ypi72MQhaMHKY1ENI3C3JZQWnFmawEUwWcJNVJseqto9TiHv6mRugNdcT6KvZ7bpvo
	kbYQqPYZfUjUUi6f3FokIxk99PmcmFtLghl103/cAhhm1mCpCgEH4BIs/mSMwhQR5ISr63
	PBsofYkJGBrAhIMa9Jk9h+2la5LIHMRTQXMGCFJKlW9BLQ60XDghgLzyq0FrZQ==
Date: Fri, 3 Nov 2023 14:46:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
 <conor+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <quic_srichara@quicinc.com>,
 <qpic_varada@quicinc.com>
Subject: Re: [RFC PATCH 1/5] mtd: nand: ecc-qcom: Add support for ECC Engine
 Driver
Message-ID: <20231103144639.6ff40ae2@xps-13>
In-Reply-To: <4b911907-44b9-c164-9648-3d399e557672@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
	<20231031120307.1600689-2-quic_mdalam@quicinc.com>
	<b9af01d2-1a86-4b41-9bd6-3bf7a0dde1c0@linaro.org>
	<553c1373-c9a0-b2af-2286-058824e31bad@quicinc.com>
	<CAA8EJpp-xsP1x==a5DH8pKpy7XH75UF-L8ewKWmeL8ePtxUq-A@mail.gmail.com>
	<4b911907-44b9-c164-9648-3d399e557672@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_064648_305405_43462D24 
X-CRM114-Status: GOOD (  14.19  )
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

SGVsbG8sCgo+IEJhc2VkIG9uIGJlbG93IGZlZWRiYWNrIFsxXSBhbmQgTkFLIG9uIHRoZSBkZXZp
Y2Ugbm9kZSBwYXRjaAo+IGdvdCBpZGVhIG9mIGhhdmluZyBzZXBhcmF0ZSBkZXZpY2Ugbm9kZSBm
b3IgRUNDIGlzIG5vdCBhY2NlcHRhYmxlLgo+IENvdWxkIHlvdSBwbGVhc2UgaGVscCB0byBjbGFy
aWZ5IHRoYXQuCgpJZiBJIG1heSB0cnkgdG8gY29tcGFyZSB3aXRoIHRoZSBNYWNyb25peCBzaXR1
YXRpb24sIHRoZSBFQ0MgZW5naW5lCndhcyBhbiBpbmRlcGVuZGVudCBoYXJkd2FyZSBibG9jaywg
d2l0aCBpdHMgb3duIG1hcHBpbmcgYW5kIGl0cyBvd24KcmVnaXN0ZXJzLCBzbyBpdCB3YXMgZGVz
Y3JpYmVkIGFzIGFuIGluZGVwZW5kZW50IG5vZGUgaW4gdGhlIERULiBUaGUKdHlwZSBvZiBFQ0Mg
Y29udHJvbGxlciAocGlwZWxpbmVkIG9yIGV4dGVybmFsKSBpcyBkZXNjcmliZWQgYnkgdGhlCm5h
bmQtZWNjLWVuZ2luZSBwcm9wZXJ0eSB3aGljaCBlaXRoZXIgcG9pbnRzIGF0IHRoZSBwYXJlbnQg
bm9kZQoocGlwZWxpbmVkKSBvciBhbiBleHRlcm5hbCBub2RlIChleHRlcm5hbCkuIFRoZSBTUEkg
aG9zdCB3b3VsZCBpdHNlbGYKcG9pbnQgYXQgdGhlIGV4dGVybmFsIEVDQyBlbmdpbmUgbm9kZSB3
aXRoIGl0cyBvd24gbmFuZC1lY2MtZW5naW5lCnByb3BlcnR5IChzZWUgbXRkL214aWN5LG5hbmQt
ZWNjLWVuZ2luZS55YW1sIGluIHRoZSBiaW5kaW5ncykuCgo+IFNpbmNlIEVDQyBibG9jayBpcyBp
bmxpbmVkIHdpdGggUVBJQyBjb250cm9sbGVyIHNvIGlzIHRoZSBiZWxvdwo+IGRldmljZSBub2Rl
IGFjY2VwdGFibGUgPwo+IAo+ICAgICBiY2g6IHFwaWNfZWNjIHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gInFjb20saXBxOTU3NC1lY2MiOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJvayI7Cj4gICAgICAgICAgICAgICAgICAgIH07CgpJ
ZiBpdCBkb2VzIG5vdCBoYXMgaXRzIG93biBtYXBwaW5nIGFuZCBpZiB5b3UgYWNjZXNzIHRoZSBF
Q0MgZW5naW5lCnRocm91Z2ggdGhlIGhvc3QgcmVnaXN0ZXJzIHRoZW4gdGhlIGNvbnRyb2xsZXIg
c2hvdWxkIGJlIHBhcnQgb2YgdGhlCmhvc3Qgbm9kZSwgYnV0IEkgYW0gbm90IHN1cmUgaXQgcmVh
bGx5IG5lZWRzIHRvIGJlIGRlc2NyaWJlZApleHBsaWNpdGx5LCBtb3N0IG9mIHRoZW0gYXJlIG5v
dCBmb3IgaGlzdG9yaWNhbCByZWFzb25zLiBDb25jZXB0dWFsbHkKdGhlcmUgaXMgYSBwcm9ibGVt
IHdpdGggc3Vibm9kZXMgb2YgZWFjaCBvZiB0aGVzZSBjb250cm9sbGVycyBoYXZpbmcKYSBzaWdu
aWZpY2F0aW9uIGFscmVhZHk6IFNQSSBkZXZpY2VzIG9yIE5BTkQgY2hpcHMuCgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
