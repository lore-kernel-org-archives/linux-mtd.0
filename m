Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072D5C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Oct 2022 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LX6ccz/RbNhWL6ti0DpXqpajPBdcaptbGGc89SR2Fq0=; b=kFw2WoepAuDwpP
	hnWe8eRPn7iE05MT1Eu2JKpnE98bKdRgiQ8Gj9CUGPye/rPgnHlUsJ6OlV5qjOMWLDkFeTRMcb3rV
	rS/u188nwvDyjJqRmclyz5ulUI78zKjF5Dw/Tlsh65JnIgyv4kO9fPtp+tCbninU3MZRjlA921vDW
	WQzSxZWA6KbQwmZWiLRlzQha8P7ZtZE9QBWEDmzwi4Jykb9x4nR1TkbW+2SfdMJXVWqtEdlKqFmhp
	nHpFDOrycBBHjFRjTAArGpbcaJJCvOEHLbJjDHLwRVNHAJ0VhiYmLdWjHQ7VB7u/0nVh2s9hL0Cy9
	SMTT0voDdCP/0mxpxNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okUuM-00EICw-Lk; Mon, 17 Oct 2022 18:32:14 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okUuJ-00EIB3-Hb; Mon, 17 Oct 2022 18:32:12 +0000
Received: by mail-ot1-f53.google.com with SMTP id r13-20020a056830418d00b0065601df69c0so6297390otu.7;
        Mon, 17 Oct 2022 11:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4KBKSBI/F2weccO+8vpMaQLojrwtOI7PJEtNGMBbv8=;
        b=fnJaoP2a+bLED/OKOv9hwR/zduhORqy6ZA9W65OTFWqz3DZd6JXlrm8cBFIfjsKiTp
         6wchY1rjghWCBNF0iwCgR1cKJpoQnji3qZu72C5p3raaZjjB4dLZ3FWvD5Ssnm30QbdN
         XCgWZ7rn5L0p3Zm/W9+NaOejdnmDfK2rkCQFwEiTRse5wHmJXg4FHSiSUXxIxKxnRUmB
         35rkWwLGWLXv++1OZuaDEYIop3dbsUvksUFWyW4wpMAwb20PcrpJoWMkmeDZVWmUQZ2J
         jajIzjAdUNfLg8+43CRBBx72l9jGQQ1X1lR/iV/NqVcaXwypuz7/qpszHqtroAWf9CKg
         Yslg==
X-Gm-Message-State: ACrzQf1r5CdSxyxbmqhoQ3TIDlJNEW8jmgpYNo57fuNsh2GGSkNmRNJW
	DSyscfJ2YiX5gXQsxQhNOw==
X-Google-Smtp-Source: AMsMyM7ovuhrFJCmyacsMdvY9jbycE7gO4OGU8WmReWBvQJS/W8Dc2fQZBZQVAyGeUjYqjO+vSZ5SA==
X-Received: by 2002:a9d:4b02:0:b0:661:b51b:d1f5 with SMTP id q2-20020a9d4b02000000b00661b51bd1f5mr5729804otf.45.1666031524698;
        Mon, 17 Oct 2022 11:32:04 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t18-20020a9d7f92000000b00660fe564e12sm4936549otp.58.2022.10.17.11.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 11:32:04 -0700 (PDT)
Received: (nullmailer pid 2252177 invoked by uid 1000);
	Mon, 17 Oct 2022 18:32:04 -0000
Date: Mon, 17 Oct 2022 13:32:04 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Hauke Mehrtens <hauke@hauke-m.de>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, John Crispin <john@phrozen.org>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, Richard Weinberger <richard@nod.at>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: add TP-Link
 SafeLoader layout
Message-ID: <166603152420.2252138.6710200769138696652.robh@kernel.org>
References: <20221015092950.27467-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221015092950.27467-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_113211_602376_7F71ADE4 
X-CRM114-Status: GOOD (  14.92  )
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

T24gU2F0LCAxNSBPY3QgMjAyMiAxMToyOTo0OSArMDIwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBNb3N0IFRQ
LUxpbmsgaG9tZSByb3V0ZXJzIHVzZSB0aGUgc2FtZSBwYXJ0aXRpb25pbmcgc3lzdGVtIGJhc2Vk
IG9uIGEKPiBjdXN0b20gQVNDSUkgdGFibGUuCj4gCj4gSXQgZG9lc24ndCBzZWVtIHRvIGhhdmUg
YW55IG9mZmljaWFsIG5hbWUuIEdQTCBzb3VyY2VzIGNvbnRhaW4gdG9vbAo+IG5hbWVkIHNpbXBs
eSAibWFrZV9mbGFzaCIgYW5kIE1ha2VmaWxlIHRhcmdldCAiRmxhc2hNYWtlciIuCj4gCj4gVGhp
cyBwYXJ0aXRpb25zIHRhYmxlIGZvcm1hdCB3YXMgZmlyc3QgZm91bmQgaW4gZGV2aWNlcyB3aXRo
IGEgY3VzdG9tCj4gU2FmZUxvYWRlciBib290bG9hZGVyIHNvIGl0IHdhcyBjYWxsZWQgU2FmZUxv
YWRlciBieSBhIGNvbW11bml0eS4gTGF0ZXIKPiBpdCB3YXMgcG9ydGVkIHRvIG90aGVyIGJvb3Rs
b2FkZXJzIGJ1dCBpdCBzZWVtcyB0aGUgbmFtZSBzdGlja2VkLgo+IAo+IEFkZCBiaW5kaW5nIGZv
ciBkZXNjcmliaW5nIGZsYXNoZXMgd2l0aCBTYWZlTG9hZGVyIHBhcnRpdGlvbnMgdGFibGUuIEl0
Cj4gYWxsb3dzIG9wZXJhdGluZyBzeXN0ZW1zIHRvIHBhcnNlIGl0IHByb3Blcmx5IGFuZCByZWdp
c3RlciBwcm9wZXIgZmxhc2gKPiBsYXlvdXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IFYyOiBGaXggdHlwbyBpbiBjb21taXQ6
IHMvc2FtZS9uYW1lLwo+IFYzOiBEcm9wIHF1b3RlcyBmcm9tICRyZWYKPiAgICAgRGVzY3JpYmUg
Zmxhc2ggc3BhY2UgY292ZXJhZ2UgJiBwYXJ0aXRpb25zIHR5cGVzIGluIHRoZSBiaW5kaW5nCj4g
ICAgIFNlZSBjb21taXQgYm9keSBvZiBQQVRDSCAyLzIgZm9yIHJlYWwgbGlmZSBleGFtcGxlCj4g
LS0tCj4gIC4uLi90cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwgICAgICAgICB8IDQ5
ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcGFydGl0aW9ucy90cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwKPiAKClJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
