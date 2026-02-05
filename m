Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED96ECD994
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 17:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/TuJEMWfSKHOCATM2fAuTi0jsqnYKtPL3Gv4aL6bUM=; b=oAcMeUTQsdUeZZ
	sk7SWFUtc/K05Y7oQHpjSkmk7u7xrIgxP07xadQWOLY18IyNdfzCEHBGO1dOaF9c6I9s/IHIJvL6v
	TE8LLChntkAM8Zlek9OWCvceYXOfhcpJS0Gch45wft/Kmfckthruzb+jocC/7TGeu6UJr0O6rFzz4
	17PD2VBxa2nCDYISWZ1Fkx1R5BxWp4eZTWdvOMibkRAT/k8OieyuU2OvvOoHBBQeR+fz5eIw5ai/E
	fsDlBK3nfcEEl3q/6mzB1HQNj3bt4L88wlYllcc97IvA3rtUnFycoHVzsKNYAa20fQx774iybHFVr
	14sNDknQamktVk6BbX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Gr-0000000AInl-37oT;
	Thu, 05 Feb 2026 17:36:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Gn-0000000AIlO-3237
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 17:36:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F34AC243B0;
	Thu,  5 Feb 2026 17:36:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 264766074D;
	Thu,  5 Feb 2026 17:35:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B300119D1669;
	Thu,  5 Feb 2026 18:35:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770312954; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sTbcat/+A6pqTkLaPExMkSATvgcyd738Gv6Z0JtLFV8=;
	b=DsmEtDfBzlkSTDMTDA4BperDN1egi5Qee+7H3rX5dPxeDebP7b3hZTsqiSmbvSXsmhwult
	dgz+lqxGKXFQwccpPf1apwYMBBYy0GwoUrmGP1qbHk1+xyRRK6RkmH6Hr3EH/A8ozlfzp6
	Oj9Igv8TTlMXWjllQX9c7Vuu/66YUipW201sVOOE8WE0DblM/Q8tr21ePNk0SNrS5pWnLB
	BOs8FyPJEQNVCwpin6bqKIgeHW2xHy7sVGlweXwPYax1sLXJuNny8eQQ/eTRgNAfhT7OZ6
	zZi1HIdeES6vzV4HmuEzJyIHkIauom7+DApSGVdN4YYSNpSJoW2C+okbNH5AYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 08/12] spi: cadence-quadspi: read 'has-dqs' DT
 property
In-Reply-To: <20260113141617.1905039-9-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Tue, 13 Jan 2026 19:46:13 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-9-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 18:35:51 +0100
Message-ID: <87h5rvgkjs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_093557_902978_1954A9AE 
X-CRM114-Status: GOOD (  10.88  )
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

T24gMTMvMDEvMjAyNiBhdCAxOTo0NjoxMyArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBBZGQgYSBib29sZWFuIGZpZWxkIHRvIHN0cnVjdCBjcXNwaV9mbGFz
aF9wZGF0YSB0byBzdG9yZSB3aGV0aGVyIHRoZQo+IGF0dGFjaGVkIGZsYXNoIGRldmljZSBzdXBw
b3J0cyBEUVMgKERhdGEgU3Ryb2JlKSBtb2RlLiBSZWFkIHRoaXMgZnJvbQo+IHRoZSAnc3BpLWhh
cy1kcXMnIGRldmljZSB0cmVlIHByb3BlcnR5IGR1cmluZyBmbGFzaCBub2RlIHBhcnNpbmcuCj4K
PiBUaGlzIGlzIHByZXBhcmF0b3J5IGluZnJhc3RydWN0dXJlIGZvciBQSFkgdHVuaW5nIHN1cHBv
cnQuIFRoZSBmaWVsZAo+IHdpbGwgYmUgdXNlZCBieSBzdWJzZXF1ZW50IHBhdGNoZXMgdG8gY29u
ZmlndXJlIHJlYWQgZGF0YSBjYXB0dXJlIHRpbWluZwo+IHdpdGggRFFTIGVuYWJsZWQgZm9yIGlt
cHJvdmVkIG1hcmdpbnMgaW4gaGlnaC1zcGVlZCBvcGVyYXRpb25zLgo+Cj4gU2lnbmVkLW9mZi1i
eTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+CgpBcyBtZW50aW9uZWQgaW4gbXkgYW5z
d2VyIHRvIHRoZSBjb3ZlciBsZXR0ZXIsIEkgYW0gbm90IHRvbyBtdWNoIGluCmZhdm91ciBvZiB0
aGlzIHByb3BlcnR5IGJlY2F1c2UgdGhpcyBpcyBzb21ldGhpbmcgdGhhdCBpcyBzb21ld2hhdApy
ZWxhdGVkIHRvIHRoZSBjaGlwIElELCB0aHVzIGRpc2NvdmVyYWJsZS4gSSBkcmFmdGVkIHNvbWV0
aGluZyB0byBnZXQKcmlkIG9mIHRoaXMgcHJvcGVydHkgYWxyZWFkeSwgSSB3aWxsIHNoYXJlIGl0
IGZvciBvcGVuaW5nIHRoZQpkaXNjdXNzaW9uLgoKSG93ZXZlciwgZm9yIG5vdyBJIGFtIGNsb3Np
bmcgbXkgZXllcyBvbiB0aGUgZmFjdCB0aGF0IHRoZSBEUVMgcGluIG1pZ2h0Cm5vdCBiZSB3aXJl
ZCB0byB0aGUgY29udHJvbGxlci4gSW4gdGhpcyBjYXNlIHdlIHdpbGwgbmVlZCBzb21lIGtpbmQg
b2YKImRxcy1ub3Qtd2lyZWQiIERUIHByb3BlcnR5LCB0aGF0J3MgdHJ1ZSwgYnV0IGFsc28gZWFz
aWx5IG1hbmFnZWFibGUgYXQKdGhlIGNvcmUgbGV2ZWwgbGF0ZXIsIHdoZW4vaWYgdGhlIG5lZWQg
YXJpc2VzLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
