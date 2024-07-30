Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EE3C3DA70
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2024 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQl5sz4h/nVUTjaGP3SRIq5c74JGWbgvX3uERXRTxQk=; b=U9JWvmPmQqyQOB
	Wuo/+krFeY7vY9PLdIyDOEimdqdbuCDPliiInGuYKaQlCNvkLKue49Yd5hA2XGRMm8YW8kipVAQfH
	jd244oCXYqvaxJp8n3dmw/cMCWMMh4R+vBdzgzxsMEE0n7RmXt/QOcUPSTSEgNhWIaI1ctpSZ0Ada
	1xaaR3ai8sWIh1Rr7Yn1j/XcCiV5LKs9pTq3MTYkx3eOafGupBNDWKgIfjYAEJpOEGtbF2rHe+ve0
	Dt5DnYxyN6GoWlOoodH49eKc6ih50jXpSknKkIkxtUijA4P2gk16pwAixzOc/JFxF4HBcV9kyLZi+
	4JFqFcUW7k40yJ0JNXyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYqem-0000000G1gQ-40La;
	Tue, 30 Jul 2024 17:29:04 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYqej-0000000G1fB-3TnH
	for linux-mtd@lists.infradead.org;
	Tue, 30 Jul 2024 17:29:03 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e05e94a979eso89969276.0
        for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2024 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722360540; x=1722965340; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP1s8QjYEdh+uFt+cmIt4OJAgmgev3dxGNW2dQ2XwRU=;
        b=Q/w+plFrrlhh+B7UOjgANuSDBkDsCNRf3OBqcCGpKdR+KHUMEdU0i7EnfBeNiBrTkF
         AoOtw4389ZJc6v2Br1L4LjekLmOoT7dTnUrgrpxD3zsIlAdgkyWXS0DC7FhwuCwtBmVy
         JiAA6HLRJ1U/AVqfX8EazdjPtQTwBazxVnoEeLSLuCK79EaUFUnjBvtSCrZfohP8/ofA
         5LPQ/qCJL/spgpatcUMxeagcvcz0CJkV4Gw2Ci6sw3o0u3dsv9vKGOhsxoRR6iDlVF5H
         syjc4jtpomPkwZFjrexS5J2hwxV9lIz5jWx4lIBflOkHD2quUj54Hrob5lGtgKGbAncW
         93Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722360540; x=1722965340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JP1s8QjYEdh+uFt+cmIt4OJAgmgev3dxGNW2dQ2XwRU=;
        b=sdTm7KFcBLknJTGOmeB6pGHwM15heA9SQo21nDLPZFTcrzcN8A9/2vs/4rW7opn9CY
         5nb+Qeh1Op0IkklMjezMHdNSZVQ4DO5nTWICnyaraYxYkace2QMPQNZbyU8dW8tu8XlP
         KvyS2/g2b+PHXnZeOPE75YnJFvSpfrRgdnrk5EWT2cBHv0aR24M1xR4LsYMwMtqgIkBB
         ifg3Z+OVsgmwtmsV968fuajzMfxux4XUhdwOa1taceumkfvICYtT7xWEaQFEedq7Y5yJ
         FzGticeZm/n5Exzovt4qWdE1xipcoNvzXlIgtxzw5KbGYfLeQieueOxBGJJKWNx1tyBO
         GDSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxjz/DoDKI7ZeYEeHWyG80ZZrcQVBOYSuQ+3Y0xWKLfe9wFMLlCrARrqPtUz7RzDZZ+pBWXCB7VplCBxvTSk+7ZFe8ywoRmDiXEisQWA==
X-Gm-Message-State: AOJu0YyZS4o/cM9WuqdtTLLvt26HJF8XpeHqysCywUV45erNbDweNNMA
	kKaqSTV6TQCH9RahH2PwMG9jU3Zv/lm0nn1y5l0jPsZvZsyIcsLCh1pDfpZbOiv58BDKd0vQk0J
	gTRv1NG0AKri5qa2G9tysPEUmaXr1N2Df
X-Google-Smtp-Source: AGHT+IHjhwrPp9CibFnetfBtnFVu8ekaB8v8h7DpbGWNITgABcH0CpPLw7LAylTC580BwBw9woSzMfuBDmpv3rONZMQ=
X-Received: by 2002:a05:6902:1202:b0:e05:eccb:95f5 with SMTP id
 3f1490d57ef6-e0b9e1fa50bmr2913232276.18.1722360539852; Tue, 30 Jul 2024
 10:28:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240726185825.142733-1-computersforpeace@gmail.com>
 <D32OADQF733D.3CVS3ZRPEBL2O@kernel.org> <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
In-Reply-To: <454deacb-88cc-4ab0-80b4-006d863a56d2@linaro.org>
From: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 30 Jul 2024 10:28:48 -0700
Message-ID: <CAN8TOE8-9=P7p8Tkc+5kG5Sqan+RAWAc7k2VH-p5W9hR-bb_Xg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Add n25q064a WP support
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_102901_891661_6F4D3142 
X-CRM114-Status: GOOD (  26.71  )
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

