Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7459CCD6E55
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2026 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8/Czwtg0IzYqMaZfEKBhrHehJ5s+XCUuOWrAZX/KEY=; b=W/EJCabzOQLEBy
	D3sd6yfrdhRECkdgxcOW+b9bPuc2L3ek58XVLMBLAixdLU24FV19w06y+77NVpK5CPHaOLKBLf2qE
	cQcle7YOsnX1x4X76UQSAijC0KtlP6uH70kh9xXd4pdEuiDs7fA8Xeza4nlZO24qNFh7OTwWdPFhR
	2kw+IdBYWuQ+sysqFkv/seYQHLrX3o4pdZDOkOJ1k6cOaaAb7BK8P8PGjEN6qyBVlz2lAfUT3KnA4
	DtB/LQQosPmzlq+dIdtrz5ncEFERUhgPEdDxvMhdRvF7Wjj8+DA2PPvEJT/9M4luV6ED7IwGnx+nL
	7DODRcPJJ2SOXLGo2ETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUo1v-0000000FTwA-1OiO;
	Wed, 03 Jun 2026 16:01:19 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUo1s-0000000FTvW-16A2
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jun 2026 16:01:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D62944E40115;
	Wed,  3 Jun 2026 16:01:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1B675FA0A;
	Wed,  3 Jun 2026 16:01:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5AF7410888CCD;
	Wed,  3 Jun 2026 18:01:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780502472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BsbNWYH2izjNOlDmI6SDg0Mqw8LEsK+UeDW79yunUl8=;
	b=2mSyo6ob2XjgIYSC6YCVIviauScosz4++r4o2nlrcqQmCtc37rKKI/nelCWMCXnv7L5gwv
	kzg9BeDuf4FNeNKQPGgcMjGdrcz+6XdgWB+ALzXsfqlvu47abJSsUOA/BQ23IxpHUK4skv
	wDlqudx4SA6+bPFD02rtBT3LxbHaT86ovWvv5Ne8w48KiA6sa2bHAcCrAmUtAj4DsOMCBg
	SV0D9313Gthd0PjoA5TbUVXlLNvtxaQO4LszmbeY4APM6KvwVcRj4kreiL/Vgp+Fn4IwQ5
	jhfX1+NJ06sOhFQ67Mx/we1is+1MPU6dM2U76t7+lxy2kHxLS3uK3vOKOP5JAQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>,  broonie@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  richard@nod.at,
  vigneshr@ti.com,  pratyush@kernel.org,  mwalle@kernel.org,
  takahiro.kuwano@infineon.com,  linux-spi@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  praneeth@ti.com,  u-kumar1@ti.com,
  a-dutta@ti.com
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY
 tuning pattern partition property
In-Reply-To: <20260602164945.GA475455-robh@kernel.org> (Rob Herring's message
	of "Tue, 2 Jun 2026 11:49:45 -0500")
References: <20260527175527.2247679-1-s-k6@ti.com>
	<20260527175527.2247679-3-s-k6@ti.com>
	<20260602164945.GA475455-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 03 Jun 2026 18:01:07 +0200
Message-ID: <87zf1by5oc.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_090116_446779_82477A29 
X-CRM114-Status: GOOD (  12.28  )
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

