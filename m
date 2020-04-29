Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017CBC83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:28:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A2B20787
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 09:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hlubcMR9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejwhGHj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A2B20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEIgrCeZ0jJFZ8hiCWyR8BhI8iTl4e0x8wIvVhyJdJo=; b=hlubcMR9eQ+NeS
	fxYzabx74JC9Hc2aHlJr74Z3M2hPybVtKf7sAfSRyYFz2FR5p0ifthSkAE1DspdSVy1w58HJxkby6
	ZXutOCu3UsQ0emePV9rzLq/PRXW7taBrdt0GWSCvd0X8a4p1YN6PBBMQwNn/qW+m6J1xhIkDDq8+k
	mO/eVPUm8oAYBe/ezYD+A2uZ9Cy47XYoKSLIQ6T3QGTs+t3/WM8GXYJtmTnfxcUB9ADkDQvdTqtyN
	AAA84Czo3deP6/X+2k9TGS2/euq7UbGtTbuePbM88dMh0woqgeely4I9RH+wII6OX28ixMzgHqmgg
	mm1qNxVgs+iirWnGHcIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTj19-0000CL-BK; Wed, 29 Apr 2020 09:28:35 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTj16-0000AQ-2i; Wed, 29 Apr 2020 09:28:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id u127so1241997wmg.1;
 Wed, 29 Apr 2020 02:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UeUVwObSkM6EFVAzScmIyMGT/gPf7YTekn6m0H+ie8w=;
 b=ejwhGHj3Y5NZCDzmcm3w8UM0m5vKpiydbk8ev228iv3dQxNch/UX6yK/Faq6WKXXhE
 ZfDqOa2pLA+KioOpoYsQh3NtsKUsYkMnsqN4phoKcrQabCC0GNAQJdq1s5UvDxcFjEKm
 Bvjqf03wydSLN21yQE9QQDBGgfug50XFzNgN6SVa5uqG5KS6Zi01nfXht1Xahj7hthIQ
 hp9F1qnFFQj4ixE7MoA/pNVnQJiez9l6ISoE8FXbzPDioNIJLn/R/Hsutn15pWbRw3Zs
 JDr2I9casLccS7vLFpshf+um/Dd1UEGO9tFXZQOkbhPEThexvbNmnTcZAptURxMPhSku
 ZeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UeUVwObSkM6EFVAzScmIyMGT/gPf7YTekn6m0H+ie8w=;
 b=UUxmmRpn4HWp7LwDjEAeFkn2ExMhAArKKdPRTDEBO1XjBlgwWmZTnhIzdPNQBYCtgn
 oCF/zXQkPtV2OZwJDiW1LcYFOOLs11Sko+CnOwiRqKonglxcC1XLeZA3kmael6lCbS8O
 NO5WGAffB3ppRSkfX1zDg7LdM9rOiE3jDqF4J9m+oHDIue9ie43zWoD1WUTwyvhBLaIt
 eYZZZ4l2OHWZchDcXG8QXuG0q434AdSlRBOmOYbqR53AUjiRHOrXnaRwgzHCeqh42Yru
 0m6PmW+BaHRBmdpR1WLU/H4eafuQ0A4Tmy0UNR/2mZS8AVbEgcjjEEH2JB7LKNz9c/tB
 vO2w==
X-Gm-Message-State: AGi0Pua40K4QnNFT8H336V0efMcrbIghUCebQ7nsU0d3Zp6j0QmB4BBG
 iNJ1b8WcRqJS+hYwhBW8nW3aaZ/k
X-Google-Smtp-Source: APiQypKUQaJgSoMixHmfMayvIF7NPOrs0jASPDWStT/ot5oGircRfIYNDPagR39Q27smhLgHapbrAw==
X-Received: by 2002:a05:600c:2214:: with SMTP id
 z20mr2363156wml.189.1588152510143; 
 Wed, 29 Apr 2020 02:28:30 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id g74sm7058726wme.44.2020.04.29.02.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Apr 2020 02:28:29 -0700 (PDT)
Subject: Re: [PATCH v5 1/7] dt-bindings: mtd: Describe Rockchip RK3xxx NAND
 flash controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200426100250.14678-1-yifeng.zhao@rock-chips.com>
 <20200426100250.14678-2-yifeng.zhao@rock-chips.com>
 <4a83e5d2-90cc-1db7-cdfd-47b7ceb4fcef@gmail.com>
 <20200429111314.5f15d72b@xps13>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <21ecb12e-43d9-581a-7d85-79b62be358e8@gmail.com>
