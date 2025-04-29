Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A93C3ABAD
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Apr 2025 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PzltBOcAsXkhCr5MnVO0cRGNvilKgUOQUBgBkHfdq3o=; b=YLSOSPmoLheqRz
	BTDAfS59tOxtxSH/uU5Iuz1zRNoGUgs14FY3/9FIgMgN4+TLsCpC5xXg0yno52DVURvdB94x6bpbp
	7/7CpBlvLsqrCVh31ZKS2VajpRnvAr2Lmr9qjphJcVLgJ00SsdaS+3Ic9wJDcWJm7LqCxZQiEoWOw
	f5qoWqcoC9U4uQiIIVDXO4SuF1REEJsAoAasKZN83LG7PMZGvwlv1gcbAQPXa8D9QZKlvsvlwCyxu
	rcxsEocfXoiJxulG1d1HYeVi3SAHr56WGkLNaEerDpFL28A2d3BZNqpoI+yA1/BeJy0UrfdPi8sny
	e9rNb72fxJ4W6F+XyB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lhp-00000009rvu-1uLO;
	Tue, 29 Apr 2025 14:13:05 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jbP-00000009aIq-0NE7;
	Tue, 29 Apr 2025 11:58:20 +0000
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e6e2971f79fso4564281276.0;
        Tue, 29 Apr 2025 04:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745927897; x=1746532697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YC2LGGpE70kiPFeCCi72EkYRfCk+pYT/yGe+VdlkBmI=;
        b=BCcw++fGJudhrYs7H0oY4t/SPNNhk+mKuEzOY5QnM6UnwPVPWC/CvvuBktontzFxz7
         apXnTy5yx6Jc6+BZ78j5YFpJXdJGmecqnOIRHzkg7lPEk9klHgLYfRvuZhGcL84HtXeR
         i5jQyqv/5vAYNG8yyd988gktebpzPTajy3dKc3z3jVvmUdoNLEL35LAxfMBVr33UHTkG
         lQP7HGj/tMq0XuB8iDtDiaJrPrNzt/hVZlzZ9jA6N61HlG1yltPqpzXasSANBXKWlCkN
         fbKsn+hSaMYUTEKT/x8489nDyVfkDridPeUoEdF/Fwt7nlpV5zdp5Y7+mSJtI2rD74Pr
         aIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745927897; x=1746532697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YC2LGGpE70kiPFeCCi72EkYRfCk+pYT/yGe+VdlkBmI=;
        b=FD6FOWUpSnz3x7oNyxsKVXz2XTvWS5qySWVVmk26bQM5wtMRYIC7Bt/VeNDBv43Bdj
         FjPQ3r6gu2bUiqBvdGCQJXeNwypOrAhIr3W2goZ5wT9u3DILK1PMmaimDAq1GiDkDjff
         89zQ88lmp0KzNqDQdp27sXyduY5h84ZyvA+dEyEoLZV7iPIk4oa3JYsSSoOjDGQYtDNa
         KFhKGC19UUgUXxRm5EiBbiuawKbzoY3CWQYpNWm999U3dUna+EONlWAttu3MZQ2wOEr7
         uXq4+c6LCJqnsM/Msaqow8j09Xf9zgV4bnuhN1saXoT04oSCsqwaSDbHRlanBf6Md+0o
         7/8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5BMhbVntJKYxZRZcDEU/hw8e31EUQzJGcxg6OYfWvfRq0e0EmI0H/P93KggUDSE7KISn6pN4ireEz@lists.infradead.org, AJvYcCWCX+2NI4tp4jdFXVFnoLLkNZeCUpvMigR4ZX520cCvTsLfhMMZoCF3T+2+kNuu3PXqRjBO/nNj1rvWYpdE9Ld+@lists.infradead.org, AJvYcCX11qCEBPmlJbd427DJNWLaw6e1OoMjd+8uITFlxfWhs+NTArt94bauGKtcMGRHEt+C1R+cYdqvTvYYzxYe2iI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzL0iz3F4eFClS2by28btPoYwL/oidRwXyPdD1/nzGQbk5Xafel
	idlERKItvWC1zBpmlvR+saG0ZVLuc089Y7SGUy98mpzvAhI7O7crD+NHSBIBksEWfmLkrMGKSbm
	DYX56G4C58tKpwRb7eq4TWl2VQTA=
