Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E18FC5479A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 02:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsVfbAhJ0HqroEMQL3GPPOZlAYAeikM2pRPxkaYZjzk=; b=uH3zLYdW4C7dUW
	0M6gwgk0QaYeyddZ+3Cz5IaWb9cVkORviysdgmITMNpyrHbiURaLfbm9x9GK4m8Ip4bnoPHx/0yiR
	3a+OqhnWCk7Nva1GxrvJ4V0zfsf7RCGJAcHv+k9iRfTFYOOAMJj5RX7Uj/NSmVX1Kb+u1RBGndGAD
	tkVVoEAb+amSCDFDmemKl/1BGQye3aDdWsq+h2vrD6FotzLr9EcZWk86yE1J/uUKmpfHzpreDxoia
	sh1VVXBhxAszqGU3IdY7krEI3T8+3yVFzA+Aqbv6+5TO8AYr5PDYeSl3GvpC5dZAA4ljeJmI/9NsZ
	f5NMyb11xHaHhbaV7fhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj8jI-0000000DWnJ-1Va7;
	Wed, 28 Aug 2024 02:48:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj8iR-0000000DWcv-1i9o;
	Wed, 28 Aug 2024 02:47:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-202376301e6so48065495ad.0;
        Tue, 27 Aug 2024 19:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724813242; x=1725418042; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lnF917HMalhfVI2HE4Sr2jQntbMdyS+RrizYBcr5oUo=;
        b=dxEp3gdYdbCITSXcSK4BIXKWyoBXx/rLSvjUKWRVTPU0XOy4mE3f5hwqXjC075SHMo
         P5hXjyitoynhvSMxJzpIjqeGHxOTD94JZWK98qf4G/1tHo0LFKAC+tPXfkUj1lGUHNDF
         HG8dGhXkwpOfTclqWlu0pl3+aQKe/Kl5TdoGnvthC3aYST39FziBNUWK0sCBsUtnaZAn
         eCcbTTmgiyl9E06xAE4n1vU9WIDkq5rwPa4QwfK6OpLJtaRzkcUHFXbvAG9HPTyz1n8C
         czE8Z2fiv/I8sCy0MO9doiUohzZHQX0OohcJ1RRL7wLWOoQgtRecFEE1MWKWbjrqgSPx
         AuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724813242; x=1725418042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lnF917HMalhfVI2HE4Sr2jQntbMdyS+RrizYBcr5oUo=;
        b=wuhiiKcGUuyL3qu6AlvriHDfCDDggl3Kg2CAsjBhdrokuiAlqPeObk1yi+izCSIXr3
         SkkQ6BytSmMviaBARj/VRq+buom6zD6b3XIAIgWGLpk6QnSySQHcOy6V/fzOW0fGnod0
         OnEkM9RbteeZJ7u4bOof1cKSyUO8rdqOf6yrpOQiKVzylveD+f54o6jvrp6Slxj8uiN1
         YGZg17ACsL6l0lxQdd4ELZqjEu8a8zEE8jfvIuXUyZba2zYY4O8Ten/PHzOP7LUhetIe
         f/PcxGFrE/2pGd+U4d5LhrI+aUaw0xNUwZAKr+S3tzVgKZ/p1pUlmO1+lmpK99MWZvBD
         swEA==
X-Forwarded-Encrypted: i=1; AJvYcCUjX2xdD+h+Z17TczWONTSOOCPcUkn14kmzp+6n+K3BlXXesy3fm9Ko2NPNj3PmfzLzZ6j86gquxHlttp1FubFk@lists.infradead.org, AJvYcCVqxbqxH6Vobi1jNY0YKf19qU0wgvmZ30CaqNgRXgB/pDryS2qxsv1c+K7leoXXaSBcMpubCrg8FNRs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/7uyC+ZpnxmN6F0kzpBoAQe0fnnkXYcTp8RZoaJPiP4P5gOe
	jpyA0g6xwd2eWFgLQg7c/bDwzT9iVCAZRNg0e6Kfa9UvQRrduZ55
