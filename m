Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CE4C4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Oct 2022 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlXb8mapm4pxBw3U7ZPp6EMdQJx+LgJCR3jP4WKbC74=; b=A0ybq1IxNmwYhY
	rUq+gABqZj+1j5AWelZwVcGkp+9C3leMeDRPUhX4HZOQwnBCNWXyY+0LGlrBZKk/hv8bUhqGaOQmF
	jFIsePGkX1Tfey5jznU2pUrqh/6vJ3EEByTyQTKB3yu5Oq6pGh4kNfw/f8V28GeKsTm9T1VUENtSl
	mNUk66u7pNUtulNdkddIXvy2lt299CoW7YWMlKLdaG8tgP+wWLtoQqRDi/DFWeB1IzgVQJObkOcZP
	YT78q48Hk6gqNlSMpoMATRynHNahAU78USt/HzXKtx/Qvl/LKT/4qQUZD4j/4LA06it54+b6JSg+D
	jBE0AVAWJSyRSxJWArdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oieTy-008f5v-JT; Wed, 12 Oct 2022 16:21:22 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oieTu-008f52-26; Wed, 12 Oct 2022 16:21:19 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-131dda37dddso20074261fac.0;
        Wed, 12 Oct 2022 09:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdkjtjQe9y7QrqNfE9DE704tTUxuuSLHdhelufYZEXY=;
        b=5VGB22RQ6jG8NzjwIMeCLDYsIKcVt0y5IWHqDqstM9kJ+ZNdVDHkILgMFukMDE8v07
         2TWSXbodprMkwnzrrg/mzKFWsK+Wy3oKNPhPokL58M3rURFthQEVhgEF7PkgEy7Ph0ep
         h4ePrv7a8F+eteDBrw9UwdYxCs7UQpOLIxiGCo8xGuc8Dmz5HHv+tFQeIQMRH2LHhseO
         kJEXlfyiHC7UXT2TmtzMT2A7nb+UJMe0vt0IFojPNoSXDkxX5sLOZQfu89hDaVHgShtS
         DptwR9oLHSOf6cKXpVhZbK07WZFM5h68CXALXTfwQ4oT8PMfZdplEibojz2GWOpBXOMM
         OnBA==
X-Gm-Message-State: ACrzQf2d29CX0+wKOmQshz9GZJ8qFCd5FwE6dr5xbS1hKAZAM0eU0xlK
	A/nojXtPvHzovOHbcjcf5w==
X-Google-Smtp-Source: AMsMyM7nAruUoSXYjluWMGl/KdX94bPKk33igtUxV/7Po/YMVByuG51WIBady0DgwT4LlWbabg9ulQ==
X-Received: by 2002:a05:6870:eaaa:b0:132:e501:4053 with SMTP id s42-20020a056870eaaa00b00132e5014053mr3005462oap.186.1665591676702;
        Wed, 12 Oct 2022 09:21:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ek19-20020a056870f61300b0012c52bd4369sm1335901oab.19.2022.10.12.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:21:16 -0700 (PDT)
Received: (nullmailer pid 2281844 invoked by uid 1000);
	Wed, 12 Oct 2022 16:21:17 -0000
Date: Wed, 12 Oct 2022 11:21:17 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, bcm-kernel-feedback-list@broadcom.com, John Crispin <john@phrozen.org>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: partitions: add TP-Link
 SafeLoader layout
Message-ID: <20221012162117.GA2275712-robh@kernel.org>
References: <20221012050442.6815-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221012050442.6815-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_092118_121637_99C48BF8 
X-CRM114-Status: GOOD (  22.31  )
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