X-Gm-Gg: ASbGncthGey3N0JGet+8ekA+GkIC0n5BAmLy8CcXvOw23XgZMYvBVOEqWphNnAF4K1R
	XyeI/3jmhTtrrKam6MKFbDHOoz8I3X7A1tB6xBYncd8IE3V1s19u+MgFfoG2oh4DFDSusUfirSr
	joVp8v9QLcPh12NcaqACp/fg==
X-Google-Smtp-Source: AGHT+IFZuUpUcT0FpWh/xFcN7YV8mTmhhmd1TfDP2Xpd6GzqIj7t/GP6ENv//lBM+JolYrLZVqHMwRl7cIw868ZvG+I=
X-Received: by 2002:a05:6902:2085:b0:e73:9d0:1823 with SMTP id
 3f1490d57ef6-e7323472933mr17628295276.47.1745927897185; Tue, 29 Apr 2025
 04:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20241119093949.3014-1-SkyLake.Huang@mediatek.com>
 <871pymtab3.fsf@bootlin.com> <c1e2d8ea-1b37-479d-8239-cb9bf0efdcaf@gmail.com> <87bjsfv0x1.fsf@bootlin.com>
In-Reply-To: <87bjsfv0x1.fsf@bootlin.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 29 Apr 2025 19:58:05 +0800
X-Gm-Features: ATxdqUFw156jElhjP-eZDXnKLbf_YdyLPXPeNQmy3SBNzsMbmjDF-l2toZGqZGM
Message-ID: <CAJsYDVKiMeYY2rw_BxuW4BAxvMcq5hDwzhiPoAR=tkXzZpRYiw@mail.gmail.com>
Subject: Re: [PATCH nand/next] mtd: nand: spi: Use write_cache first and then
 update_cache in write operation
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle <daniel@makrotopia.org>, 
	Chia-Lin Kao <acelan.kao@canonical.com>, Cheng Ming Lin <chengminglin@mxic.com.tw>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Pratyush Yadav <pratyush@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Steven Liu <Steven.Liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_045819_133153_A6093AA5 
X-CRM114-Status: GOOD (  34.63  )
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

