Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872E9E77188
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZO7APedKSjD196QZxDW1fWT2GDIxNfqhuGxeNpxUUiU=; b=JW6tpk3oLMGdNb
	z/osnzvqvvNL7usrAdsmyOhO7Y9G3M1aVUZfNQ6HioJi3mPH9d4n0qwaM1OLvmfCJlSi1wV+CYx0q
	CyLjFBuZ5R1ugxOo7LQ9T2psGVJS1BEwDpzQIPy+s+6U+B02JyE8FIfK7mep/vl68GjzBwGAV2ZGX
	CmgcWJALDpcMtytsYkQVASkHSKwf394llTN58s5sGNPj74E0RIbKR2agR32tKkiumd9YsmVqsKZ1F
	ilveBsk+sG2oIHEK8KgIUkjjbxNGjfXpfuyZKmL9qYirZjVESxNFG2jxXLjur9N2yIqpipAckOEZK
	f41xjz1rnPsHc1uSceWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ74J-0000000CERw-1IEm;
	Tue, 24 Dec 2024 15:43:35 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ74G-0000000CERF-115E
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 15:43:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2142C0006;
	Tue, 24 Dec 2024 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735055009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F3+hSGSHlH4/HIta8u7/GmGd5FBLxZS+Wb7ky8FWtyA=;
	b=OrEn7nQgApH+CtWryuRC0bwTkZtS7shbgt785gNv6ZkgfXEEYOoNDwvsXOUW0O/VsaSfAZ
	lHvqD1/SJPs6MUNhixLLi3U9PFLyobotPW10cWUSzWRj01jOqZGEy3xJuNPrj/R4R9y00V
	ifHkpIPl3+2hqH3aKo/kQblWM1CGddEx+dOh6OuWau568uicZc4fDlIAIkZ/eAQhjk738b
	QDsb//lZsRkUpL9TC8q2cyHJab1rc+4zkQVrWtnRF+cTsLue/QTQm3Bgw6bzFfjZ1M1+ov
	23s9ufGXw53gP3vtBbOxReoHj00yMtlkKSMCndJYNmBEatJYjAFD/xSL3DBWVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	richard@nod.at,
	vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH v14 0/8] Add QPIC SPI NAND driver
Date: Tue, 24 Dec 2024 16:43:21 +0100
Message-ID: <173505491734.10614.11394326797380035834.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
References: <20241120091507.1404368-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_074332_566618_4BAD6E61 
X-CRM114-Status: UNSURE (   5.38  )
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

T24gV2VkLCAyMCBOb3YgMjAyNCAxNDo0NDo1OCArMDUzMCwgTWQgU2FkcmUgQWxhbSB3cm90ZToK
PiB2MTQ6Cj4gICogVXBkYXRlZCBjb21taXQgbWVzc2FnZQo+ICAqIEZpeCBzcGVsbGluZyBtaXN0
YWtlCj4gICogUmVtb3ZlICJpbmxpbmUiIGZyb20gbXVsdGlwbGUgQVBJcyBmcm9tIHFjb21fbmFu
ZGMuYyBmaWxlCj4gICogTW92ZSAnfCcgaW4gcWNvbV9wYXJhbV9wYWdlX3R5cGVfZXhlYygpIEFQ
SXMgYXQgdGhlIGVuZCBvZiBsaW5lCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkLzYuMTMtcmMx
L3Fjb20tcmVvcmctZm9yLXNwaS02LjE0LCB0aGFua3MhCgpbMi84XSBtdGQ6IHJhd25hbmQ6IHFj
b206IGNsZWFudXAgcWNvbV9uYW5kYyBkcml2ZXIKICAgICAgY29tbWl0OiA4YzUyOTMyZGE1ZTY3
NTZmYTY2ZjUyZjA3MjBkYTI4M2ZiYTEzYWE2ClszLzhdIG10ZDogcmF3bmFuZDogcWNvbTogQWRk
IHFjb20gcHJlZml4IHRvIGNvbW1vbiBhcGkKICAgICAgY29tbWl0OiAxZDQ3OWY1YjM0NWUwYzM2
NTBmZWM0ZGRkZWVmOWZjNmZhYjMwYzhiCls0LzhdIG10ZDogbmFuZDogQWRkIHFwaWNfY29tbW9u
IEFQSSBmaWxlCiAgICAgIGNvbW1pdDogZmRmM2VlNWM2ZTUyNzhkYWI0ZjYwYjk5OGI0N2VkMmQ1
MTBiZjgwZgpbNS84XSBtdGQ6IHJhd25hbmQ6IHFjb206IHVzZSBGSUVMRF9QUkVQIGFuZCBHRU5N
QVNLCiAgICAgIGNvbW1pdDogMGMwODA4MGZkNzFjZDVkZDU5NjQzMTA0YjM5ZDNjODlkNzkzYWIz
YwoKUGF0Y2hlKHMpIHdpbGwgYmUgYXZhaWxhYmxlIHdpdGhpbiBob3VycyBvbiBsaW51eC1tdGQu
CgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
