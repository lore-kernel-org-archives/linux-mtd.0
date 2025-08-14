Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82189CA0EE6
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Aug 2025 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q4KGsmZwQDw70eU5LbZCOJS/3YUXUJOt524EBiyV4Dk=; b=WHYz40hoVyIaNr
	lY9iQ39ZoZZw19MWDZtZBUwAOYSmg24zQSiJfHMPeIng2GadF5thhoHy+w6E2UqJd3QPNwOtNvBEF
	BElwluRhXhF5JmOPhyUHQ1zpJqFvO148G3291FI1lpwlpJKkcPPj3T3UIOO4HCcCpv0gBSngJjbm+
	RpsfWSEpKJLjtLu8g3VeAIyTdwPLXIp8ptfR4AFXTkQ3aiIvVkfY7NDyV84k1/OY2QFpaSZSwStvD
	3DbfJpA+f4m6zazr4M66w+McXZL2tTAfSQBa/qxrSfg0KPuyQkY5xy6msfvUX5KaQoFukTPQCAxjD
	cFIf7ZM2R2x25GNofLcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZgx-0000000HOdF-4A74;
	Thu, 14 Aug 2025 15:16:35 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUxZ-0000000GXXg-2KnH
	for linux-mtd@lists.infradead.org;
	Thu, 14 Aug 2025 10:13:26 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-323267adb81so962181a91.1
        for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2025 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755166404; x=1755771204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWV0Vky7dLN5wLLAfrWbf/PWgWvlpmsQDAwFJM1cuFQ=;
        b=eHo/iafmjfjM1xRrx8+FGCh+Xl7ZO7s99mDoYGBvy5kZ5i4RY4h3rbugzrooKoyfka
         EiuUO5QwszHETEbYUyYykH/MnF7C8yyrbxoAW1BHFhkR2mDQqgO9DbDGcKSBrpz2mKOX
         pF5ZtQIZo0rAY0cTFulmS5gOC8HAEJTjMlIyOIqFvWHrwgOonECWz1BldmtNUwRN1zp8
         bwnVmNdLVjJvVCn6pilAnDaim19KiaYzWdaCga5hmEgRNkDb8moTTWWTq7ku7qoz3ptY
         aBllQzc60ISKaR9k08eob25iyFGTcPHJHqVOObdFCH3fiP4y0Um+OjtUBhdQXA+earVU
         jJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755166404; x=1755771204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWV0Vky7dLN5wLLAfrWbf/PWgWvlpmsQDAwFJM1cuFQ=;
        b=ZLcavV/SCPs95pa0Ie3y5YIA1oUP3M8C0Fnr7KYfYKuoI5q0a52SYsmdsLtGFRK8AO
         FeRxJYT2l2L/qf51p6/v273jLHBwHIwuL7lLLpELx0x53Yet2r0UoxMqrcVEFoyAeE95
         QqWNltHT9wQEguJIipP5lFXfd6ZW8f1Vj6fnKaeq539T1VUQ+ZMh8f32W1O2TP6vwR82
         ubWYa17aAn2kE1T1NMaUKU8STUagNwzFAVGO4t0fjK3696xGrUQNTyjkVjJiGjTNdeGA
         py18y/Rd5QXBOpK7Q4gGfMo5rKHlE0TwcjSgu1WF/in5imOagI9FIkjzMOBIiO1jAiG5
         eKuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/xVlQI5Naw0ZlL7muQYjU2KTc9EN12+L9J24SOmHGgfxoZPsJo09jpyhTGj4d3hcUx837gU2z7iI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWExoha0z883BmCrigYIAGS9G2bv7SGNRonlpNLzZIUDRZi9Wo
	W75Q5FMlDd69Pd0NudPE3oK+cA07nJp94ghKLtGLykELOL/57QuTOwmClw9t+DH8IsIG5H9Pkw+
	DoEkoMdvHm4oQ/FtuAvTPwOeFNAh97GE=
