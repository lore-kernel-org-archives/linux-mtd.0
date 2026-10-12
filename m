Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED46CA9ED0
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2026 21:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Aa6ikgFpYQ8lNB8DwZdEGGUeceh6lN87Em26eFijOY=; b=KN6Nm2daVr0sNf
	2ZE/vpPRkoCzA6jFXAAP9/EZbzjQiCK9P6JZ54lLjImMeezQbLysEo3FQiF50q1hIaFx+zrbbJg3W
	7Du2iQKyeJPIWkDR6qp1OkTRrc2LQPoATrQG0Zxn0v4Tef8Ee+W479OwZ9nAQYRTB5KHWosJ01Ggu
	jdOonqjRsOCbgYLTpYukC9j3hTuBVIF5XzApK0JDcLVgCbLfoWKYj+84iegDG1hLknNWfp2o+P7vo
	OVjt258PC70wTHSOfnonzTA7b/YeBW2j7p22CT0ss2gIGrOciAI4+J5/WUpoaWvfz3DinnRov1Y1J
	Ct6ttGihEvYmpidrKbpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNoY-0000000BZYX-1go8;
	Mon, 12 Oct 2026 21:44:10 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNoV-0000000BZXm-158P
	for linux-mtd@lists.infradead.org;
	Mon, 12 Oct 2026 21:44:08 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so1288912241.3
        for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2026 14:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791841446; cv=none;
        d=google.com; s=arc-20260327;
        b=pKDO5qUpkOZ8Zylm3vmWylNCiCA6Jq9f7vGienYtpyxh3IKGUCyx4tf5A9+Il98YhH
         QvVm+4T/qZdsSBwun8S2NsQXfJ5XNkELqyKlrorMtp7DRiW50HGZQryTHAst/O4EZKPd
         WZdqD3ktUwIGdAGj4P0Obvn1EFwvrZGvhn/EpfCR1L3kW+QGqhq1ZCe7wfl2CEsVdtSv
         9NvJCzUOOpzrFpzrn9cQoAIQ2ufI505XpPSoHRHcnWyjHn7jc23jywRYOC+ZawxAewwz
         8ITf2u/tCmAKO0xrE4xVNkLZTEFWO2j2ScOyjYlwtqL0XeQvipT8l/7I/xGwnZ8F4Cke
         Lt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        fh=vxSSY1wr3t30SD0DDURbgHbnz+THP52Vh18rXfF2Ip8=;
        b=E1bfdcW2pSBEhdS4UnEFYlR5rZrYF2On26mJHUA8YIr4Lt3uT/AspLR22hzt8aehKH
         g6P24TDBEzRF65cLo5Rhlnu7Sg/1ksvF3/TbWKPnk7lP1d0nXTeeaqPk4ZAnpd9NC+ex
         Pw0bQkwHmI+s3ELrd1pgkS3OY7yj3WJ+E8QbLtd56rI7psLbzVB1i9BxiPFcTOAfJW2G
         Xt1mpqTn9mX8iwoy8C4y2Gq7Blx4xEWxFA5qIzXOt7NcOWiEimImFptz6CuKPS6deIy3
         LJ62Rs7OTY3TdvIlQS0ClmYqhq6CAbYlM/zWtinQZ5f32DhWKwhPeXCZworSNnmCuiJz
         LWXA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841446; x=1792446246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=A56WKw+xK2LnMkcL7VfBfKHtnm39Y/UlvZuOCOaGU91nObMDEG1WemgpsSVf0Irzdz
         QYMdFAHp58nOfpd7K13b63lapXER3rIdRxEeGJaHhnnmL5/sT8RdOOpU5astochVhkRC
         7MGbsmj5XM0gQEe3vZoLxoaOMhvht8KdCQsIvgLSA6wqs1lCrPDOV1Z0XcfQSzUu/2dL
         kTGQ/qDmJ4gjmE6HOx5L0m+8DVg7SF7ex00c3Yn8Gu2REnBTBTnz7eSWN4vlvDrB7cXQ
         KCyGksE48Sa0cFYbTxCkXNtsrwFh2MknRoCSMvhe8Qn2meNGl8mWc8CzHYbazy52mhz+
         m5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841446; x=1792446246;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IgcW+mBezfmaVemco2WC7GasvmmjoylpddtvtSsj0OQ=;
        b=i/atDxIZraioqHChMvF20b/toP2ZMzv5NM0FAba7ZCd9VgGfXI2SzjNl36WWqqBudC
         iGQNPa9PMr0uD4XpM8AepoqNXQ72v6K0PM9NMSlcEK4KeVD4iMecIQQmWo/FEJcec3su
         qDUBTDoNP7MPnGYtzkEpOpeQgSecMWtuZTpNH1Pq/1+VphSneDlA/mHXQK5J4MhS9ZtV
         9e2F22zflgwk855JlxK9K6U98DDT0itb/+sfkv9vKO2SvDn7IPX9O/DbJ+w+uf/LtWB1
         m34800B5VKVOt4Pi/0tdI3Z/x2JrNcsieP4sMbW9lyjNDfk4VhGQASLAVx9GETyYx0IU
         Tusw==
