Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2D7D41D6E
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Nov 2024 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vlesl94CoBmzBcQIr+s+6tKvbcVL9ePWf3oewawY9hU=; b=tOkB24jiKQ2mfu
	rNTeAxITvRSn9Y5dQ6YZG6ASl7zunAMIoCRAdFNVKhSgjzRjZqZGCNxTTNnMRt02aEjAub9qxMV7O
	Rw40G1dqwFhzQ2kEPVgpkEz7YONlMuNe92D9xR8+/K7Afk6O9oj9iKiTeB7dQcTzy03rJJls/xKla
	BpM2sIm6y/VVmSYyMVLenkLfcTdnjb7xVteAfjq5qT018t8KJWicGsXnm/RrfJUUCsvvlISUJYwMI
	mTSiDzBZEojG9cCAizoLmwnH74miDk4yj5ZTNSzEYWCIPs9nFkLFwkb8+TssQp1PJaNsMLL5xBO9j
	pk+JUtmHlSfdUOdeJk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmbi-00000002hml-29pu;
	Tue, 12 Nov 2024 08:50:42 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmVq-00000002gWL-3Vul
	for linux-mtd@lists.infradead.org;
	Tue, 12 Nov 2024 08:44:40 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2e9ecba5db0so25698a91.2
        for <linux-mtd@lists.infradead.org>; Tue, 12 Nov 2024 00:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731401078; x=1732005878; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD4NIRuOoXRobK8tLpSsUdKa4VS1TCAcZTdPI0rPzvM=;
        b=C7rBhkJmLtMe4xCbogKuNGnoE/dkBMircp/VWjWJeDYIYqPBK86A6Qa+20NF1ObFdS
         /VE9rlG3Aw3N/D30f2weYKcvPhRJLDoRHfRfJDOFpzLcGfXtZIMfYtXQHmDP0sjaRf+r
         9r7Q3LxxjhKIPwbkrHbXiIzDyZUBMUpgklxzlufXCvjqSgVu7zqfy0mhhNLvks23phrp
         iDRGlz2o8ajVmoSlKbSiAyI0FLbXDOWcISg2p00XNeeVL1Bk05Tm+9ArxQ6XGGwZLCu+
         o0sn4tUP4aUZSbZwfnOvPjeFIvD23OQZvJYtMXv9aSR0Snos5xydCowYm3MqGCSVYChN
         8SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731401078; x=1732005878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oD4NIRuOoXRobK8tLpSsUdKa4VS1TCAcZTdPI0rPzvM=;
        b=DBI3tw6xB8cm2yLB9Mf0oKJNhBqUSCbDX5SsJxaN637wM1zAQsr4r5niQfTTQURPDC
         JY0NIqE6Slwu5wbQzDmVh19bWnZtHrm6+LUBMV3afRxapmVghvhXIMtzC51SeNd+7aXw
         fwbdM3Jw7E4Pm5cAEFTkyg9eLmJSKKawb8znQpz4A2risOFez+bnpK+oxmcyWF/cBB8W
         ph2jNj7irggITPpCqr2O4cPOoDQxEesKBTl3jAWvVDcjzmEBe6IdslOoLUA93UJVmDzr
         Ea5xw4xmgjCCQcyFhbSXB1LbJJvfLKz5L+1ANCtd1179+0R82kF/aiFvmVdE/u6UnMBE
         yzCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZGLZnHNpwO5ZEHLvLMvcaHfZP0jVHAg0DO4HAjcTSJWuw847ZieixNBjHVr0XdYq/Wz/vnK6pO/w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyrl97sHvcShbpbE0KXC9j7DXwkjRpo7hqCK95pW+SHsJdx1GwN
	HMUa9nZlBaZUD1sZXA11nQsORHWVhc8tkyEZ4p1YzD8vSqd5qWZCeFn1qCvan3Sf5TiPwAPP9F4
	3W5tn7Iuqr0KsmkbLFeEcaYtKf9o=
X-Google-Smtp-Source: AGHT+IGsff7MKvhLoRG2gVSj8fo7XNYdpobns2uwXFgoCm4PNAZd80nuMUrpdvdlq7MmwiENpeH/P66waFagEQjNc5w=
X-Received: by 2002:a17:90b:4d0d:b0:2e2:8bce:3d02 with SMTP id
 98e67ed59e1d1-2e9b177bacemr20975458a91.30.1731401078025; Tue, 12 Nov 2024
 00:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20241112075242.174010-1-linchengming884@gmail.com> <173140050742.5304.12768268448288985195.b4-ty@linaro.org>
