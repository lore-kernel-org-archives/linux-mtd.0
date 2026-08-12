Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9162C5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 04:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NJcag2sk4wbc51gbLXk/vxZjtZUm51x2TU1d1Ru7AtY=; b=3RJeFMKXHDWM0p
	QkhHPuEnBiP4Uo9MIfQ2NMc8soCAMBaWGcjzwyqslnbz8i+a7mdUoEO3/TtrYtsIACUIHa09Kj3Uu
	99wcg4EQ8lODLD+Jo5w0NsAs4a7EOUsshuBKXWZnwqksif1BJoS2YIr7+s+xm4Gc8G1Y04Jf9I1ps
	MheE1WWUhBqMY2qsZmdnRhEX1e+k1bAwV2i76g1u+eKCjNvRMu/KgDOFjk8WZsi4pp/dd2urjnf6n
	l7FgW03zr3Syagh2pwojpQvvoCQk1UBIRDpheXRo7XWBBzif8SqCaa0fCZ/TIdMc5bMwjBPsrz01z
	uSVRiY9t24L1sL878N6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0M6-0000000FOKw-0C7M;
	Wed, 12 Aug 2026 04:14:18 +0000
Received: from gw2.atmark-techno.com ([35.74.137.57])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu0M2-0000000FOKM-2XFu
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 04:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1786508050;
	bh=0ac+9ChYOT63TLmJE7muZgICUT8deNIQ8Yn5SX6y4Xw=;
	h=From:Date:Subject:To:Cc:From;
	b=EuTv3tEggJJcj6gI6JQItK68beIgS+LEgrIxf0WiSuGKIvSZM5xC8pLl2Jni2lvps
	 zmyjR4JooMIZm4hVYBSSGh8jPtzcSb+p2CL8wSLklEnR82Fn3XSkPUhfG+r/tCtjkA
	 XkkgHYZ/9jSXUBGw2UeACAuFrDJcdA2fAxzu1eJzu5bVjkadOE11BHR1/l2gV7ykvV
	 se9KgVnyRaSns1RQtZ50QIThHaYiFRVXJXwFW7RP1TZxbUz+T55BjcpSmD8V1gemXr
	 kBACRgN3RQji3AecpgvntC2t0r/ud/ufxoN/SGb9MgVW4/EFXvZ2mlThhKDrB/aXLc
	 1XwYrScOXOIig==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id A7704444
	for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 13:14:10 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=XJ3TBKi+;
	dkim-atps=neutral
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 71D2D444
	for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 13:14:09 +0900 (JST)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so4539665ad.0
        for <linux-mtd@lists.infradead.org>; Tue, 11 Aug 2026 21:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1786508049; x=1787112849; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bVLNluNzT3CgQnEwDzhoLkRU7QTo/hyjSTd200GccGo=;
        b=XJ3TBKi+VnZ2Vi0hDv9E23jjl2V8x92tk1if3g4Y5DQUFJ7zZbhlH8D9JxzeznpnYG
         3tFpHIlhltsVJ5YX2ltLAR5vX4fMh1/7TDGQuo50HI2GdqiJ5/iixgoviBBpJPd1vCh9
         upXwLq8vnBk26TIxdsxVhh2UtG4DrO9pFa8aMB3awVOqP0VVQR23f2N5CQbDfnx28uQN
         2XuH3v3haKytgzFNAewB693B5uGq9jPAMtQ09XuplzppunMxgyBZcji0SEqfXG6uJUF4
         9rPyuk4ldfivY2ts9I/LJp1VzsOpk5r57sewZ8J8Lqt27d46expwAYrPKKUtfTMS2DRv
         CKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786508049; x=1787112849;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bVLNluNzT3CgQnEwDzhoLkRU7QTo/hyjSTd200GccGo=;
        b=mBLp4ROoC3ldmMx6waPHiJXrjkTUg8O0BmfDYJixUh76fJBlHwTCUZ6AQJNsHvgBou
         L0REVKaDC8lQTgRI9hdJsgBktahOJs8YUIOWkK6ok455KsZMhQvOUD9D9mZ1u/DX+ONh
         CUvjf+Wra7AW9INFN/mbXxxDql+9MHcEhRB+rNwcmFKwR32ruj1DWyJfjzHyg104Y+c8
         fdSVaPMrXZ4IvyeHUlo7GuAenbdgUoWuJRH47k/RgiQfzc2K2Y3MaTBUNnfTyPV/+hse
         NCuTMzJF/askeljY+DCBTx7uf5pjrKAEhJTT/LK4xemDTwn6RdW/B5wCBIZdFHSO4gm3
         axhQ==
