Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1F4F531F8
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Apr 2026 07:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8EAd8a2Xrzc+FQNqKi9gXJrVipkrWFPz5SmYEqLCcc=; b=WSTjQ5jrpApNko
	bA4vrYe4nnTpmpFrJZWI8/uaMHKlr1+0FuK4odjyE1+PtjBHDZihcP/p3IhGlz12WWs6ZA3ATYJ+z
	ONgoE8dicxpBgJ0PDjHaIH6a+tIJXIGf+wizu+6urXRXPtA8JkbB4WAq3uW14MiUVhRRYY7gwaB7B
	rmW77hTjxvdFCs5QyWHpSBcYzeJn1cn8TgcZuwWjrUjWK4AYwDdfF2UbFAzQHlu7v2+P6SQhUH1KC
	AKeqTpGmVOcmWlPic3Lf7Jw+wMylwjAHP8Dw0io9OuEJaC7YXRcIJo/TBgB3g4O6O6IXgJC4K+H2D
	BL9kKSPPNWwRjQUUaqMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCY3C-0000000GtcK-3blW;
	Tue, 14 Apr 2026 07:19:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCY38-0000000Gtbx-0Qy5
	for linux-mtd@lists.infradead.org;
	Tue, 14 Apr 2026 07:19:07 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-35fbca04006so803391a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 14 Apr 2026 00:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776151144; cv=none;
        d=google.com; s=arc-20240605;
        b=UTwUOc9+VrgJ35fdiIdPKnW0H6S4vK/RH3sjtCMoHFZyyj+DSdbp6A4WWc1KzP9alg
         olf3SsFEUUwyZmv+Yg45JGid4qpHUrDhAo6cQyKUc+JQeGP+Fqrzro9+dGX8kXM/czkw
         4yKKVGlZq1bo3idfPxP03wGRaOHqssunB6Km6pPRzYsYhI8Jm+l3ZA560Fscxym6KAH/
         2irSnBIFoIQI93BEVr1faNRX/iVhkhvTDT5ier14bPs/z15Oj6s5tLLdgLgEuCw+1mpD
         duOp9BCQfS83Y8mG2x+IsZKiXweEdGsBf9WitRiPw3pNw56hrpO64KjMST2NQENcWMsm
         Q00g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HPxwAPPGySSDyaTEyxzKdNbCF7rxcPCYcVwo0vcS/gg=;
        fh=zevup7nilPoBM3VsOQWKIFjtAFwF//twM90nP8By2os=;
        b=lr6FxsUUhMWYf3T+PWIRcQoWtgRJwReZNN7rGlUgMgfbR0MvbwyGIMVjOGFqpObj8q
         4rT3iynZWiT1tKAHDoTt7QmiCSSdMGF6ztFLZpR2eSFKpphqWt7Oyzb9+usZnF088sBv
         a+4qX5F/NwAuFll1m5zsmKE2LUcB3tIgk92RiOrGnpU3miQeOaWyl8XzOWWAPQS7E3sh
         l/cA8mkoo5FzQAomY9f3ioeCfxW1gOj1lgA1em28cs9fcwoE7g9lqr60+aCP5qXwCGnv
         eP4h9PKhOyK89O9FE20TfkM40c6qEh57d4BAhFovYhSe3H4VwaAWgsrYiYYnXZFxjOuJ
         pCOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776151144; x=1776755944; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPxwAPPGySSDyaTEyxzKdNbCF7rxcPCYcVwo0vcS/gg=;
        b=CNF9JJRVeUQ6OQ8HTlM9EJKJamZJ+fsxDhmGYE4/zSAKmB8BWSyoUafsD9fwY4b0uM
         fj6WrueYrsPLBxkRaRgHhBMqWCQD9hf2I+n60C/NPjdxKKw4Wq0qMjZRQXW6jDGBtFK7
         Lt05xfiMPtzM9UfrVFRv5/Ut+K9dWCHeTLxU3c+k2l+ER+GBvVFmcceK6vhMRJKqg/Hq
         IGfilVYa+InwqjVtPYb7oNDfUIMMQaqEOPAYPWXrmye5NBLmV3jzOtjFJMYnsVaNb58E
         LPpcskpmdLBkWcjKiP07mJAjrpmN0bpLI5vmAL0AtZ32JiK6aPRcH9gJ8Msq5LNrlLbJ
         vDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776151144; x=1776755944;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HPxwAPPGySSDyaTEyxzKdNbCF7rxcPCYcVwo0vcS/gg=;
        b=PXJQusSzT4KJTFuxGQ14STSjappF8InGYG8V3hErQ2cWm8cIWLKq0fNVaXGvEKihrI
         jNHFQMue1IMN57TBN56QaRyJn3/3L/3vR3WX0WfckqASQ9WulhfEbC2GwtaZDYs6zaBw
         g/v358BYhJMFv2704KtqhKXZtMAN5EVlcQQbmnyJexv/PdAD3KsWRpCy/m2x8ILMsZJE
         WzVtM4kjzMD4r2e+uunkuUQ2TS8i6QCBybPdQ1/l77HqektgNCiIN3ox0i96qodDPftG
         jIpQdH5iqvR23ovhQ+kHVc07TGl/kJ+qtMnmzFYgANUzvC1gxxv8EOG91cQY10MNAkzf
         jNMg==