SGVsbG8sCgpPbiAwMi8wNi8yMDI2IGF0IDExOjQ5OjQ1IC0wNSwgUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIFdlZCwgTWF5IDI3LCAyMDI2IGF0IDExOjI1OjE2UE0g
KzA1MzAsIFNhbnRob3NoIEt1bWFyIEsgd3JvdGU6Cj4+IFBIWSB0dW5pbmcgcmVxdWlyZXMgYSBr
bm93biBkYXRhIHBhdHRlcm4gdG8gYmUgcmVhZGFibGUgZnJvbSBmbGFzaC4KPj4gV2hlbiBubyBw
YXJ0aXRpb24gaXMgZXhwbGljaXRseSBpZGVudGlmaWVkLCB0aGUgY29udHJvbGxlciBtdXN0IHNl
YXJjaAo+PiBhbGwgYXZhaWxhYmxlIHBhcnRpdGlvbnMgdG8gbG9jYXRlIHRoZSBwYXR0ZXJuIGJ5
IGxhYmVsLCB3aGljaCBhZGRzCj4+IG92ZXJoZWFkIGFuZCByZWxpZXMgb24gbGFiZWwgbmFtaW5n
IGNvbnZlbnRpb25zIG91dHNpZGUgdGhlCj4+IGNvbnRyb2xsZXIncyBjb250cm9sLgo+Cj4gSSBh
Z3JlZSAnbGFiZWwnIGlzIG5vdCB0aGUgYmVzdCBjaG9pY2UuIFNvZnR3YXJlIHNob3VsZCBub3Qg
Y2FyZSB3aGF0IAo+ICdsYWJlbCcgY29udGFpbnMuIEl0IHNob3VsZCByZWFsbHkgYmUgJ2NvbXBh
dGlibGUnIGluc3RlYWQuCgpCdXQgY29tcGF0aWJsZSBkb2VzIG5vdCBzZWVtIHJlbGV2YW50IGlu
IHRoaXMgY2FzZSwgcmlnaHQ/IFdlIGFyZSBqdXN0CmZsYWdnaW5nIHRoZSBsb2NhdGlvbiBvZiAi
c29tZSB1c2VmdWwgZGF0YSBmb3IgdGhlIGNvbnRyb2xsZXIiLgoKPj4gQWRkIGNkbnMscGh5LXBh
dHRlcm4tcGFydGl0aW9uLCBhIHBoYW5kbGUgcHJvcGVydHkgdGhhdCBhbGxvd3MgdGhlIERUCj4+
IGF1dGhvciB0byBkaXJlY3RseSByZWZlcmVuY2UgdGhlIGZsYXNoIHBhcnRpdGlvbiBob2xkaW5n
IHRoZSBQSFkgdHVuaW5nCj4+IHBhdHRlcm4uIFRoZSBjb250cm9sbGVyIHVzZXMgdGhpcyBwYXJ0
aXRpb24gZHVyaW5nIGNhbGlicmF0aW9uLCBhdm9pZGluZwo+PiB0aGUgcGFydGl0aW9uIHNlYXJj
aCBlbnRpcmVseS4KPgo+IERvIHlvdSBoYXZlIGFueSBkYXRhIHRoYXQgdGhpcyBhcHByb2FjaCBi
ZWluZyAiZGlyZWN0IiBpcyBmYXN0ZXI/IEluIAo+IGZhY3QsIGl0IG1pZ2h0IGJlIHdvcnNlLiBJ
bnN0ZWFkIG9mIHNlYXJjaGluZyBqdXN0IHRoZSBsaW1pdGVkIG51bWJlciBvZiAKPiBwYXJ0aXRp
b24gc3Vibm9kZXMsIHlvdSBub3cgc2VhcmNoIHRoZSBlbnRpcmUgdHJlZSBmb3IgYSBtYXRjaGlu
ZyAKPiBwaGFuZGxlIHZhbHVlLiBXZSBkbyBoYXZlIHBoYW5kbGUgY2FjaGluZywgc28gdGhhdCBt
aWdodCBzYXZlIHlvdQo+IGhlcmUuCgpUcnVlLCBidXQgYmVzaWRlcyBwZXJmb3JtYW5jZSBjb25z
aWRlcmF0aW9ucywgSSBwZXJzb25hbGx5IGRvIG5vdCBmaW5kCmVsZWdhbnQgdXNpbmcgYSBwYXJ0
aXRpb24gbmFtZS9sYWJlbCwgYnV0IG1heWJlIHRoYXQncyBqdXN0IHBlcnNvbmFsCnRhc3RlIDot
KQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