X-Gm-Gg: ASbGnctGalX0nc80juQVDa0tW7Y3Y2irZJxV51qC03Uao40m7dVDmaORRGGSj7Ap9Uh
	2ND6MtN6dgLupj7/gZfIhE2iiLnBPlTyTmtCo/Ft6+P9I5vw9eu3oad0YFz/AUVugF61b5cZzhL
	bifc+dFgTfvdfysvV07/7JlPITh+z2c+PzY/1W01Rt2tZNMvF/wGARhcKGG0pxXZVUC7xQjIPvI
	DsJtlU=
X-Google-Smtp-Source: AGHT+IGQB8r/pPHGVfsNp7+7bw5sKWLbla7BkdMq5nUYbmAEN+NnBiJIz4CX6aB11P4WqBNN6+MQuuJXSxJySIi6080=
X-Received: by 2002:a17:90b:1d01:b0:321:87fa:e1ec with SMTP id
 98e67ed59e1d1-32327accbcamr4020043a91.34.1755166404565; Thu, 14 Aug 2025
 03:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250812051949.983040-1-linchengming884@gmail.com> <152133202.103367.1754981828821.JavaMail.zimbra@nod.at>
In-Reply-To: <152133202.103367.1754981828821.JavaMail.zimbra@nod.at>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Thu, 14 Aug 2025 18:11:07 +0800
X-Gm-Features: Ac12FXz2rhhyBIh2oSvcLuHLhf31k4mVO-sI8GTQ2EvX_sMkocC2UqI39p7JvyA
Message-ID: <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Alvin Zhou <alvinzhou@mxic.com.tw>, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_031325_592873_BE54CFE9 
X-CRM114-Status: GOOD (  18.56  )
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

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IOaWvCAyMDI1
5bm0OOaciDEy5pelIOmAseS6jCDkuIvljYgyOjU35a+r6YGT77yaCj4KPiAtLS0tLSBVcnNwcsO8
bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJDaGVuZyBNaW5nIExpbiIgPGxpbmNoZW5nbWlu
Zzg4NEBnbWFpbC5jb20+Cj4gPiBBbjogInJpY2hhcmQiIDxyaWNoYXJkQG5vZC5hdD4sICJjaGVu
Z3poaWhhbzEiIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4sICJNaXF1ZWwgUmF5bmFsIiA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4sCj4gPiAiVmlnbmVzaCBSYWdoYXZlbmRyYSIgPHZpZ25l
c2hyQHRpLmNvbT4sICJsaW51eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4s
ICJsaW51eC1rZXJuZWwiCj4gPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4KPiA+IEND
OiAiQWx2aW4gWmhvdSIgPGFsdmluemhvdUBteGljLmNvbS50dz4sIGxlb3l1QG14aWMuY29tLnR3
LCAiQ2hlbmcgTWluZyBMaW4iIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+Cj4gPiBHZXNlbmRl
dDogRGllbnN0YWcsIDEyLiBBdWd1c3QgMjAyNSAwNzoxOTo0OQo+ID4gQmV0cmVmZjogW1JGQ10g
bXRkOiB1Ymk6IHNraXAgcHJvZ3JhbW1pbmcgdW51c2VkIGJpdHMgaW4gdWJpIGhlYWRlcnMKPgo+
ID4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWluZ2xpbkBteGljLmNvbS50dz4KPiA+Cj4g
PiBUaGlzIHBhdGNoIHByZXZlbnRzIHVubmVjZXNzYXJ5IHByb2dyYW1taW5nIG9mIGJpdHMgaW4g
ZWNfaGRyIGFuZAo+ID4gdmlkX2hkciB0aGF0IGFyZSBub3QgdXNlZCBvciByZWFkIGR1cmluZyBu
b3JtYWwgVUJJIG9wZXJhdGlvbi4gVGhlc2UKPiA+IHVudXNlZCBiaXRzIGFyZSB0eXBpY2FsbHkg
YWxyZWFkeSBzZXQgdG8gMSBpbiBlcmFzZWQgZmxhc2ggYW5kIGRvIG5vdAo+ID4gbmVlZCB0byBi
ZSBleHBsaWNpdGx5IHByb2dyYW1tZWQgdG8gMCBpZiB0aGV5IGFyZSBub3QgdXNlZC4KPiA+Cj4g
PiBQcm9ncmFtbWluZyBzdWNoIHVudXNlZCBhcmVhcyBvZmZlcnMgbm8gZnVuY3Rpb25hbCBiZW5l
Zml0IGFuZCBtYXkKPiA+IHJlc3VsdCBpbiB1bm5lY2Vzc2FyeSBmbGFzaCB3ZWFyLCByZWR1Y2lu
ZyB0aGUgb3ZlcmFsbCBsaWZldGltZSBvZiB0aGUKPiA+IGRldmljZS4gQnkgc2tpcHBpbmcgdGhl
c2Ugd3JpdGVzLCB3ZSBwcmVzZXJ2ZSB0aGUgZmxhc2ggc3RhdGUgYXMgbXVjaAo+ID4gYXMgcG9z
c2libGUgYW5kIG1pbmltaXplIHdlYXIgY2F1c2VkIGJ5IHJlZHVuZGFudCBvcGVyYXRpb25zLgo+
Cj4gV2UgdGFsayBhYm91dCBwcm9ncmFtbWluZyBhIHNpbmdsZSAoc3ViKXBhZ2UsIHJpZ2h0PwoK
U2luY2UgdGhlIFVCSSBoZWFkZXIgaXMgbWFpbmx5IHdyaXR0ZW4gaW50byBhIHNpbmdsZSBwYWdl
LCB0aGUgInVudXNlZAphcmVhcyIgaGVyZSByZWZlciB0byB0aGUgc3BhY2Ugd2l0aGluIGEgc2lu
Z2xlIChzdWIpcGFnZSB0aGF0IGlzIG91dHNpZGUKdGhlIGhlYWRlciBjb250ZW50LgoKPgo+ID4g
VGhpcyBjaGFuZ2UgZW5zdXJlcyB0aGF0IG9ubHkgbmVjZXNzYXJ5IGZpZWxkcyBhcmUgd3JpdHRl
biB3aGVuCj4gPiBwcmVwYXJpbmcgVUJJIGhlYWRlcnMsIGltcHJvdmluZyBmbGFzaCBlZmZpY2ll
bmN5IHdpdGhvdXQgYWZmZWN0aW5nCj4gPiBmdW5jdGlvbmFsaXR5Lgo+Cj4gSSBoYXZlIGJlZW4g
dG9sZCB0aGF0IHdyaXRpbmcgMHhGRiBieXRlcyB0byBOQU5EIHNob3VsZCBiZSBhdm9pZGVkLgo+
IFRoaXMgaXMgYWxzbyB3aHkgVUJJIGluaXRpYWxpemVzIHRoZW0gdG8gMHgwMC4KCk5vcm1hbGx5
LCBhZnRlciBhIE5BTkQgZmxhc2ggYmxvY2sgaXMgZXJhc2VkLCBhbGwgYml0cyBhcmUgaW4gdGhl
IDB4RkYKc3RhdGUuIFByb2dyYW1taW5nIDB4RkYgaW4gdGhpcyBjYXNlIHdpbGwgbm90IGFjdHVh
bGx5IGNoYW5nZSB0aGUgTkFORApjZWxscywgYXMgdGhlIGRldmljZSBjYW4gaW5oaWJpdCBwcm9n
cmFtbWluZ+KAlGVpdGhlciBieSByYWlzaW5nIHRoZQpiaXRsaW5lIHZvbHRhZ2Ugb3IgdXNpbmcg
YSBzZWxmLWJvb3N0ZWQgcHJvZ3JhbSBpbmhpYml0IG1lY2hhbmlzbS4KVGhlcmVmb3JlLCBwcm9n
cmFtbWluZyAweEZGIGlzIGEgbm9ybWFsIGFuZCBoYXJtbGVzcyBvcGVyYXRpb24gZm9yIE5BTkQK
Zmxhc2guCgo+Cj4gRG8geW91IGhhdmUgZGF0YSB3aGljaCBwcm92ZXMgdGhlIG9wcG9zaXRlPwoK
SSBhbSBjdXJyZW50bHkgY29sbGVjdGluZyByZWxldmFudCBkYXRhLCBhbmQgd2lsbCBwcmVzZW50
IGl0IG9uY2UgaXQgaXMKcmVhZHkuIFRoYW5rIHlvdS4KCj4KPiBUaGFua3MsCj4gLy9yaWNoYXJk
CgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
