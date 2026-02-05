Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A1ECD981
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Feb 2026 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKftMY6Bd9x92+E6h2Wfol/J1g+d+G7VeJ/Q5e25pDE=; b=gfgGJLklNZeVBQ
	IbXEDeIYRy7BACCbovFYPOFLCb6lnFEit+FuZj/1Z3NVwlneU933wKb9AHX3c4gBBhKzfkUGRhITU
	o14Alu0cOGiefqO1DGzlMj7TqoDozlVwgiRWwpoc7xSJyaEu3Z9SwPYU5MFbvKfcMytEveAQzjqjG
	Jp2X+w8t8CBAEK99P/+oeO1athJ+NFe+qaCQ77ACvZVX9hFfj1NMUub/qyWDR7gE2gIKhSHs9ShFz
	4D/mer2dV4LffVkeIFMQa3Ko9fy33iu9breSluNrBVY2xI8OpCmB0KabtRmdZmQ5BssmhvRx7Qj+O
	zokV3RGej4EtdkE5fFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1bE-0000000AASV-1mRa;
	Thu, 05 Feb 2026 15:48:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1b8-0000000AARj-3uw9
	for linux-mtd@lists.infradead.org;
	Thu, 05 Feb 2026 15:48:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 141F71A2C2D;
	Thu,  5 Feb 2026 15:48:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C871C6074D;
	Thu,  5 Feb 2026 15:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46527119A865B;
	Thu,  5 Feb 2026 16:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770306526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zrAc5w0PG3JDItEYuR8KISBaKOhhMORkmCkekqY+adU=;
	b=CYgj5HUe+584jFnaZ9D3XtM+DG7J8wB5C0FKdRCHCSLM+vTp+07qP1p0Sv2AlHKQP455uy
	RDUtCdC3DeL0LfxcDY9rgkonWKJk8KftcRWZnDdUQHcBJiSlZVeVsx11xcU4s+WwG91nLH
	og5SndEI0AEQIvdeaHvKZHYB4c4FgCcKRvhWwfrAAq897jhbnhM65C9tWwaqiU/vcCJ7M4
	/YnZB6T8hCHf4oldNZmo2kp91Chc5pEhPCINOn1DDh7tfWfOJk/Hs0idU+W94eopy5aBLH
	1spAT3krtRKSi2KMQr1HEnYCDKsl+kYgDVvdi+GZ+xPnK7nQT5OgdVbyxnpGvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 00/12] spi: cadence-quadspi: add PHY tuning support
In-Reply-To: <87343ghkek.fsf@bootlin.com> (Miquel Raynal's message of "Wed, 04
	Feb 2026 11:29:07 +0100")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<87343ghkek.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 16:48:42 +0100
Message-ID: <87v7gbdwdh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_074851_468407_0604D7FC 
X-CRM114-Status: GOOD (  11.00  )
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

SGkgU2FudGhvc2gsCgo+IEkgYW0gc3VycHJpc2VkIGJ5IHRoZXNlIG51bWJlcnMsIEkgd291bGQg
ZXhwZWN0IHRoZXNlIHRvIGdldCBoaWdoZXIgZm9yCj4gU1BJIE5BTkRzLiBJIHdpbGwgdGVzdCB0
aGUgc2VyaWVzIGFuZCByZXBvcnQgbXkgb2JzZXJ2YXRpb25zLCBlc3BlY2lhbGx5Cj4gc2luY2Ug
dGhlcmUgaXMgYWxzbyBPRERSIFNQSSBOQU5EIHN1cHBvcnQgbm93IChpbiBuYW5kL25leHQsIHNo
b3VsZCBiZQo+IHBhcnQgb2YgbXkgdXBjb21pbmcgbWVyZ2UgcmVxdWVzdCB0byBMaW51cyBmb3Ig
Ni4xOSsxKTsKCkkganVzdCB0ZXN0ZWQgdGhlIHNlcmllcywgaGVyZSBhcmUgc29tZSBudW1iZXJz
IEkgZ3JhYmJlZCBvbiBUSSBBTTYyQTcKTFAgU0sgd2l0aCBhIFdpbmJvbmQgVzM1TjAyIFNQSSBO
QU5EIGNoaXAgKHNvIGluIHRoZSBlbmQgdmVyeSBjbG9zZSB0bwp5b3VyIHJlcG9ydCk6CgogKy0t
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSsKIHwgU1BJIE5BTkQgICAg
ICAgIHwgbm8gdHVuaW5nIHwgUEhZIHR1bmluZyB8CiB8IFVuaXQ6IE1pQi9zICAgICB8ICAgMjVN
SHogICB8ICAgMTY2TUh6ICAgfAogfC0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLXwgICAgICAgICAgIAogfCBPY3RhbCBTRFIgcmVhZCAgfCAgIDEzLjggICAgfCAgICAz
NC4yICAgIHwKIHwgICAgICAgICAgIHdyaXRlIHwgICAgNy4yICAgIHwgICAgMTAuMiAgICB8CiB8
LS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tfAogfCBPY3RhbCBEVFIg
cmVhZCAgfCAgIDIxLjIgICAgfCAgICAgTi9BICAgIHwKIHwgICAgICAgICAgIHdyaXRlIHwgICAg
OS4wICAgIHwgICAgIE4vQSAgICB8CiArLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0rLS0t
LS0tLS0tLS0tKwoKUGxlYXNlIG1pbmQgSSB1c2VkIE1pQi9zIGFuZCBub3QgTUIvcyAoc28ga2lC
IC8gMTAyNCksIEkgZG9uJ3Qga25vdwp3aGljaCBvbmUgeW91IHVzZWQgZm9yIG1lYXN1cmluZywg
YXMgeW91IG1hcmtlZCBNQiwgd2hlcmVhcyB0aGUgbW9zdApjb21tb24gdW5pdCBzZWVtcyB0byBi
ZSBNaUIuCgpIb3dldmVyIFBIWSB0dW5pbmcgZmFpbGVkIGluIE9jdGFsIERUUiBtb2RlICh5b3Vy
IHNlcmllcyBhcHBsaWVkIG9uIHRvcApvZiBuYW5kL25leHQpIHdpdGggdGhlIGZvbGxvd2luZyBs
b2dzLCBjYW4geW91IGhhdmUgYSBsb29rPwoKWyAgICAyLjI2MTY0N10gc3BpLW5hbmQgc3BpMC4w
OiBXaW5ib25kIFNQSSBOQU5EIHdhcyBmb3VuZC4KWyAgICAyLjI2Njk1Nl0gc3BpLW5hbmQgc3Bp
MC4wOiAxMjggTWlCLCBibG9jayBzaXplOiAyNTYgS2lCLCBwYWdlIHNpemU6IDQwOTYsIE9PQiBz
aXplOiAxMjgKWyAgICAyLjI4NTI1N10gY2FkZW5jZS1xc3BpIGZjNDAwMDAuc3BpOiBQSFkgdHVu
aW5nIGZhaWxlZDogLTIKWyAgICAyLjI5MDgzNV0gc3BpLW5hbmQgc3BpMC4wOiBGYWlsZWQgdG8g
ZXhlY3V0ZSBQSFkgdHVuaW5nOiAtMgoKVGhlIGZhbGxiYWNrIHdvcmtlZCB3ZWxsIHRob3VnaCwg
dGhlIG1lbW9yeSB3YXMgc3RpbGwgdXNhYmxlIGxpa2UKYmVmb3JlLCB3aGljaCBpcyBhIHZlcnkg
Z29vZCBwb2ludC4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
