Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924F5C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Jun 2022 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+X2Yih3CFNAHcRmOiOoYfO1pyl7jcOtEli0TsKCYag=; b=yIPgYa9eGaYNTD
	1O5YCts/qJwyxlZd0NHYqizbqR7+36kYSYAczmN6viv6VRq7HyP/xV8Kw4oP3oPb1/tzx4kRdoMAM
	TVgX80Fi7xuUd3l2nTrVNe7lJkjO1txIXQETgS7xJpTd926nxyPOLxlXGlI+bhjdlsC1fVzu/5mMs
	xL6+KSkiXyvfzQSIeTZVnwOlppsnnKhw9xulQuRzm3xJxuQvEL8z/QneREXASQ+wPJHquMiF7ym53
	B1aYXZ+fCCAQj5lG7BGNerOuOxlF6hJMrzKnS+aZDdukNJJTkiXjUPDPuIzRIfzNX7q3nWtsf5xO7
	gvhR1v2ZwgbT1jRsP30Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx994-007zW3-TS; Fri, 03 Jun 2022 15:23:26 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx991-007zU8-1T
	for linux-mtd@lists.infradead.org; Fri, 03 Jun 2022 15:23:24 +0000
Received: by mail-ej1-x62e.google.com with SMTP id s12so9372372ejx.3
        for <linux-mtd@lists.infradead.org>; Fri, 03 Jun 2022 08:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lqyq5k+XF5KgaIo5e3mhOS1nBHM477MF0d9qU6OOaQk=;
        b=HSg4VtPtX0FA6DhM4M/SK75iaIqx+VCXGg1pUX53SLtsvYkg9pR2/pFuxQOoAOefOq
         f2mBPGr0EJPdKqptHoGR2BDFmui6PKhSl5cNSTZumEQEIEtD+AwyoOGhkaKufrb/YkyA
         O7HW3sXJPjTYabzBxRqdVUgaUmMZeF/JWyndNXz9QHNiNKb8zhOFOgHXf+OwM5vtVX2m
         ga+1ePUiy0iH24OzhdlMhA4lJL3L1Hevddd64pxppQ8N2RNyc+ifeBmZqWdsamxcNaGl
         ziZC1ktFKTGilRtug72eUBvGnaFRVHgpbsfjFN9IdVMAMj/KSbx5BDYVXA7ZHxcE95GG
         cPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lqyq5k+XF5KgaIo5e3mhOS1nBHM477MF0d9qU6OOaQk=;
        b=uzN9I+hpbG7Byq1/Hy6gRRvV6+J3GIertIShS5TvhDqRMFSLOilnsrbJ8QQ+gSYX57
         czDy2gQ+LucMhKMoR/2Z5fmBOCBGsr+8VmhoacjRoocKIHkdY/a4Qg7mcLTISHg9aTrz
         CRMNqkPOl4zpWPr56+vIq1zar9xRIGcm2Kxt6PBE7syeaPqDM4gUqDvtYmJRTiJk8zO5
         MtxN7jxF8BUFiSYRzxWGRM2kpNik7Ahr64BVQEOoUjCimTn7DwM3s88J11SImqbxeBaR
         8kpUMBGTDHcep3FYqP4hEw4RRe0rwNbHGDjtyjVmomR2XnYhFcXuZPexT9ys8c+U4UzP
         3cqg==
X-Gm-Message-State: AOAM532AYjmPHuDD9joqLqMdRYOurHbyTJTHkx6bVxISkFskma3l3yg1
	ieYldOjO9hWYK/aJgK3Gs94=
X-Google-Smtp-Source: ABdhPJx10a+aPHP5XcUngLeIIWoBKRDAxK9Dfy8n9eTEaJ7IOZN/o5Buq3qGXf/P3sZYGpt8fkmmXg==
X-Received: by 2002:a17:907:7290:b0:6ff:1fa2:e9e3 with SMTP id dt16-20020a170907729000b006ff1fa2e9e3mr9042275ejc.345.1654269799791;
        Fri, 03 Jun 2022 08:23:19 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id g9-20020aa7c849000000b0042a2d9af0f8sm3998719edt.79.2022.06.03.08.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 08:23:19 -0700 (PDT)
Message-ID: <629a2767.1c69fb81.ee3de.6097@mx.google.com>
X-Google-Original-Message-ID: <YponZSfj3982xCYI@Ansuel-xps.>
Date: Fri, 3 Jun 2022 17:23:17 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Add support for unprotected spare data page
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220603151806.GB26696@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220603151806.GB26696@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_082323_145052_299F3F3F 
X-CRM114-Status: GOOD (  35.25  )
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