X-Forwarded-Encrypted: i=1; AKwUvByKTNdeR2aqLFqAJL5m6oF9yJntrbUbrW8hUSwYHWzN3MXVDYAZtS3q9y4eXhxbxKIQaDq9hQYmkFQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYJK049CTK2DT8xTi4NOTVpG7sONmamVXHXD+N5B7zP3YLIzQrCJ
	fSOiPT4w2c6UG0nyj/CZaneA3MJQJIY08wvHL4NaG9+6DcqLgf+kErbEY7HH7Ay5yxVtK5Iy8hZ
	LMUd+HGhOSKsD+L7zIgvSXFo0fl5yIBE=
X-Gm-Gg: AYBFou0xSadgt7KrH6FHtvLhyTyY5w9voJ299X4Ta84A9I/5dJtbq7m7PYuMqvIxbu+
	/UWKGK6SrK0vpFi2wcoUtRGBzqM4IT8RyKyhWeFBP+28ebfGYMt/AFjQvgv+VjWpkmKGcBHxRSr
	o7f4PgZr/H4P0PAgHUDf5q+ejvdw/udnOVUxm/yU58k9seAKeSs1regyXdPshy6wzOryX9bqoYP
	hODXc9I5zzsnScwPbb6QdLKx7rKOI7h+poOfRBzQyRHkk9eZU1co1UWsAYdToy5Gt2iyn20xWgL
	Ug3rHL9uhHAOBs8w25hAzmWIjn6tk9idCgcNLE+Fql5RAPY6psobnGukDlDiWUoPH+W+qgldTpI
	EUcKjDNLz3fSwMS1Ob+eqAE7FG37PWPmtymJiILN2z3ZI9KS5HNQE1WuRuRBWpIZ9jebKMJB/Kt
	L/VvyIRoeOZEBEh6FkVk9HyZ7yiV0d+PSJdIG9R6bVdXlGt/GkgHW0Q0Y=
X-Received: by 2002:a05:6102:5814:b0:79e:2b00:b4da with SMTP id
 ada2fe7eead31-7cb3a0059admr2967326137.6.1791841445569; Mon, 12 Oct 2026
 14:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-1-2fb084fe0751@gmail.com>
 <8733ua23xs.fsf@bootlin.com> <CADvTj4pmtGZ4c04q+5AE3trrfshToD7BPtF-8kPxPRZ25hOTRw@mail.gmail.com>
 <877bjmzqkr.fsf@bootlin.com> <CADvTj4ppQannShF+dkLreST94g_vSAg4QdMqxhNORzkvci3O1A@mail.gmail.com>
 <87pkxey725.fsf@bootlin.com>