X-Gm-Message-State: AOJu0YypCpFVm8axzbptnT8v6WB9Q6Rrwx6TXplXBQbSFDJncZCV99P5
	Zbpn1m+x7rIzk8O6v6Nd0eZRYL3TeSxUGvgHdSiwA2TdN0UgKBvYS+/Cg7krmNlxjSe0zY7/PFU
	kCis9HypBOFlvODYBw9S6M0YGAPbvxXxYg1DIizv8DuiuEo6bLbtOe1jHoWkUsZJKKEsXeJEhCT
	/f
X-Gm-Gg: AR+sD10GX/VlhIKSeAKIMp3cQ2xvOaId8P54L9Oh1KEInl/qJ+tszikoswP4JcO7syY
	8NOF8tG3bmGu3R65EEAjYfGXZhO3p5H0cNm7dhXbnYTIpqod26MIoLdqWNNtl3GD0kHdvx866R3
	PxgjlXfkqLsdLiPbRIbn6mNEPlwIVBRQOwwrexqipXI7h2u8Bp1VDcBkSHX/+2JweqsDMWAEeUc
	RAGpr47ccg7CFWRph1h8J2eMkeARizH5TtGI+uRboJvCpwmpD/l2QFPf12FqmcPPfPCCgkgFQFF
	lENlMKNBeGpyLl01075BgpX/o2fDB9y8N9OinNITKJQ8QMOnvLXwNnWrTl40KPduvyNaq78m5Oe
	3+jcfj2MUcRo6ZitcTXI/HdavRHfi35Vnb94Zh1N4dmh6pK0a
X-Received: by 2002:a17:902:fda3:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d345359e86mr30818755ad.1.1786508048711;
        Tue, 11 Aug 2026 21:14:08 -0700 (PDT)
X-Received: by 2002:a17:902:fda3:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2d345359e86mr30818235ad.1.1786508048208;
        Tue, 11 Aug 2026 21:14:08 -0700 (PDT)
Received: from localhost (sodcd-04p2-40.ppp11.odn.ad.jp. [203.139.65.40])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d350fb0cd0sm990655ad.4.2026.08.11.21.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 21:14:07 -0700 (PDT)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Wed, 12 Aug 2026 04:14:02 +0000
Subject: [PATCH RFC v2] mtd: spinand: winbond: add support for W25N04LW
MIME-Version: 1.0
Message-Id: <20260812-w25n04lw-v2-1-deee97602fc4@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAAnze2oC/yWNSwuCQBhF/4p82xoZRxNrFRQtCoKCFhEuRh1zY
 h414yMR/3ujbS6cy+HeASwznFnYeAMY1nLLtXJAlh7kFVVPhnjhGAgmMU4CgjqyUjgSHQrZOoj
 iIgkjXILT34aV/DtPPeB62EH6L22TvVheTyOTVnFba9PPh20wy1TZ+02fT8d+f1nEJdlWDZIFF
 VSiTBj/01CRayl9F5CO4/gDvSGlXbUAAAA=
