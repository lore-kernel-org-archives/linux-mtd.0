Return-Path: <SRS0=Zu/5=NR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8875AC432BE
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Aug 2021 05:28:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EF76610C7
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Aug 2021 05:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EF76610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SlDMYZ7MLo/OdfVD1xNVUat7zMGbm5jW+NuRtiZBy+A=; b=X3lNFoFs1kLnfY
	cyR1YG9qgAxRj+j4A/qKBkErrAO9ASw7pXZwpdRRSNipyy2GKNci+a/FYC99GJ1/vZ3lim0E3PKPL
	GP7oXPSFDyDD6jvEvE5MRzCzv583zhoXV1kG38+Qt8+ROFMPBIT76AljyqHmoNIV9BjjZsJa7aPvq
	JoawSp25Mzr+b09I9cx66lpa/SjUs3g2idc39XqVZtXzumu56AhkoSJ0oWEgDP0TV0ztGtLntDsCt
	ZUWbRwqjFz0c3AOKhrk5XE+h8bYJ/qF6nkTb5/TvpoHLEY4j9hrtpr0vSkVCwOxKP6L2RkUskaT9+
	6piPV1SeWcE3A2wgV9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ7vd-009Ctq-DZ; Thu, 26 Aug 2021 05:27:53 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ7vX-009CtG-RV
 for linux-mtd@lists.infradead.org; Thu, 26 Aug 2021 05:27:51 +0000
Received: by mail-qk1-x72d.google.com with SMTP id f22so2112457qkm.5
 for <linux-mtd@lists.infradead.org>; Wed, 25 Aug 2021 22:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Z0kqO64XqRwJ93SOQZVMf7bi4x3MG0LrGr/el2bek3E=;
 b=XC08SiJFTXCsGo0l1acy5AJeO0kFfMLmkWq1hp54YHhwK0oZQx6jMxKcoqWrXq1R89
 HyrdfmEmyI6qXhalHGTFZlYQQZvlAI7BPuE/3T5Lx6vavU44MkybOyCY9kqbXoSB5kCg
 94uQ9j/DwbFXbaiwOQnrfp/gxizFR9OzHowe15c8tfdNG6So4n1FsT99NQopbmv5Q3Wl
 nLcprxghxROPyxM1A7eDZnTRo7n1BkD5nO5xcpukfWe6OV4GyC6qHq3NfgJWxciCcg8u
 8aisqEaMbE3eFVWofBivsKMIzMCV/peFmrinvrjrRkAcOtuzV0SZu22XtD+34DyTFJvz
 cJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Z0kqO64XqRwJ93SOQZVMf7bi4x3MG0LrGr/el2bek3E=;
 b=M3rZNG96qrMWc/wwt57REX7ggHRegDDdNHw8c4qU1+sgpTegvNZnZfi+5F1kq/Xr70
 OcsBcH8TbyRvvPtijR5calB0TikcEwPHeMc5eURp4125pcDi8I3Yy1X32w3GQARSLuHj
 NBw2FqsS4V4i0ENPXeD9JOHMCa66irF0G+GaPpZltz2mjwZOtL1X5sMPTq8yQn23F1Xz
 U9VC2YpUtRdxnZA3LxaIKoe3g2cX6Ic6ARZCFFYghfXNVBcA2puBkabIoSfQIP74FZhp
 VelIv4kfgsY7CamMo/bdR9RHpaMMKUq35zmumuXzz1ivFGnYrFjbHUi76G/GrWCohiBU
 xfWw==
X-Gm-Message-State: AOAM531s0X68cxH14NNaLmrX3y88kK7CWXlbKXBnpd7TbVGMbkHiWJf6
 lwshl+7PusgSD01j5x8Two7B4QwNp2MSEUaiUUo=
