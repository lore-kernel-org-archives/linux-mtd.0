Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE65C433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Apr 2022 08:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c43yddpO6uE0GKVUV1msW50PohDI7VTXnuNHJlkaLQM=; b=1ZRsT/ZYowlNLO
	sHYh5xp2VpyHWVurgHd8nSMMe3MFCwV/SSgrvE09FbeuXJY/WRrKnUvSDaG7/e2uTewf6jilN/fUt
	IKaRME47/6ejfcb2rfnKxJ74+P7N48095XhT/FkCTDgN6sDqBJB7IqB8NKp3NXhmn1FfSCFSwAJaB
	+eMZr0COvPzqgXss5TE7exrzNM6PqCsh9GzP+TBWRQSl8qvz6JXScl7s177uq0LCNT32uOcTJzqM1
	EBPt+fHZ/oB5fiRVvGItIO1b7gbg26uhqN1n7gczdFLZ82PRTQ6e40fXKu9vKCs3NPer9KcxYykKM
	3nq5d0m5pI6yZ2TianoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndSik-004Syh-14; Sun, 10 Apr 2022 08:14:54 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndSig-004Sxl-JO
 for linux-mtd@lists.infradead.org; Sun, 10 Apr 2022 08:14:51 +0000
Received: by mail-ej1-x633.google.com with SMTP id n6so24971516ejc.13
 for <linux-mtd@lists.infradead.org>; Sun, 10 Apr 2022 01:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ocwG8BUupA0c7ngkbVIRkowdsSBmAJkxH3Uq9ZfLtFA=;
 b=ZT1T5kvX23OeR/oEtBIM5SXEif+djqD2K2O7ahGHOY4JJFhq8cFilcqTebMLFuKnyC
 Euc/j7Ij9guEHOTr9CPFKD5Bvk6XiBSoNMRXsWGaSujpiFLsE7p/HZVegO5G8YFp3tFd
 i88V49F8SoOsxqrexpDDfgycaq/1U+f4HW4r36DXoQ6VEEd82DsHTBFRvxQR9LP9yrnY
 rCMP2S/eqfovdzTG9RkXUbrEF0RWAlIgfXq4imI6znvPsSkVNhiHUvfgVEEVmP3h8spp
 EzWgUB78mp5jOYuNlQhj4TP/TiEp0K+3sZx8ytwjzh0GyvdYZ4iUCq+bD6nWES7zQdZ7
 DCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ocwG8BUupA0c7ngkbVIRkowdsSBmAJkxH3Uq9ZfLtFA=;
 b=w8ZGwrZSw/gAd8KbPXQJhObHJJC4cZJSYWgxtLPA83R6UPdZ79aNS70OfHmRYe5rHZ
 UNxTw9NcYHUSap4gRkxPkIsqSEvtYV1IqADHogmA2EGBne4K5GyGAONPbDxnwGFfG2c/
 JCeUJve0zc7ojookhx3yc85EWS9FGKgR1ssyDweF7INrrj73iqstMU1IdZXXX1S7MQRX
 dYsDzGnf8Qn5oyPr8wJLoA2W3fBNrQgb3pC/abmc0qAEcTL8/O+VcHEWBMIeox6csb4h
 WBGFLGaEqbvuBTwCmrWAve6zNGcCmhOKUyLyLrgR3YPt6k50Z4udlj0gki39PTCpDKJK
 77lg==
X-Gm-Message-State: AOAM530oC85B3Qu3rSiwBBBrPg5auBxEzQC80ibXoJQOd8LSOO1AwXtI
 7lS0prFMgAewPWMkGSL7CM8NsKpd4OHYykDX
X-Google-Smtp-Source: ABdhPJwiRoInrgMIGnHeSp8In8dbE9mUih20/nJXBR7jr/dYvOIE4073mVFhS82a8jtMWgSoAqJyQg==
X-Received: by 2002:a17:906:c144:b0:6e8:1bb:3b54 with SMTP id
 dp4-20020a170906c14400b006e801bb3b54mr25808371ejc.547.1649578488308; 
 Sun, 10 Apr 2022 01:14:48 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 z25-20020a1709067e5900b006e7fe2a1308sm6583308ejr.48.2022.04.10.01.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Apr 2022 01:14:47 -0700 (PDT)
Message-ID: <73607ee6-a6bc-1f18-1dc1-d3e916f0e8ae@linaro.org>
Date: Sun, 10 Apr 2022 10:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for
 Sercomm parser