X-Change-ID: 20260812-w25n04lw-3e9146d8340f
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daisuke Mizobuchi <mizo@atmark-techno.com>, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.16-dev-a9e92
X-Developer-Signature: v=1; a=openpgp-sha256; l=6435;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=0ac+9ChYOT63TLmJE7muZgICUT8deNIQ8Yn5SX6y4Xw=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBqe/MO3uG/4R7lc8o4s5xMilJwZEZPO3d/x24Xf
 bUZJRwoSYeJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCanvzDgAKCRDyimB/1oxx
 B+7BD/9lRSSTHY2nEK+x8f5sf1BWpDbFadodXwVg2/h4dQG/qrmo+aaSc5UGuwfgxihFU50fA9n
 qXjUx2OmFv6BBybxHMe55mcVPtAnYmUV17Z3Izq3mQYDDTHnpbObgoiWpbTX9ZjxqaUwfENvAWt
 DqD0U9/FJkN96q7SQNUfBEJv6mwrp1RG0xPHvHtMvX7Pmjz+XaRfJ4NvsU3rmwViv9JW6rhy0WV
 7oBSZmUofgZksIPnq/Z8TxsuS1pfMEcTWchhGqZOjknY5khn230WnvmvWcemHIdZEpsVOAquWCe
 tghliUcRzUJ5DjxhotcP7H4FMW8vbuI1sxWMCbpouO8TG3Q1N4DLDKsxKzZWLKMxd64iTIVf35+
 iXg5GtT8pmIrhJtl3wJcHnlmLOEQQgx9Qd7RwjNETsa4OodpWFib03mBt4W/2MnecqxUnHiEAJL
 dFOYKrkoyslM+qGqk2Eeo77vs/ujrQ4GGxQr/BiGUOSbTn9sOVk+0luTj1xi22ozNo9IxNLjik6
 MzIyUJDPjJUdXDJ3IFMQZhyhukM3QYc8J1A1raBI4hb99T4PqPyhbUOfbQXOf1qe2cH/d+rSvr/
 G1ho8tknGnL0rjJOUBgp/hAF8k04MJv1IrQ85FY6Oc1/5r2XRGWsz7p2fPatB3U1KNswtfq2dXl
 WdoueJamHmGGP6A==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_211415_678538_A96BCEF8 
X-CRM114-Status: GOOD (  31.24  )
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

