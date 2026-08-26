Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8E8C61DC2
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Aug 2026 09:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btYq7qpD60xZ7mbn5/0SA0ByZhNDesV5sCzA30oSKHc=; b=nbKAsvuHrhwzQk
	WnRIuTztCad/6DteNAaeQhSlstUDkuaY5OdFRTzTS1RZdVlBc1/5sz6fIKyTtBCuLYd3uf1udl798
	4i+w2KZhzd6CuSKenR+cID5ixwBzgk5JMCWpmXcvskeHA3rUyaHmmQ7Ov7GWnK4NinM8w2xZ0czUF
	pGnnqYT6Q+TgM04EntXLHkR7zoNlqcWfMwok47CdwmcIJ6KH4HYhk4uPurx2SctgOjNrlmkBp05bs
	uGGclJOUYoPSFCoKcnZBRpzSzCtZ+oNY4vhYJ/HxCgAvlbmygkJvV2416zF0UFpxC3cTHIAF6t5xt
	EUYNqw2DeCVCQH5tgeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Xo-000000028rq-1rr1;
	Wed, 26 Aug 2026 09:03:40 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9Xl-000000028qc-49B0
	for linux-mtd@lists.infradead.org;
	Wed, 26 Aug 2026 09:03:39 +0000
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=OaGgCG7E;
	dkim-atps=neutral
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 7B375444
	for <linux-mtd@lists.infradead.org>; Wed, 26 Aug 2026 18:03:32 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso907551a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Aug 2026 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1787735011; x=1788339811; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gd/7CGcQOnI8K4fUjyfMWBBAL5IDTfpF3taYM7+n2AM=;
        b=OaGgCG7EcPm877RQxftvFXK63xflxTC3UodZ6PRHglxeGFoYpd5WAo+oLwjeAnCxic
         YltZqM0qPJPjx5KzFQIlV9ngaDE+0rfjdF47ZibH5W8DRDpAfyE0i6m5VD5O6+DacWmS
         dsLM1muyFohIKI3S/T5lm6TV6aE6HlGPqQgT0mZGShDtW5SJi1QCIpocBrxonoHwIIl6
         mkSZH3uEpmVyguZBeRXjOOUjNWwbyW9/JaBsa/t5bDKk2t5LQbyPlPoz8RsLwlSa2qBa
         sMBIglvpQeoTAHJLtXioty1vqj2+/C4I2HlA4hTMp14Z1yE7IcRRf78X3T8IDfdRTIUs
         FqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787735011; x=1788339811;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gd/7CGcQOnI8K4fUjyfMWBBAL5IDTfpF3taYM7+n2AM=;
        b=aDHaUVZ5ff1u3oAGmI5l4DetMdcAtGpVRzSOZer4GmuWdz++0w+8FWxeJhH07X+Zd2
         II+m5LUyuBQU/z952ARlSLEJ37XSx3sSCmKnc2iaURKRx0Y1Iwpxuckf06F5KZkBeUa9
         3ERaEDJ/u6nQzyMN4oYo5azebX8bNYAXYog1Rxi/adVlyicTp0pxlcWHu8uMAq5Kg1mM
         PB6B7/UWCWUY3qdw/MOn43IJcqWkxYI5ingetdYL37C4BVa250ugYucSrPx0EogKKqBj
         kpHuYWSokS+SdArByOUgkdilxX4Vau5GU3aABoPoFQUkNVvJCgxQGvfd2QMjIFZ/u2iz
         DM+g==
X-Forwarded-Encrypted: i=1; AHgh+RpAQ0ks8mD7FpyTOAsPjGpFSbqyKTPUxVdTn1aAxxTzF/EtPTOjHrCm5YTo1tpabza9jcV61yeDy5c=@lists.infradead.org
X-Gm-Message-State: AFuF++mV4u/hYCFewmC2MvI4yKZ1Ogp4bhEZjGvGEhzhZaHjigeJ8uj+
	sOG0rBWHkTD+2UBwxkoLgCtb33Q30phzXa4SvV2cndlAokjhD+Er6wAmUkVSGpXkjFQFEZscIrC
	6d/z1XWGGPPImf9sgZmiUHNZ5A6SEvoDTtbFW2GrsVA1T06qDAEaKB9oXzBmzMkDm7wJb