Content-Language: en-US
To: Mikhail Zhilkin <csharper2005@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: NOGUCHI Hiroshi <drvlabo@gmail.com>, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220406195557.1956-1-csharper2005@gmail.com>
 <20220406195946.2019-1-csharper2005@gmail.com>
 <8d0d8b27-35ff-3693-cf80-897b80c26b4e@linaro.org>
 <57bebf2f-af4c-b2d9-10e5-19e5104946fb@gmail.com>
 <29cfa017-bbaf-3aba-fe1d-06771957dbaa@linaro.org>
 <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1b391399-984b-7a63-3265-62ef09caec39@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_011450_681919_6C9CB98F 
X-CRM114-Status: GOOD (  14.21  )
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

T24gMDkvMDQvMjAyMiAyMDowNCwgTWlraGFpbCBaaGlsa2luIHdyb3RlOgo+IE9uIDQvOS8yMDIy
IDM6NDMgUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gCj4+PiBJJ20gbm90IHN1cmUg
dGhhdCAic2NwYXJ0LWlkIiBpcyBuZWNlc3NhcnkgaGVyZS4gInNlcmNvbW0sc2MtcGFydGl0aW9u
cyIKPj4+IGlzIG5lY2Vzc2FyeS4gSSdtIGdvaW5nIHRvIGFkZCB2ZW5kb3IgcHJlZml4IGluIGEg
c2VwYXJhdGUgcGF0Y2guIElzIHRoaXMKPj4+IG9rPwo+PiBZZXMuCj4gCj4gVGhhbmtzIQo+IAo+
Pj4+PiArcmVxdWlyZWQ6Cj4+Pj4+ICsgIC0gY29tcGF0aWJsZQo+Pj4+IE1pc3NpbmcgcmVnLgo+
Pj4gcmVnIGlzbid0IHJlcXVpcmVkLiBQYXJzZXIgY2FuIHJlYWQgcGFydGl0aW9uIG9mZnNldHMg
YW5kIHNpemVzIGZyb20KPj4+IFNDIFBBUlQgTUFQIHRhYmxlLiBPciBkbyB5b3UgbWVhbiBzb21l
dGhpbmcgZWxzZT/CoCBBbGwgaXMgb2sKPj4+IHdpdGhvdXQgcmVnIGRlZmluaXRpb24gaW4gIkV4
YW1wbGUiIChleGNlcHQgdGhlIHdhcm5zIHRoYXQgcmVnIHByb3BlcnR5Cj4+PiBpcyBtaXNzaW5n
KS4KPj4gcmVnIG1pZ2h0IG5vdCBiZSByZXF1aXJlZCBmb3IgY3VycmVudCBpbXBsZW1lbnRhdGlv
biBidXQgaXQgaXMgcmVxdWlyZWQKPj4gYnkgZGV2aWNldHJlZSBmb3IgZXZlcnkgbm9kZSB3aXRo
IHVuaXQgYWRkcmVzcy4gRG8geW91IGV4cGVjdCBoZXJlIG5vZGVzCj4+IHdpdGhvdXQgdW5pdCBh
ZGRyZXNzZXM/Cj4gT25seSAicGFydGl0aW9ucyIgbm9kZSBoYXMgbm8gdW5pdCBhZGRyZXNzLgoK
VGhpcyBjb25mdXNlZCBtZS4gRG8geW91IGhhdmUgYSBjaGlsZCBub2RlIG5hbWVkICJwYXJ0aXRp
b25zIj8KCj4gQWxsIHN1Ym5vZGVzwqAgaGF2ZSB1bml0Cj4gYWRkcmVzc2VzIGFuZCB0aGVyZWZv
cmUgaGF2ZSB0byBoYXZlIHJlZyBwcm9wZXJ0eS4gCgpTbyBhbGwgb2YgdGhlbSBuZWVkIHJlZy4K
Cj4gSSd2ZSBqdXN0IHJlYWxpemVkCj4gdGhhdCAiZml4ZWQtcGFydGl0aW9ucy55YW1sIiBpcyBh
bG1vc3QgbXkgY2FzZS4gSXQgbG9va3MgbGlrZSBJIGNhbgo+IGNvcHknbidwYXN0ZcKgICJyZXF1
aXJlZCIgYW5kICIqcHJvcGVydGllcyIuCj4gRG8geW91IG1pbmQgaWYgSSBkb24ndCByZWludmVu
dCB0aGUgd2hlZWwgYW5kIHJldXNlIHRoaXMgZ29vZAo+IHByYWN0aWNlPwoKUmUtdXNpbmcgcHJv
cGVyIHN0dWZmIGlzIGdvb2QsIGJ1dCBqdXN0IGRvbid0IGJsaW5kbHkgY29weS4gWW91IG5lZWQK
c3RpbGwgY29tcGF0aWJsZSBhbmQgcmVnIGluIHJlcXVpcmVkIHByb3BlcnRpZXMuCgpCZXN0IHJl
Z2FyZHMsCktyenlzenRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