Date: Wed, 29 Apr 2020 11:28:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429111314.5f15d72b@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_022832_141294_B6912BBC 
X-CRM114-Status: GOOD (  16.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, heiko@sntech.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gNC8yOS8yMCAxMToxMyBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBKb2hhbiwKPiAKPiBKb2hhbiBKb25rZXIgPGpieDYyNDRAZ21haWwuY29tPiB3cm90ZSBvbiBX
ZWQsIDI5IEFwciAyMDIwIDEwOjUzOjMwCj4gKzAyMDA6Cj4gCj4+IEhpIFlpZmVuZywKPj4KPj4+
IE9uIFN1biwgQXByIDI2LCAyMDIwIGF0IDA2OjAyOjQ0UE0gKzA4MDAsIFlpZmVuZyBaaGFvIHdy
b3RlOiAgCj4+Pj4gRG9jdW1lbnRhdGlvbiBzdXBwb3J0IGZvciBSb2NrY2hpcCBSSzN4eHggTkFO
RCBmbGFzaCBjb250cm9sbGVycwo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWWlmZW5nIFpoYW8g
PHlpZmVuZy56aGFvQHJvY2stY2hpcHMuY29tPgo+Pj4+IC0tLQo+Pj4+Cj4+Pj4gQ2hhbmdlcyBp
biB2NToKPj4+PiAtIEZpeCBzb21lIHdyb25nIGRlZmluZQo+Pj4+IC0gQWRkIGJvb3QtbWVkaXVt
IGRlZmluZQo+Pj4+IC0gUmVtb3ZlIHNvbWUgY29tcGF0aWJsZSBkZWZpbmUKPj4+Pgo+Pj4+IENo
YW5nZXMgaW4gdjQ6Cj4+Pj4gLSBUaGUgY29tcGF0aWJsZSBkZWZpbmUgd2l0aCBya3h4X25mYwo+
Pj4+IC0gQWRkIGFzc2lnbmVkLWNsb2Nrcwo+Pj4+IC0gRml4IHNvbWUgd3JvbmcgZGVmaW5lCj4+
Pj4KPj4+PiBDaGFuZ2VzIGluIHYzOgo+Pj4+IC0gQ2hhbmdlIHRoZSB0aXRsZSBmb3IgdGhlIGR0
LWJpbmRpbmdzCj4+Pj4KPj4+PiBDaGFuZ2VzIGluIHYyOiBOb25lCj4+Pj4KPj4+PiAgLi4uL210
ZC9yb2NrY2hpcCxuYW5kLWNvbnRyb2xsZXIueWFtbCAgICAgICAgIHwgMTI0ICsrKysrKysrKysr
KysrKysrKwo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKykKPj4+PiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcm9j
a2NoaXAsbmFuZC1jb250cm9sbGVyLnlhbWwKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3JvY2tjaGlwLG5hbmQtY29udHJvbGxlci55
YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9yb2NrY2hpcCxuYW5k
LWNvbnRyb2xsZXIueWFtbCAgCj4+Cj4+IFRoZSBuYW1lIG9mIHRoaXMgZmlsZSBpcyBiYXNlZCBv
biBNaXF1ZWwncyBvcGluaW9uLCBidXQgdGhlCj4+IGNvbXBhdGliaWxpdHkgc3RyaW5ncywgKGZv
ciB3aGljaCByb2JoIGhhcyBnaXZlbiBhICdyZXZpZXdlZCBieScgdGFnKSBpbgo+PiB2ZXJzaW9u
IDQgZG9uJ3QgZml0IHdpdGggdGhpcyBmb3JtYXQuCj4gCj4gV2hhdCBkbyB5b3UgbWVhbj8gSXMg
dGhlIGZpbGUgbmFtZSByZXN0cmljdGVkIHNvbWVob3c/IEkganVzdCBkb24ndAo+IHdhbnQgYSBj
b21wYXRpYmxlIHdpdGgganVzdCAibmFuZCIgaW4gaXQgYmVjYXVzZSB0aGlzIHdvcmQgaXMgdG9v
IHZhZ3VlCj4gYXMgaXQgZGVmaW5lczogYSBidXMsIGEgc3BlYywgYSBjaGlwLCBwZW9wbGUgYXJl
IGFsc28gY29uZnVzaW5nIGl0IHdpdGgKPiB0aGUgY29udHJvbGxlciBhbmQgc29tZXRpbWVzIHdp
dGggdGhlIEVDQyBlbmdpbmUgdG9vLiAibmZjIiBpcyBva2F5Cj4gdGhvdWdoLgo+IAo+IFRoYW5r
cywKPiBNaXF1w6hsCj4gCgpXaXRoIHRoZSByZXZpZXcgb2YgbXkgYmluZGluZyBzdHJpbmcgcm9j
a2NoaXAscmszMDY2LWhkbWkgcm9iaCBhZHZpc2VkCnRvIHVzZSB0aGUgYmluZGluZyBjb21wYXRp
YmxlIHN0cmluZyBhbmQgYWRkICcudHh0JyB0byBpdCBmb3IgdGhlIGZpbGUgbmFtZS4KCklzIGl0
IE9LIGZvciB5b3UgdG8gaGF2ZSBhIGZpbGUgbmFtZToKICByb2NrY2hpcCxuYW5kLWNvbnRyb2xs
ZXIueWFtbAoKYW5kIGEgbGl0dGxlIGJpdCBkaWZmZXJlbnQgY29tcGF0aWJpbGl0eSBzdHJpbmc6
CiAgcm9ja2NoaXAscmszMDY2LW5mYwoKS2luZCByZWdhcmRzLAoKSm9oYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
