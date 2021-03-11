Return-Path: <SRS0=XuJY=IJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA36C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 06:38:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC8064F76
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Mar 2021 06:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC8064F76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=161YvReKhIWz9J9+ZKXzxTHhbyio1s7xbKUJRIk/pNA=; b=ai2zzfMmYTXJ0HWNsqO+HU+hc
	Lz3uHtpnjBJm6k2dTYWAwTE3n4ydPB4zH5QKhO/Avlt2/4k1VrzKBgGCzcoqcGIUT4Bd+53rBA0xt
	9aKcyema6CfAVvhjFB+kha6qN1cDPResnjAKT/aRyIq99PJRv+Nubfj5eyCec0oFItMWoOt8prjSJ
	ky7qLYvi/BtuSbropd5EVx+wJJyhdjWw3/0hhm/1UQSXbRHf+hSv7Dge6k2a8YDQ5okc1RkLeJ2+n
	6yar9wkl6h2XUt380dSfXYLUvo4sxgX22fIytZgBDOIVPqVY9alQOymyt5/qB/tWZFr4vhAILrIxD
	DGxY8/3mQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKEwq-008WGe-F5; Thu, 11 Mar 2021 06:37:29 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKEwf-008WDO-5c
 for linux-mtd@lists.infradead.org; Thu, 11 Mar 2021 06:37:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id z25so708300lja.3
 for <linux-mtd@lists.infradead.org>; Wed, 10 Mar 2021 22:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rkUl4bL4Z7DgHnZybct6/BLTh4ZxrA3lKivu8PK+2QI=;
 b=f3qcanvEF1LN1YKHY6H2vlT/q1YtVAag+kxo3N1KAuotT4GHI9TLZKew984mF7l5A3
 BEZChTCiQHcRpaTH3hWlBYx/Hmej5K3hhB5yP2cSHududRuoYcTrrssqSzBGWUtrP9Ha
 xo1B/ekaUr65Elf7PpIY3V+uj6nnSRwUIb7pu72J5JNUkA6q4wD5az5lwKZOua9t+XMH
 bDwGLurh1sj2YE2tveQqQPYkTfoJT4BrE3QKf2CEhvMtSYODACRqdZGnroSvLL9yzmVx
 +6+iAoR5IUc6Om/eDF3ee0fSj9mg1qie3PgaXnlMBhKiNRRnZkBTq9Gkd8xG+lrt8CXm
 c7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rkUl4bL4Z7DgHnZybct6/BLTh4ZxrA3lKivu8PK+2QI=;
 b=rdgk/dj38Yfm6CaRq+LNiTjvrOLPf6uwarDMneT+CuRjHS1CQujOtHyuKb0GVNFcU2
 UWXFsQ8ZrNlrxdUF2HU6p0Jvv/GAKdTtFFr3m0MN5uPb4H3z1yYRXXgycxlaAjJvl9NO
 7xphXOo+ylYHHcf5vNvb+Gn+bSkqSio1zFbK2LyUd1u9sAdAKN2FhkdbKuzo15u45nt0
 KKhZNGH2FWlP4TY8m8tLHptNZlx/kONmZ1Bgfj7rIWcO37IRb4IFwqgc30RaQO04rPod
 4VMmmmSCA1SF/INSAPfel2PARwXBNphCv33l7kZgSOrtvqkXbyNaINNwcPEZrrbAgIrV
 FGyw==
X-Gm-Message-State: AOAM531MEoASJ4S2SjeZvOnSSEynGYLm/MP6WegeCQtki36OMg3jpfNS
 XaDYh3p1HjUDUWFvhiCxO7s=
X-Google-Smtp-Source: ABdhPJxk/USnHIUP+u2UTxk3wmttgYIJ3fJuHFSR6FpVpEU6hXIIM/uYblSNQUv6rrw3ttxdf3BdTQ==
X-Received: by 2002:a2e:a487:: with SMTP id h7mr3803393lji.447.1615444635933; 
 Wed, 10 Mar 2021 22:37:15 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id p3sm531674lfg.14.2021.03.10.22.37.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 22:37:15 -0800 (PST)
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Document use of nvmem-cells
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210310210812.8880-1-ansuelsmth@gmail.com>
 <20210310210812.8880-2-ansuelsmth@gmail.com>
 <5d798266-3a18-d50d-9c3e-f91bc2460fe5@gmail.com>
 <YElMjg/AspNSRe0A@Ansuel-xps.localdomain>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <1d2ad735-ad15-be6a-ad90-9c33f5845a15@gmail.com>