X-Google-Smtp-Source: ABdhPJwdmCIXBfygIj0M2gb6CeRPApEGKRXmEUqDifAohMCQW5SnS2pnmtv61z93mUrpXa7eZuSrsHFy7LXljbE/aPo=
X-Received: by 2002:a05:620a:1655:: with SMTP id
 c21mr2099183qko.187.1629955664312; 
 Wed, 25 Aug 2021 22:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210808072643.GA5084@ubuntu> <20210816093126.442f74a1@xps13>
 <CAE9cyGQ+Bb3rQxiF4My9zXwg_+QYifaCckE=C6spAtN9_4dBFQ@mail.gmail.com>
 <20210819100334.6af2d86e@xps13>
 <CAE9cyGSF2vTCptSZd3uMFaZPD=as=PwZY14S+zDhzjWCmsfmpQ@mail.gmail.com>
 <20210823172413.0bc4ab3a@xps13>
 <CAE9cyGTKFcMuxePo2SgxkBe_cWvP5nZ_SDcnuUtwaE5o9oVq3g@mail.gmail.com>
 <20210824192203.076df55e@xps13>
 <CAE9cyGQ9_--=+MGc4_vTV1BkR6jv2RZcixyfLtCozXo349+6KA@mail.gmail.com>
 <20210825105126.4c1c15cb@xps13>
 <CAE9cyGRuoaiTu40Yu0po3dykk1fTq_VkqwNfrQkJq8DR6FPRpw@mail.gmail.com>
 <20210825173114.04ae2b20@xps13>
In-Reply-To: <20210825173114.04ae2b20@xps13>
From: Kestrel seventyfour <kestrelseventyfour@gmail.com>
Date: Thu, 26 Aug 2021 07:27:33 +0200
Message-ID: <CAE9cyGS8iYHqPYmG1nOFoJ=gi-PBtmz_Y37EZRU9jYJwjf-gvA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: rawnand: xway: No hardcoded ECC engine, use
 device tree setting
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_222747_929296_EF50E833 
X-CRM114-Status: GOOD (  51.19  )
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