SGVsbG8sIE1pcXVlbCEKCk9uIFR1ZSwgQXByIDI5LCAyMDI1IGF0IDQ6MTXigK9QTSBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4g
T24gMjIvMDQvMjAyNSBhdCAwOTozODoyNiArMDgsIENodWFuaG9uZyBHdW8gPGdjaDk4MTIxM0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBIZWxsbyEKPiA+IOWcqCAyMDI0LzEyLzUgMjM6MzIsIE1p
cXVlbCBSYXluYWwg5YaZ6YGTOgo+ID4+IEhlbGxvLAo+ID4+IE9uIDE5LzExLzIwMjQgYXQgMTc6
Mzk6NDkgKzA4LCBTa3kgSHVhbmcgPFNreUxha2UuSHVhbmdAbWVkaWF0ZWsuY29tPgo+ID4+IHdy
b3RlOgo+ID4+Cj4gPj4+IEZyb206IFNreSBIdWFuZyA8c2t5bGFrZS5odWFuZ0BtZWRpYXRlay5j
b20+Cj4gPj4+Cj4gPj4+IEFjY29yZGluZyB0byBkaXNjdXNzaW9uIHdpdGggTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+Pj4gYW5kIENodWFuaG9uZyBHdW8gPGdj
aDk4MTIxM0BnbWFpbC5jb20+IG9uIEZPUkVTRUUgRjM1U1FBMDAyRyBwYXRjaCwKPiA+Pj4gQ2h1
YW5ob25nIHJlY29tbW1lbmRzIHRoYXQgd2UgY2FuIHVzZSB0aGUgZm9sbG93aW5nIHNlcXVlbmNl
IGluCj4gPj4+IHNwaW5hbmRfd3JpdGVfdG9fY2FjaGVfb3AoKToKPiA+Pj4KPiA+Pj4geDEgbW9k
ZToKPiA+Pj4gMDJIKHByb2dyYW0gZGF0YSBsb2FkKSAtPiA4NEgocmFuZG9tIHByb2dyYW0gZGF0
YSBsb2FkKSAtPiA4NEggLi4uCj4gPj4+Cj4gPj4+IHg0IG1vZGU6Cj4gPj4+IDMySChwcm9ncmFt
IGRhdGEgbG9hZCB4NCkgLT4gMzRIKHJhbmRvbSBwcm9ncmFtIGRhdGEgbG9hZCB4NCkgLT4gMzRI
IC4uLgo+ID4+Pgo+ID4+PiAwMkggb3IgMzJIIGNvbW1hbmRzIHdpbGwgY2xlYXIgY2FjaGUgYnVm
ZmVyIG9uIFNQSS1OQU5EIGFuZCBsb2FkCj4gPj4+IGRhdGEgdG8gaXQuIEZvciB0aG9zZSBTUEkg
Y29udHJvbGxlcnMgd2hpY2ggY2FuJ3QgZmluaXNoIHRyYW5zbWlzc2lvbgo+ID4+PiBpbiBzaW5n
bGUgc3RlcCwgODRIIG9yIDM0SCB3aWxsIGJlIHRyaWdnZXJlZCBmb3IgdGhlIHJlc3QgZGF0YS4K
PiA+Pj4KPiA+Pj4gV2Ugb2JzZXJ2ZSB0aGF0IHNvbWUgY3VycmVudCBTUEktTkFORHMsIGluY2x1
ZGluZyBGT1JFU0VFIEYzNVNRQTAwMUcgYW5kCj4gPj4+IEYzNVNRQTAwMkcsIG11c3QgdXNlIDAy
SCBvciAzMkggdG8gcmVzZXQgY2FjaGUgYnVmZmVyIGluIGZsYXNoIGJlZm9yZQo+ID4+PiB1c2lu
ZyA4NEggb3IgMzRILiBPciB1c2VycyBtYXkgZW5jb3VudGVyIHByb2dyYW0gZmFpbHVyZSBpc3N1
ZS4gVGhpcyBpc3N1ZQo+ID4+PiBpcyBub3QgYWx3YXlzIHJlcHJvZHVjaWJsZSwgYnV0IGl0IG1h
eSBvY2N1ciBhbmQgY2F1c2Ugc3lzdGVtIGluc3RhYmlsaXR5Lgo+ID4+Pgo+ID4+PiBUaGlzIHNl
cXVlbmNlIHNob3VsZCB3b3JrIG9uIGFsbCBTUEktTkFORHMgbm93YWRheXMuIEkgYWxzbyBjaGVj
ayB3aXRoCj4gPj4+IEZvcmVzZWUgdGhhdCB0aGUgc2VxdWVuY2UgY2FuIHNvbHZlIHRoZSBhYm92
ZSBwcm9ncmFtIGZhaWx1cmUgaXNzdWUuCj4gPj4+Cj4gPj4+IE9uIG15IHRlc3QgcGxhdGZvcm0g
KE1UNzk4OCksIFNQSSBkcml2ZXIgaXMgZHJpdmVycy9zcGkvc3BpLW10NjV4eC5jLgo+ID4+PiBB
bmQgSSBsaW1pdCBNVEtfU1BJX0lQTV9QQUNLRVRfU0laRSB0byBTWl8xSyB0byBzaW11bGF0ZSBs
aWdodHdlaWdodCBTUEkKPiA+Pj4gY29udHJvbGxlciB3aGljaCBjYW4gb25seSB0cmFuc21pdCAx
MDI0IGJ5dGVzLgo+ID4+Pgo+ID4+PiBUaGUgdGVzdCBzdGVwIGlzIHRoZSBmb2xsb3dpbmc6Cj4g
Pj4+IC0gbXRkIGVyYXNlIC9kZXYvbXRkMgo+ID4+PiAtIGRkIGlmPS9kZXYvemVybyBicz0yMDQ4
IGNvdW50PTEgfCB0ciAnXDAnICdceEE1JyA+IG91dHB1dC5iaW4KPiA+Pj4gLSBtdGQgd3JpdGUg
b3V0cHV0LmJpbiAvZGV2L210ZDIKPiA+Pj4KPiA+Pj4gQmVmb3JlIGFwcGx5aW5nIHRoaXMgcGF0
Y2gsIHdyaXRlIG9wZXJhdGlvbiB1c2VzIG9ubHkgMzRIKHVwZGF0ZV9jYWNoZSk6Cj4gPj4+IFs3
OC45Mzc3MjBdIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFsOiAweDAsIGRhdGEgbmJ5dGVzOiAxMDIw
LCBkYXRhIDFzdCBieXRlOiAweGE1Cj4gPj4+IFs3OC45NDUyOTddIE9QIGNvZGU6IDB4MzQsIGFk
ZHIgdmFsOiAweDNmYywgZGF0YSBuYnl0ZXM6IDEwMjAsIGRhdGEgMXN0IGJ5dGU6IDB4YTUKPiA+
Pj4gWzc4Ljk1NDI1MV0gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4N2Y4LCBkYXRhIG5ieXRl
czogNzIsIGRhdGEgMXN0IGJ5dGU6IDB4YTUKPiA+Pj4gWzc4Ljk2Mjk2Nl0gT1AgY29kZTogMHgx
MCwgYWRkciB2YWw6IDB4MzAwCj4gPj4+IFs3OC45Njg4MTZdIE9QIGNvZGU6IDB4MzQsIGFkZHIg
dmFsOiAweDAsIGRhdGEgbmJ5dGVzOiAxMDIwLCBkYXRhIDFzdCBieXRlOiAweGZmCj4gPj4+IFs3
OC45NzcyMzNdIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFsOiAweDNmYywgZGF0YSBuYnl0ZXM6IDEw
MjAsIGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPiA+Pj4gWzc4Ljk4NTEyNF0gT1AgY29kZTogMHgzNCwg
YWRkciB2YWw6IDB4N2Y4LCBkYXRhIG5ieXRlczogNzIsIGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPiA+
Pj4gWzc4Ljk5MjUyN10gT1AgY29kZTogMHgxMCwgYWRkciB2YWw6IDB4MzAxCj4gPj4+IFs3OC45
OTY5ODFdIE9QIGNvZGU6IDB4MzQsIGFkZHIgdmFsOiAweDAsIGRhdGEgbmJ5dGVzOiAxMDIwLCBk
YXRhIDFzdCBieXRlOiAweGZmCj4gPj4+IFs3OS4wMDQ0MTZdIE9QIGNvZGU6IDB4MzQsIGFkZHIg
dmFsOiAweDNmYywgZGF0YSBuYnl0ZXM6IDEwMjAsIGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPiA+Pj4g
Wzc5LjAxMjAzMV0gT1AgY29kZTogMHgzNCwgYWRkciB2YWw6IDB4N2Y4LCBkYXRhIG5ieXRlczog
NzIsIGRhdGEgMXN0IGJ5dGU6IDB4ZmYKPiA+Pj4gWzc5LjAxOTQzNV0gT1AgY29kZTogMHgxMCwg
YWRkciB2YWw6IDB4MzAyCj4gPj4gSSBhbSBzb3JyeSBidXQgYWJvdmUgeW91IHNhaWQgdGhhdCB3
ZSBzaG91bGQgbm90IHBlcmZvcm06Cj4gPj4gICAgICAweDMyLCAweDMyLCAweDMyLi4uCj4gPj4g
YmVjYXVzZSB0aGUgc2Vjb25kIHRpbWUgaXQgd291bGQgY2xlYXIgdGhlIGNhY2hlIGFnYWluLiBB
bmQgaGVyZQo+ID4+IHlvdSB0ZWxsIHVzIHRoYXQgYWN0dWFsbHkgdGhlIGNvcmUgYWxyZWFkeSBo
YW5kbGVzIHRoYXQgYnkgcGVyZm9ybWluZwo+ID4+IGluc3RlYWQ6Cj4gPj4gICAgICAweDM0LCAw
eDM0LCAweDM0Li4uCj4gPj4gU28gd2hhdCBpcyB0aGUgcHJvYmxlbT8KPiA+PiBPciBtYXliZSBJ
IG1pc3VuZGVyc3Rvb2QgdGhlIGlzc3VlLCBidXQgSSB0aGluayBDaHVhbmhvbmcgcmFpc2VkIGFu
Cj4gPj4gaXNzdWUgdGhhdCBpcyBhbHJlYWR5IHNvbHZlZD8gSXNuJ3QgaXQ/Cj4gPj4KPiA+Cj4g
PiBUaGUgaXNzdWUgaXMgdGhhdCB0aGUgRk9SRVNFRSBOQU5EcyByZXF1aXJlIHRoZSBmaXJzdCBj
YWNoZSB3cml0aW5nCj4gPiBpbnN0cnVjdGlvbiB0byBiZSBXUklURV9DQUNIRSBpbnN0ZWFkIG9m
IFVQREFURV9DQUNIRS4gaS5lLiBpdCBuZWVkcyBhCj4gPiBjb21tYW5kIHNlcXVlbmNlIG9mOgo+
ID4gICAgIDB4MzIsIDB4MzQsIDB4MzQsIDB4MzQuLi4KPgo+IFNvIEZvcmVzZWUgTkFORHMgZG8g
bm90IHN1cHBvcnQgdXBkYXRlX2NhY2hlLCB3aHkgYXJlIHRoZXkgYWR2ZXJ0aXNlZCBpbgo+IHRo
ZSBmaXJzdCBwbGFjZT8gQ291bGQgeW91IHdlIGhhdmUgYSBsZXNzIGltcGFjdGluZyBzb2x1dGlv
biBmb3IgdGhlCj4gb3RoZXIgTkFORHM/Cj4KPiA+IFRoaXMgcGF0Y2ggZG9lcyBleGFjdGx5IHRo
YXQsIG1ha2luZyB0aGUgZmlyc3QgaW5zdHJ1Y3Rpb24gaXNzdWVkIDB4MzIuCj4gPiBJdCBzaG91
bGQgYmUgYXBwbGllZCB0byBmaXggdGhlIGlzc3VlIGFib3ZlLgo+Cj4gTXkgdW5kZXJzdGFuZGlu
ZyBpcyB0aGF0IHRoaXMgaXMgdmVyeSBzcGVjaWZpYyB0byBGT1JFU0VFIE5BTkRzIGFuZCB5b3UK
PiBhcmUgY2hhbmdpbmcgdGhpcyBmb3IgYWxsIE5BTkRzLiBJIGhhdmUgZmVhcnMgdGhhdCBpdCB3
aWxsIGJyZWFrCj4gZXZlcnl3aGVyZSBlbHNlLgoKSSBqdXN0IGNoZWNrZWQgYSBmZXcgZGF0YXNo
ZWV0cyBvZiBTUEktTkFORHMgZnJvbQpUb3NoaWJhL1dpbmJvbmQvRXRyb24vRVNNVC9HaWdhRGV2
aWNlL01hY3Jvbml4LgpBbGwgb2YgdGhlbSBzcGVjaWZ5IHRoZSBwcm9ncmFtbWluZyBzZXF1ZW5j
ZSB0byBiZToKd3JpdGVfZW5hYmxlLT53cml0ZV9jYWNoZS0+dXBkYXRlX2NhY2hlIGlmIG5lZWRl
ZC0+CnByb2dyYW1fZXhlY3V0ZS0+cG9sbCBzdGF0dXMuClNvbWUgb2YgdGhlbSBtZW50aW9ucyB0
aGF0IHRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB3cml0ZV9jYWNoZQphbmQgdXBkYXRlX2Nh
Y2hlIGlzIHdoZXRoZXIgdGhlIHBhZ2UgY2FjaGUgaXMgY2xlYXJlZCBiZWZvcmUKd3JpdGluZyAo
V2luYm9uZCksIHdoaWxlIG90aGVycyBkb24ndCBzcGVjaWZpY2FsbHkgc2F5IHRoYXQuCgpUaGUg
b3JpZ2luYWwgc2VxdWVuY2UgZG9lc24ndCBzZWVtIHRvIGJlIGZvbGxvd2luZyBhbnkgbWFudWZh
Y3R1cmVycycKaW5zdHJ1Y3Rpb25zLiBXZSBqdXN0IGhhdmVuJ3QgcnVuIGludG8gYW55IHByb2Js
ZW1zIHVudGlsIHRoaXMgRk9SRVNFRQpvbmUuCgo+Cj4gT3ZlcmFsbCBJIHVuZGVyc3RhbmQgdGhl
IHByb2JsZW0sIGJ1dCBJIGRpc2FncmVlIHdpdGggdGhlIGZpeC4gQ291bGQgeW91Cj4gcHJvcG9z
ZSBzb21ldGhpbmcgbGVzcyBpbXBhY3RpbmcgYXMgaGludGVkIGFib3ZlPwo+Cj4gVGhhbmtzIGFu
ZCBzb3JyeSBmb3IgdGhlIGRlbGF5Lgo+IE1pcXXDqGwKCi0tIApSZWdhcmRzLApDaHVhbmhvbmcg
R3VvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
