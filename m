Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101DEC001B0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 10:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S6FqaXnsAaZxUjgc4nScMjAKahC7PHirSEVxN1RGPvk=; b=u3SzG5+NMlcEFx
	y8bZHJ0etLxz/u67lrEDr/OmEzhB17JVRsLygHWDgb1OnBx0BQT3HQOUW6jDBoZVDxchB3g9BY4OS
	R4mu2BkDOdX/2NorYQAMOmChWVc4DzPZu9KzG2nf8cqxH2Zfv/nQUPPzRv2vz/eW2MIHQU9mxTKae
	qUB2P+WPEoa3qsRLYwRTvo6TrNJGkIQ/4M2NAgIf9qWuTPz+q1zI1y+ZslUCpsqtc/Y6o2+VQkhem
	ULuReP4ZZyliKHxiaS98e2t+TZebQQmE9ytAxGzbjNEop/nmdagIgxbQDFIEu5FBuTdT9iurUcYGg
	gCZrCx00goUZoMY6Kxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE58-003tsN-32;
	Wed, 16 Aug 2023 10:48:54 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWE56-003tqs-1s
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 10:48:54 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bca5d6dcedso5381829a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692182930; x=1692787730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5m5UzpJlRLvwZeV0suPAl3MejkzVUOiX3hWF9GgbnY=;
        b=SIZLCfPs9aH+YpE486zaXOdb61mkGGRDh9Y8KutGAeY79M/EAAssMwEC1dEJFKORid
         aS8a3Nq4ZpKa0X48K9jI3bApIT3qdGNFG7llYR2u7+sipMAY5fnjL83o6jOE/lWM+g+W
         HhSkWp5jOVUkOIpugI9BUetX2MdSzoOqA3U7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182930; x=1692787730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5m5UzpJlRLvwZeV0suPAl3MejkzVUOiX3hWF9GgbnY=;
        b=M85wlHpQRqx9zys5wHGj+zNNWR8MKjIZ0NY5nUXLxOZVh6UVfOxIpD4gSu7LFECHGk
         Y85UdC6QH49FtZhADYXhOv2UuTROxe3XlSGMTyTJe6OBx3B9b2b9BsEgyTwLnAtqtL1i
         jnybf8aM5MHmx6fBuV10KMAlEbiGhpaQmaBYh66tUOHX2vkF3uXvPSDkOe62LzJQYK2G
         txkcGX7p+F8PjyY+VCZIdJrDGTgyOQvDfKaIKDPO1ZmztChIuX7NdoOAOICVIZTBuOa4
         8p60W/ESEQQswN8EicOJ6awveF0io3GL1NDlatGuXQJOqB0B7G95hezREZdnnfvdzfLb
         qL6Q==
X-Gm-Message-State: AOJu0YxFMJg+2MzDABNbLbWG9CtDuTF2uo3axBdHBdMv2gq9LpUwm0Sk
	ITeqKfeVANDd9NoKweUxLQzgbeninrc/FrSCrw7dsw==
X-Google-Smtp-Source: AGHT+IHw+Hn5+HaHJOx4yIHLzCbxLXGJi1570SOwBYj4CutbHBvqVodnckZLDA7MEapvrG2f0e1muho0h/AXY5oEx2o=
X-Received: by 2002:a9d:77c9:0:b0:6b9:1917:b2f3 with SMTP id
 w9-20020a9d77c9000000b006b91917b2f3mr1353972otl.33.1692182930471; Wed, 16 Aug
 2023 03:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230815154412.713846-1-hsinyi@chromium.org> <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
 <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com> <fb85c288-2ea9-3343-ff19-cd58940b44ec@linaro.org>
In-Reply-To: <fb85c288-2ea9-3343-ff19-cd58940b44ec@linaro.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 16 Aug 2023 18:48:24 +0800
Message-ID: <CAJMQK-h+j-uFvqqC9-ri_ciTBV=v5F8u2u6SBSArD8m+dONFyg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add a property to override the quad mode
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Walle <michael@walle.cc>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, "Miquel Raynal )" <miquel.raynal@bootlin.com>, 
	"Richard Weinberger )" <richard@nod.at>, "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_034852_622796_8B808759 
