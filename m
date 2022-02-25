Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8894C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 16:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnDjmfxYsQbf2gqYvlE7gHjndajy8u2RdopwLO7kSEU=; b=ZobafTeqwzrdOS
	VQR/KMoGWPQl6Hzjoaccfmg/Ix1+LAh3BgMCVmH8taNfT96RClN31NG3t1B472CoxN4ajfULhxJZS
	K1l4PkaPblxGvbD/oRiIhZmUJW40dLsUQEvXtw6iXs3nd230hVT6fZFrl22cyLg7gCfFWjvcpl0Qm
	ypyMDak1CJG+jAKFCQ5Pt0+CyUOy9MjKqg6CplK+YP3Q3PZjxTFovN29C9aOT/iNQ/Erx557CzU4u
	TKQOqS+X5fatE5TpWYCsGpGhftQW89fv6MzmevJRr1MOIbFHS1JpA0P/XnWEqV64cGFiPBXXWeBog
	iFcg8YoYh5H46C5tj5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdRW-005uhx-1m; Fri, 25 Feb 2022 16:27:42 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdRT-005ugs-5b
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 16:27:40 +0000
Received: by mail-oi1-f175.google.com with SMTP id z7so7980940oid.4
 for <linux-mtd@lists.infradead.org>; Fri, 25 Feb 2022 08:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b6mqfRniL+r9ZpfUJSShReJE7UNxaIRMnvl0KB1bI/8=;
 b=7P9t4k0HD2FoLYxrXF3L41SBQpK27ZjJetQCHqcotEFG3h1ZgdIEJjXy3nReafWy4t
 h6dfey0wKAhZedo9VqzPIoUoAOVsWYYLco67kqQzoFFOrrcrUHdpABUNK48MeJJB8Xer
 hdG++sNYm8A0SKNJA86vdRpSR/FZx8I39+p9jt44ZZ1ofu/Nhg9QOlDLBiXB8967vFcU
 3Ro8uVm5gQCSBwuVtfJsSDkdxXxUOtQJqcfs/7T75ZyjU8mPSmhYJmVcmL0M/iw64hAo
 aTdfSN5BdkpoFaV4Nj4TqmoFNyhz2FAyVQA6SJoFV7hhzaPz+4S2tdPaAWWPZoNanL36
 FdDg==
X-Gm-Message-State: AOAM533u7J4Jk41mk44Yuol/X0p2Sc1Nl592ONwaAvDNuSDRS/N85OnJ
 tRZmiLFKn0W/UuqsY8y2Og==
X-Google-Smtp-Source: ABdhPJxYB88wiXpqrYy/re0vBGeWP38Ml9w47xUbbgBDbaP3bcnxEAiC4IXzF8XzZuh29hI+Zbp2wg==
X-Received: by 2002:a05:6808:202a:b0:2d4:df36:68a4 with SMTP id
 q42-20020a056808202a00b002d4df3668a4mr2012574oiw.16.1645806457796; 
 Fri, 25 Feb 2022 08:27:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 x12-20020a056830244c00b005ad233e0ba3sm1304298otr.48.2022.02.25.08.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 08:27:37 -0800 (PST)
Received: (nullmailer pid 1040968 invoked by uid 1000);
 Fri, 25 Feb 2022 16:27:35 -0000
Date: Fri, 25 Feb 2022 10:27:35 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: mtd: partitions: convert BCM47xx to the
 json-schema
Message-ID: <YhkDd2CF3VhTkn9W@robh.at.kernel.org>
References: <20220216104135.31307-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216104135.31307-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_082739_233808_E883AB29 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCAxNiBGZWIgMjAyMiAxMTo0MTozNSArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBUaGlzIGhl
bHBzIHZhbGlkYXRpbmcgRFRTIGZpbGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWC
ZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiAgLi4uL2JyY20sYmNtOTQ3eHgtY2ZlLXBh
cnRpdGlvbnMudHh0ICAgICAgICAgIHwgNDIgLS0tLS0tLS0tLS0tLS0tLQo+ICAuLi4vYnJjbSxi
Y205NDd4eC1jZmUtcGFydGl0aW9ucy55YW1sICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysr
KysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0p
Cj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bXRkL3BhcnRpdGlvbnMvYnJjbSxiY205NDd4eC1jZmUtcGFydGl0aW9ucy50eHQKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0
aW9ucy9icmNtLGJjbTk0N3h4LWNmZS1wYXJ0aXRpb25zLnlhbWwKPiAKClJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