T24gV2VkLCBPY3QgMTIsIDIwMjIgYXQgMDc6MDQ6NDFBTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBN
b3N0IFRQLUxpbmsgaG9tZSByb3V0ZXJzIHVzZSB0aGUgc2FtZSBwYXJ0aXRpb25pbmcgc3lzdGVt
IGJhc2VkIG9uIGEKPiBjdXN0b20gQVNDSUkgdGFibGUuCj4gCj4gSXQgZG9lc24ndCBzZWVtIHRv
IGhhdmUgYW55IG9mZmljaWFsIG5hbWUuIEdQTCBzb3VyY2VzIGNvbnRhaW4gdG9vbAo+IG5hbWVk
IHNpbXBseSAibWFrZV9mbGFzaCIgYW5kIE1ha2VmaWxlIHRhcmdldCAiRmxhc2hNYWtlciIuCj4g
Cj4gVGhpcyBwYXJ0aXRpb25zIHRhYmxlIGZvcm1hdCB3YXMgZmlyc3QgZm91bmQgaW4gZGV2aWNl
cyB3aXRoIGEgY3VzdG9tCj4gU2FmZUxvYWRlciBib290bG9hZGVyIHNvIGl0IHdhcyBjYWxsZWQg
U2FmZUxvYWRlciBieSBhIGNvbW11bml0eS4gTGF0ZXIKPiBpdCB3YXMgcG9ydGVkIHRvIG90aGVy
IGJvb3Rsb2FkZXJzIGJ1dCBpdCBzZWVtcyB0aGUgbmFtZSBzdGlja2VkLgo+IAo+IEFkZCBiaW5k
aW5nIGZvciBkZXNjcmliaW5nIGZsYXNoZXMgd2l0aCBTYWZlTG9hZGVyIHBhcnRpdGlvbnMgdGFi
bGUuIEl0Cj4gYWxsb3dzIG9wZXJhdGluZyBzeXN0ZW1zIHRvIHBhcnNlIGl0IHByb3Blcmx5IGFu
ZCByZWdpc3RlciBwcm9wZXIgZmxhc2gKPiBsYXlvdXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IFYyOiBGaXggdHlwbyBpbiBj
b21taXQ6IHMvc2FtZS9uYW1lLwo+IC0tLQo+ICAuLi4vdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0
aW9ucy55YW1sICAgICAgICAgfCA0NCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFy
dGl0aW9ucy55YW1sCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvcGFydGl0aW9ucy90cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5r
LHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLmUzOGFhZWE1YWExMQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVs
b2FkZXItcGFydGl0aW9ucy55YW1sCj4gQEAgLTAsMCArMSw0NCBAQAo+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlCj4gKyVZQU1MIDEuMgo+
ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9tdGQvcGFydGl0aW9u
cy90cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwjCj4gKyRzY2hlbWE6IGh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ICsKPiArdGl0bGU6IFRQLUxp
bmsgU2FmZUxvYWRlciBwYXJ0aXRpb25zCj4gKwo+ICtkZXNjcmlwdGlvbjogfAo+ICsgIFRQLUxp
bmsgaG9tZSByb3V0ZXJzIHN0b3JlIHZhcmlvdXMgZGF0YSBvbiBmbGFzaCAoZS5nLiBib290bG9h
ZGVyLAo+ICsgIGZsYXNoIGxheW91dCwgZmlybXdhcmUsIHByb2R1Y3QgaW5mbywgY29uZmlndXJh
dGlvbiwgY2FsaWJyYXRpb24KPiArICBkYXRhKS4gVGhhdCByZXF1aXJlcyBmbGFzaCBwYXJ0aXRp
b25pbmcuCj4gKwo+ICsgIEZsYXNoIHNwYWNlIGxheW91dCBvZiBUUC1MaW5rIGRldmljZXMgaXMg
c3RvcmVkIG9uIGZsYXNoIGl0c2VsZiB1c2luZwo+ICsgIGEgY3VzdG9tIEFTQ0lJLWJhc2VkIGZv
cm1hdC4gVGhhdCBmb3JtYXQgd2FzIGZpcnN0IGZvdW5kIGluIFRQLUxpbmsKPiArICBkZXZpY2Vz
IHdpdGggYSBjdXN0b20gU2FmZUxvYWRlciBib290bG9hZGVyLiBMYXRlciBpdCB3YXMgYWRhcHRl
ZCB0bwo+ICsgIENGRSBhbmQgVS1Cb290IGJvb3Rsb2FkZXJzLgo+ICsKPiArICBUaGlzIGJpbmRp
bmcgZGVzY3JpYmVzIHBhcnRpdGlvbmluZyBtZXRob2QgYW5kIGRlZmluZXMgb2Zmc2V0IG9mIEFT
Q0lJCj4gKyAgYmFzZWQgcGFydGl0aW9ucyB0YWJsZS4gVGhhdCBvZmZzZXQgaXMgcGlja2VkIGF0
IG1hbnVmYWN0dXJpbmcgcHJvY2Vzcwo+ICsgIGFuZCBkb2Vzbid0IGNoYW5nZS4KPiArCj4gK21h
aW50YWluZXJzOgo+ICsgIC0gUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+ICsK
PiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IHRwbGluayxzYWZl
bG9hZGVyLXBhcnRpdGlvbnMKPiArCj4gKyAgcGFydGl0aW9ucy10YWJsZS1vZmZzZXQ6Cj4gKyAg
ICBkZXNjcmlwdGlvbjogRmxhc2ggb2Zmc2V0IG9mIHBhcnRpdGlvbnMgdGFibGUKPiArICAgICRy
ZWY6ICIvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzIiCgpEb24ndCBuZWVk
IHF1b3Rlcy4KCj4gKwo+ICtyZXF1aXJlZDoKPiArICAtIHBhcnRpdGlvbnMtdGFibGUtb2Zmc2V0
Cj4gKwo+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsg
IC0gfAo+ICsgICAgcGFydGl0aW9ucyB7Cj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJ0cGxpbmss
c2FmZWxvYWRlci1wYXJ0aXRpb25zIjsKPiArICAgICAgICBwYXJ0aXRpb25zLXRhYmxlLW9mZnNl
dCA9IDwweDEwMDAwMD47CgpXaGF0IGlzIGluIHRoZSBzcGFjZSBiZWZvcmUgdGhpcz8gSXQgaXMg
cGFydCBvZiB0aGUgc2FmZWxvYWRlciAKcGFydGl0aW9ucz8gSWYgdGhlIHNhZmVsb2FkZXIgcGFy
dGl0aW9ucyBhcmUgbm90IHRoZSBlbnRpcmUgZGV2aWNlLCB0aGVuIApwZXJoYXBzIHdlIHN0aWxs
IG5lZWQgZml4ZWQgcGFydGl0aW9ucy4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
