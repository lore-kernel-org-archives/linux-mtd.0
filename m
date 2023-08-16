Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A5FC05052
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IB3t1QyV2A0FF/MtveUimNc3O/4318GENuatsI90Fwo=; b=dafHU6sFhiXIqG
	Pjyg2r4uCVaD8veFLbOL4iGvUQw91hOd9EulEgb2Ag4kYliu+LezC3yO6afgOxhfowjwaSGRXGS4y
	GDupbpI5SEr6zV1ckxgOsqnWdR9zgsuHrsrPZJGQNfqSmERtJ6gef9+tU+dAoTHdrCHZvrJzq0n2z
	lBdFW8xRJe5oXCSZwTKi04RFNZ2dbHZuKoKqyjmnkFFQ8s7eNfSUuYjf5+vhzmJ/SMuT71lmgARcO
	X1d0f3IUQpn6yoR7JN+dA9KXHUtNzE1ig2vdpMeEYf7QCnRg5OHIFYOCxjpfYxxtDHt/Bqoktoczq
	5oaD6sugg7O6jmq26TIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLCQ-004ms7-2U;
	Wed, 16 Aug 2023 18:24:54 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWLCN-004mqk-1d
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 18:24:52 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6bcf2fd5d69so6017101a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692210288; x=1692815088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH3CkbS+no8xu7xLg3uZvAz4wzema/itwp2Tc+c167Q=;
        b=llZD2J6325NRzggUheb32gJnMOi0s+ae4Wl7M+BJK9y4mft/TBWwNVki7sdnPSIBgP
         0sGjTfxBw+CvxYl8en56GwsG/rqZVEOY3cv2nvoXeWLsI3qQbzU1He0r4Xco2aHaObgD
         cq/JIfDJBlkJQsT0zsDGjsyj48B8MzOmd5EX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692210288; x=1692815088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vH3CkbS+no8xu7xLg3uZvAz4wzema/itwp2Tc+c167Q=;
        b=RepYi6ykLmTx/oq2EudFdzIXTqcCw10WRYIoB5JRkGQHsBhDiluNQEs3lhzEjPJI/6
         Evp6EFcaTBqeHrrAdiikSBSAdJI5ffHG2GSSIkGAdP7CiBrNUEs5JPxGrg0MRp0GNR4S
         lZKd3TXagaNydgE9Uc3x+D3/ZkEYA0nzNyHj9ukt7togQ7zOPuKxr7Mmka4XWzTkD54S
         HpdlgeHendyiDY/rk+DMQv/98ZZAHH2s4lJ3Kbkz9IJm2wIOnGP350duhnZcK3ImQHaR
         hm724G+39WFwA+63DSko19ockHHSBZRamGu0Sj+j1rKv48CUCd7SN18KAp+rw9AXkkix
         XFtg==
X-Gm-Message-State: AOJu0Yyn+LuwR2loytsjBnMhvUTjEYd8Tgflhes0LUyKlPqTS7S8Zijn
	obxFmnoEgShkfUBNY1ljpHV9VgkCLmq9EN1+ktIyNg==
X-Google-Smtp-Source: AGHT+IFhH83WvJtRVMVm2GAtVDT3sTRvuK+g1KkIMZB0RU5RRarSlXYvZLoA25e52zZYKSGVkqvK7p18o08QNZFd3O4=
X-Received: by 2002:a9d:7d13:0:b0:6b9:9129:dddf with SMTP id
 v19-20020a9d7d13000000b006b99129dddfmr2763929otn.16.1692210288472; Wed, 16
 Aug 2023 11:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230816104245.2676965-1-hsinyi@chromium.org> <6702bac712daab13698b9bb9ad81d49e@walle.cc>
 <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org> <80ec748f37f40ae5c3c3c5d1602681b3@walle.cc>
 <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
In-Reply-To: <0011a25a-e096-73ac-9800-9d8e35efdc8b@linaro.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 17 Aug 2023 02:24:22 +0800
Message-ID: <CAJMQK-jgcH-OBQox3fisr0M0gbhFnSvKWCHwos2mtiRH7t8kVA@mail.gmail.com>
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <michael@walle.cc>, 
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
X-CRM114-CacheID: sfid-20230816_112451_545085_F7477EA3 
X-CRM114-Status: GOOD (  27.00  )
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