X-CRM114-Status: GOOD (  23.11  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgMzoxOeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAxNS8wOC8yMDIzIDE5
OjIxLCBIc2luLVlpIFdhbmcgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAxNSwgMjAyMyBhdCAxMTo1
OeKAr1BNIE1pY2hhZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+IHdyb3RlOgo+ID4+Cj4gPj4g
SGksCj4gPj4KPiA+Pj4gT24gZ2lnYWRldmljZSBnZDI1bHE2NGMsIHRoZSBxdWFkIG1vZGUgaXMg
ZW5hYmxlZCBhZnRlciBCRlBUIGlzIHBhcnNlZC4KPiA+Pj4gQWNjb3JkaW5nIHRvIGRhdGFzaGVl
dFsxXSwgUXVhZCBlbmFibGUgKFFFKSBiaXQgbmVlZHMgdG8gYmUgc2V0IHRvIDAgdG8KPiA+Pj4g
dXNlIHdyaXRlIHByb3RlY3Rpb24gKFdQKSBwaW4uIEl0IGFsc28gcmVjb21tZW5kcyBzZXR0aW5n
IGRlZmF1bHQgdmFsdWUgb2YKPiA+Pj4gUUUgdG8gMCB0byBhdm9pZCBhIHBvdGVudGlhbCBzaG9y
dCBpc3N1ZS4KPiA+Pgo+ID4+IFNvIHlvdSBhcmUgdXNpbmcgZWl0aGVyIGR1YWwgb3Igc2luZ2xl
IGlvIG1vZGUuIFdoeSBjYW4ndCB5b3UgdXNlIHRoZSBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBzcGkt
e3R4LHJ4fS1idXMtd2lkdGg/Cj4gPgo+ID4gSSB0cmllZCBzZXR0aW5nIHNwaS10eC1idXMtd2lk
dGggYW5kIHNwaS1yeC1idXMtd2lkdGggdG8gZWl0aGVyIDAgb3IgMQo+ID4gYW5kIFdQIHN0aWxs
IGRvZXNuJ3Qgd29yay4KPiA+IEZvciB0aGlzIGNoaXAsIHF1YWRfZW5hYmxlIHdpbGwgYmUgc2V0
IHRvIHNwaV9ub3Jfc3IyX2JpdDFfcXVhZF9lbmFibGUKPiA+IChRRVIgZmxhZyBpcyBCRlBUX0RX
T1JEMTVfUUVSX1NSMl9CSVQxX0JVR0dZKVsxXQo+ID4KPiA+IHNwaV9ub3Jfd3JpdGVfc3JfYW5k
X2NoZWNrKCkgY2FsbHMKPiA+IHNwaV9ub3Jfd3JpdGVfMTZiaXRfc3JfYW5kX2NoZWNrKClbMl0g
YW5kIHRoZSBmdW5jdGlvbiBzZXRzIFFFIGJpdCBpZgo+ID4gcXVhZF9lbmFibGUgaXMgbm90IE5V
TEwuCj4gPgo+ID4gWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9z
b3VyY2UvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMjTDU3NQo+ID4gWzJdIGh0dHBzOi8vZWxp
eGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMjTDg3OQo+ID4KPiA+IFNldHRpbmcgc3BpLXt0eCxyeH0tYnVzLXdpZHRoIHN0aWxsIGZh
bGxzIHRvIHRoaXMgZnVuY3Rpb24gYW5kIGNhc2VzLgo+Cj4gd2l0aCB0eC9yeCBidXMgd2lkdGgg
PSAyLCBob3cgcXVhZCBtb2RlIGlzIHN0aWxsIHBvc3NpYmxlPyBJT1csIHdoeSBkbwo+IHlvdSBu
ZWVkIG5ldyBwcm9wZXJ0eT8gWW91IHdyb3RlIGhlcmUgYWJvdXQgZHJpdmVyLCBidXQgSSBhc2sg
YWJvdXQKPiBiaW5kaW5ncy4KPgpUaGlzIG1heSBiZSBhIGJ1ZyBpbiB0aGUgZHJpdmVyIHRoYXQg
c2V0dGluZyBzcGkte3R4LHJ4fS1idXMtd2lkdGgKc3RpbGwgZW5hYmxlcyB0aGUgUUUgYml0LiBJ
IHByb3Bvc2VkIGFub3RoZXIgbWV0aG9kIGluIHRoZSBjaGlwJ3MKZml4dXAgdG8gZGVhbCB3aXRo
IHRoaXMgaXNzdWUgaW5zdGVhZCBvZiBjcmVhdGluZyBhIG5ldyBiaW5kaW5nCnByb3BlcnR5Lgp2
MjogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDgxNjEwNDI0NS4yNjc2OTY1LTEt
aHNpbnlpQGNocm9taXVtLm9yZy8KCgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
