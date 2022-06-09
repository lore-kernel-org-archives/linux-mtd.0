Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F89C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFBBnRERgQ7IEvTi9DTdzPWfOljrG09qWiFI9SqZQ38=; b=sprP+13Tp3IYOO
	vgbh7hHLPWbDOE54Tet1mpGovFBAeXHRcVkYAolHu/hLT/Wpv13etNC8YBMrZa4LEMOFaWhedp2bq
	52PGaT0rCPs2bEfmqpscudJOwQB2h1ZNLVGnKFhXI/qoY2uebDhTHYawJl2FV875h4dmnDtQzhotl
	nRgnwYeKfsM1S29P8+ujKhY1yR2bX13zt6yxeaqOByv7D2zl/nzZcEf9o8ee8mR0LFnknuzjKGA22
	bggKOd07bd7405S0NzaOpT6x0aKEtNpTV5ucfHpVlSenaLw7cYdKMJHIFnGDvUHgdsVni73fMansL
	WcpzvK4+99Nr4LNZepNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLdF-002yyr-DF; Thu, 09 Jun 2022 17:07:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLdC-002yxM-5u
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 17:07:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CA8C0B82E56;
	Thu,  9 Jun 2022 17:07:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5366EC341C0;
	Thu,  9 Jun 2022 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654794455;
	bh=ee5TZiNlW7vDizss9nf0y5vrWyHbm4ptXDn+z57/BXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f3E+ZiKDLvoyP4DzfdYnYL4itaZqOWEFERshly86nHvB4ktXSUT4zhtfL6P+BTW9f
	 6NrIeIdNoVr6SwR6YizswrCvZKS9i0iXZbEryoHZRbNk3vIY4bNvydAZCJJWz8ip27
	 L5wTeHmr+I6amg2hyzkrvV9OHZvXgc8JnKyqhMVOw9BfW9Ikd0HiMCW3vYSqeFY2PA
	 LNBZyn3Z8TSi5t910HFskQ8Zpt5iUA+56jT8zYSUBgne/SY055KskmPEBNZB0w54GY
	 WVrmttEz60MLOpuFp7hMLzq5nFxJQyNJUvBP8kVeAUXA/hnrY4k6fbwfaUioqqoEEL
	 SlQEyMY65XtgA==
Date: Thu, 9 Jun 2022 22:37:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] mtd: nand: raw: qcom_nandc: reorder
 qcom_nand_host struct
Message-ID: <20220609170722.GA5081@thinkpad>
References: <20220609132344.17548-1-ansuelsmth@gmail.com>
 <20220609132344.17548-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609132344.17548-2-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_100738_401858_B8A18245 
X-CRM114-Status: GOOD (  19.65  )
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

T24gVGh1LCBKdW4gMDksIDIwMjIgYXQgMDM6MjM6NDJQTSArMDIwMCwgQW5zdWVsIFNtaXRoIHdy
b3RlOgo+IFJlb3JkZXIgcWNvbV9uYW5kX2hvc3QgdG8gc2F2ZSBob2xlcyBpbiB0aGUgc3RydWN0
LgoKWW91IGZvcmdvdCB0byByZW9yZGVyIG90aGVyIHN0cnVjdHMgYWxzbyBhcyBJIHJlcXVlc3Rl
ZCA6LwoKVGhhbmtzLApNYW5pCgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5z
dWVsc210aEBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbXRkL25hbmQvcmF3L3Fjb21fbmFu
ZGMuYyB8IDEwICsrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNv
bV9uYW5kYy5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5jCj4gaW5kZXggMWE3
NzU0MmM2ZDY3Li43ZmJiZDNlNzc4NGMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvcWNvbV9uYW5kYy5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvcWNvbV9uYW5kYy5j
Cj4gQEAgLTQzMSwxMSArNDMxLDEyIEBAIHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciB7Cj4g
ICAqCQkJCWFuZCByZXNlcnZlZCBieXRlcwo+ICAgKiBAY3dfZGF0YToJCQl0aGUgbnVtYmVyIG9m
IGJ5dGVzIHdpdGhpbiBhIGNvZGV3b3JkIHByb3RlY3RlZAo+ICAgKgkJCQlieSBFQ0MKPiArICog
QGVjY19ieXRlc19odzoJCUVDQyBieXRlcyB1c2VkIGJ5IGNvbnRyb2xsZXIgaGFyZHdhcmUgZm9y
IHRoaXMKPiArICoJCQkJY2hpcAo+ICsgKgo+ICAgKiBAdXNlX2VjYzoJCQlyZXF1ZXN0IHRoZSBj
b250cm9sbGVyIHRvIHVzZSBFQ0MgZm9yIHRoZQo+ICAgKgkJCQl1cGNvbWluZyByZWFkL3dyaXRl
Cj4gICAqIEBiY2hfZW5hYmxlZDoJCWZsYWcgdG8gdGVsbCB3aGV0aGVyIEJDSCBFQ0MgbW9kZSBp
cyB1c2VkCj4gLSAqIEBlY2NfYnl0ZXNfaHc6CQlFQ0MgYnl0ZXMgdXNlZCBieSBjb250cm9sbGVy
IGhhcmR3YXJlIGZvciB0aGlzCj4gLSAqCQkJCWNoaXAKPiAgICogQHN0YXR1czoJCQl2YWx1ZSB0
byBiZSByZXR1cm5lZCBpZiBOQU5EX0NNRF9TVEFUVVMgY29tbWFuZAo+ICAgKgkJCQlpcyBleGVj
dXRlZAo+ICAgKiBAbGFzdF9jb21tYW5kOgkJa2VlcHMgdHJhY2sgb2YgbGFzdCBjb21tYW5kIG9u
IHRoaXMgY2hpcC4gdXNlZAo+IEBAIC00NTIsMTEgKzQ1MywxMiBAQCBzdHJ1Y3QgcWNvbV9uYW5k
X2hvc3Qgewo+ICAJaW50IGNzOwo+ICAJaW50IGN3X3NpemU7Cj4gIAlpbnQgY3dfZGF0YTsKPiAt
CWJvb2wgdXNlX2VjYzsKPiAtCWJvb2wgYmNoX2VuYWJsZWQ7Cj4gIAlpbnQgZWNjX2J5dGVzX2h3
Owo+ICAJaW50IHNwYXJlX2J5dGVzOwo+ICAJaW50IGJibV9zaXplOwo+ICsKPiArCWJvb2wgdXNl
X2VjYzsKPiArCWJvb2wgYmNoX2VuYWJsZWQ7Cj4gIAl1OCBzdGF0dXM7Cj4gIAlpbnQgbGFzdF9j
b21tYW5kOwo+ICAKPiAtLSAKPiAyLjM2LjEKPiAKCi0tIArgrq7grqPgrr/grrXgrqPgr43grqPg
rqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
