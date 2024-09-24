Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C0CF9C5B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Sep 2024 03:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fAXtMaDjHxGEPA0IqLrDQ2HrG6+7YTsHirhWRf5XIAk=; b=HBuKop++p2rFTf
	PfSrikiSSCfU8UQgOdO4VTq776RK5H4/gBnoZMSs+lT2P4g/dsx7APdWYjBZQsvSpE0gmcXZqt1p4
	cufnZqoCjWnxRCOlOpZfJekLaQMyXbSNQb00A1z2fUO9aNiODVSyXaiXBeM9j1rY5NAILcOR4sfvS
	B0D7RXq+dqAT8VUU4ayd3Wzpqvsiaie2L1MlrqQIFPmstIyTHwbqH1k+ol8CxFwQ8RL3NxeQNMrxM
	+8Orchg5NInN/Nvm5r3At+hz941TWMD/U4p0iIrK5nBwh/taaFx/XlK3+CcPsTbebYNmhWyn751st
	p/8TROX6hR1voPY1jh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sswCA-00000000ybN-2bAz;
	Tue, 24 Sep 2024 03:26:34 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sswC7-00000000yaf-2zzi
	for linux-mtd@lists.infradead.org;
	Tue, 24 Sep 2024 03:26:32 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a7a843bef98so676422866b.2
        for <linux-mtd@lists.infradead.org>; Mon, 23 Sep 2024 20:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727148389; x=1727753189; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=56PjDxigXVOIzQ1oNphT+JNMfW878D/s9pl7IGdWoto=;
        b=anoTL4f9x7wdWYNfLLq+Z35Q2sYmwRHQIFfBGOqIuHepyS1p10AzJUz0eBXNcr4gsD
         2kto6o690Dvkuc+Y1IX4M38Cj4p7QUXIrp487NcGeNQ7BETMb8x17J6HA2lM6Dmkp48v
         Rxm4/P8nTOoNEXszc6IIiUA7zTTU75HoZtkO0C/VkZHOIeqWmvGkGoGd0+WrPr+HJuT2
         O720ZxgxSM4GqvIFrAAAwcy843fS9hf42kdjW1TB7LVUfE7IzFJ8lCOaooeXABfgFlh/
         PbV4GSqad+fJ0GO2tgnpstkucWukFUeljY6Y4Jqe3+r4BOzHGfHLpGUUTjXaj3Vq0DSl
         oaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727148389; x=1727753189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=56PjDxigXVOIzQ1oNphT+JNMfW878D/s9pl7IGdWoto=;
        b=KxjPUGeO73QQIzEL6891YWVsIyqRIwXa2derQrfKGK3NTuiKZf6aGScULzwd5KndJl
         tbawlG8Vjiit16Zm1WeIfOQ66f8auANvH3xKG2BpXlxy6ueGzbgv6HZwHYNOn3Egi42h
         noH2xdfmdYMcgDIEcIdlXv8MmrWQ6d7oq/heI2ItbGbJGy3kGCcOdbwyMYAuiNMzbykI
         Tt3h/VyCDMzAanoN/WIpuVtHYBRQLgBMoOy1dbajZS1KxWljM6F5+Pzo9Hxu4ddV8m2O
         uuJ93zxQjxtTCEI6y+29EWvVfNvkE5R8QHK3CxsUFOXdM+jZWzPu8xLJNdOvURONBfwV
         3fEQ==
X-Gm-Message-State: AOJu0YwYlqVeu8ONpWiR4rH6npuDXEidKuDpqLkDK0rxsMesvTX+3g4r
	iacPvGvTxEw3n+3rbRN8NFph+8oXNxCcd3C9PKbceFD0s8lq4BMcakodlBSSG/xyte5S3G7tds1
	IaXBURHNaagYNQJpHPHPv1A0OhXs=
X-Google-Smtp-Source: AGHT+IGhbAJwqXzVtJkfn2cS/fzTwtEm2nUykTxtIPRIuWSQCFK/QHe70KrLsbuDrVEt9/2u3Glg6ejNSJlGt4J1q+k=
X-Received: by 2002:a17:907:f148:b0:a86:700f:93c0 with SMTP id
 a640c23a62f3a-a90d504f5c6mr1240193466b.35.1727148389175; Mon, 23 Sep 2024
 20:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240718034614.484018-1-alvinzhou.tw@gmail.com>
 <20240718034614.484018-7-alvinzhou.tw@gmail.com> <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