X-Gm-Gg: AR+sD12DQl+soXderzj1spF4EKY8P8V4d/v4VGTlID4eigUisk4Zil3ZNWD1F6vXNQK
	TgWyu1iIoDtE8CcwfOzgiAlnTT3KRl/5Acz3e6XYA7QqkY4Nz/Oq2zxjO384vMgmur5sahXG5ea
	ALcDUNSr7SMLRJ1fRk3WfsCqGAjQ9wiIPCP0gASpFi6M7Lz0yTrWJmz86w5fa0hqc6zHKgd/qi2
	cJVisyhQJ1qVG+aWuMCPNbp/RBh68TThpiFRPjFMaz4bvs1YBw1opmHkJOBt/Zhbx1qhRQ52dg/
	2nIRM/hkkjTCvc2JkskZGvivnHLjshz/rMk2HZahbXkEzKUxR1JpHbBsQVkUfkr0z+1TDUPn1R+
	nUvBcPS/cCS4pY8aEiDmuGOLigKafGOXTYLbVL3y3kKCl4pZq
X-Received: by 2002:a17:90b:1d47:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3966d8ab6e3mr11165619a91.13.1787735011440;
        Wed, 26 Aug 2026 02:03:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1d47:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-3966d8ab6e3mr11165541a91.13.1787735010999;
        Wed, 26 Aug 2026 02:03:30 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-396686e8aa2sm3218947a91.3.2026.08.26.02.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 02:03:30 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:03:19 +0900
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] mtd: spinand: winbond: enable continuous read for
 W25N04LW
Message-ID: <ao6r15CbIMQZZWTB@atmark-techno.com>
References: <20260814-w25n04lw-contread-v1-1-2968b07c962d@atmark-techno.com>
 <871pbmk1ma.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <871pbmk1ma.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020338_280016_C31B4269 
X-CRM114-Status: GOOD (  23.67  )
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

