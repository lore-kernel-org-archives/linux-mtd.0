Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B56FC33CB1
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:25:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F2C2217BA
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RaVQrCGW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F2C2217BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lD3GPiTey/AZfRsFWUkuOeiH1/SBl1bltsdWTdumYso=; b=RaVQrCGWGGUcGQ
	ADVVUQIf7hip4qUYzsmTVrfPEAjV06ZV9WtrEB0JnFGG1ggy0b3eDU4govlZq/0A9mr8oDjtHmnwj
	wnj6+2I5LCB8UpDCGLlSyke7kvVh2YYtj/1rDoKdy5xRJscR/LY8z3ruFKNXAGpy+bgoc4txulrYR
	eh08ncbE2NlOSfqmSSHRZmy0cZsgyI5VPgCsCN4hwZDGIbYE4OjNJCpdJCa6VnVPQIvaQabGUsloG
	CnToxLdYjjfnhhCgAWTxrfVXctRRyGTD0iBlhaU0xEEVq8SmlkHJl3jGqePgujrUR9LUzpNJY1UN0
	HsqRZDCntTMu3dWtq4/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irIRR-0007rq-Qf; Tue, 14 Jan 2020 09:24:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irIRL-0007qi-Sn
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 09:24:52 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 09180C0012;
 Tue, 14 Jan 2020 09:24:33 +0000 (UTC)
Date: Tue, 14 Jan 2020 10:24:32 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 4/4] mtd: Add driver for concatenating devices
Message-ID: <20200114102432.602415a4@xps13>
In-Reply-To: <20191209113506.41341ed4@collabora.com>
References: <20191127105522.31445-1-miquel.raynal@bootlin.com>
 <20191127105522.31445-5-miquel.raynal@bootlin.com>
 <20191209113506.41341ed4@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_012448_204263_78827040 