In-Reply-To: <97134efb-398d-4c21-a915-87a5b4f1b29a@linaro.org>
From: Alvin Zhou <alvinzhou.tw@gmail.com>
Date: Tue, 24 Sep 2024 11:25:34 +0800
Message-ID: <CAPhrvRR3U9=0DuG_FQ81ZJq+RLe6Bn9YO831Mx2n3NkeV3MCdA@mail.gmail.com>
Subject: Re: [PATCH v9 6/6] mtd: spi-nor: add support for Macronix Octal flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, pratyush@kernel.org, mwalle@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	broonie@kernel.org, chengminglin@mxic.com.tw, leoyu@mxic.com.tw, 
	AlvinZhou <alvinzhou@mxic.com.tw>, JaimeLiao <jaimeliao@mxic.com.tw>, 
	Bough Chen <haibo.chen@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_202631_775714_CBBFE8D1 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgVHVkb3IsCgpUdWRvciBBbWJhcnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+IOaWvCAy
MDI05bm0OeaciDIz5pelIOmAseS4gCDkuIvljYgyOjU05a+r6YGT77yaCj4KPiBIaSwgQWx2aW4s
Cj4KPiBJIHF1aWNrbHkgc2tpbW1lZCBvdmVyIHRoZSBwcmV2aW91cyA1IHBhdGNoZXMgYW5kIHRo
ZXkgYXJlIGxvb2tpbmcgZmluZS4KPgo+IEkgZG9uJ3QgZ2V0IHRoaXMgcGF0Y2ggaG93ZXZlci4K
Pgo+IE9uIDcvMTgvMjQgNDo0NiBBTSwgQWx2aW5aaG91IHdyb3RlOgo+ID4gRnJvbTogQWx2aW5a
aG91IDxhbHZpbnpob3VAbXhpYy5jb20udHc+Cj4gPgo+ID4gQWRkaW5nIE1hbnVmYWN0dXJlIElE
IDB4QzIgaW4gbGFzdCBvZiBJRCB0YWJsZSBiZWNhdXNlIG9mCj4gPiBPY3RhbCBGbGFzaCBuZWVk
IG1hbnVmYWN0dXJlciBmaXh1cCBmb3IgZW5hYmxpbmcvZGlzYWJsaW5nCj4gPiBPY3RhbCBEVFIg
bW9kZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWltZUxpYW8gPGphaW1lbGlhb0BteGljLmNv
bS50dz4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsdmluWmhvdSA8YWx2aW56aG91QG14aWMuY29tLnR3
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jIHwgNCArKystCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMgYi9kcml2ZXJzL210
ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+IGluZGV4IGYwMzk4MTlhNTI1Mi4uMWE4Y2NlYmRmZTBl
IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gPiArKysg
Yi9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMKPiA+IEBAIC0yMDAsNyArMjAwLDkgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIG1hY3Jvbml4X25vcl9wYXJ0c1tdID0gewo+
ID4gICAgICAgICAgICAgICAubmFtZSA9ICJteDI1bDMyNTVlIiwKPiA+ICAgICAgICAgICAgICAg
LnNpemUgPSBTWl80TSwKPiA+ICAgICAgICAgICAgICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRL
LAo+ID4gLSAgICAgfQo+ID4gKyAgICAgfSwKPiA+ICsgICAgIC8qIE5lZWQgdGhlIG1hbnVmYWN0
dXJlciBmaXh1cHMsIEtlZXAgdGhpcyBsYXN0ICovCj4gPiArICAgICB7IC5pZCA9IFNOT1JfSUQo
MHhjMikgfQo+ID4gIH07Cj4gPgo+Cj4gQ291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgd2h5IHlv
dSBuZWVkIGp1c3QgdGhlIG1hbnVmYWN0dXJlciBpZCBoZXJlPyBJCj4gd291bGQgaGF2ZSBleHBl
Y3RlZCB0byBzZWUgYSBzcGVjaWZpYyBmbGFzaCBlbnRyeSBpbnN0ZWFkLgoKR3JhdGVmdWwgdG8g
TWljaGFlbCBmb3IgdGhlIHZhbHVhYmxlIHN1Z2dlc3Rpb24uIFRoaXMgYWRkaXRpb24gb2YgdGhl
Ck1hY3Jvbml4IG1hbnVmYWN0dXJlciBJRCBlbmFibGVzIHRoZSBmaXh1cCBmdW5jdGlvbnMgc3Vj
aCBhcwptYWNyb25peF9ub3Jfc2V0X29jdGFsX2R0ciB0byBiZSBleGVjdXRlZCB3aXRob3V0IHRo
ZSBuZWVkIHRvCmNyZWF0ZSBzZXBhcmF0ZSBJRCBlbnRyaWVzIGZvciBlYWNoIE9jdGFsIERUUiBO
T1IgRmxhc2ggaW4gdGhlCmZsYXNoX2luZm8uCgo+Cj4gVGhhbmtzLAo+IHRhCgpUaGFua3MsCkFs
dmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