X-Google-Smtp-Source: AGHT+IF0GEyxFOWbUu+ExQlyAJXiGNDV52VSUO4649Opxz3OpCXsbg5OuD8s1mKSDmM48NIESs5/IA==
X-Received: by 2002:a17:90a:ac17:b0:2d3:b8eb:9c3c with SMTP id 98e67ed59e1d1-2d646b9083cmr13244361a91.2.1724813241838;
        Tue, 27 Aug 2024 19:47:21 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac97f5fsm9869216a12.11.2024.08.27.19.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 19:47:21 -0700 (PDT)
Message-ID: <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
Date: Wed, 28 Aug 2024 10:47:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new
 bindings
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240821071132.281018-1-hpchen0nvt@gmail.com>
 <20240821071132.281018-2-hpchen0nvt@gmail.com>
 <20240823182616.5a85e1ae@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20240823182616.5a85e1ae@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_194723_473926_8F90D403 
X-CRM114-Status: GOOD (  15.55  )
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

RGVhciBNaXF1w6hsLAoKVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LgoKCgpPbiAyMDI0LzgvMjQg
5LiK5Y2IIDEyOjI2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpLAo+Cj4gaHBjaGVuMG52dEBn
bWFpbC5jb20gd3JvdGUgb24gV2VkLCAyMSBBdWcgMjAyNCAwNzoxMTozMSArMDAwMDoKPgo+PiBB
ZGQgZHQtYmluZGluZ3MgZm9yIHRoZSBOdXZvdG9uIE1BMzUgU29DIE5BTkQgQ29udHJvbGxlci4K
Pj4KPj4gU2lnbmVkLW9mZi1ieTogSHVpLVBpbmcgQ2hlbiA8aHBjaGVuMG52dEBnbWFpbC5jb20+
Cj4+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+Cj4+IC0tLQo+PiAgIC4uLi9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEt
bmFuZC55YW1sICAgICB8IDkzICsrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdl
ZCwgOTMgaW5zZXJ0aW9ucygrKQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL251dm90b24sbWEzNWQxLW5hbmQueWFtbAo+Pgo+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9udXZvdG9u
LG1hMzVkMS1uYW5kLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L251dm90b24sbWEzNWQxLW5hbmQueWFtbAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjE1Mjc4NGU3MzI2Mwo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55
YW1sCj4+IEBAIC0wLDAgKzEsOTMgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRp
ZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbXRkL251dm90b24sbWEzNWQxLW5hbmQu
eWFtbCMKPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIwo+PiArCj4+ICt0aXRsZTogTnV2b3RvbiBNQTM1RDEgTkFORCBGbGFzaCBJbnRlcmZh
Y2UgKE5GSSkgQ29udHJvbGxlcgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBIdWktUGlu
ZyBDaGVuIDxocGNoZW4wbnZ0QGdtYWlsLmNvbT4KPj4gKwo+PiArYWxsT2Y6Cj4+ICsgIC0gJHJl
ZjogbmFuZC1jb250cm9sbGVyLnlhbWwjCj4+ICsKPj4gK3Byb3BlcnRpZXM6Cj4+ICsgIGNvbXBh
dGlibGU6Cj4+ICsgICAgZW51bToKPj4gKyAgICAgIC0gbnV2b3RvbixtYTM1ZDEtbmFuZAo+IENh
biB3ZSBwbGVhc2UgdXNlIHRoZSAtbmFuZC1jb250cm9sbGVyIHN1ZmZpeC4gQSBOQU5EIGlzIGEg
dGhlIGNvbW1vbgo+IG5hbWUgZm9yIGEgY2hpcCB3aXRoIHN0b3JhZ2UgaW5zaWRlLiBZb3UgYXJl
IGRlc2NyaWJpbmcgYSBob3N0Cj4gY29udHJvbGxlciB0aGF0IGNhbiBiZSBjb25uZWN0ZWQgdG8g
aW4gb3JkZXIgdG8gdGFsayB0byBhIE5BTkQuCgoKT2theSwgSSB3aWxsIGNoYW5nZSBpdCB0byBu
dXZvdG9uLG1hMzVkMS1uZmkuCgpCZWNhdXNlIGluIG91ciBwbGF0Zm9ybSwgaXQgaXMgdGhlIE5B
TkQgRmxhc2ggSW50ZXJmYWNlLgoKCgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKQmVzdCByZWdhcmRz
LAoKSHVpLVBpbmcgQ2hlbgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
