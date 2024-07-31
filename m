Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBCAC3DA7F
	for <linux-mtd@archiver.kernel.org>; Wed, 31 Jul 2024 08:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MbDaSVb5g84JvQr7PgZxFdOOvyYxq1GXzzpnqoUUxI4=; b=coUb2VwC5H4xFc
	j9Kb1a5GSbiWnPx2EffXYmeOJBMVKf8Qow8v+qhE0XyM2dQttTS7RqhKvh/fWk2esDan9gfohiiVn
	t4phWZuv29+8kHlq3cwn3twArCiDQN2zi56LRwy2sAkgRu1rACdbm6wlxpVmMV3LheAN5WT1LWx6B
	z/2h9gBylGRiTH/DsQPhwwHVekcW6bN1niSrE61o5Kil1nD2WfhrGea0oOdQI85d6F5yWujaHERiy
	YDpY+bE0JBa7aeMhbyOQAKNJVVmwBxeIydnUqk2nm0hVT/1ZQLtTGjdBOoYdFIRso+JIX1Qo+m4RO
	aqXu31CkFxiQFQQ3pfQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4hw-00000000JwO-0ICU;
	Wed, 31 Jul 2024 08:29:16 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ4hs-00000000Jv1-3WT9
	for linux-mtd@lists.infradead.org;
	Wed, 31 Jul 2024 08:29:14 +0000
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dfdb6122992so3717943276.3
        for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2024 01:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414550; x=1723019350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFUCt3Bsi1iCqC+jA7TnkhmlNAEuwd86EldupbqR7Rk=;
        b=weLc9BroXI0f2gMqyXUqPHysY8mU0geRaiynBBD9OghKD5e7853zxSO3xu1eum/Dqg
         Ej/nv98X1fjpcSFuoaJTJh7gHTO5ijAz9dbp1oB7yemm3Hi0afC5v+gCFP/tJrjZRbGe
         Mcr+pA0YhbLtFZ5xtwg6cvw107SDR9kRmMf5/nQSt3bM5jUZ22kYiosZpnSGxE28t9Ty
         I7HLCGOXV9ew0/LXx0DlYZS4HfVjcrXr4k3oF8n8dD34BeyOM0iSbMu4vl4073t9L/C8
         BZQXVJB/Ql3wdLsNCBObDt7dXnCKjLTX3EfSOu59J+l3O8dnDKwp+GArnPoapeN7X6ap
         nvcg==
X-Forwarded-Encrypted: i=1; AJvYcCVLSbDVR6z4PRY1vhYVeTcEasMKH6MTKgO2LdL+nVbK15SW6BxD+ETT+TKK7xSIg2i2uynX2Efo2yAJIfviWaWotOfdtpQqUE/TrbcfXA==
X-Gm-Message-State: AOJu0YymAz4BN9M70sa6Zlm5t7oJj8LJN2TrKpRxpNpDvQY5mXAxvcrK
	KqsXT5CNHyoqETx45XNbv8OpdNWEYNF3ehPSpV9GjqxIy5JyLyyeQZZBBknJ
X-Google-Smtp-Source: AGHT+IFwyMaD7i0NS4ApTSkbhIpiP2JAnTI4sa6Scnoxf8s/sLwBVaKsYl1QUKOG+TpqBqfhZ7wSTA==
X-Received: by 2002:a05:6902:280a:b0:e08:80ca:c3dd with SMTP id 3f1490d57ef6-e0b5462c8c8mr12682509276.49.1722414550357;
        Wed, 31 Jul 2024 01:29:10 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b2a93a98dsm2604334276.56.2024.07.31.01.29.09
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 01:29:09 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-682ff2f0e67so16270277b3.1
        for <linux-mtd@lists.infradead.org>; Wed, 31 Jul 2024 01:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfn7+OKvVYlgrwSazO1g/+XolXBUxzJYlIszhskeoA1iy9ex34M7TFOVAA2C9XZ51FNwZgUx2OqRCtoQhlEl86a1QtLAORTqX66tdWVA==
X-Received: by 2002:a05:690c:23c1:b0:615:1cbb:7b81 with SMTP id
 00721157ae682-67a0a60d184mr128759337b3.46.1722414549601; Wed, 31 Jul 2024
 01:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jul 2024 10:28:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWv726HCteiT7V4q_94nNVDkBLStCsm+hrjfJgz_LgyrA@mail.gmail.com>
Message-ID: <CAMuHMdWv726HCteiT7V4q_94nNVDkBLStCsm+hrjfJgz_LgyrA@mail.gmail.com>
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mtd@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_012912_897673_99FCEBDE 
X-CRM114-Status: GOOD (  15.46  )
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

T24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgMTA6MDjigK9BTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+IHdyb3RlOgo+IFRoZSBycGMtaWYtaHlwZXJmbGFzaCBkcml2ZXIgY2Fu
IGJlIGNvbXBpbGVkIGFzIGEgbW9kdWxlLCBidXQgbGFja3MKPiBNT0RVTEVfREVWSUNFX1RBQkxF
KCkgYW5kIHdpbGwgdGhlcmVmb3JlIG5vdCBiZSBsb2FkZWQgYXV0b21hdGljYWxseS4KPiBGaXgg
dGhpcy4KPgo+IEZpeGVzOiA1ZGUxNWI2MTBmNzggKCJtdGQ6IGh5cGVyYnVzOiBhZGQgUmVuZXNh
cyBSUEMtSUYgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCty
ZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExp
bnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1l
ciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