Date: Thu, 11 Mar 2021 07:37:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YElMjg/AspNSRe0A@Ansuel-xps.localdomain>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_063717_919014_7B81B1A8 
X-CRM114-Status: GOOD (  22.68  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTAuMDMuMjAyMSAyMzo0NywgQW5zdWVsIFNtaXRoIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDEw
LCAyMDIxIGF0IDExOjQxOjI0UE0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gU2Vl
IGlubGluZQo+Pgo+PiBPbiAxMC4wMy4yMDIxIDIyOjA4LCBBbnN1ZWwgU21pdGggd3JvdGU6Cj4+
PiBEb2N1bWVudCBudm1lbS1jZWxscyBjb21wYXRpYmxlIHVzZWQgdG8gdHJlYXQgbXRkIHBhcnRp
dGlvbnMgYXMgYQo+Pj4gbnZtZW0gcHJvdmlkZXIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW5z
dWVsIFNtaXRoIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gICAgLi4uL2JpbmRp
bmdzL210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxzLnlhbWwgIHwgOTYgKysrKysrKysrKysrKysr
KysrKwo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKykKPj4+ICAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRp
dGlvbnMvbnZtZW0tY2VsbHMueWFtbAo+Pj4KPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvbnZtZW0tY2VsbHMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9udm1lbS1jZWxs
cy55YW1sCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5m
NzBkNzU5N2E2YjAKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9udm1lbS1jZWxscy55YW1sCj4+PiBAQCAt
MCwwICsxLDk2IEBACj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZQo+Pj4gKyVZQU1MIDEuMgo+Pj4gKy0tLQo+Pj4gKyRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL3BhcnRpdGlvbnMvbnZtZW0tY2VsbHMueWFtbCMK
Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFt
bCMKPj4+ICsKPj4+ICt0aXRsZTogTnZtZW0gY2VsbHMKPj4+ICsKPj4+ICtkZXNjcmlwdGlvbjog
fAo+Pj4gKyAgQW55IHBhcnRpdGlvbiBjb250YWluaW5nIHRoZSBjb21wYXRpYmxlICJudm1lbS1j
ZWxscyIgd2lsbCByZWdpc3RlciBhcyBhCj4+PiArICBudm1lbSBwcm92aWRlci4KPj4+ICsgIEVh
Y2ggZGlyZWN0IHN1Ym5vZGVzIHJlcHJlc2VudHMgYSBudm1lbSBjZWxsIGZvbGxvd2luZyB0aGUg
bnZtZW0gYmluZGluZy4KPj4+ICsgIE52bWVtIGJpbmRpbmcgdG8gZGVjbGFyZSBudm1lbS1jZWxs
cyBjYW4gYmUgZm91bmQgaW46Cj4+PiArICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbnZtZW0vbnZtZW0ueWFtbAo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+Pj4gKyAgLSBBbnN1
ZWwgU21pdGggPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+Pgo+PiBJIHRoaW5rIHRoYXQgd2hlbiBS
b2Igd3JvdGU6Cj4+Cj4+IE9uIDEwLjAzLjIwMjEgMDM6NTgsIFJvYiBIZXJyaW5nIHdyb3RlOgo+
Pj4gSSB0aGluayB0aGlzIHNob3VsZCByZWZlcmVuY2UgbnZtZW0ueWFtbC4KPj4KPj4gaGUgbWVh
bnQgeW91IHVzaW5nOgo+Pgo+PiBhbGxPZjoKPj4gICAgLSAkcmVmOiAibnZtZW0ueWFtbCMiCj4+
Cj4+ICh5b3UnbGwgbmVlZCB0byBhZGp1c3QgYmluZGluZyBwYXRoKS4KPj4KPj4gUGxlYXNlIGNo
ZWNrIGhvdyBpdCdzIGRvbmUgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL252
bWVtLyoueWFtbCBmaWxlcwo+Pgo+Pgo+IAo+IEFzaWRlIGZyb20gdGhhdCwgc2hvdWxkIEkgcmVh
ZGQgdGhlIG9sZCBwcm9wZXJ0aWVzIG9yIEkgY2FuIGtlZXAgdGhlCj4gY29tcGF0aWJsZSBhcyB0
aGUgb25seSBvbmUgcmVxdWlyZWQ/CgpXaGF0IG9sZCBwcm9wZXJ0aWVzIGRvIHlvdSBtZWFuPwoK
WW91IHNob3VsZG4ndCBuZWVkIHRvIGFkZCBhbnl0aGluZyB0byB0aGUgbGlzdCBvZiAicmVxdWly
ZWQiIEkgdGhpbmsuCgpTb21lIE5WTUVNIHByb3ZpZGVycyBhZGQgIiNhZGRyZXNzLWNlbGxzIiBh
bmQgIiNzaXplLWNlbGxzIi4gVGhhdCBtYWtlcwpzZW5zZSBpZiBOVk1FTSBwcm92aWRlciBtdXN0
IHByb3ZpZGUgYXQgbGVhc3QgMSBjZWxsLiBJJ20gbm90IHN1cmUgaWYgd2UKbmVlZCB0aGF0IGZv
ciBNVEQuCgpFdmVuICJjb21wYXRpYmxlIiBpcyBhY3R1YWxseSByZWR1bmRhbnQgYnV0IG1vc3Qg
WUFNTCBmaWxlcyBsaXN0IGl0IGZvcgpjb252ZW5pZW5jZS4gU291cmNlOgoKT24gMTAuMTIuMjAy
MCAwMzo0OCwgUm9iIEhlcnJpbmcgd3JvdGU6CiA+IEFuZCBkcm9wICdjb21wYXRpYmxlJyBhcyBy
ZXF1aXJlZC4gSXQncyByZWR1bmRhbnQgYW55d2F5cyBiZWNhdXNlIHRoZQogPiBzY2hlbWEgd2ls
bCBvbmx5IGJlIGFwcGxpZWQgaWYgY29tcGF0aWJsZSBtYXRjaGVzLgoKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LW10ZC8yMDIwLURlY2VtYmVyLzA4NDU3NC5odG1s
Cmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvY29tbWVudC8yNTk3MzI2LwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