SGkgVHVkb3IsIE1pY2hhZWwsCgpPbiBUdWUsIEp1bCAzMCwgMjAyNCBhdCA0OjMz4oCvQU0gVHVk
b3IgQW1iYXJ1cyA8dHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiA3LzMwLzI0
IDc6NTEgQU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gPiBPbiBGcmkgSnVsIDI2LCAyMDI0IGF0
IDg6NTggUE0gQ0VTVCwgQnJpYW4gTm9ycmlzIHdyb3RlOgo+ID4+IFRoZXNlIGZsYXNoIGNoaXBz
IGFyZSB1c2VkIG9uIEdvb2dsZSAvIFRQLUxpbmsgLyBBU1VTIE9uSHViIGRldmljZXMsIGFuZAo+
ID4+IE9uSHViIGRldmljZXMgYXJlIHdyaXRlLXByb3RlY3RlZCBieSBkZWZhdWx0IChzYW1lIGFz
IGFueSBvdGhlcgo+ID4+IENocm9tZU9TL0Nocm9tZWJvb2sgc3lzdGVtKS4gSSd2ZSByZWZlcnJl
ZCB0byBkYXRhc2hlZXRzLCBhbmQgdGVzdGVkIG9uCj4gPj4gT25IdWIgZGV2aWNlcy4KPiA+Cj4g
PiBPdXQgb2YgY3VyaW9zaXR5LCB0aGVyZSBpcyBhbHNvIGEgaGFyZHdhcmUgd3JpdGUgcHJvdGVj
dCBzd2l0Y2gKPiA+IHNvbWVob3csIHJpZ2h0PyBBdCBsZWFzdCB0aGF0J3MgbXkgdW5kZXJzdGFu
ZGluZyBob3cgdmVyaWZ5IGJvb3QKPiA+IHdvcmtzLgoKVGhlcmUncyBhIHdob2xlIGRvYyBvbiB0
aGlzOgpodHRwczovL3d3dy5jaHJvbWl1bS5vcmcvY2hyb21pdW0tb3MvZGV2ZWxvcGVyLWxpYnJh
cnkvcmVmZXJlbmNlL3NlY3VyaXR5L3dyaXRlLXByb3RlY3Rpb24vCgpTaG9ydCBhbnN3ZXI6IHll
cy4KCklmIHlvdSB3YW50IHRvIHNlZSBob3cgdGhpcyBmaXRzIHRvZ2V0aGVyIGluIHByYWN0aWNl
IG9uIGEKbm9uLUNocm9taXVtT1Mgc3lzdGVtLCB5b3UgY2FuIHNlZSBteSBjb21wYW5pb24gT3Bl
bldydCB3b3JrIGhlcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQvcHVsbC8x
NjAxNAoKQmFzaWNhbGx5LCBJIGp1c3QgdHJ5IHRvIG1ha2UgaXQgZWFzaWVyIGZvciB0b29scyAo
aW4gdGhpcyBjYXNlLCB0aGUKQ3JPUyB2Ym9vdCB0b29scykgdG8gZmluZCB0aGUgd3JpdGUtcHJv
dGVjdCBHUElPLCBhbmQgY3Jvc3MtcmVmZXJlbmNlCnRoYXQgd2l0aCB0aGUgc29mdHdhcmUgKE1U
RCAibG9ja2VkIiBpb2N0bHMpIHByb3RlY3Rpb24gc3RhdHVzLiBXZQpuZWVkIHRvIHVuZGVyc3Rh
bmQgYW5kIG1hbmlwdWxhdGUgYm90aCBpZiB3ZSB3YW50IHRvICh0ZW1wb3JhcmlseSkKcmVtb3Zl
IHdyaXRlIHByb3RlY3Rpb24sIHdoaWxlIG90aGVyd2lzZSByZXRhaW5pbmcgdmVyaWZpZWQgYm9v
dAppbnRlZ3JpdHkuCgo+ID4+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE5vcnJpcyA8Y29tcHV0ZXJz
Zm9ycGVhY2VAZ21haWwuY29tPgo+ID4KPiA+IFRoaXMgbG9va3MgZ29vZDoKPiA+IFJldmlld2Vk
LWJ5OiBNaWNoYWVsIFdhbGxlIDxtd2FsbGVAa2VybmVsLm9yZz4KPiA+Cj4gPiBCdXQgY291bGQg
eW91IGhhdmUgYSBsb29rIHdoZXRoZXIgdGhpcyBmbGFzaCBzdXBwb3J0cyBTRkRQLgo+ID4gQWNj
b3JkaW5nIHRvIHRoZSBkYXRhc2hlZXQgaXQgbG9va3MgbGlrZSBpdCBkb2VzLiBJbiB0aGF0IGNh
c2UsCj4gPiBjb3VsZCB5b3UgcGxlYXNlIGR1bXAgaXQgYWNjb3JkaW5nIHRvOgo+ID4gaHR0cHM6
Ly9kb2NzLmtlcm5lbC5vcmcvZHJpdmVyLWFwaS9tdGQvc3BpLW5vci5odG1sCgpTb3JyeSwgSSBk
aWRuJ3Qgbm90aWNlIHRoaXMgZG9jLiBJdCdzIG5vdCB0ZWNobmljYWxseSBhICJuZXciIGZsYXNo
LApzbyBpdCBkb2Vzbid0IG5lY2Vzc2FyaWx5IGFwcGx5LCBidXQgZm9yIHRoZSBtYWlsLWFyY2hp
dmUgcmVjb3JkOgoKIyB4eGQgLXAgL3N5cy9idXMvc3BpL2RldmljZXMvc3BpMC4wL3NwaS1ub3Iv
c2ZkcAo1MzQ2NDQ1MDAwMDEwMGZmMDAwMDAxMDkzMDAwMDBmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmYKZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZTUyMGYxZmZmZmZm
ZmYwMzI5ZWIyNzZiCjA4M2IyN2JiZmZmZmZmZmZmZmZmMjdiYmZmZmYyOWViMGMyMDEwZDgwMDAw
MDAwMAoKPiBUaGlzIHdvdWxkIGhlbHAgZ2V0dGluZyByaWQgb2YgdGhlIG5vX3NmZHBfZmxhZ3Mg
YW5kIHNpemUgZnJvbSB0aGUgZmxhc2gKPiBkZWZpbml0aW9uLiBBbm90aGVyIHJlYXNvbiBpcyB0
aGF0IHRoZSBTRkRQIGR1bXAgY2FuIGhlbHAgdXMKPiBkaWZmZXJlbnRpYXRlIGJldHdlZW4gZmxh
dm9ycyBvZiB0aGUgc2FtZSBmbGFzaCwgaWYgaXQnbGwgZXZlciBiZSB0aGUKPiBjYXNlLCBhbmQg
aGVscCB1cyBrZWVwIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuCgpJIHdvbmRlciwgc2luY2UgbWFu
dWZhY3R1cmVycyBzZWVtIHRvIHJldXNlIElEcyBzb21ldGltZXMsIGlzIGl0CnBvc3NpYmxlIChv
ciwgbGlrZWx5KSBmb3IgU0ZEUCBhbmQgbm9uLVNGRFAgdmVyc2lvbnMgb2YgdGhlIHNhbWUgZmxh
c2gKdG8gZXhpc3Q/IEknbSBub3QgcmVhbGx5IHN1cmUgd2hldGhlciBJIGNhbiB0cnVseSBkcm9w
IHRoZSBub24tU0ZEUApkZWZpbml0aW9ucy4KCj4gQWxzbywgaWYgeW91IGNhcmUsIHdvdWxkIGJl
IGdvb2QgdG8gZXh0ZW5kIHRoZSBTUEkgTk9SIGRvY3VtZW50YXRpb24gb24KPiBob3cgb25lIHNo
YWxsIHRlc3QgdGhlIEJsb2NrIFByb3RlY3Rpb24uCgpUaGF0IHNvdW5kcyB0b3VnaGVyLiBJIGRv
bid0IGtub3cgdGhhdCB0aGVyZSdzIHJlYWxseSBhIHN0YW5kYXJkCnRvb2xzZXQgZm9yIGhhbmRs
aW5nIHByb3RlY3Rpb24gLS0gSSBndWVzcyB0aGUgJ2ZsYXNoX3t1bix9bG9jaycKdXRpbGl0aWVz
IGluIG10ZC11dGlscyBxdWFsaWZ5LCBidXQgdGhleSBhcmVuJ3QgZXZlbiBwYWNrYWdlZCBieQpy
ZWxldmFudCBkaXN0cm9zIChlLmcuLCBPcGVuV3J0OyBidXQgSSBndWVzcyB0aGV5J3JlIGluIERl
YmlhbikuIEkKdHlwaWNhbGx5IHVzZSBmbGFzaHJvbSwgc2luY2UgdGhhdCdzIHdoYXQgQ2hyb21p
dW1PUyB1c2VzLCBhbmQgaXQncwphdmFpbGFibGUgaW4gT3BlbldydCAtLSB3b3VsZCB0aGF0IGJl
IGFuIE9LIGJhc2lzIGZvciBkb2NzPwoKSXQncyBhbHNvIGhpZ2hseSBjb25kaXRpb25hbCBvbiB3
aGF0IHNvcnQgb2YgcmFuZ2UocykgdGhlIGZsYXNoCnN1cHBvcnRzLiBTbyBpdCdzIGFsbW9zdCBs
aWtlIHdlIG1pZ2h0IHdhbnQgYSBwcm9ncmFtbWF0aWMKd3JpdGUtcHJvdGVjdGlvbiB0ZXN0IHN1
aXRlIGFzIHBhcnQgb2YgbXRkLXV0aWxzL3Rlc3RzLywgcmF0aGVyIHRoYW4gYQpiZXNwb2tlIG5h
cnJhdGl2ZSBkb2N1bWVudC4gV2hpY2ggLi4uIGlzIGdldHRpbmcgYSBsaXR0bGUgbGFyZ2VyIHRo
YW4KSSBzaWduZWQgdXAgZm9yLgoKQnJpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