In-Reply-To: <87pkxey725.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 12 Oct 2026 15:43:54 -0600
X-Gm-Features: AclHuK9S8X-EJbG6Jz0l1nDWbI3paRApUkydjtgW5vHKMROEOTWMTqhZBvuvO68
Message-ID: <CADvTj4p-o=EQMq-6E1q2=NOmQbscAVGMUbwX+Wh4R0v5kbXe_w@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] mtd: rawnand: sunxi: drain interrupts before
 reusing the completion
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_144407_312229_B828DB87 
X-CRM114-Status: GOOD (  30.40  )
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgMjo1M+KAr1BNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4KPiA+PiA+PiBjb21taXQgbG9nLCBJIG5vdyBk
aXNhZ3JlZSB3aXRoIHRoZSBmaXJzdCBwYXJ0IG9mOgo+ID4+ID4+Cj4gPj4gPj4gPlRoZSBvbGQg
aGFuZGxlciBjYW4gYWxzbyBjb21wbGV0ZSB0aGUgbmV3IHdhaXQgb3IgcmVzdG9yZSBhbiBvYnNv
bGV0ZSBpbnRlcnJ1cHQgbWFzay4KPiA+PiA+Pgo+ID4+ID4+ICJjb21wbGV0ZSB0aGUgbmV3IHdh
aXQiPyBJIGRvbid0IHNlZSBob3cgYSBzdGFsZSBoYW5kbGVyIGNvbXBsZXRlcyB0aGUKPiA+PiA+
PiBuZXh0IHdhaXQgZ2l2ZW4gdGhlIGhhbmRsZXIgaXMgYSBoYXJkIElSUSBhbmQgdGhlIGludGVy
cnVwdCBlbmFibGUKPiA+PiA+PiByZWdpc3RlciBpcyBjbGVhcmVkIG9uIHRpbWVvdXQuCj4gPj4g
Pgo+ID4+ID4gVGhlIGNhc2UgSSBoYWQgaW4gbWluZCBpcyBhbiBhbHJlYWR5LXJ1bm5pbmcgaGFu
ZGxlciBvbiBhbm90aGVyIENQVToKPiA+PiA+Cj4gPj4gPiBDUFUgMDogUmVhZCBzdCBhbmQgaWVu
IGZvciBvcGVyYXRpb24gQS4KPiA+PiA+IENQVSAxOiBUaW1lIG91dCBvcGVyYXRpb24gQSwgbWFz
ay9hY2tub3dsZWRnZSBpdHMgaW50ZXJydXB0cywKPiA+PiA+ICAgICAgICB0aGVuIGV2ZW50dWFs
bHkgcmVpbml0aWFsaXplIHRoZSBjb21wbGV0aW9uIGZvciBvcGVyYXRpb24gQi4KPiA+PiA+IENQ
VSAwOiBDYWxsIGNvbXBsZXRlKCkgYmFzZWQgb24gdGhlIHNhdmVkIHN0IGFuZCBpZW4gZnJvbSBv
cGVyYXRpb24gQS4KPiA+Pgo+ID4+IEZvciB0aGlzIHRvIGZpcmUsIHRoZSBoYXJkIElSUSBoYW5k
bGVyIG9uIENQVTAgd291bGQgaGF2ZSB0byBiZSBzdG9wcGVkCj4gPj4gYmV0d2VlbiByZWFkaW5n
IHN0L2llbiBhbmQgY2FsbGluZyBjb21wbGV0ZSgpIGxvbmcgZW5vdWdoIHRvIHNwYW46Cj4gPj4g
LSBBJ3MgdGltZW91dAo+ID4+IC0gQSdzIGNsZWFudXAKPiA+PiAtIEIncyB3YWl0IGJlaW5nIHJl
YXJtZWQKPiA+PiBPbiB0aGlzIGhhcmR3YXJlLCBob3cgaXMgdGhpcyByZWFjaGFibGU/Cj4gPgo+
ID4gQ09ORklHX1BSRUVNUFRfUlQgcHJvdmlkZXMgYSBjb25jcmV0ZSBtZWNoYW5pc20uIFRoZSBk
cml2ZXIgcmVxdWVzdHMgdGhpcwo+ID4gSVJRIHdpdGggZmxhZ3MgPSAwLCB3aXRob3V0IElSUUZf
Tk9fVEhSRUFELCBzbyB0aGUgaGFuZGxlciBpcwo+ID4gZm9yY2VkLXRocmVhZGVkLiBBIGhpZ2hl
ci1wcmlvcml0eSB0YXNrIGNhbiBwcmVlbXB0IHRoYXQgSVJRIHRocmVhZAo+ID4gYWZ0ZXIgaXQg
cmVhZHMgc3QvaWVuOgo+Cj4gVGhhdCBhcmd1bWVudCBvbmx5IGFwcGVhcnMgaW4gdGhpcyByZXBs
eS4gSXQgaXMgbm90IGluIHRoZSBjb21taXQgbG9nCj4gbm9yIGluIHRoZSBkaWZmLCBib3RoIG9m
IHdoaWNoIHJlYXNvbiBhYm91dCBhIGhhcmQgSVJRLCBubz8gSSdsbCBoYXBwaWx5Cj4gdGFrZSB0
aGUgUFJFRU1QVF9SVCBjYXNlIGludG8gYWNjb3VudDogaW4gdGhhdCBjb25maWd1cmF0aW9uIHRo
ZSBjYXNlIGlzCj4gcmVhY2hhYmxlLCBidXQgaXQgcmVhZHMgYXMgYSBqdXN0aWZpY2F0aW9uIGFk
ZGVkIGFmdGVyIHRoZSBmYWN0LgoKWWVzLCBQUkVFTVBUX1JUIHdhcyBhIGxhdGVyIGNvbmNyZXRl
IGV4cGxhbmF0aW9uIG9mIGhvdyB0aGUgcmFjZQpjb3VsZCBvY2N1ci4gSSBzaG91bGQgaGF2ZSBt
YWRlIHRoYXQgZGlzdGluY3Rpb24gZXhwbGljaXQuCgpUaGUgb3JpZ2luYWwgcmF0aW9uYWxlIGZv
ciBkaXNhYmxlX2lycSgpIHdhcyB0byBlc3RhYmxpc2ggYSBjbGVhcgpib3VuZGFyeSBiZXR3ZWVu
IHRoZSBvbGQgaGFuZGxlciBhbmQgdGltZW91dCBjbGVhbnVwLgoKU2ltcGx5IG1hc2tpbmcgdGhl
IGNvbnRyb2xsZXIgaW50ZXJydXB0cyBkb2VzIG5vdCBzdG9wIGFuIGFscmVhZHkKcnVubmluZyBo
YW5kbGVyLiBBIHBhcnRpYWwtZXZlbnQgaGFuZGxlciBjYW4gc3Vic2VxdWVudGx5IHJlc3RvcmUK
YW4gb2Jzb2xldGUgcmVtYWluaW5nLWV2ZW50IG1hc2suIEEgaGFuZGxlciB3aG9zZSBzYXZlZCBz
dGF0dXMKc2F0aXNmaWVzIHRoZSB3YWl0IGNhbiBpbnN0ZWFkIHNpZ25hbCB0aGUgY29tcGxldGlv
biBhZnRlciB0aGUKd2FpdGVyIGhhcyBtb3ZlZCBvbi4KCmRpc2FibGVfaXJxKCkgcHJldmVudHMg
ZnVydGhlciBJUlEgZGlzcGF0Y2ggYW5kIHdhaXRzIGZvciBleGlzdGluZwpoYW5kbGluZyB0byBm
aW5pc2guIENsZWFudXAgY2FuIHRoZW4gbWFzayBhbmQgYWNrbm93bGVkZ2UgdGhlIGNvbnRyb2xs
ZXIKZXZlbnRzIHdpdGhvdXQgdGhlIG9sZCBoYW5kbGVyIG1vZGlmeWluZyB0aGF0IHN0YXRlIGFm
dGVyd2FyZHMuIFRoZQpyZWdpc3RlciByZWFkYmFjayBmbHVzaGVzIHRob3NlIHdyaXRlcyBiZWZv
cmUgcmUtZW5hYmxpbmcgdGhlIElSUS4KClRoaXMgYWxzbyBrZWVwcyB0aGUgYWRkaXRpb25hbCBz
eW5jaHJvbml6YXRpb24gb24gdGhlIHRpbWVvdXQgcGF0aCwKd2l0aG91dCBpbnRyb2R1Y2luZyBh
IGRyaXZlciBsb2NrIGludG8gZXZlcnkgc3VjY2Vzc2Z1bCBpbnRlcnJ1cHQgYW5kCndhaXQgc2V0
dXAuIFRoZSBjaGVja3MgYXQgdGhlIHRpbWUgZXN0YWJsaXNoZWQgdGhhdCB0aGUgY2FsbGVyIGNv
dWxkCnNsZWVwLCB0aGUgaGFuZGxlciBkaWQgbm90IHJlcXVpcmUgdGhlIE5BTkQgY29udHJvbGxl
ciBtdXRleCBoZWxkIGJ5CnRoZSBjYWxsZXIsIGFuZCB0aGUgSVJRIHdhcyBub3QgcmVnaXN0ZXJl
ZCBhcyBzaGFyZWQuCgpTYXNoaWtvJ3MgcmVwb3J0WzBdIHdhcyB0aGUgc3RhcnRpbmcgcG9pbnQg
YW5kIG1lbnRpb25lZCBib3RoCnN5bmNocm9uaXplX2lycSgpIGFuZCBkaXNhYmxlX2lycSgpLiBU
aGUgb3JkZXJpbmcgYWJvdmUgd2FzIHRoZQpyZWFzb25pbmcgZm9yIHRoZSBpbXBsZW1lbnRhdGlv
biwgcmF0aGVyIHRoYW4gdGhlIHN1Z2dlc3Rpb24gYWxvbmUuCkl0IHdhcyBub3QgYmFzZWQgb24g
YW4gUlQgcHJpb3JpdHktaW5oZXJpdGFuY2UgYW5hbHlzaXMgb3IgYSBtZWFzdXJlZApwZXJmb3Jt
YW5jZSBjb21wYXJpc29uIHdpdGggYSBzcGlubG9jay4KClswXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MDkwODU0MzQuQzhGMjAxRjAwQTNBQHNtdHAua2VybmVsLm9yZy8KCj4g
VGhlbiwgSSdtIGN1cmlvdXMgdG8ga25vdyBob3cgdGhlIEFJIGp1c3RpZmllcyB0aGUgdXNlIG9m
IGRpc2FibGVfaXJxKCkKPiBhcyB0aGUgUlQtYXBwcm9wcmlhdGUgY2hvaWNlOiBkb2Vzbid0IGl0
IGJsb2NrIHdpdGhvdXQgYSB0aW1lb3V0IG9uIHRoZQo+IHZlcnkgSVJRIHRocmVhZCB0aGUgc2Nl
bmFyaW8gcmVsaWVzIG9uIGJlaW5nIHN0YXJ2ZWQgKGFuZCBnaXZlcyBubwo+IHByaW9yaXR5IGlu
aGVyaXRhbmNlKT8KClllcywgaXQgd2FpdHMgd2l0aG91dCBhIHRpbWVvdXQgYW5kIGRvZXMgbm90
IHByb3ZpZGUgcHJpb3JpdHkKaW5oZXJpdGFuY2UuIEkgd291bGQgbm90IHByZXNlbnQgaXQgYXMg
dGhlIGJldHRlciBjaG9pY2UgZm9yIGJvdW5kZWQKUlQgcmVjb3ZlcnkgbGF0ZW5jeS4KCkEgc3Bp
bmxvY2tfdC1iYXNlZCBpbXBsZW1lbnRhdGlvbiBjYW4gcHJvdmlkZSBwcmlvcml0eSBpbmhlcml0
YW5jZSBvbgpSVCwgcHJvdmlkZWQgdGhlIGhhbmRsZXIgaG9sZHMgaXQgZnJvbSB0aGUgc3RhdHVz
L2VuYWJsZSByZWFkcyB0aHJvdWdoCnRoZSByZWdpc3RlciB1cGRhdGVzIGFuZCBjb21wbGV0ZSgp
LCB3aXRoIGNvcnJlc3BvbmRpbmcgcHJvdGVjdGlvbiBpbgp0aGUgd2FpdGVyLiBUaGF0IGltcHJv
dmVzIHJlY292ZXJ5IHVuZGVyIHByaW9yaXR5IGludmVyc2lvbiwgYnV0IGFkZHMKbG9ja2luZyB0
byBub3JtYWwgaW50ZXJydXB0IGhhbmRsaW5nIGFuZCB3YWl0IHNldHVwL2NsZWFudXAuCgpUaGVy
ZSBpcyBhIHJlYWwgbGltaXRhdGlvbjogaWYgdGhlIElSUSB0aHJlYWQgcmVtYWlucyBzdGFydmVk
LCByZWNvdmVyeQpjYW5ub3QgZmluaXNoLCBhbmQgb3RoZXIgTkFORCBvcGVyYXRpb25zIGNhbiBy
ZW1haW4gYmxvY2tlZCBiZWhpbmQgdGhlCmNvbnRyb2xsZXIgbG9jay4gU28gdGhlIG9wZXJhdGlv
biB0aW1lb3V0IGRvZXMgbm90IGJvdW5kIHRoZSBlbnRpcmUKY2xlYW51cC4gVGhlIGFyZ3VtZW50
IGZvciB0aGlzIGltcGxlbWVudGF0aW9uIGlzIHRoZSBzdHJhaWdodGZvcndhcmQKaGFuZGxlci1s
aWZldGltZSBib3VuZGFyeSBhbmQgYWJzZW5jZSBvZiBhZGRpdGlvbmFsIG5vcm1hbC1wYXRoCmxv
Y2tpbmcsIG5vdCB0aGF0IGVycm9yLXBhdGggbGF0ZW5jeSBjYW4gbmV2ZXIgbWF0dGVyLgoKPgo+
IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
