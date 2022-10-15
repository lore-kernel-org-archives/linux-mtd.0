Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DF4C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Oct 2022 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6V2nemjoL5pnDhoJO+fqaEaQCNhRWceZDWSW3RSiv0A=; b=n5mIXxaaulWGb4
	FVou+M/uje5YA0ExEdWx7YraTOy/hFoDtKghj0NsybViDBrWcisaOPg1Kfu+EFe8cnP9cbURLtYHA
	EcJnlYjaw43n+d8srHyVbETlP8uUs9FfUsaeFqAA5j0I8IL/EK1d2IucRsB0r60bkc8MN8EZ81X+x
	yEUXb1UilAFCyzvacFTVXuNPn3k+uEEXBTX1FySYjKuW95AYls8M5qhO2mpaOaEtz91hsKMM+vm/E
	jh3LsL8g0f/AkaGtpCIbeOszBOCyz04sJJHbPEDCiieFN1gwFGUoDPw8TXB+NK5HokEbfG613Dzb7
	xJ0RtqjNRVCLdqJNM4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojczd-00Gewf-QW; Sat, 15 Oct 2022 08:58:05 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojczb-00GewA-6w; Sat, 15 Oct 2022 08:58:04 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bj12so14967905ejb.13;
        Sat, 15 Oct 2022 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8THr6e5dwrx+OFbz/eCJDkyw6kNXf6tcFfVfShB5Ghc=;
        b=PYkuZuRdNzxrv0OD0mIbbvrBnUkodAuyGNCxDt6hQBbxYVIW18gxO2UNn7A5DTXXhK
         7xSOFCeGjJFHHVrxKCfmSbDcE2tC46tGcy+WUB+ca6GYyWUTpiPUBP55dWNmuNWHxfPD
         A20zltxsv7dLa5/jD8qMUzu7GX8s+F2qnSE0Mjcn8zbxgIiZHkKns4Mt2bsNc5W9nGrr
         xhY/UGCYgtKRObfP4S+UJsb3iMu6m4FitzIBbfwt7tlylNhuJDcp7sXAbPDjyoVSW3d9
         MhIXlNaSaf/ObdQbBMKaUMp9Jqf8EYXgBr9mYCBF6wnAzIMmxqbKhv6eG0TV7gsYMGmK
         Ye4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8THr6e5dwrx+OFbz/eCJDkyw6kNXf6tcFfVfShB5Ghc=;
        b=gV+Be7u4PvpYyTddi0KcAKnuWUTfb7lN2HWyIBiUxiJX6U1e1MdCe1Qw8+QJ03JH1j
         LHcwXAqLhnZuVjZER7KWqoO/ApYFIA8m8u3qnaIW4cBqOCvUz9Ii0gDso8ko8uoHIyqb
         J5iT/sg5HfRTZacG1TKosjqkTHepBGG9pk2OKTQ0dlPjNokjjrahvnbVSdCtj6Mfrjnw
         MaK+SdV72ebvcZ7ookiAegtNZlUtokwvAF5qQou05ce3i0+dMCOJt0VkDeIq/oBUgDXk
         Ovxg4+aDYeDqrLUo6BQoCrJwYbs5L7LSYpxmF8DHhzmrvDigSldRmR6gd8/53w612c5p
         Ux3A==
X-Gm-Message-State: ACrzQf0nkDCwxNPh+3+mXa4mmBbF3+qQJQNMPy2xDf7MwA6sDlvT9Y2z
	E2nHIQUUtdS9KowRVwOPTv8=
X-Google-Smtp-Source: AMsMyM6rEV1B5jLb3ffAxNGxXsPvb0SuOmKpM8CYU3+FvJlIBcAv7Ts5bcgBpEKqOXGDzWwiQlTyQQ==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id wu9-20020a170906eec900b0073dc369690fmr1351837ejb.767.1665824279047;
        Sat, 15 Oct 2022 01:57:59 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id kz1-20020a17090777c100b0073d753759fasm2840341ejc.172.2022.10.15.01.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 01:57:58 -0700 (PDT)
Message-ID: <27607fc6-fcab-ec13-7a21-16e6e0de7602@gmail.com>
Date: Sat, 15 Oct 2022 10:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: partitions: add TP-Link
 SafeLoader layout