X-Forwarded-Encrypted: i=1; AFNElJ/8qt/ptdTc6j8Xvq3iSWsMocO/mX7VhwomLugTaKDzy7+A5YIhZyPrsOF5XjVr3MGOZg27+puE5gU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw27fIL6uiM6ssojfvz/ueDBdGhpEzkV87L4cOJ8W/yTjutfapK
	aPLtT1ZvSryoUSJ5UOR05dUfuGhksbdfGHYmlMuErunOP+YWdokNHZ00E1EaTIgh17Sih4R0lQ0
	ZAWDrox/eUU/bwOqfIee/yak/rNgV5dI=
X-Gm-Gg: AeBDietMmX+01wiUyAg/ja3RSOD5PMrUBl7XmWEYFo00CY6B3zFNvzV3szWjMemDw5y
	zdnMYpO/G13BKB7APlZRFYgCvp2xOGYBSP25sFj9WcYRgL9NyZFT2cFbIaGaOJemiQLrm20EVLZ
	E98nO4fyaOT6yRTqfs8dPJ3+nCXT/XBeVTIWZhDnOMtD+R2eWRPWZDRCrxRNbul7mvVQJOPBOTR
	wBb/fvIWP7QzRzwaaWNuoUd+0wwHqhfSipokuCMwkNUwBLSmDMe0xq2QpTyWU6m5Fk35fb9suQn
	wzVeiOVtUNCNCtvknQ==
X-Received: by 2002:a17:90b:4e85:b0:35d:93ff:2859 with SMTP id
 98e67ed59e1d1-35e42832228mr16208136a91.22.1776151144308; Tue, 14 Apr 2026
 00:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260410091039.389911-1-linchengming884@gmail.com> <DHPD8DFIQCMM.13NPOBDQOSXL2@kernel.org>
In-Reply-To: <DHPD8DFIQCMM.13NPOBDQOSXL2@kernel.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 14 Apr 2026 15:18:15 +0800
X-Gm-Features: AQROBzBwkLiEXglcLc_fqaAIZ4y5x4PV5HNsxI5tXsX3-vx38cT0-PxHzmWTyZg
Message-ID: <CAAyq3SbbyT_wYmVNqgyK4J7C34q2beXGOa+hN0hpi5JNUBfrjw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: macronix: Document support for additional
 flash aliases
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_001906_174310_E2DFAF6C 
X-CRM114-Status: GOOD (  15.17  )
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