QWRkIHN1cHBvcnQgZm9yIFdpbmJvbmQgVzI1TjA0TFcgNEdiaXQgU1BJLU5BTkQ6Cj4gMS44ViA0
Ry1iaXQKPiBSYXcgc2VyaWFsIFNMQyBOQU5EIGZsYXNoIG1lbW9yeQo+IER1YWwvUXVhZCBTUEkg
d2l0aCAxMDRNSHoKPiBidWZmZXIgcmVhZCwgY29udGludW91cyByZWFkICYgc2VxdWVudGlhbCBy
ZWFkCgpIaWdobGlnaHRzIGNvcGllZCBmcm9tIGRhdGFzaGVldDoK4oCTIFBhZ2Ugc2l6ZTogNCwz
NTIgQnl0ZXMgKDQwOTYgKyAyNTYgQnl0ZXMpCuKAkyBCbG9jayBzaXplOiA2NCBwYWdlcyAoMjU2
SyArIDE2SyBCeXRlcykKLSBCdWlsdC1pbiA4LUJpdCBFQ0MgZm9yIG1lbW9yeSBhcnJheQrigJMg
RUNDIHN0YXR1cyBiaXRzIGluZGljYXRlIEVDQyByZXN1bHRzCuKAkyBCYWQgQmxvY2sgTWFuYWdl
bWVudCBhbmQgTFVUIGFjY2VzcwrigJMgU29mdHdhcmUgYW5kIEhhcmR3YXJlIFdyaXRlLVByb3Rl
Y3QK4oCTIFBvd2VyIFN1cHBseSBMb2NrLURvd24gYW5kIE9UUCBwcm90ZWN0aW9uCuKAkyBVbmlx
dWUgSUQgYW5kIFBhcmFtZXRlciBwYWdlCuKAkyBUZW4gNEtCIE9UUCBwYWdlcyBwZXIgZGllCuKA
kyBSZWFkIExldmVsIFNldHRpbmcgZm9yIFJlYWQgUmV0cnkKClRoZSA0MDk2KzI1NiBieXRlIHBh
Z2UgbGF5b3V0IGlzIGFzIGZvbGxvdzoKLSA0MDk2IGJ5dGVzIEVDQyBwcm90ZWN0ZWQgIm1haW4g
bWVtb3J5IGFycmF5Iiwgc3ViZGl2aWRlZCBpbiA4CiAgNTEyIGJ5dGVzIHNlY3RvcnMKLSAxMjgg
Ynl0ZXMgc3BhcmUgYXJyYXksIHN1YmRpdmlkZWQgaW4gOCAxNiBieXRlcyBzZWN0b3JzIGFzIGZv
bGxvdzoKICAtIDIgYnl0ZXMgYmFkIGJsb2NrIG1hcmtlciAobm8gRUNDIHByb3RlY3Rpb24pCiAg
LSAyIGJ5dGVzICJ1c2VyIGRhdGEgSUkiIChubyBFQ0MgcHJvdGVjdGlvbikKICAtIDEyIGJ5dGVz
ICJ1c2VyIGRhdGEgSSIgKEVDQyBwcm90ZWN0ZWQpCi0gMTI4IGJ5dGVzIHBhcml0eSBhcnJheSwg
c3ViZGl2aWRlZCBpbiA4IDE2IGJ5dGVzIHNlY3RvcnM6CiAgLSAxMyBieXRlcyBFQ0MgZm9yIG1h
aW4gZGF0YSBhbmQgdXNlciBkYXRhCiAgLSAzIHVudXNlZCBieXRlcwoKVGhpcyBjb21taXQgZG9l
cyBub3Qgc3VwcG9ydCBtb3N0IGFkdmFuY2VkIGZlYXR1cmVzIHN1Y2ggYXMgY29udGludW91cwpy
ZWFkLCBMVVQgbWFuYWdlbWVudCBhbmQgT1RQIHBhZ2VzLCBhbmQgb25seSBwcm92aWRlcyBiYXNp
YyB1c2FnZS4KCk9PQiBsYXlvdXQgd2FzIGRlZmluZWQgdG8gb25seSBzaG93IEVDQy1wcm90ZWN0
ZWQgInVzZXIgZGF0YSBJIiwgbGVhdmluZwoidXNlciBkYXRhIElJIiB1bmF2YWlsYWJsZS4KClNp
Z25lZC1vZmYtYnk6IERhaXN1a2UgTWl6b2J1Y2hpIDxtaXpvQGF0bWFyay10ZWNobm8uY29tPgpT
aWduZWQtb2ZmLWJ5OiBEb21pbmlxdWUgTWFydGluZXQgPGRvbWluaXF1ZS5tYXJ0aW5ldEBhdG1h
cmstdGVjaG5vLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0gTGluayB0byB2MTogaHR0cHM6Ly9w
YXRjaC5tc2dpZC5saW5rL2Fuc1lVb05LSnlEUSs2ZjJAaHUtbWRhbGFtLWJsci5xdWFsY29tbS5j
b20KLSBmaXhlZCBvb2IgbGF5b3V0Ci0gZml4ZWQgTkFORF9NRU1PUkcgb29iIHNpemUKCkkndmUg
dGVzdGVkIHRoZSBOQU5EIHdpdGggdmFyaW91cyBtdGQgdGVzdCB1dGlscyAobXRkX29vYnRlc3Qs
Cm10ZF9wYWdldGVzdCwgbXRkX3N1YnBhZ2V0ZXN0LCBtdGRfbmFuZGJpdGVycnMgYW5kIHNvbWUg
bXRkLXV0aWxzCnVzZXJzcGFjZSBjb3VudGVycGFydHMpIHdpdGggbm8gcHJvYmxlbSwgYnV0IEkn
bSBub3Qgc3VyZSB3aGF0IHRvIGRvCndpdGggdGhlIG9vYmxheW91dCBmcmVlKCkgaW5mb3JtYXRp
b25zOiBhcyB3cml0dGVuIGluIHRoZSBjb21taXQKbWVzc2FnZSwgdGhpcyBjaGlwIGhhcyAyKzEy
IGJ5dGVzIG9mIHVzZXIgZGF0YSBwZXIgc2VjdG9yIHdoZXJlIHRoZQpmaXJzdCB0d28gYXJlIG5v
dCBFQ0MgcHJvdGVjdGVkIGFuZCB0aGUgbGF0ZXIgMTIgYXJlLgoKSSBiZWxpZXZlIHVzZXIgc2hv
dWxkIG1ha2UgdGhlIGNob2ljZSBvZiB3aGljaCBvb2IgYnl0ZXMgdGhleSB3YW50IHRvCnVzZSwg
YnV0IGFmYWlrIHdlIGNhbid0IHNheSAidGhpcyBpcyBub3QgcHJvdGVjdGVkIiwgc28gd2UgY2Fu
J3QgbGV0CnRoZW0gY2hvb3NlIGFuZCBtdXN0IGVpdGhlciBzYXkgYm90aCBhcmUgZnJlZSBvciBv
bmx5IHByb3ZpZGUgb25lIGxpa2UgSQpkaWQgaGVyZS4KCkFzIGFuIGV4dHJhIGRhdGEgcG9pbnQs
IHRoaXMgInVzZXIgYXJlYSBJIGFuZCBJSSIgZGlzdGluY3Rpb24gaXMgdGhlIHNhbWUKaW4gVzI1
TjA0S1cgKHNhbWUgMisxMiksIGJ1dCB3MjVuMDJrdl9vb2JsYXlvdXRfZnJlZSgpIHVzZSB0aGVy
ZSByZXR1cm5zCnRoZSB3aG9sZSAxNCBieXRlcyBhcyBhIHNpbmdsZSBjaHVuaywgc28gSSBleHBs
aWNpdGx5IG1hZGUgYSBkaWZmZXJlbnQKY2hvaWNlIGhlcmUuCihJIGJlbGlldmUgdGhhdCdzIG5v
dCBzb21ldGhpbmcgdGhhdCBjYW4gYmUgY2hhbmdlZCBlYXNpbHksIHNvIHdlIHNob3VsZApkaXNj
dXNzIHRoaXMgYmVmb3JlIG1lcmdpbmcpCgpUaGF0IGFzaWRlOgotIEFsYW0sIHdvdWxkIHlvdSBs
aWtlIHlvdXIgbmFtZSBzb21ld2hlcmUgaW4gdGhlIGNvbW1pdD8gSSBkaWRuJ3Qga2VlcAogIGFu
eXRoaW5nIGZyb20geW91ciBjb21taXQgYmVjYXVzZSBJIGFscmVhZHkgaGFkIG9uZSwgYnV0IGhh
cHB5IHRvIGFkZAogIGEgQ28tZGV2ZWxvcGVkLWJ5IG9yIHNvbWV0aGluZwotIEkga2VwdCBOQU5E
X0VDQ1JFUSg4LCA1MTIpIGxpa2UgVzI1TjA0S1cgYnV0IHRoZSBkYXRhc2hlZXQgc2F5cyBpdCdz
CiAgYmFzZWQgb24gOC1iaXRzLzU0NC1ieXRlcyBFQ0MsIHNvIEkgc2hvdWxkIHNldCBpdCBhcyAo
OCwgNTQ0KT8KICAoc2luY2UgaXQncyBwcm90ZWN0aW5nIDUxMisxMiBieXRlcyBmb3IgdXAgdG8g
OCBiaXRzIGNvcnJ1cHRpb24pCiAgSW4gcHJhY3RpY2UgRUNDIGlzIGRvbmUgYnkgaGFyZHdhcmUg
YW5kIGxvb2tzIGxpa2UgaXQgaXMgY29ycmVjdGx5CiAgcmVwb3J0ZWQgKGUuZy4gbWFudWFsbHkg
b3ZlcndyaXRpbmcgYSBjb3VwbGUgb2YgYml0cyB3aXRoIG5hbmR3cml0ZQogIGFuZCBjaGVja2lu
ZyB3aXRoIG5hbmRkdW1wIHByb3Blcmx5IGNvcnJlY3RzIGFuZCByZXBvcnRzIG51bWJlciBvZgog
IGNvcnJlY3RlZCBiaXRzKSwgYnV0IG1pZ2h0IGFzIHdlbGwgZ2V0IHRoaXMgcmlnaHQsIGV2ZW4g
aWYgYXMgZmFyIGFzIEkKICB1bmRlcnN0YW5kIG5vdGhpbmcgYWN0dWFsbHkgdXNlcyB0aGUgRUND
IG9vYiBkYXRhIHRvIGRvdWJsZS1jaGVjawogIGhhcmR3YXJlIHN0YXR1cz8KLSBJJ2xsIHNoYW1l
ZnVsbHkgYWRtaXQgSSBkbyBub3QgdW5kZXJzdGFuZCB0aGUgcmVhZCAvIHdyaXRlIC8KICB1cGRh
dGVfY2FjaGVfdmFyaWFudHMoKSBJIGNvcGllZCBmcm9tIEtXLAogIEFsYW0gaGFkIHRoZSBzYW1l
IGJ1dCBpdCdkIGJlIGdyZWF0IHRvIGNvbmZpcm0gdXNpbmcgdGhlIHNhbWUKICBjYWxsYmFja3Mg
bWFrZXMgc2Vuc2U/Ci0gKEkgd3JvdGUgYWJvdXQgT1RQIGluIHRoZSBjb21taXQgbWVzc2FnZSBi
dXQgaGF2ZSBubyBwbGFuIG9mCiAgaW1wbGVtZW50aW5nIGl0IGF0IHRoaXMgcG9pbnQgYXMgd2Ug
aGF2ZSBubyB1c2UgZm9yIGl0LCBJIHN0aWxsCiAgaW50ZW5kIHRvIGxvb2sgYXQgY29udGludW91
cyByZWFkIGFmdGVyIHNvbWUgb3RoZXIgd29yaykKClRoYW5rcyEKCi1Eb21pbmlxdWUKLS0tCiBk
cml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9zcGkvd2luYm9uZC5jCmluZGV4IDliNzhjMWU2Y2JjOS4uNWI4NmU1Y2IwNmEzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMKKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9zcGkvd2luYm9uZC5jCkBAIC0zMzUsNiArMzM1LDM0IEBAIHN0YXRpYyBpbnQgdzI1bjAy
a3Zfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogCXJl
dHVybiAwOwogfQogCitzdGF0aWMgaW50IHcyNW4wNGx3X29vYmxheW91dF9lY2Moc3RydWN0IG10
ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAorCQkJCSAgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpy
ZWdpb24pCit7CisJaWYgKHNlY3Rpb24gPiA3KQorCQlyZXR1cm4gLUVSQU5HRTsKKworCXJlZ2lv
bi0+b2Zmc2V0ID0gMTI4ICsgKDE2ICogc2VjdGlvbik7CisJcmVnaW9uLT5sZW5ndGggPSAxMzsK
KworCXJldHVybiAwOworfQorCitzdGF0aWMgaW50IHcyNW4wNGx3X29vYmxheW91dF9mcmVlKHN0
cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKKwkJCQkgICBzdHJ1Y3QgbXRkX29vYl9y
ZWdpb24gKnJlZ2lvbikKK3sKKwlpZiAoc2VjdGlvbiA+IDcpCisJCXJldHVybiAtRVJBTkdFOwor
CisJLy8gdGhlIFcyNU4wNExXIGNoaXAgYWN0dWFsbHkgaGFzIHR3byBmcmVlIHJhbmdlcyBwZXIg
c2VjdGlvbjoKKwkvLyAiVXNlciBEYXRhIEkiIGF0ICgxNiAqIHNlY3Rpb24pICsgNCwgbGVuZ3Ro
IDEyCisJLy8gIlVzZXIgRGF0YSBJSSIgYXQgKDE2ICogc2VjdGlvbikgKyAyLCBsZW5ndGggMgor
CS8vIFRoZSBsYXRlciBpcyBub3QgRUNDIHByb3RlY3RlZCBzbyB0aGlzIG9ubHkgcmV0dXJucyBV
c2VyIERhdGEgSQorCXJlZ2lvbi0+b2Zmc2V0ID0gKDE2ICogc2VjdGlvbikgKyA0OworCXJlZ2lv
bi0+bGVuZ3RoID0gMTI7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGRfb29ibGF5b3V0X29wcyB3MjVuMDFrdl9vb2JsYXlvdXQgPSB7CiAJLmVjYyA9IHcyNW4wMWt2
X29vYmxheW91dF9lY2MsCiAJLmZyZWUgPSB3MjVuMDJrdl9vb2JsYXlvdXRfZnJlZSwKQEAgLTM0
NSw2ICszNzMsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGRfb29ibGF5b3V0X29wcyB3MjVu
MDJrdl9vb2JsYXlvdXQgPSB7CiAJLmZyZWUgPSB3MjVuMDJrdl9vb2JsYXlvdXRfZnJlZSwKIH07
CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMgdzI1bjA0bHdfb29ibGF5
b3V0ID0geworCS5lY2MgPSB3MjVuMDRsd19vb2JsYXlvdXRfZWNjLAorCS5mcmVlID0gdzI1bjA0
bHdfb29ibGF5b3V0X2ZyZWUsCit9OworCiBzdGF0aWMgaW50IHcyNW4wMWp3X29vYmxheW91dF9l
Y2Moc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogCQkJCSAgc3RydWN0IG10ZF9v
b2JfcmVnaW9uICpyZWdpb24pCiB7CkBAIC03NjgsNiArODAxLDE1IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc3BpbmFuZF9pbmZvIHdpbmJvbmRfc3BpbmFuZF90YWJsZVtdID0gewogCQkJCQkgICAg
ICAmdXBkYXRlX2NhY2hlX3ZhcmlhbnRzKSwKIAkJICAgICAwLAogCQkgICAgIFNQSU5BTkRfRUND
SU5GTygmdzI1bjAya3Zfb29ibGF5b3V0LCB3MjVuMDJrdl9lY2NfZ2V0X3N0YXR1cykpLAorCVNQ
SU5BTkRfSU5GTygiVzI1TjA0TFciLCAvKiAxLjhWICovCisJCSAgICAgU1BJTkFORF9JRChTUElO
QU5EX1JFQURJRF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweGIyLCAweDIzKSwKKwkJICAgICBOQU5E
X01FTU9SRygxLCA0MDk2LCAyNTYsIDY0LCAyMDQ4LCA0MCwgMSwgMSwgMSksCisJCSAgICAgTkFO
RF9FQ0NSRVEoOCwgNTEyKSwKKwkJICAgICBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRf
Y2FjaGVfdmFyaWFudHMsCisJCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKKwkJCQkJ
ICAgICAgJnVwZGF0ZV9jYWNoZV92YXJpYW50cyksCisJCSAgICAgMCwKKwkJICAgICBTUElOQU5E
X0VDQ0lORk8oJncyNW4wNGx3X29vYmxheW91dCwgdzI1bjAya3ZfZWNjX2dldF9zdGF0dXMpKSwK
IAlTUElOQU5EX0lORk8oIlczNU4wNEpXIiwgLyogMS44ViAqLwogCQkgICAgIFNQSU5BTkRfSUQo
U1BJTkFORF9SRUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHhkZiwgMHgyMyksCiAJCSAgICAg
TkFORF9NRU1PUkcoMSwgNDA5NiwgMTI4LCA2NCwgNTEyLCAxMCwgMSwgNCwgMSksCgotLS0KYmFz
ZS1jb21taXQ6IGRiMmRkYjg3MTQzNTE5ZTIwYTk1YWEzNmM2MGIzNjEwN2I3MzZhNTgKY2hhbmdl
LWlkOiAyMDI2MDgxMi13MjVuMDRsdy0zZTkxNDZkODM0MGYKCkJlc3QgcmVnYXJkcywKLS0gIApE
b21pbmlxdWUgTWFydGluZXQgPGRvbWluaXF1ZS5tYXJ0aW5ldEBhdG1hcmstdGVjaG5vLmNvbT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