In-Reply-To: <173140050742.5304.12768268448288985195.b4-ty@linaro.org>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Tue, 12 Nov 2024 16:43:48 +0800
Message-ID: <CAAyq3Sb05UjF2E86B_R_9q8Xmtjqx1TovhkPWRiHRq_O5yj4UA@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] mtd: spi-nor: core: replace dummy buswidth from
 addr to data
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw, 
	Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_004438_898880_43798115 
X-CRM114-Status: GOOD (  12.35  )
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
MDI05bm0MTHmnIgxMuaXpSDpgLHkuowg5LiL5Y2INDozNuWvq+mBk++8mgo+Cj4gT24gVHVlLCAx
MiBOb3YgMjAyNCAxNTo1Mjo0MSArMDgwMCwgQ2hlbmcgTWluZyBMaW4gd3JvdGU6Cj4gPiBTZXQg
dGhlIGR1bW15IGJ1c3dpZHRoIHRvIG1hdGNoIHRoZSBkYXRhIGJ1c3dpZHRoLgo+ID4KPiA+IHYy
Ogo+ID4gKiBBZGQgZml4ZXMgdGFnIGFuZCBjYyB0byBzdGFibGUuCj4gPgo+ID4gQ2hlbmcgTWlu
ZyBMaW4gKDEpOgo+ID4gICBtdGQ6IHNwaS1ub3I6IGNvcmU6IHJlcGxhY2UgZHVtbXkgYnVzd2lk
dGggZnJvbSBhZGRyIHRvIGRhdGEKPiA+Cj4gPiBbLi4uXQo+Cj4gWW91IGhhZCBzb21lIHdhcm5p
bmdzIHdoaWNoIEkgZml4ZWQgd2hpbGUgYXBwbHlpbmc6CgpJIGFwb2xvZ2l6ZSBmb3Igb3Zlcmxv
b2tpbmcgdGhhdCwgYW5kIHRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgaGVscC4KCj4gV0FS
TklORzogUGxlYXNlIHVzZSBjb3JyZWN0IEZpeGVzOiBzdHlsZSAnRml4ZXM6IDwxMiBjaGFycyBv
ZiBzaGExPiAoIjx0aXRsZSBsaW5lPiIpJyAtIGllOiAnRml4ZXM6IDBlMzBmNDcyMzJhYiAoIm10
ZDogc3BpLW5vcjogYWRkIHN1cHBvcnQgZm9yIERUUiBwcm90b2NvbCIpJwo+ICMxOToKPiBGaXhl
czogMGUzMGY0NzIzMmFiNSAoIm10ZDogc3BpLW5vcjogYWRkIHN1cHBvcnQgZm9yIERUUiBwcm90
b2NvbCIpCj4KPiBXQVJOSU5HOiBOb24tc3RhbmRhcmQgc2lnbmF0dXJlOiAnUmV2aWV3ZC1ieTon
IC0gcGVyaGFwcyAnUmV2aWV3ZWQtYnk6Jz8KPiAjMjE6Cj4gUmV2aWV3ZC1ieTogUHJhdHl1c2gg
WWFkYXYgPHByYXR5dXNoQGtlcm5lbC5vcmc+Cj4KPiBBcHBsaWVkIHRvIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9tdGQvbGludXguZ2l0LAo+IHNwaS1ub3Iv
bmV4dCBicmFuY2guIFRoYW5rcyEKPgo+IFsxLzFdIG10ZDogc3BpLW5vcjogY29yZTogcmVwbGFj
ZSBkdW1teSBidXN3aWR0aCBmcm9tIGFkZHIgdG8gZGF0YQo+ICAgICAgIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvbXRkL2MvOThkMWZiOTRjZTc1Cj4KPiBDaGVlcnMsCj4gLS0KPiBUdWRvciBBbWJh
cnVzIDx0dWRvci5hbWJhcnVzQGxpbmFyby5vcmc+CgpUaGFua3MsCkNoZW5nIE1pbmcgTGluCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