SGkgTWljaGFlbCwKCk1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPiDmlrwgMjAyNuW5
tDTmnIgxMOaXpemAseS6lCDkuIvljYg1OjI25a+r6YGT77yaCj4KPiBPbiBGcmkgQXByIDEwLCAy
MDI2IGF0IDExOjEwIEFNIENFU1QsIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+ID4gRnJvbTogQ2hl
bmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+Cj4gPiBTZXZlcmFsIE1h
Y3Jvbml4IFNQSSBOT1IgZmxhc2ggZGV2aWNlcyBzaGFyZSB0aGUgc2FtZSBJRC4KPiA+IEZvciBp
bnN0YW5jZSwgdGhlIE1YMjVMNTEyNDVHIGFuZCBNWDI1TDUxMjczRyBzaGFyZSB0aGUgc2FtZSBJ
RAo+ID4gKDB4YzIyMDFhKSB3aXRoIHRoZSBjdXJyZW50bHkgbGlzdGVkIE1YNjZMNTEyMzVGLgo+
ID4KPiA+IEFkZCB0aGVzZSBlcXVpdmFsZW50IHBhcnQgbnVtYmVycyB0byB0aGUgY29tbWVudHMg
YWJvdmUgdGhlaXIKPiA+IGNvcnJlc3BvbmRpbmcgZmxhc2hfaW5mbyBlbnRyaWVzLgo+ID4KPiA+
IFdoaWxlIHRoaXMgY2hhbmdlIGRvZXMgbm90IGFmZmVjdCB0aGUgZnVuY3Rpb25hbCBkcml2ZXIg
bG9naWMsIGl0Cj4gPiBzaWduaWZpY2FudGx5IGltcHJvdmVzIHRoZSBzZWFyY2hhYmlsaXR5IG9m
IHRoZSBrZXJuZWwgc291cmNlIHRyZWUuCj4gPiBUaGlzIGhlbHBzIHVzZXJzIGVhc2lseSB2ZXJp
ZnkgdGhhdCB0aGVpciBzcGVjaWZpYyBwaHlzaWNhbCBwYXJ0IGlzCj4gPiBmdWxseSBzdXBwb3J0
ZWQsIHByZXZlbnRpbmcgY29uZnVzaW9uIGFuZCBkZXRlcnJpbmcgcmVkdW5kYW50IHBhdGNoCj4g
PiBzdWJtaXNzaW9ucyB0aGF0IGF0dGVtcHQgdG8gYWRkIGR1cGxpY2F0ZSBlbnRyaWVzIGZvciB0
aGVzZSBhbGlhcyBwYXJ0cy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGVuZyBNaW5nIExpbiA8
Y2hlbmdtaW5nbGluQG14aWMuY29tLnR3Pgo+Cj4gSGkgQ2hlbmcsCj4KPiBjb3VsZCB5b3UgcGxl
YXNlIHByb3ZpZGUgYW4gU0ZEUCBkdW1wIG9mIGFsbCB0aGVzZSBjaGlwcz8gU2VlIFsxXQo+IGZv
ciBtb3JlIGluZm9ybWF0aW9uLgoKMS4gTVgyNUw1MTI0NUcKenlucT4gY2F0IC9zeXMva2VybmVs
L2RlYnVnL3NwaS1ub3Ivc3BpMi4wL3BhcmFtcwpuYW1lICAgICAgICAgICAgKG51bGwpCmlkICAg
ICAgICAgICAgICBjMiAyMCAxYSBjMiAyMCAxYQpzaXplICAgICAgICAgICAgNjQuMCBNaUIKd3Jp
dGUgc2l6ZSAgICAgIDEKcGFnZSBzaXplICAgICAgIDI1NgphZGRyZXNzIG5ieXRlcyAgNApmbGFn
cyAgICAgICAgICAgNEJfT1BDT0RFUyB8IEhBU180QkFJVCB8IFNPRlRfUkVTRVQKCnp5bnE+IHh4
ZCAtcCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkyLjAvc3BpLW5vci9zZmRwCjUzNDY0NDUwMDYw
MTAyZmYwMDA2MDExMDMwMDAwMGZmYzIwMDAxMDQxMDAxMDBmZjg0MDAwMTAyYzAwMAowMGZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZlNTIwZmJmZmZmZmZmZjFmNDRlYjA4NmIKMDgz
YjA0YmJmZWZmZmZmZmZmZmYwMGZmZmZmZjQ0ZWIwYzIwMGY1MjEwZDgwMGZmZDY0OWM1MDA4MWRm
CjA0ZTM0NDAzNjczODMwYjAzMGIwZjdiZGQ1NWM0YTllMjlmZmYwNTBmOTg1ZmZmZmZmZmZmZmZm
ZmZmZgpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmYKZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjdmZWZmZmZmMjE1Y2RjZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZgpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmYKZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmCmZmZmYwMDM2MDAyNzlkZjljMDY0ODVjYmZmZmZmZmZm
ZmZmZgoKenlucT4gc2hhMjU2c3VtIC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaTIuMC9zcGktbm9y
L3NmZHAKNzI4MWIwYTM1NWE0NDk3ZWM2MjU2YzU3YjgxYzNkMmIzMDNiYzM0MjIwY2I3Nzc5MDI3
OGQ3MTlkNzQ2NTI3Ngovc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkyLjAvc3BpLW5vci9zZmRwCgoy
LiBNWDI1TDUxMjczRwp6eW5xPiBjYXQgL3N5cy9rZXJuZWwvZGVidWcvc3BpLW5vci9zcGkyLjAv
cGFyYW1zCm5hbWUgICAgICAgICAgICAobnVsbCkKaWQgICAgICAgICAgICAgIGMyIDIwIDFhIGMy
IDIwIDFhCnNpemUgICAgICAgICAgICA2NC4wIE1pQgp3cml0ZSBzaXplICAgICAgMQpwYWdlIHNp
emUgICAgICAgMjU2CmFkZHJlc3MgbmJ5dGVzICA0CmZsYWdzICAgICAgICAgICA0Ql9PUENPREVT
IHwgSEFTXzRCQUlUIHwgU09GVF9SRVNFVAoKenlucT4geHhkIC1wIC9zeXMvYnVzL3NwaS9kZXZp
Y2VzL3NwaTIuMC9zcGktbm9yL3NmZHAKNTM0NjQ0NTAwNjAxMDJmZjAwMDYwMTEwMzAwMDAwZmZj
MjAwMDEwNDEwMDEwMGZmODQwMDAxMDJjMDAwCjAwZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmU1MjBmYmZmZmZmZmZmMWY0NGViMDg2YgowODNiMDRiYmZlZmZmZmZmZmZmZjAwZmZm
ZmZmNDRlYjBjMjAwZjUyMTBkODAwZmZkNjQ5YzUwMDgxZGYKMDRlMzQ0MDM2NzM4MzBiMDMwYjBm
N2JkZDU1YzRhOWUyOWZmZjA1MGY5ODVmZmZmZmZmZmZmZmZmZmZmCmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZgpmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYKZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmN2ZlZmZmZmYyMTVjZGNmZmZmZmZmZmZmZmZmZmZmZmZmZmZmCmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZgpm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmYKZmZmZjAwMzYwMDI3OWRmOWMwNjQ4NWNiZmZmZmZmZmZmZmZmCgp6eW5xPiBzaGEyNTZzdW0g
L3N5cy9idXMvc3BpL2RldmljZXMvc3BpMi4wL3NwaS1ub3Ivc2ZkcAo3MjgxYjBhMzU1YTQ0OTdl
YzYyNTZjNTdiODFjM2QyYjMwM2JjMzQyMjBjYjc3NzkwMjc4ZDcxOWQ3NDY1Mjc2Ci9zeXMvYnVz
L3NwaS9kZXZpY2VzL3NwaTIuMC9zcGktbm9yL3NmZHAKCjMuIE1YMjVVNTEyOTNHCnp5bnE+IGNh
dCAvc3lzL2tlcm5lbC9kZWJ1Zy9zcGktbm9yL3NwaTIuMC9wYXJhbXMKbmFtZSAgICAgICAgICAg
IChudWxsKQppZCAgICAgICAgICAgICAgYzIgMjUgM2EgYzIgMjUgM2EKc2l6ZSAgICAgICAgICAg
IDY0LjAgTWlCCndyaXRlIHNpemUgICAgICAxCnBhZ2Ugc2l6ZSAgICAgICAyNTYKYWRkcmVzcyBu
Ynl0ZXMgIDQKZmxhZ3MgICAgICAgICAgIDRCX09QQ09ERVMgfCBIQVNfNEJBSVQgfCBTT0ZUX1JF
U0VUCgp6eW5xPiB4eGQgLXAgL3N5cy9idXMvc3BpL2RldmljZXMvc3BpMi4wL3NwaS1ub3Ivc2Zk
cAo1MzQ2NDQ1MDA2MDEwMmZmMDAwNjAxMTAzMDAwMDBmZmMyMDAwMTA0MTAwMTAwZmY4NDAwMDEw
MmMwMDAKMDBmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZTUyMGZiZmZmZmZmZmYx
ZjQ0ZWIwODZiCjA4M2IwNGJiZmVmZmZmZmZmZmZmMDBmZmZmZmY0NGViMGMyMDBmNTIxMGQ4MDBm
Zjg3NDliNTAwODJkZgowNGUyNDQwMzY3MzgzMGIwMzBiMGY3YmRkNTVjNGE5ZTI5ZmZmMDUwZjk4
NWZmZmZmZmZmZmZmZmZmZmYKZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZgpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmY3ZjhmZmZm
ZjIxNWNkY2ZmZmZmZmZmZmZmZmZmZmZmZmZmZmYKZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZgpmZmZmMDAyMDUwMTY5ZGY5YzA2
NDg1Y2JmZmZmZmZmZmZmZmYKCnp5bnE+IHNoYTI1NnN1bSAvc3lzL2J1cy9zcGkvZGV2aWNlcy9z
cGkyLjAvc3BpLW5vci9zZmRwCmZhYTUwZDBjMmM4ZjI2ZGJkZmI0MDBjOTk1YmQxOWE0YTQ5MjQw
NDMzNjU4OGE3MmM1OTYwODhjNTY0MTE2NGYKL3N5cy9idXMvc3BpL2RldmljZXMvc3BpMi4wL3Nw
aS1ub3Ivc2ZkcAoKNC4gTVg2NlUxRzkzRwp6eW5xPiBjYXQgL3N5cy9rZXJuZWwvZGVidWcvc3Bp
LW5vci9zcGkyLjAvcGFyYW1zCm5hbWUgICAgICAgICAgICAobnVsbCkKaWQgICAgICAgICAgICAg
IGMyIDI1IDNiIGMyIDI1IDNiCnNpemUgICAgICAgICAgICAxMjggTWlCCndyaXRlIHNpemUgICAg
ICAxCnBhZ2Ugc2l6ZSAgICAgICAyNTYKYWRkcmVzcyBuYnl0ZXMgIDQKZmxhZ3MgICAgICAgICAg
IDRCX09QQ09ERVMgfCBIQVNfNEJBSVQgfCBTT0ZUX1JFU0VUCgp6eW5xPiB4eGQgLXAgL3N5cy9i
dXMvc3BpL2RldmljZXMvc3BpMi4wL3NwaS1ub3Ivc2ZkcAo1MzQ2NDQ1MDA2MDEwMmZmMDAwNjAx
MTAzMDAwMDBmZmMyMDAwMTA0MTAwMTAwZmY4NDAwMDEwMmMwMDAKMDBmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZTUyMGZiZmZmZmZmZmYzZjQ0ZWIwODZiCjA4M2IwNGJiZmVmZmZm
ZmZmZmZmMDBmZmZmZmY0NGViMGMyMDBmNTIxMGQ4MDBmZjg3NDliNTAwODJkZgowNGUyNDQwMzY3
MzgzMGIwMzBiMGY3YmRkNTVjNGE5ZTI5ZmZmMDUwZjk4NWZmZmZmZmZmZmZmZmZmZmYKZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmCmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZgpmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmY3ZjhmZmZmZjIxNWNkY2ZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmYKZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmCmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZgpmZmZmMDAyMDUwMTY5ZGY5YzA2NDg1Y2JmZmZmZmZmZmZmZmYKCnp5bnE+
IHNoYTI1NnN1bSAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkyLjAvc3BpLW5vci9zZmRwCmY2OTM1
MzdmOGI2NjYwYThlZDkzN2RhYjY1ZWZmMzgyMWY1OGUwM2MwMjZhNjRiMTUzZGRjY2JmZDlhNmRm
MGMKL3N5cy9idXMvc3BpL2RldmljZXMvc3BpMi4wL3NwaS1ub3Ivc2ZkcAoKPgo+IFRoYW5rcywK
PiAtbWljaGFlbAo+Cj4gWzFdIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvbXRk
L3NwaS1ub3IuaHRtbAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