T24gRnJpLCBKdW4gMDMsIDIwMjIgYXQgMDg6NDg6MDZQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFRodSwgTWF5IDE5LCAyMDIyIGF0IDA5OjAxOjEwUE0gKzAyMDAs
IEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IFNvbWUgYmFja2dyb3VuZCBhYm91dCB0aGlzLgo+ID4g
T24gb3JpZ2luYWwgcXNkayBpcHE4MDY0IGJhc2VkIGZpcm13YXJlIHRoZXJlIHdhcyBhIGJpZyBz
ZXBhcmF0aW9uIGZyb20KPiA+IGJvb3QgcGFydGl0aW9uIGFuZCB1c2VyIHBhcnRpdGlvbi4gV2l0
aCBib290IHBhcnRpdGlvbiB3ZSByZWZlciB0bwo+ID4gcGFydGl0aW9uIHVzZWQgdG8gaW5pdCB0
aGUgcm91dGVyIChib290bG9hZGVyLCBzcG0gZmlybXdhcmUgYW5kIG90aGVyCj4gPiBpbnRlcm5h
bCBzdHVmZikgV2l0aCB1c2VyIHBhcnRpdGlvbiB3ZSByZWZlciB0byBsaW51eCBwYXJ0aXRpb24g
YW5kIGRhdGEKPiA+IHBhcnRpdGlvbiBub3QgdXNlZCB0byBpbml0IHRoZSByb3V0ZXIuCj4gPiBX
aGVuIHNvbWVvbmUgaGFkIHRvIHdyaXRlIHRvIHRoZXNlIGJvb3QgcGFydGl0aW9uIGEgc3BlY2lh
bCBtb2RlIHdhcwo+ID4gbmVlZGVkLCB0byBzd2l0Y2ggdGhlIG5hbmQgZHJpdmVyIHRvIHRoaXMg
c3BlY2lhbCBjb25maWd1cmF0aW9uLgo+ID4gCj4gPiBVcHN0cmVhbSB2ZXJzaW9uIG9mIHRoZSBu
YW5kYyBkcml2ZXIgdG90YWxseSBkcm9wcGVkIHRoaXMgYW5kIHRoZSByZXN1bHQKPiA+IGlzIHRo
YXQgaWYgc29tZW9uZSB0cnkgdG8gcmVhZCBkYXRhIGZyb20gdGhlc2UgcGFydGl0aW9uIGEgQ1JD
IHdhcm5pbmcKPiA+IGlzIHByaW50ZWQgYW5kIGlmIHNvbWVvbmUgdHJ5IHRvIHdyaXRlIHRoYXQg
KGlmIGZvciBleGFtcGxlIHNvbWVvbmUKPiA+IHdhbnRzIHRvIHJlcGxhY2UgdGhlIGJvb3Rsb2Fk
ZXIpIHJlc3VsdCBpcyBhIGJyb2tlbiBzeXN0ZW0gYXMgdGhlIGRhdGEKPiA+IGlzIGJhZGx5IHdy
aXR0ZW4uCj4gPiAKPiAKPiBDYW4geW91IHBsZWFzZSBwb2ludCBtZSB0byB0aGUgZG93bnN0cmVh
bS92ZW5kb3IgZHJpdmVyIHRoYXQgaGFzIHRoaXMKPiBpbXBsZW1lbnRhdGlvbj8KPiAKPiBUaGFu
a3MsCj4gTWFuaQo+CgpTdXJlLCBpcyBpdCBnb29kIGlmIEkgZ2l2ZSB5b3UgYSBnaXN0IGxpbmsg
d2l0aCB0aGUgc291cmNlIG9mIGRyaXZlcj8KCj4gPiBUaGlzIHNlcmllcyBjb21lcyB0byBmaXgg
dGhpcy4KPiA+IAo+ID4gQSB1c2VyIGNhbiBkZWNsYXJlIG9mZnNldCBhbmQgc2l6ZSBvZiB0aGVz
ZSBzcGVjaWFsIHBhcnRpdGlvbiB1c2luZyB0aGUKPiA+IHFjb20sYm9vdC1wYWdlcyBiaW5kaW5n
Lgo+ID4gCj4gPiBBbiBpbml0aWFsIGltcGxlbWVudGF0aW9uIG9mIHRoaXMgYXNzdW1lZCB0aGF0
IHRoZSBib290LXBhZ2VzIHN0YXJ0ZWQKPiA+IGZyb20gdGhlIHN0YXJ0IG9mIHRoZSBuYW5kIGJ1
dCB3ZSBkaXNjb3ZlciB0aGF0IHNvbWUgZGV2aWNlIGhhdmUgYmFja3VwCj4gPiBvZiB0aGVzZSBz
cGVjaWFsIHBhcnRpdGlvbiBhbmQgd2UgY2FuIGhhdmUgc2l0dWF0aW9uIHdoZXJlIHdlIGhhdmUg
dGhpcwo+ID4gcGFydGl0aW9uIHNjaGVtZQo+ID4gLSBBUFBTQkwgKHJlcXVpcmUgc3BlY2lhbCBt
b2RlKQo+ID4gLSBBUFBTQkxFTlYgKGRvZXNuJ3QgcmVxdWlyZSBzcGVjaWFsIG1vZGUpCj4gPiAt
IEFSVAo+ID4gLSBBUFBTQkxCSyAoYmFjayBvZiBBUFBTQkwgcmVxdWlyZSBzcGVjaWFsIG1vZGUp
Cj4gPiAtIEFQUFNCTEVOVkJLIChiYWNrIG9mIEFQUFNCTEVOViBkb2Vzbid0IHJlcXVpcmUgc3Bl
Y2lhbCBtb2RlKQo+ID4gV2l0aCB0aGlzIGNvbmZpZ3VyYXRpb24gd2UgbmVlZCB0byBkZWNsYXJl
IHNwYXJzZSBib290IHBhZ2UgYW5kIHdlIGNhbid0Cj4gPiBhc3N1bWUgYm9vdC1wYWdlcyBhbHdh
eXMgc3RhcnRzIGZyb20gdGhlIHN0YXJ0IG9mIHRoZSBuYW5kLgo+ID4gCj4gPiBBIHVzZXIgY2Fu
IHVzZSB0aGlzIGZvcm0gdG8gZGVjbGFyZSBzcGFyc2UgYm9vdCBwYWdlcwo+ID4gcWNvbSxib290
LXBhZ2VzID0gPDB4MCAweDBjODAwMDAgMHgwYzgwMDAwIDB4MDUwMDAwMD47Cj4gPiAKPiA+IFRo
ZSBkcml2ZXIgaW50ZXJuYWxseSB3aWxsIHBhcnNlIHRoaXMgYXJyYXksIGNvbnZlcnQgaXQgdG8g
bmFuZCBwYWdlcwo+ID4gYW5kIGNoZWNrIGludGVybmFsbHkgb24gZXZlcnkgcmVhZC93cml0ZSBp
ZiB0aGlzIHNwZWNpYWwgY29uZmlndXJhdGlvbgo+ID4gc2hvdWxkIHVzZWQgZm9yIHRoYXQgcGFn
ZSBvciB0aGUgbm9ybWFsIG9uZS4KPiA+IAo+ID4gVGhlIHJlYXNvbiBmb3IgYWxsIG9mIHRoaXMg
aXMgdGhhdCBxY29tIEZPUiBTT01FIFJFQVNPTiwgZGlzYWJsZSBFQ0MgZm9yCj4gPiBzcGFyZSBk
YXRhIG9ubHkgZm9yIHRoZXNlIGJvb3QgcGFydGl0aW9uIGFuZCB3ZSBuZWVkIHRvIHJlZmxlY3Qg
dGhpcwo+ID4gc3BlY2lhbCBjb25maWd1cmF0aW9uIHRvIG11dGUgdGhlc2Ugd2FybmluZyBhbmQg
dG8gcGVybWl0IGFjdHVhbGx5Cj4gPiB3cml0aW5nIHRvIHRoZXNlIHBhZ2VzLgo+ID4gCj4gPiB2
NDoKPiA+IC0gRml4IHdyb25nIGNvbXBhdGlibGUgc2V0IGZvciBib290LXBhZ2VzIChpcHE4MDc0
IGluc3RlYWQgb2YgaXBxODA2eCkKPiA+IHYzOgo+ID4gLSBGaXggdHlwbyBpbiBEb2NtdW5ldGF0
aW9uIGNvbW1pdCBkZXNyaXB0aW9uCj4gPiAtIEFkZCBpdGVtcyBkZXNjcmlwdGlvbiBmb3IgdWlu
dDMyLW1hdHJpeAo+ID4gdjI6Cj4gPiAtIEFkZCBmaXhlcyBmcm9tIEtyenlzenRvZiBpbiBEb2N1
bWVudGF0aW9uCj4gPiAKPiA+IEFuc3VlbCBTbWl0aCAoMik6Cj4gPiAgIG10ZDogbmFuZDogcmF3
OiBxY29tX25hbmRjOiBhZGQgc3VwcG9ydCBmb3IgdW5wcm90ZWN0ZWQgc3BhcmUgZGF0YQo+ID4g
ICAgIHBhZ2VzCj4gPiAgIGR0LWJpbmRpbmdzOiBtdGQ6IHFjb21fbmFuZGM6IGRvY3VtZW50IHFj
b20sYm9vdC1wYWdlcyBiaW5kaW5nCj4gPiAKPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9t
dGQvcWNvbSxuYW5kYy55YW1sICAgfCAgMjYgKysrCj4gPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcv
cWNvbV9uYW5kYy5jICAgICAgICAgICAgIHwgMTQ4ICsrKysrKysrKysrKysrKysrLQo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTY5IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IC0tIAo+ID4gMi4zNC4xCj4gPiAKPiAKPiAtLSAKPiDgrq7grqPgrr/grrXgrqPgr43grqPgrqng
r40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgotLSAKCUFuc3VlbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
