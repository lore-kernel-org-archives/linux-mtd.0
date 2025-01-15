Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D3BC02180
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2025 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJq/tonOP8xxTOHHXH6O6cyY8wEWXQAd81tp96VgoNY=; b=p8vV0e/IfyLOTQ
	yF5eLn2Lrs0PCRtzeq9X2UhvhMhu81SbKEA1FKCSRo3hBC52ISiQje8Rufs44NFwzKjLbsmfVY2I4
	55V3Eha0XedAo+kTRF6GTkPB2eqnDzjx2M1qdeqoZmPKKMMjPcDcM7IgUslUzLNnauEJOt3YTe6FA
	llQe0QnSxiAz97AKm3AMuDGt3w3CosjH3NFI3tu9y0eGyEJyNP+NCTCL1msCGNnNykLDEnnPebG2X
	2/W4El3mTw3hTWSGQ1SWureUoLZh7qd07bt1xPdUfQ9mYQURaIKc1M92555Ki2QghYUn6m6z8BkU8
	3u9LxIPYXC1Hsl85FOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8sG-0000000CsZr-0TfT;
	Wed, 15 Jan 2025 19:16:20 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8sD-0000000CsZJ-1bi6
	for linux-mtd@lists.infradead.org;
	Wed, 15 Jan 2025 19:16:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EA5E820007;
	Wed, 15 Jan 2025 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736968575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AZfOmRXS2v9AozyEd79Oqt/y5oac9ovFF/Y8vjq+1kQ=;
	b=Ox3OIw3x0GEe5dP6scp9j/1hwNgjwZTJZOFZXaaSIjwGjWiyqDbvns3PoleVriMWdQ602N
	Ivggz4JItcWdg2wgVQh+8ztSS9QezKmg+ypErmmXTNMeCIYPhs5mRrhAUSJsJAHUV8DM/K
	TzRzxeEvxTBpsotEOFaENCYT9ATSvVFq8UsPIwIELSFchm9Hatr1ORaoYZnle9OVNPsLns
	Mp3VhRS/Wmh+8EsAwxX4Za2CZujoVfkuDmeEJkqgCRnYj0wrx8domp9c/xKgDdId8AT0B1
	SjpyaaEaGbGZgp1WKNXyPsrTISatQxMz1MQMnNcG7JAM/n5EYx+lYlGlW39epQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <richard@nod.at>,  <vigneshr@ti.com>,  <quic_sridsn@quicinc.com>,
  <quic_mdalam@quicinc.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <p-mantena@ti.com>
Subject: Re: [PATCH 3/3] mtd: spinand: winbond: Fix oob_layout for W25N01JW
In-Reply-To: <20250102115110.1402440-4-s-k6@ti.com> (Santhosh Kumar K.'s
	message of "Thu, 2 Jan 2025 17:21:10 +0530")
References: <20250102115110.1402440-1-s-k6@ti.com>
	<20250102115110.1402440-4-s-k6@ti.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 20:16:14 +0100
Message-ID: <87r053lwg1.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_111617_565321_4A5D035D 
X-CRM114-Status: UNSURE (   6.61  )
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

SGVsbG8gU2FudGhvc2gsCgpPbiAwMi8wMS8yMDI1IGF0IDE3OjIxOjEwICswNTMwLCBTYW50aG9z
aCBLdW1hciBLIDxzLWs2QHRpLmNvbT4gd3JvdGU6Cgo+IEZpeCB0aGUgVzI1TjAxSlcncyBvb2Jf
bGF5b3V0IGFjY29yZGluZyB0byB0aGUgZGF0YXNoZWV0LiBbMV0KPgo+IFsxXSBodHRwczovL3d3
dy53aW5ib25kLmNvbS9ocS9wcm9kdWN0L2NvZGUtc3RvcmFnZS1mbGFzaC1tZW1vcnkvcXNwaW5h
bmQtZmxhc2gvP19fbG9jYWxlPWVuJnBhcnRObz1XMjVOMDFKVwo+Cj4gRml4ZXM6IDZhODA0ZmI3
MmRlNSAoIm10ZDogc3BpbmFuZDogd2luYm9uZDogYWRkIHN1cHBvcnQgZm9yIHNlcmlhbCBOQU5E
IGZsYXNoIikKPiBDQzogU3JpZGhhcmFuIFMgTiA8cXVpY19zcmlkc25AcXVpY2luYy5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+CgpUaGVyZSBoYXZl
IGJlZW4gY2hhbmdlcyBpbiB0aGlzIGRyaXZlciwgSSdkIHN1Z2dlc3QgdG8gcmViYXNlIHlvdXIg
d29yawpvbmNlIC1yYzEgaXMgb3V0LgoKQWxzbywgUGxlYXNlIGFkZCBDYzogc3RhYmxlIGluIGNv
cHkgYW5kIGVpdGhlciBtb3ZlIHRoaXMgcGF0Y2ggZmlyc3QgaW4KdGhlIHNlcmllcywgb3IgZXZl
biBkZXRhY2ggaXQgYmVjYXVzZSBpdCBoYXMgbGl0dGxlIHRvIGRvIHdpdGggdGhlIHR3bwpvdGhl
ciBwYXRjaGVzLgoKVGhhbmtzIQpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
