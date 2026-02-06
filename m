Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07A2EB28EC
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Feb 2026 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2WADSXoXbWNfW6NWbddH0UD1szwH+UF19oUNtYEo34=; b=Wq4JgVfjcyfaeR
	bvSFxkWBKP+AiJgsViYNaR/5JhoCVnENElXV8x976hS2TwTN4zw5lThl46yY99BVN06T/bWVx2yiN
	AdC9VkYjMO2Ff9lnoHb4IhQ7IIW5qcSvqHny8KrLl3/tf3iq0dGW4ygJF++YJmQPTaC3wdk20Lwk1
	lyCJLd+0CG5ejY66xNhJFlLzxq8w5cl3mjxd7sihVCppYNrKt/sHVKM0r7yWBBp/B5MuS4htxyvi/
	khpw+M0uBf51gHSMP+QjzDDXjK7K9+ReRralwHFG0PJcoPAAPGJrZ+SKhxuhguIsWmF5nfNO71Pg6
	0KTqA4XL/MF1knMD68pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHBp-0000000B2id-27fW;
	Fri, 06 Feb 2026 08:27:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHBm-0000000B2iH-1vhQ
	for linux-mtd@lists.infradead.org;
	Fri, 06 Feb 2026 08:27:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 895A94E4243F;
	Fri,  6 Feb 2026 08:27:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DBB460729;
	Fri,  6 Feb 2026 08:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 19EB9119D16FF;
	Fri,  6 Feb 2026 09:27:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770366458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vSfvKz3190MDYbEvnmEMFNLWPOV0++lu5jPilm3/UGQ=;
	b=J3cwqmnO3X/9LlKlsIcIe0v7S3wXQOCcJMUPZFtvz7I+Ko3ld1laW1s692x8J202otMQbL
	WBCrC4fxKA14dGWo3e0gJWO9bCLQv47hxxpfq2EM67FuSJIEtW7UnMFHF7VpDpJwTlDDpi
	QDAqkPyPS7XS9jEtD7AlIlGdbqPf8ERtTp3eHr50CamayGSm4aA3yT9UduZ7xXb4Vb371i
	sBTxafYLOApJ9f9VbP4iWdvuHPp5qmo3PZ/EOj+8NTpCnFpsxH+BYAsTcbB1/VwgkFrPmz
	OOWLJiE+Fglv3muSDf9EuFYcmN/bGFo9oV8VbH76eoIMERQXoGrFBScUgbm8QA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  praneeth@ti.com,  u-kumar1@ti.com,  p-mantena@ti.com,  a-dutta@ti.com,
  s-k6@ti.com,  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC 1/4] spi: spi-mem: Flag DQS capability
In-Reply-To: <9aaeca54-292a-42f7-90d6-a533ff1f5022@sirena.org.uk> (Mark
	Brown's message of "Thu, 5 Feb 2026 19:11:45 +0000")
References: <20260205-winbond-nand-next-phy-tuning-v1-0-5e7d3976f0f1@bootlin.com>
	<20260205-winbond-nand-next-phy-tuning-v1-1-5e7d3976f0f1@bootlin.com>
	<9aaeca54-292a-42f7-90d6-a533ff1f5022@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 06 Feb 2026 09:27:34 +0100
Message-ID: <874inuff9l.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_002742_653475_6CEF44D1 
X-CRM114-Status: GOOD (  10.92  )
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

T24gMDUvMDIvMjAyNiBhdCAxOToxMTo0NSBHTVQsIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVs
Lm9yZz4gd3JvdGU6Cgo+IE9uIFRodSwgRmViIDA1LCAyMDI2IGF0IDA4OjA2OjU4UE0gKzAxMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+IERRUyBpcyBhIHR5cGljYWwgU1BJIG1lbW9yeSBzaWdu
YWwgdXNlZCB0byBoZWxwIHdpdGggcmVhZGluZyB0aGUgZGF0YSBvbgo+PiB0aGUgYnVzIGF0IGhp
Z2ggc3BlZWRzIChlc3BlY2lhbGx5IGluIERUUiBtb2RlKSBieSBhdm9pZGluZyBjbG9jawo+PiBz
a2V3cy4gVGhlIGNoaXAgZ2VuZXJhdGVzIGEgY2xvY2sgc2lnbmFsIHN5bmNocm9uaXplZCB3aXRo
IGl0cyBkYXRhCj4+IG91dHB1dCBmcm9udHMsIGFsc28gY2FsbGVkIGRhdGEgc3Ryb2JlLgo+Cj4g
QWNrZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPgo+IFRoaXMgc2VlbXMg
ZmluZSBpZiB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIGlzIGZpbmU7IGlmIHBlb3BsZSBsaWtlIHRo
aXMKPiBhcHByb2FjaCB0aGVuIGl0J3MgcHJvYmFibHkgc2Vuc2libGUgdG8gbWVyZ2UgYWxvbmcg
d2l0aCB0aGUgTVREIHBhdGNoZXMKPiB1c2luZyBpdCBhbmQgdGhlbiBzZW5kIG1lIGEgdGFnIHdp
dGggdGhlIFNQSSBiaXQgZm9yIG1lIHRvIGFwcGx5IHRoZQo+IFNQSSBkcml2ZXIgY2hhbmdlcy4K
CkZvciBzdXJlLiBUaGlzIGlzIGEgcHJlcmVxdWlzaXRlIGZvciBTYW50aG9zaCdzIFNQSSB0dW5p
bmcgc2VyaWVzLCBzbyBpZgp3ZSBnbyB0aGF0IHdheSwgSSB3aWxsIG1lcmdlIHRoYXQgYml0IGFu
ZCBvZmZlciBhbiBpbW11dGFibGUgdGFnIHdpdGgKdGhlIHNwaS1tZW0gYW5kIG10ZCBwYXRjaGVz
IGFzIHlvdSBwcm9wb3NlZC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