SGkgTWlxdcOobCwKCkFtIE1pLiwgMjUuIEF1Zy4gMjAyMSB1bSAxNzozMSBVaHIgc2NocmllYiBN
aXF1ZWwgUmF5bmFsCjxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPjoKPgo+ID4gPiA+ID4gPiA+
ID4gdGhhbmsgeW91IGZvciB5b3VyIHJlc3BvbnNlLgo+ID4gPiA+ID4gPiA+ID4gSWYgSSByZW1v
dmUgdGhlIG5hbmQtZWNjLXh4eCBwcm9wZXJ0aWVzIGluIHRoZSBkZXZpY2UgdHJlZSwgdGhlIGRl
dmljZSB3aXRoCj4gPiA+ID4gPiA+ID4gPiB0aGUgVG9zaGliYSBOQU5EIGNoaXAgaXMgd29ya2lu
Zy4gSG93ZXZlciwgdGhlIGRldmljZSB3aXRoIHRoZSBNaWNyb24KPiA+ID4gPiA+ID4gPiA+IE5B
TkQgZmFpbHMgd2l0aCBOTyBFQ0MgZnVuY3Rpb25zIHN1cHBsaWVkOyBoYXJkd2FyZSBFQ0Mgbm90
IHBvc3NpYmxlLAo+ID4gPiA+ID4gPiA+ID4gc2VlbXMgdG8gYmUgYXQgbGluZSA1MzY3IG9yIGVx
dWl2YWxlbnQuCj4gPiA+ID4gPiA+ID4gPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51
eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jI0w1MzY3Cj4g
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gSXQgbG9va3MgbGlrZSB0aGUgbWljcm9uIG5h
bmQgZHJpdmVyIHN1cHBvcnRzIG9uIGRpZSBvbmx5IGlmIGl0cwo+ID4gPiA+ID4gPiA+ID4gc3Bl
Y2lmaWVkIGludCB0aGUKPiA+ID4gPiA+ID4gPiA+IERldmljZSB0cmVlOgo+ID4gPiA+ID4gPiA+
ID4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX21pY3Jvbi5jI0w1MTEKPiA+ID4gPiA+ID4gPiA+IFRoZSBNaWNy
b24gTkFORCBkcml2ZXIgcHJvYmFibHkgbmVlZHMgdG8gc2V0IHRoZSBFQ0MgdHlwZSB0byBPTiBE
SUUgaWYgdGhlCj4gPiA+ID4gPiA+ID4gPiB2YXJpYWJsZSBvbmRpZSBjb250YWlucyB0aGUgc3Vw
cG9ydGVkIGF0dHJpYnV0ZT8hCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBZb3UncmUgcmln
aHQgYnV0IEkgZG9uJ3Qgc2VlIGFueSBlYXN5IHVwc3RyZWFtLWFibGUgc29sdXRpb24gaGVyZS4K
PiA+ID4gPiA+ID4gPiBDaGFuZ2luZyB0aGUgYmVoYXZpb3IgaW4gdGhlIFh3YXkgZHJpdmVyIHdv
dWxkIGNlcnRhaW5seSBicmVhayB1c2VycywKPiA+ID4gPiA+ID4gPiBjaGFuZ2luZyB0aGUgYmVo
YXZpb3IgaW4gdGhlIE1pY3JvbiBkcml2ZXIgd291bGQgY2VydGFpbmx5IGJyZWFrIGV2ZW4KPiA+
ID4gPiA+ID4gPiBtb3JlIHVzZXJzLiBUaGUgcm9vdCBjYXVzZSBiZWluZyBhbiBhYnNlbmNlIG9m
IHByb3BlciBkZXNjcmlwdGlvbiAodGhlCj4gPiA+ID4gPiA+ID4gaW50ZWdyYXRpb24gY2hhbmdl
ZCkuIEhvbmVzdGx5IEkgZmVlbCBzdHVjaywgbWF5YmUgeW91IGNhbiB0cnkgdG8KPiA+ID4gPiA+
ID4gPiByZWdpc3RlciB5b3VyIGRldmljZSwgaWYgaXQgZmFpbHMsIGNoYW5nZSB0aGUgaW50ZWdy
YXRpb24gaW4gdGhlIGRyaXZlcgo+ID4gPiA+ID4gPiA+ICh0byBhbiBvbmRpZSBlY2MgZW5naW5l
KSB0aGVuIHJldHJ5Pwo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gVGhhbmtzLAo+ID4gPiA+
ID4gPiA+IE1pcXXDqGwKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gRG8geW91IHRoaW5rIGFkZGlu
ZyBzb21ldGhpbmcgbGlrZSBiZWxvdyBhdCB0aGUgZm9sbG93aW5nIGxvY2F0aW9uCj4gPiA+ID4g
PiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVy
cy9tdGQvbmFuZC9yYXcveHdheV9uYW5kLmMjTDIyMwo+ID4gPiA+ID4gPiB3b3VsZCBiZSB1cHN0
cmVhbWFibGUgKHdpdGggb3Igd2l0aG91dCBkZXZpY2UgdHJlZSBwcm9wZXJ0eT8pPwo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiAgICAgICAgIGVyciA9IG5hbmRfc2NhbigmZGF0YS0+Y2hpcCwgMSk7
Cj4gPiA+ID4gPiA+ICAgICAgICAgaWYgKGVyciAvKiAmJiBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wo
bnAsICJsYW50aXEscmV0cnktb24tZGllIikgKi8pIHsKPiA+ID4gPiA+ID4gICAgICAgICAgICAg
ICAgIGRhdGEtPmNoaXAuZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfT05f
RElFOwo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZXJyID0gbmFuZF9zY2FuKCZkYXRhLT5j
aGlwLCAxKTsKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgIGlmIChlcnIpIHJldHVybiBlcnI7
Cj4gPiA+ID4gPiA+ICAgICAgICAgfQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJdCBzdGlsbCB0
aHJvd3MgdGhlIGtlcm5lbCB3YXJuaW5nIG9uIGZpcnN0IHRyeSwgYnV0IHRoZSBzZWNvbmQgdHJ5
IHRoZW4gd29ya3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ2FuIHlvdSBwbGVhc2UgcmVtaW5kIG1l
IHdoYXQgaXMgeHdheS9sYW50aXEveW91ciBzZXR1cC9ob3cgcHVibGljIGl0Cj4gPiA+ID4gPiBp
cy93aG8ncyB1c2luZyB0aGlzIGRyaXZlcj8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGFua3MsCj4g
PiA+ID4gPiBNaXF1w6hsCj4gPiA+ID4KPiA+ID4gPiBJdHMgZm9yIE9wZW53cnQsIEkgd291bGQg
bGlrZSB0byBhZGQgc3VwcG9ydCBmb3IgMyBtb3JlIGRldmljZXMKPiA+ID4gPiBBVk0gZnJpdHpi
b3ggMzQ5MC81NDkwIGFuZCA3NDkwLiBUaGV5IGFsbCBoYXZlIHZhcnlpbmcgTkFORCBjaGlwcy4K
PiA+ID4gPiBJIGhhdmUgaW5pdGlhbGx5IGNyZWF0ZWQgYSBQUiB0byBoYXZlIG15IGluaXRpYWwg
cGF0Y2ggdGVzdGVkOgo+ID4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVud3J0L29wZW53cnQv
cHVsbC80NDI2Cj4gPiA+ID4gVGhlcmUgaXMgYWxyZWFkeSBvbmUgZGV2aWNlIHN1cHBvcnRlZCB3
aGljaCBoYXMgdHdvIERUQnMgb25lIGZvcgo+ID4gPiA+IE1pY3JvbiBhbmQgb25lIGZvciBub24g
TWljcm9uICgzMzcwKSwgYnV0IGl0cyBub3QgdmVyeSBzdHJhaWdodCBmb3J3YXJkLgo+ID4gPiA+
IFdpdGhvdXQgaGF2aW5nIHRoaXMgaXNzdWUgc29sdmVkLCBmbGFzaGluZyB0aG9zZSBkZXZpY2Vz
IHdvdWxkIGJlCj4gPiA+ID4gcG9zc2libHkgaGF2aW5nIGlzc3VlcyBkZXBlbmRpbmcgb24gTkFO
RCBjaGlwIG9yIHRoZSBhd2t3YXJkCj4gPiA+ID4gd29ya2Fyb3VuZCBvZiBmbGFzaGluZyBvbmUg
aW1hZ2UgYW5kIGlmIGl0IGRvZXMgbm90IGJvb3QsIGJvb3QgdGhlCj4gPiA+ID4gb3RoZXIgb25l
LiBXaXRob3V0IHNlbGYgc29sZGVyZWQgc2VyaWFsIGNvbnNvbGUsIGl0IHdvdWxkIG5vdCB2ZXJ5
Cj4gPiA+ID4gZWFzeSB0byBmaWd1cmUgb3V0IHRoZSBOQU5EIG1hbnVmYWN0dXJlci4KPiA+ID4g
PiBUaGUgQVZNIHN0b2NrIGZpcm13YXJlIGlzIG9sZCBrZXJuZWwgYW5kIGRvZXMgbm90IHVzZSBk
ZXZpY2UKPiA+ID4gPiB0cmVlIGZvciBOQU5ELCB0aGV5IGp1c3QgcXVlcnkgYWxsIHBvc3NpYmxl
IG1hbnVmYWN0dXJlcnMgYW5kIHNldAo+ID4gPiA+IHVwIE5BTkQgYmFzZWQgb24gbWFudWZhY3R1
cmVyIHF1ZXJ5Lgo+ID4gPgo+ID4gPiBCdXQgaW4gdGhpcyBjYXNlIGNhbid0IHlvdSBjaGVjayB0
aGUgJ3Jvb3QnIGNvbXBhdGlibGUgYWdhaW5zdCBjZXJ0YWluCj4gPiA+IHZhbHVlcyBhbmQgYW5k
IHNvbWUga2luZCBvZiBxdWlyayBpbiB0aGUgLT5hdHRhY2goKSBob29rIHRvIHVwZGF0ZSB0aGUK
PiA+ID4gRUNDIGVuZ2luZSB0byB0aGUgcmlnaHQgb25lPwo+ID4gPgo+ID4gPiBUaGFua3MsCj4g
PiA+IE1pcXXDqGwKPiA+Cj4gPiBtYXliZSBJIHdyb3RlIHRoZSB3cm9uZyB0aGluZywgYnV0IHdo
YXQgZG8geW91IG1lYW4gd2l0aCByb290IGNvbXBhdGlibGUuCj4gPiBUaGUgY29udHJvbGxlciBp
cyBhbHdheXMgTkFORCB4d2F5IGFuZCBJIHRoaW5rIHRoZXJlIGFyZSA0IGRpZmZlcmVudAo+ID4g
TkFORCBjaGlwIHR5cGVzLiBCdXQgdGhlIHN0b2NrIGZpcm13YXJlIGp1c3QgcXVlcmllcyB0aGUg
TkFORAo+ID4gbWFudWZhY3R1cmVyIG5hbWUsIG5vdCBhIGRhdGUgb3IgdHlwZS9tb2RlbCBvZiB0
aGUgZGV2aWNlcy4gRS5nLiA3NDkwIGNhbgo+ID4gaGF2ZSBNaWNyb24gb3IgTWFjcm9uaXggTkFO
RCwgYnV0IHF1ZXJ5aW5nIHRoZSBNaWNyb24gaWQgb3IgTWFjcm9uaXgKPiA+IGlkIHJlcXVpcmVz
IGEgY2hhbmdlIHRvIHRoZSB4d2F5IGRyaXZlcj8KPiA+IERvIHlvdSBtZWFuIHNvbWV0aGluZyBs
aWtlIGluIHRoZSBmaXJzdCBwYXRjaCBkbyBxdWVyeSB0aGUgbWFudWZhY3R1cmVyCj4gPiBidXQg
anVzdCBmb3IgYWxsIHRoZSA0Pwo+ID4KPiA+IFRoYW5rcywgRGFuaWVsLgo+Cj4gWW91IHdlcmUg
dGFsa2luZyBhYm91dCBuZXcgYm9hcmRzLCBpZiwgb24gZWFjaCBvZiB0aGVzZSBib2FyZHMsIHlv
dQo+IGtub3cgd2hhdCBpcyB0aGUgTkFORCBjaGlwLCB5b3UgY291bGQgcmV0cmlldmUgdGhlIHJv
b3QgY29tcGF0aWJsZSAoYnkKPiByb290IEkgbWVhbiB0aGUgb25lIGF0IHRoZSByb290IG9mIHRo
ZSB0cmVlIC8geyB9IGluIHRoZSBEVCkgYW5kCj4gZGVwZW5kaW5nIG9uIGl0IGNoYW5nZSB0aGUg
RUNDIGVuZ2luZSB0aGF0IG11c3QgYmUgdXNlZCBmcm9tIHRoZSBkcml2ZXIKPiBpdHNlbGYuCj4K
Pgo+IFRoYW5rcywKPiBNaXF1w6hsCgpUaGUgYm9hcmRzIGFyZSBub3Qgc3VwcG9ydGVkIHlldCBp
biBPcGVuV3J0IGFuZCB0aGVyZSBpcyB0aGUKZXhpc3RpbmcgZnJpdHpib3ggMzM3MC4gRnJpdHpi
b3ggNzQ5MCBmaXJzdCBtYW51ZmFjdHVyZSBkYXRlIHdhcyAyMDEzLgpBcyBJIHN0YXRlZCB0aGUg
NzQ5MCBjYW4gaGF2ZSBlaXRoZXIgTWljcm9uIG9yIE1hY3Jvbml4IE5BTkQgd2l0aApubyBpbmRp
Y2F0b3IuIEkgd2FzIGp1c3QgaG9waW5nIHRoZXJlIGlzIGEgZHluYW1pYyB3YXkgdG8gc3VwcG9y
dApib3RoIE5BTkQgY2hpcHMgd2l0aG91dCBoYXZpbmcgdG8gYnVpbGQgdHdvIGRpZmZlcmVudCBp
bWFnZXMgd2l0aCB0d28KZGlmZmVyZW50IERUQnMuIEZvciB0aGlzIGNhc2UsIERUQiBpcyB0b28g
c3RhdGljLgoKVGhhbmtzLCBEYW5pZWwuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