TWlxdWVsIFJheW5hbCB3cm90ZSBvbiBUdWUsIEF1ZyAyNSwgMjAyNiBhdCAxMTowOTozM0FNICsw
MjAwOgo+ID4gVW5mb3J0dW5hdGVseSBvbiBteSBzeXN0ZW0gKGkuTVggOFVMUCBMUFNQSSkgdGhl
IGZpcnN0IHRpbWUgY29udGludW91cwo+ID4gcmVhZCBpcyB1c2VkIHNwaW5hbmRfcmVhZF9mcm9t
X2NhY2hlX29wKCkgZmFsbHMgaW50byB0aGlzIGlmIGFuZAo+ID4gZGlzYWJsZXMgY29udGludW91
cyByZWFkLCBzbyB0aGlzIGRpZG4ndCBnbyBhbnkgZnVydGhlcjoKPiAKPiBBaCwgdG9vIGJhZCA6
LSkKClllYWgsIEknbGwgdHJ5IHRvIHRha2Ugc29tZSB0aW1lIHRvIGRpZyBpbnRvIHRoZSBTUEkg
ZHJpdmVyIHRvIHNlZSBpZgp0aGF0IGNhbiBiZSBmaXhlZCBpbiBzb2Z0d2FyZSBidXQgSSdtIGFm
cmFpZCBpdCdsbCB0YWtlIGEgd2hpbGUKbG9uZ2VyLi4uCgo+ID4gRnVuIGZhY3Q6Cj4gPiBuYW5k
ZHVtcCAtQyBpcyBhYm91dCA5JSBmYXN0ZXIgdGhhbiBuYW5kZHVtcCBvbiBsYXJnZSBkYXRhICh0
cmllZCAxME1CKQo+ID4gZXZlbiBpZiBjb250aW51b3VzIHJlYWQgaXMgbm90IHN1cHBvcnRlZC4K
PiAKPiBUaGF0IGlzIHN0cmFuZ2UuIElzIHRoaXMgcmVhbGx5IHJlcHJvZHVjaWJsZT8gQ2FuIHlv
dSBkaXNhYmxlIENQVSBQTSBhbmQKPiB0cnkgYWdhaW4/IFRoZXJlIHNob3VsZCBiZSBubyBpbXBh
Y3QgaWYgY29udGludW91cyByZWFkIGlzIGRpc2FibGVkLgoKVGhpcyBzeXN0ZW0gaGFzIG5vIGtu
b2IgdGhhdCBJJ20gYXdhcmUgb2YgKG5vIGNwdWZyZXEgaW4KL3N5cy9kZXZpY2VzL3N5c3RlbS9j
cHUgYXQgbGVhc3QpLCBidXQgSSd2ZSBzaG92ZWQgdGhlIElSUXMgYXNpZGUgZXhjZXB0CmZvciB0
aGUgc3BpIG9uZXMgYW5kIGl0IGFwcGVhcnMgcHJldHR5IHN0YWJsZSAobXRkMSBpcyBhIDhNQiBw
YXJ0aXRpb24pCgotLS0tLS0KbG9jYWxob3N0Oi9tbnQvbXRkLXV0aWxzIyB0YXNrc2V0IC1jIDEg
aHlwZXJmaW5lIC0td2FybXVwIDMgLXIgMjAgICcuL25hbmRkdW1wIC1mIC9kZXYvbnVsbCAvZGV2
L210ZDEnICcuL25hbmRkdW1wIC1DIC0KZiAvZGV2L251bGwgL2Rldi9tdGQxJwpCZW5jaG1hcmsg
MTogLi9uYW5kZHVtcCAtZiAvZGV2L251bGwgL2Rldi9tdGQxCiAgVGltZSAobWVhbiDCsSDPgyk6
ICAgICA1MTEuMSBtcyDCsSAgIDAuNSBtcyAgICBbVXNlcjogNy44IG1zLCBTeXN0ZW06IDQxOS44
IG1zXQogIFJhbmdlIChtaW4g4oCmIG1heCk6ICAgNTEwLjQgbXMg4oCmIDUxMi4wIG1zICAgIDIw
IHJ1bnMKIApCZW5jaG1hcmsgMjogLi9uYW5kZHVtcCAtQyAtZiAvZGV2L251bGwgL2Rldi9tdGQx
CiAgVGltZSAobWVhbiDCsSDPgyk6ICAgICA0ODAuOSBtcyDCsSAgIDAuOSBtcyAgICBbVXNlcjog
MC41IG1zLCBTeXN0ZW06IDM5OS42IG1zXQogIFJhbmdlIChtaW4g4oCmIG1heCk6ICAgNDgwLjEg
bXMg4oCmIDQ4My4zIG1zICAgIDIwIHJ1bnMKIAogIFdhcm5pbmc6IFN0YXRpc3RpY2FsIG91dGxp
ZXJzIHdlcmUgZGV0ZWN0ZWQuIENvbnNpZGVyIHJlLXJ1bm5pbmcgdGhpcyBiZW5jaG1hcmsgb24g
YSBxdWlldCBzeXN0ZW0gd2l0aG91dCBhbnkgaW50ZXJmZXJlbmNlcyBmcm9tIG90aGVyIHByb2dy
YW1zLiBJdCBtaWdodCBoZWxwIHRvIHVzZSB0aGUgJy0td2FybXVwJyBvciAnLS1wcmVwYXJlJyBv
cHRpb25zLgogClN1bW1hcnkKICAuL25hbmRkdW1wIC1DIC1mIC9kZXYvbnVsbCAvZGV2L210ZDEg
cmFuCiAgICAxLjA2IMKxIDAuMDAgdGltZXMgZmFzdGVyIHRoYW4gLi9uYW5kZHVtcCAtZiAvZGV2
L251bGwgL2Rldi9tdGQxCi0tLS0tLQoodGhpcyBpcyBvbiBvdXIgNi4xMiB0cmVlIGFuZCBub3Qg
b24gdGhlIDcuMi1yYyBJIHdhcyBvbiBlYXJsaWVyLCBzbwp5bW12LCBidXQgaWlyYyB0aGUgOSUg
ZmlndXJlIHdhcyB0YWtlbiBvbiA3LjIgd2l0aCBoeXBlcmZpbmUgc28gdGhpcwpzaG91bGQgYmUg
cmVwcm9kdWNpYmxlIHdpdGggdGhlIGxhdGVzdCBhbmQgZ3JlYXRlc3QpCgoKSSBoYXZlIG11Y2gg
bW9yZSBpbXBvcnRhbnQgdGhpbmdzIHRvIGRvIHNvIEkgb2J2aW91c2x5IGhhZCB0byBsb29rCmZ1
cnRoZXIgaW50byB0aGlzIG15c3RlcnkgOi0pLCBidXQgSSBkaWRuJ3Qgc2VlIGFueXRoaW5nIG9i
dmlvdXMuLi4KCkZvciBzb21lIHJlYXNvbiB0aGUgY29udGlndW91cyByZWFkIHZhcmlhbnQgc2Vl
bXMgdG8gc3BlbmQgbGVzcyB0aW1lIGluCnNwaW5hbmRfd2FpdCgpIGJldHdlZW4gdGhlIGxvYWQg
cGFnZSBhbmQgcmVhZCBmcm9tIGNhY2hlIG9wIChsb29raW5nIGF0CmEgZmxhbWVncmFwaCksIGJ1
dCBkdW1waW5nIHRoZSBhY3R1YWwgb3BzIHVzZWQgSSBzZWUgdmVyeSBzaW1pbGFyCnNlcXVlbmNl
cyBvZiBsb2FkIHBhZ2UgKDB4MTMpLCBwb2xsIHN0YXR1cyAoMHhmKSwgZGlybWFwX3JlYWQgKDB4
ZWIpLApzbyB0aGF0IGRvZXNuJ3QgZXhwbGFpbiB0aGUgZGlmZmVyZW5jZS4uLgoKVGhlIG1haW4g
ZGlmZmVyZW5jZSBJIHNlZSBpcyB0aGF0IG5hbmRkdW1wIC1DIHBhc3NlcyBhIG11Y2ggbGFyZ2Vy
CmJ1ZmZlciB0byByZWFkIChvYnNlcnZhYmxlIHdpdGggc3RyYWNlIC1jKSwgc28gbG9vcHMgZm9y
IHJlYWRpbmcgaW5zaWRlCnRoZSBrZXJuZWwsIGFuZCB3aXRob3V0IC1DIGxvb3BzIGluIHVzZXJz
cGFjZTogSSBkbyBub3Qgc2VlIHRoZSBzeXNjYWxsCm92ZXJoZWFkIGluIG15IHBlcmYgcmVjb3Jk
IGZsYW1lZ3JhcGggYnV0IHBlcmhhcHMgdGhhdCBjaGFuZ2VzIHRoZQp0aW1pbmcganVzdCBlbm91
Z2ggZm9yIHRoZSBuYW5kIHRvIGJlaGF2ZSBkaWZmZXJlbnRseSBvciBzb21ldGhpbmcgbGlrZQp0
aGF0PwoKRGVmaW5pdGVseSBjdXJpb3VzLCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoZXJlJ3MgYW55
dGhpbmcgdG8gYWN0IG9uCmhlcmUuLgoKQ2hlZXJzLAotLSAKRG9taW5pcXVlCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