X-CRM114-Status: GOOD (  18.45  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Bernhard Frauendienst <kernel@nospam.obeliks.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4g
d3JvdGUgb24gTW9uLCA5IERlYwoyMDE5IDExOjM1OjA2ICswMTAwOgoKPiBPbiBXZWQsIDI3IE5v
diAyMDE5IDExOjU1OjIyICswMTAwCj4gTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290
bGluLmNvbT4gd3JvdGU6Cj4gCj4gPiBJbnRyb2R1Y2UgYSBnZW5lcmljIHdheSB0byBkZWZpbmUg
Y29uY2F0ZW5hdGVkIE1URCBkZXZpY2VzLiBUaGlzIG1heQo+ID4gYmUgdmVyeSB1c2VmdWwgaW4g
dGhlIGNhc2Ugb2YgaWUuIHN0YWNrZWQgU1BJLU5PUi4gUGFydGl0aW9ucyB0bwo+ID4gY29uY2F0
ZW5hdGUgYXJlIGRlc2NyaWJlZCBpbiBhbiBhZGRpdGlvbmFsIHByb3BlcnR5IG9mIHRoZSBwYXJ0
aXRpb25zCj4gPiBzdWJub2RlOgo+ID4gCj4gPiAgICAgICAgIGZsYXNoMCB7Cj4gPiAgICAgICAg
ICAgICAgICAgcGFydGl0aW9ucyB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcGFy
dC1jb25jYXQgPSA8JmZsYXNoMF9wYXJ0MT4sIDwmZmxhc2gxX3BhcnQwPjsKPiA+IAo+ID4gCQkJ
cGFydDBAMCB7Cj4gPiAJCQkJbGFiZWwgPSAicGFydDBfMCI7Cj4gPiAJCQkJcmVnID0gPDB4MCAw
eDgwMDAwMD47Cj4gPiAJCQl9Owo+ID4gCj4gPiAJCQlmbGFzaDBfcGFydDE6IHBhcnQxQDgwMDAw
MCB7Cj4gPiAJCQkJbGFiZWwgPSAicGFydDBfMSI7Cj4gPiAJCQkJcmVnID0gPDB4ODAwMDAwIDB4
ODAwMDAwPjsgIAo+IAo+IFNvLCBmbGFzaDBfcGFydDEgYW5kIGZsYXNoMF9wYXJ0MiB3aWxsIGJl
IGNyZWF0ZWQgZXZlbiB0aG91Z2ggdGhlIHVzZXIKPiBwcm9iYWJseSBkb2Vzbid0IG5lZWQgdGhl
bT8KPiAKPiA+IAkJCX07Cj4gPiAgICAgICAgICAgICAgICAgfTsKPiA+ICAgICAgICAgfTsKPiA+
IAo+ID4gICAgICAgICBmbGFzaDEgewo+ID4gICAgICAgICAgICAgICAgIHBhcnRpdGlvbnMgewo+
ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmaXhlZC1wYXJ0aXRpb25z
IjsKPiA+IAo+ID4gCQkJZmxhc2gwX3BhcnQxOiBwYXJ0MUAwIHsKPiA+IAkJCQlsYWJlbCA9ICJw
YXJ0MV8wIjsKPiA+IAkJCQlyZWcgPSA8MHgwIDB4ODAwMDAwPjsKPiA+IAkJCX07Cj4gPiAKPiA+
IAkJCXBhcnQwQDgwMDAwMCB7Cj4gPiAJCQkJbGFiZWwgPSAicGFydDFfMSI7Cj4gPiAJCQkJcmVn
ID0gPDB4ODAwMDAwIDB4ODAwMDAwPjsKPiA+IAkJCX07Cj4gPiAgICAgICAgICAgICAgICAgfTsK
PiA+ICAgICAgICAgfTsgIAo+IAo+IElNSE8gdGhpcyByZXByZXNlbnRhdGlvbiBpcyBmYXIgZnJv
bSBpbnR1aXRpdmUuIEF0IGZpcnN0IGdsYW5jZSBpdCdzIG5vdAo+IG9idmlvdXMgd2hpY2ggcGFy
dGl0aW9ucyBhcmUgbGlua2VkIHRvZ2V0aGVyIGFuZCB3aGF0J3MgdGhlIG5hbWUgb2YgdGhlCj4g
cmVzdWx0aW5nIGNvbmNhdGVuYXRlZCBwYXJ0LiBJIGRlZmluaXRlbHkgcHJlZmVyIHRoZSBzb2x1
dGlvbiB3aGVyZSB3ZQo+IGhhdmUgYSB2aXJ0dWFsIGRldmljZSBkZXNjcmliaW5nIHRoZSBjb25j
YXRlbmF0aW9uLiBJIGFsc28gdW5kZXJzdGFuZAo+IHRoYXQgdGhpcyBnb2VzIGFnYWluc3QgdGhl
ICMxIERUIHJ1bGU6ICJEVCBvbmx5IGRlY3JpYmVzIEhXIGJsb2Nrcywgbm90Cj4gaG93IHRoZXkg
c2hvdWxkIGJlIHVzZWQvY29uZmlndXJlZCIsIGJ1dCBtYXliZSB3ZSBjYW4gZmluZCBhIGNvbXBy
b21pc2UKPiBoZXJlLCBsaWtlIG1vdmluZyB0aGlzIGRlc2NyaXB0aW9uIHRvIHRoZSAvY2hvc2Vu
IG5vZGU/Cj4gCj4gY2hvc2VuIHsKPiAJZmxhc2gtYXJyYXlzIHsKPiAJCS8qCj4gCQkgKiBteS1m
bGFzaC1hcnJheSBpcyB0aGUgTVREIG5hbWUgaWYgbGFiZWwgaXMKPiAJCSAqIG5vdCBwcmVzZW50
Lgo+IAkJICovCj4gCQlteS1mbGFzaC1hcnJheSB7Cj4gCQkJLyoKPiAJCQkgKiBXZSBjb3VsZCBo
YXZlCj4gCQkJICogY29tcGF0aWJsZSA9ICJmbGFzaC1hcnJheSI7Cj4gCQkJICogYnV0IHdlIGNh
biBhbHNvIGRvIHdpdGhvdXQgaXQuCj4gCQkJICovCj4gCQkJbGFiZWwgPSAiZm9vIjsKPiAJCQlm
bGFzaGVzID0gPCZmbGFzaDEgJmZsYXNoMiAuLi4+Owo+IAkJCXBhcnRpdGlvbnMgewo+IAkJCQkv
KiB1c3VhbCBwYXJ0aXRpb24gZGVzY3JpcHRpb24uICovCj4gCQkJCS4uLgo+IAkJCX07Cj4gCQl9
Owo+IAl9Owo+IH07Cj4gCj4gUm9iLCB3aGF0IGRvIHlvdSB0aGluaz8KClJvYiwgSSB3b3VsZCBy
ZWFsbHkgd2VsY29tZSB5b3VyIHRob3VnaHRzIG9uIHRoaXMgc29sdXRpb24sIGhhdmluZwpzb21l
dGhpbmcgbGlrZSBhIGZsYXNoLWFycmF5IG5vZGUgaW4gdGhlIC9jaG9zZW4vIG5vZGUgd291bGQg
YXZvaWQKY3JlYXRpbmcgZHVtbXkgZGV2aWNlcywga2VlcCB0aGUgZGVjbGFyYXRpb25zIG9mIHRo
ZSBwaHlzaWNhbCBub2Rlcwp0aWR5IGFuZCBoYXZlIGEgdmVyeSBzaW1wbGUgZGVzY3JpcHRpb24u
CgpIb3BlIHRoaXMgY29tcHJvbWlzZSBjb3VsZCBmaXQhCiAKPiAKPiA+IAo+ID4gVGhpcyBpcyB1
c2VmdWwgZm9yIGJvYXJkcyB3aGVyZSBtZW1vcnkgcmFuZ2UgaGFzIGJlZW4gZXh0ZW5kZWQgd2l0
aAo+ID4gdGhlIHVzZSBvZiBtdWx0aXBsZSBmbGFzaCBjaGlwcyBhcyBtZW1vcnkgYmFua3Mgb2Yg
YSBzaW5nbGUgTVRECj4gPiBkZXZpY2UsIHdpdGggcGFydGl0aW9ucyBzcGFubmluZyBjaGlwIGJv
cmRlcnMuCj4gPiAKPiA+IFN1Z2dlc3RlZC1ieTogQmVybmhhcmQgRnJhdWVuZGllbnN0IDxrZXJu
ZWxAbm9zcGFtLm9iZWxpa3MuZGU+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