T24gV2VkLCBBdWcgMTYsIDIwMjMgYXQgODozNOKAr1BNIFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPgo+Cj4gT24gOC8xNi8yMyAxMzoyMiwgTWljaGFl
bCBXYWxsZSB3cm90ZToKPiA+IEhpLAo+ID4KPiA+Pj4gbGlrZSBhIGZ1bmRhbWVudGFsIHByb2Js
ZW0gYW5kIHRoYXQgY29tbWl0IDM5ZDFlMzM0MGM3MyAoIm10ZDogc3BpLW5vcjoKPiA+Pj4gRml4
IGNsZWFyaW5nIG9mIFFFIGJpdCBvbiBsb2NrKCkvdW5sb2NrKCkiKSBpcyBicm9rZW4gaW4gdGhh
dCByZWdhcmQuCj4gPj4KPiA+PiB3aGF0J3Mgd3Jvbmcgd2l0aCB0aGUgbWVudGlvbmVkIGNvbW1p
dD8KPiA+Cj4gPiAgICAgICAgIH0gZWxzZSBpZiAobm9yLT5wYXJhbXMtPnF1YWRfZW5hYmxlKSB7
Cj4gPiAgICAgICAgICAgICAgICAgLyoKPiA+ICAgICAgICAgICAgICAgICAgKiBJZiB0aGUgU3Rh
dHVzIFJlZ2lzdGVyIDIgUmVhZCBjb21tYW5kICgzNWgpIGlzIG5vdAo+ID4gICAgICAgICAgICAg
ICAgICAqIHN1cHBvcnRlZCwgd2Ugc2hvdWxkIGF0IGxlYXN0IGJlIHN1cmUgd2UgZG9uJ3QKPiA+
ICAgICAgICAgICAgICAgICAgKiBjaGFuZ2UgdGhlIHZhbHVlIG9mIHRoZSBTUjIgUXVhZCBFbmFi
bGUgYml0Lgo+ID4gICAgICAgICAgICAgICAgICAqCj4gPiAgICAgICAgICAgICAgICAgICogV2Ug
Y2FuIHNhZmVseSBhc3N1bWUgdGhhdCB3aGVuIHRoZSBRdWFkIEVuYWJsZSBtZXRob2QgaXMKPiA+
ICAgICAgICAgICAgICAgICAgKiBzZXQsIHRoZSB2YWx1ZSBvZiB0aGUgUUUgYml0IGlzIG9uZSwg
YXMgYSBjb25zZXF1ZW5jZSBvZiB0aGUKPiA+ICAgICAgICAgICAgICAgICAgKiBub3ItPnBhcmFt
cy0+cXVhZF9lbmFibGUoKSBjYWxsLgo+ID4gICAgICAgICAgICAgICAgICAqCj4gPiAgICAgICAg
ICAgICAgICAgICogV2UgY2FuIHNhZmVseSBhc3N1bWUgdGhhdCB0aGUgUXVhZCBFbmFibGUgYml0
IGlzIHByZXNlbnQgaW4KPiA+ICAgICAgICAgICAgICAgICAgKiB0aGUgU3RhdHVzIFJlZ2lzdGVy
IDIgYXQgQklUKDEpLiBBY2NvcmRpbmcgdG8gdGhlIEpFU0QyMTYKPiA+ICAgICAgICAgICAgICAg
ICAgKiByZXZCIHN0YW5kYXJkLCBCRlBUIERXT1JEU1sxNV0sIGJpdHMgMjI6MjAsIHRoZSAxNi1i
aXQKPiA+ICAgICAgICAgICAgICAgICAgKiBXcml0ZSBTdGF0dXMgKDAxaCkgY29tbWFuZCBpcyBh
dmFpbGFibGUganVzdCBmb3IgdGhlIGNhc2VzCj4gPiAgICAgICAgICAgICAgICAgICogaW4gd2hp
Y2ggdGhlIFFFIGJpdCBpcyBkZXNjcmliZWQgaW4gU1IyIGF0IEJJVCgxKS4KPiA+ICAgICAgICAg
ICAgICAgICAgKi8KPiA+ICAgICAgICAgICAgICAgICBzcl9jclsxXSA9IFNSMl9RVUFEX0VOX0JJ
VDE7Cj4gPiAgICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAgICAgICAgc3JfY3JbMV0gPSAw
Owo+ID4gICAgICAgICB9Cj4gPgo+ID4gIldlIGNhbiBzYWZlbHkgYXNzdW1lIHRoYXQgd2hlbiB0
aGUgUXVhZCBFbmFibGUgbWV0aG9kLi4iLiBXZSBjYW5ub3QsIGlmIHdlCj4gPiBkb24ndCBoYXZl
IDQgSS9PIGxpbmVzLiBUaGUgcXVhZF9lbmFibGUgaXMganVzdCB0aGUgb3AgaG93IHRvIGRvIGl0
LCBidXQgbm90Cj4gPiAqaWYqIGNhbiBkbyBpdC4gSXQgc2VlbXMgdG8gYmUgbWlzc2luZyB0aGUg
c2FtZSBjaGVjayBhcyB0aGUKPiA+IHNwaV9ub3JfcXVhZF9lbmFibGUoKS4gQnV0IEknbSBub3Qg
c3VyZSBpZiBpdCdzIHRoYXQgc2ltcGxlLgo+ID4KPgo+IEkgc2VlLiBUaGVuIGV4dGVuZGluZyB0
aGUgaWYgY29uZGl0aW9uIHNob3VsZCBkbyB0aGUgdHJpY2ssIGFzCj4gc3BpX25vcl93cml0ZV8x
NmJpdF9zcl9hbmRfY2hlY2soKSBpcyBjYWxsZWQgYWZ0ZXIgc2V0dXAuIFNvbWV0aGluZwo+IGxp
a2U6Cj4KPiBpZiAoc3BpX25vcl9nZXRfcHJvdG9jb2xfd2lkdGgobm9yLT5yZWFkX3Byb3RvKSA9
PSA0ICYmCj4gICAgIHNwaV9ub3JfZ2V0X3Byb3RvY29sX3dpZHRoKG5vci0+d3JpdGVfcHJvdG8p
ID09IDQgJiYKPiAgICAgbm9yLT5wYXJhbXMtPnF1YWRfZW5hYmxlKQo+Cj4gSXMgdGhpcyB3aGF0
IEhzaW4tWWkgaXMgaGl0dGluZz8KClllcywgaXQgaXMuIEFkZGluZyB0aGVzZSBjaGVja3MgY2Fu
IHNvbHZlIHRoZSBpc3N1ZS4gVGhlIHJlYWQgb3V0CndpZHRoIGZvciBib3RoIHJlYWQgYW5kIHdy
aXRlIGlzIDEsIHdoaWNoIG1hdGNoZXMgdGhlIGRlZmF1bHQgYnVzCndpZHRoLgoKVGhhbmtzLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
