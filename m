Return-Path: <SRS0=jKlu=O4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0533DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 19:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C816860F9C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Oct 2021 19:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C816860F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SR9iSbKHpMTbRSVLXDB8Y9EvY7LQ51KhIkFA6mTH0W4=; b=LeCs+jGR9MARjUhzmndchUWwgP
	vu/8G1Pkq4QvTRitoR4LJgT2IdAkIu8yHhGEcV9Ysslcja+DTvwKyI+89otYAiXSFD9/WrwvVUY/c
	t/hMAX9ycePVUHx4M4yPGYdEfye3qwX8UU8OH3R2WazS7XqAva/ljbxDTMDCUWOtssx8ltvdtMTkh
	nbE4Wp4KKcbYFC4GAtxo9VtqmmFq2Y13Rs7Y6uJs7aeMDABslK+4oj+m4K4MtLpf7VRgfUJOEr8UZ
	x+/jZQX+h2bYI3nc5XEiVdJ8adfTip7DoYKhZ6PfHpXlqZBnz7+NMqsblVQADVAHL40uP4u82q1A5
	KQ+mfksA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYvGC-003wMb-2y; Fri, 08 Oct 2021 19:10:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYvG9-003wMF-Ay
 for linux-mtd@lists.infradead.org; Fri, 08 Oct 2021 19:10:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DD6960F4F;
 Fri,  8 Oct 2021 19:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633720219;
 bh=Z2ygsEMYLO/VXWnyBFIGSRh1kDJ8bQcJPSg13l9qSjI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MiE2hoxFy1mIniC8bw230X+w+0L3PDqWqsJUnhZ2geQe2uTeT1xMdMlzCA2EtICah
 XZDB3AQAv1zN1ApwJXUwn9cosA0xE+lB2UeACXUb/0cMffJG2oiZfH/gOB4yHPhcWn
 UUgnL/e77mYxnJE8uR/N6EZPIEu8hzxSy3QCAtmNDMxtHBjs45L7ykfw8yMMEYkJk4
 0DBYr1wNFb1pelpbV6pktXehflcIWE3Y87i3r0HETDUcSmWVBpwGjOegT1bSGGNPFT
 FENWjhRkq3saCptID9BG6f176aFvm5KPTqB1ToVIzxiiEXTHxmYi/koBqtntjfcRYB
 ksyIKq8tW+Oww==
Subject: Re: [PATCH v5 0/8] dt-bindings: memory-controllers: ti, gpmc: Convert
 to yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 tony@atomide.com, =?UTF-8?Q?Miqu=c3=a8l_Raynal?= <miquel.raynal@bootlin.com>
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, miquel.raynal@bootlin.com,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211007120830.17221-1-rogerq@kernel.org>
 <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
From: Roger Quadros <rogerq@kernel.org>
Message-ID: <e165b6ee-91d3-3a50-3b9d-3f15fa82a101@kernel.org>
Date: Fri, 8 Oct 2021 22:10:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6b90a6fd-001f-a41a-b69f-2bd3ec8a8e26@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_121021_421240_23B824E0 
X-CRM114-Status: UNSURE (   9.82  )
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

S3J6eXN6dG9mLAoKT24gMDcvMTAvMjAyMSAyMDozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90
ZToKPiBPbiAwNy8xMC8yMDIxIDE0OjA4LCBSb2dlciBRdWFkcm9zIHdyb3RlOgo+PiBIaSwKPj4K
Pj4gVGhpcyBzZXJpZXMgY29udmVydHMgdGksZ3BtYyBtZW1vcnkgY29udHJvbGxlciBhbmQgdGks
Z3BtYy1uYW5kIGFuZAo+PiB0aSxncG1jLW9uZW5hbmQgTVREIGNvbnRyb2xsZXIgYmluZGluZ3Mg
dG8geWFtbC4KPj4KPj4gY2hlZXJzLAo+PiAtcm9nZXIKPj4KPiAKPiBIaSwKPiAKPiBBbHRob3Vn
aCB5b3UgZGlkIG5vdCBtZW50aW9uIGl0IGhlcmUsIGl0IGxvb2tzIGxpa2UgeW91IGhhdmUgc29t
ZQo+IGRlcGVuZGVuY2llcyBiZXR3ZWVuIHRoZSBwYXRjaGVzLiBNYXliZSB0aGlzIHNoYWxsIGdv
IHNpbXBseSB2aWEgUm9iJ3MgdHJlZT8KPiAKClJvYiBoYXMgYWNrZWQgYWxsIHRoZSBEVCBiaW5k
aW5nIHBhdGNoZXMuClNvIGl0IGlzIHVwdG8geW91IGFuZCBNaXF1w6hsIHRvIGRlY2lkZSB0aGUg
YmVzdCB3YXkuIE1URCB0cmVlIG9yIE1lbW9yeSBjb250cm9sbGVyIHRyZWUKZm9yIHRoZSBkdC1i
aW5kaW5ncyBwYXRjaGVzLgoKVGhlIEFSTTogZHRzIGNoYW5nZXMgc2hvdWxkIGdvIHZpYSBUb255
J3MgT01BUCBTb0MgdHJlZS4KCk9yIGlmIFRvbnkgaXMgT0sgd2l0aCBpdCB0aGVuIG1heWJlIGFs
bCBwYXRjaGVzIGNhbiBnbyB2aWEgVG9ueSdzIHRyZWU/IDopCgpjaGVlcnMsCi1yb2dlcgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