To: Rob Herring <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list@broadcom.com, John Crispin <john@phrozen.org>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20221012050442.6815-1-zajec5@gmail.com>
 <20221012162117.GA2275712-robh@kernel.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20221012162117.GA2275712-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_015803_315699_730C0241 
X-CRM114-Status: GOOD (  21.72  )
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

T24gMTIuMTAuMjAyMiAxODoyMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBPY3QgMTIs
IDIwMjIgYXQgMDc6MDQ6NDFBTSArMDIwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+PiBGcm9t
OiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Cj4+IE1vc3QgVFAtTGluayBo
b21lIHJvdXRlcnMgdXNlIHRoZSBzYW1lIHBhcnRpdGlvbmluZyBzeXN0ZW0gYmFzZWQgb24gYQo+
PiBjdXN0b20gQVNDSUkgdGFibGUuCj4+Cj4+IEl0IGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGFueSBv
ZmZpY2lhbCBuYW1lLiBHUEwgc291cmNlcyBjb250YWluIHRvb2wKPj4gbmFtZWQgc2ltcGx5ICJt
YWtlX2ZsYXNoIiBhbmQgTWFrZWZpbGUgdGFyZ2V0ICJGbGFzaE1ha2VyIi4KPj4KPj4gVGhpcyBw
YXJ0aXRpb25zIHRhYmxlIGZvcm1hdCB3YXMgZmlyc3QgZm91bmQgaW4gZGV2aWNlcyB3aXRoIGEg
Y3VzdG9tCj4+IFNhZmVMb2FkZXIgYm9vdGxvYWRlciBzbyBpdCB3YXMgY2FsbGVkIFNhZmVMb2Fk
ZXIgYnkgYSBjb21tdW5pdHkuIExhdGVyCj4+IGl0IHdhcyBwb3J0ZWQgdG8gb3RoZXIgYm9vdGxv
YWRlcnMgYnV0IGl0IHNlZW1zIHRoZSBuYW1lIHN0aWNrZWQuCj4+Cj4+IEFkZCBiaW5kaW5nIGZv
ciBkZXNjcmliaW5nIGZsYXNoZXMgd2l0aCBTYWZlTG9hZGVyIHBhcnRpdGlvbnMgdGFibGUuIEl0
Cj4+IGFsbG93cyBvcGVyYXRpbmcgc3lzdGVtcyB0byBwYXJzZSBpdCBwcm9wZXJseSBhbmQgcmVn
aXN0ZXIgcHJvcGVyIGZsYXNoCj4+IGxheW91dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUmFmYcWC
IE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+PiAtLS0KPj4gVjI6IEZpeCB0eXBvIGluIGNv
bW1pdDogcy9zYW1lL25hbWUvCj4+IC0tLQo+PiAgIC4uLi90cGxpbmssc2FmZWxvYWRlci1wYXJ0
aXRpb25zLnlhbWwgICAgICAgICB8IDQ0ICsrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2Fk
ZXItcGFydGl0aW9ucy55YW1sCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9u
cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0aXRpb25z
L3RwbGluayxzYWZlbG9hZGVyLXBhcnRpdGlvbnMueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmUzOGFhZWE1YWExMQo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy90
cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25zLnlhbWwKPj4gQEAgLTAsMCArMSw0NCBAQAo+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+
PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVt
YXMvbXRkL3BhcnRpdGlvbnMvdHBsaW5rLHNhZmVsb2FkZXItcGFydGl0aW9ucy55YW1sIwo+PiAr
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+
ICsKPj4gK3RpdGxlOiBUUC1MaW5rIFNhZmVMb2FkZXIgcGFydGl0aW9ucwo+PiArCj4+ICtkZXNj
cmlwdGlvbjogfAo+PiArICBUUC1MaW5rIGhvbWUgcm91dGVycyBzdG9yZSB2YXJpb3VzIGRhdGEg
b24gZmxhc2ggKGUuZy4gYm9vdGxvYWRlciwKPj4gKyAgZmxhc2ggbGF5b3V0LCBmaXJtd2FyZSwg
cHJvZHVjdCBpbmZvLCBjb25maWd1cmF0aW9uLCBjYWxpYnJhdGlvbgo+PiArICBkYXRhKS4gVGhh
dCByZXF1aXJlcyBmbGFzaCBwYXJ0aXRpb25pbmcuCj4+ICsKPj4gKyAgRmxhc2ggc3BhY2UgbGF5
b3V0IG9mIFRQLUxpbmsgZGV2aWNlcyBpcyBzdG9yZWQgb24gZmxhc2ggaXRzZWxmIHVzaW5nCj4+
ICsgIGEgY3VzdG9tIEFTQ0lJLWJhc2VkIGZvcm1hdC4gVGhhdCBmb3JtYXQgd2FzIGZpcnN0IGZv
dW5kIGluIFRQLUxpbmsKPj4gKyAgZGV2aWNlcyB3aXRoIGEgY3VzdG9tIFNhZmVMb2FkZXIgYm9v
dGxvYWRlci4gTGF0ZXIgaXQgd2FzIGFkYXB0ZWQgdG8KPj4gKyAgQ0ZFIGFuZCBVLUJvb3QgYm9v
dGxvYWRlcnMuCj4+ICsKPj4gKyAgVGhpcyBiaW5kaW5nIGRlc2NyaWJlcyBwYXJ0aXRpb25pbmcg
bWV0aG9kIGFuZCBkZWZpbmVzIG9mZnNldCBvZiBBU0NJSQo+PiArICBiYXNlZCBwYXJ0aXRpb25z
IHRhYmxlLiBUaGF0IG9mZnNldCBpcyBwaWNrZWQgYXQgbWFudWZhY3R1cmluZyBwcm9jZXNzCj4+
ICsgIGFuZCBkb2Vzbid0IGNoYW5nZS4KPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICsgIC0gUmFm
YcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiAr
ICBjb21wYXRpYmxlOgo+PiArICAgIGNvbnN0OiB0cGxpbmssc2FmZWxvYWRlci1wYXJ0aXRpb25z
Cj4+ICsKPj4gKyAgcGFydGl0aW9ucy10YWJsZS1vZmZzZXQ6Cj4+ICsgICAgZGVzY3JpcHRpb246
IEZsYXNoIG9mZnNldCBvZiBwYXJ0aXRpb25zIHRhYmxlCj4+ICsgICAgJHJlZjogIi9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMiIKPiAKPiBEb24ndCBuZWVkIHF1b3Rlcy4K
PiAKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0gcGFydGl0aW9ucy10YWJsZS1vZmZzZXQKPj4g
Kwo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4gK2V4YW1wbGVzOgo+PiAr
ICAtIHwKPj4gKyAgICBwYXJ0aXRpb25zIHsKPj4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJ0cGxp
bmssc2FmZWxvYWRlci1wYXJ0aXRpb25zIjsKPj4gKyAgICAgICAgcGFydGl0aW9ucy10YWJsZS1v
ZmZzZXQgPSA8MHgxMDAwMDA+Owo+IAo+IFdoYXQgaXMgaW4gdGhlIHNwYWNlIGJlZm9yZSB0aGlz
PyBJdCBpcyBwYXJ0IG9mIHRoZSBzYWZlbG9hZGVyCj4gcGFydGl0aW9ucz8gSWYgdGhlIHNhZmVs
b2FkZXIgcGFydGl0aW9ucyBhcmUgbm90IHRoZSBlbnRpcmUgZGV2aWNlLCB0aGVuCj4gcGVyaGFw
cyB3ZSBzdGlsbCBuZWVkIGZpeGVkIHBhcnRpdGlvbnMuCgpWYXJpb3VzIHBhcnRpdGlvbnMgYXJl
IHBsYWNlZCBiZWZvcmUgYW5kIGFmdGVyIHBhcnRpdGlvbnMgdGFibGUuCgpVc3VhbGx5L2Fsd2F5
cyB0aGUgd2hvbGUgZmxhc2ggc3BhY2UgaXMgY292ZXJlZCBieSBwYXJ0aXRpb25zIGRlZmluZWQg
aW4KdGhlIHBhcnRpdGlvbnMgdGFibGUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
