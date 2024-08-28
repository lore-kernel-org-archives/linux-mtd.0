Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3294C5472D
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTwQQyPTATV457gwbGrrKJymCUuXcw+RR8iPSliM+Og=; b=jZ0q8lK/Rd8f6J
	8mueCigS+0h1SEACVBDeW0YU7P/SNquODGySK9Wk/9eiD7mvbTpqb5Fqcexy8W2juizcquZ+Talzi
	4Aq9nKjtuXWIE6LyHdjag0fqNSlfIBkMDaw/4wgme77to0ak0vGTawm0+Hv0qsDRoA3f/nc67+yfl
	aV6TS84YGiSIPZVnfMeJg+NwpsDsTALGINRIQRm2VLJQcfGMRBNdGxf5NstWNe8RKdXFodnZ1qQb3
	j4sggJumhNpgB7OFlPD+ev4wGdJ6L4PVw/XvGXfVX4geURfmodkLXbl8pg4FB9LEaZrvFbq+KeOXH
	QNpGhmiyZlfNSmPXfuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDZ3-0000000EQRo-3oE1;
	Wed, 28 Aug 2024 07:58:01 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDYg-0000000EQHB-08UR;
	Wed, 28 Aug 2024 07:57:39 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2020b730049so50499025ad.3;
        Wed, 28 Aug 2024 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724831857; x=1725436657; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GfqHwI8DhzI+oBVoPKsWjmnloLfBOCfpckFVyP5GIik=;
        b=HEocaz3xIdNwcANjR17cvtK5m8s9x3XTB8BeJFUjX7zmpZgF1wGYdObv9hDkaJ9Uvt
         2Eioum0ZRwBbYJ6fnUoHYWhm6jEFwbx9hm+qKAM9hgp+tPdFia0InViZsv8W2R6mmdcB
         orOoPW6R/2RBlAWclaHjNazIhTjzP0UbWNFL2LCF4OaufgwgdHl9BXSbBw1NQnELtSQ1
         2Lqp67ZMtCnP+9I2Ct5e9SbnFYwU9thDbANuRqx1yFsjkCu+Eyh/+2B5T8POBnQz3i3t
         MUwoXxNdAQ+tVViUIrUU2LB2VHGUGzKhPdYI66Ozgol7NfzGVhZpTQHxADUCXui0SHIk
         GB3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724831857; x=1725436657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfqHwI8DhzI+oBVoPKsWjmnloLfBOCfpckFVyP5GIik=;
        b=AHL7FJr/DsRBiujBa17e0lOkV6FmCvsNo0p4fX9N5O27OM9b/680WG47kzfrCQKEO2
         GKc0xfmrdgSNBdVPa+kDCJflSgo+Ddx5okIqWYe+LCXHop0TB3LNcgW3ssjhjbI7LOtA
         MG+4KKMyMGn+9VSvkwQKQSvlMehSAS0FG612F6/L890UKJxW77Od09/o1bWiycKEqgA5
         O+EaOzIWBccZbz3eySKbVrzJtkyvAI9jfkh9TD2W97LmCkvcZlJGNaohtf2O2oX9QLjU
         O2RAIo3MP1Q20eVPUaofvDJwgp+uJCwsuwdTMKlU8jwXPQzvBBEnf35Lh9J70TGDUwcW
         fing==
X-Forwarded-Encrypted: i=1; AJvYcCUISX3DN3+givqege3o2qg7IQ5QMnwdFDzTYFrjDO1y+RVad4tu+HcrQfrFjNHlWEsxIdtVwzy2Rjqc@lists.infradead.org, AJvYcCWbIjjCoaY0QXhkhs+1YgZEoMXkBolsKU02to4rU+F0KVQkJkcifjt3VeweolgKc1kfKeHQ2D8WBi7axUbd9Axj@lists.infradead.org
X-Gm-Message-State: AOJu0YyvxFqaNoeqTt/ojQZY4FYCAWm0IB3yHdZgKzyHDupREBSQ1ZS7
	VEjuN+Yy9vQXeaDgK0aMha7SDXme47VHaQLeWoDUm10Qj6xSbwmr
X-Google-Smtp-Source: AGHT+IFVTQ3LfaXYubmmh//jrLLb1bQzxGTiF8xttq0VDGjJnNc/pBZNhv6nCpqY0o/0dZ2GXjw0+w==
X-Received: by 2002:a17:90a:600c:b0:2c8:da73:af82 with SMTP id 98e67ed59e1d1-2d646bb1094mr15667628a91.10.1724831856982;
        Wed, 28 Aug 2024 00:57:36 -0700 (PDT)
Received: from [172.19.1.53] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d844641416sm992321a91.44.2024.08.28.00.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 00:57:36 -0700 (PDT)
Message-ID: <1d2d2637-b897-4fb5-ab4e-c419c154a744@gmail.com>
Date: Wed, 28 Aug 2024 15:57:32 +0800
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
 <fd0d73cf-6bce-4f7b-9513-5f434ab9ae00@gmail.com>
 <20240828094846.166c7de6@xps-13>
Content-Language: en-US
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
In-Reply-To: <20240828094846.166c7de6@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_005738_096430_55959564 
X-CRM114-Status: GOOD (  17.59  )
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

RGVhciBNaXF1ZWwsCgpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuCgoKCk9uIDIwMjQvOC8yOCDk
uIvljYggMDM6NDgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgSHVpLVBpbmcsCj4KPiBocGNo
ZW4wbnZ0QGdtYWlsLmNvbSB3cm90ZSBvbiBXZWQsIDI4IEF1ZyAyMDI0IDEwOjQ3OjE3ICswODAw
Ogo+Cj4+IERlYXIgTWlxdcOobCwKPj4KPj4gVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5Lgo+Pgo+
Pgo+Pgo+PiBPbiAyMDI0LzgvMjQg5LiK5Y2IIDEyOjI2LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+
Pj4gSGksCj4+Pgo+Pj4gaHBjaGVuMG52dEBnbWFpbC5jb20gd3JvdGUgb24gV2VkLCAyMSBBdWcg
MjAyNCAwNzoxMTozMSArMDAwMDoKPj4+ICAgCj4+Pj4gQWRkIGR0LWJpbmRpbmdzIGZvciB0aGUg
TnV2b3RvbiBNQTM1IFNvQyBOQU5EIENvbnRyb2xsZXIuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBIdWktUGluZyBDaGVuIDxocGNoZW4wbnZ0QGdtYWlsLmNvbT4KPj4+PiBSZXZpZXdlZC1ieTog
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+Pj4+
IC0tLQo+Pj4+ICAgIC4uLi9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEtbmFuZC55YW1sICAg
ICB8IDkzICsrKysrKysrKysrKysrKysrKysKPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgOTMgaW5z
ZXJ0aW9ucygrKQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL251dm90b24sbWEzNWQxLW5hbmQueWFtbAo+Pj4+Cj4+Pj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbnV2b3Rvbixt
YTM1ZDEtbmFuZC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9u
dXZvdG9uLG1hMzVkMS1uYW5kLnlhbWwKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uMTUyNzg0ZTczMjYzCj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbnV2b3RvbixtYTM1ZDEt
bmFuZC55YW1sCj4+Pj4gQEAgLTAsMCArMSw5MyBAQAo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPj4+PiArJVlBTUwgMS4yCj4+
Pj4gKy0tLQo+Pj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL210ZC9udXZv
dG9uLG1hMzVkMS1uYW5kLnlhbWwjCj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9y
Zy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4+ICsKPj4+PiArdGl0bGU6IE51dm90b24gTUEz
NUQxIE5BTkQgRmxhc2ggSW50ZXJmYWNlIChORkkpIENvbnRyb2xsZXIKPj4+PiArCj4+Pj4gK21h
aW50YWluZXJzOgo+Pj4+ICsgIC0gSHVpLVBpbmcgQ2hlbiA8aHBjaGVuMG52dEBnbWFpbC5jb20+
Cj4+Pj4gKwo+Pj4+ICthbGxPZjoKPj4+PiArICAtICRyZWY6IG5hbmQtY29udHJvbGxlci55YW1s
Iwo+Pj4+ICsKPj4+PiArcHJvcGVydGllczoKPj4+PiArICBjb21wYXRpYmxlOgo+Pj4+ICsgICAg
ZW51bToKPj4+PiArICAgICAgLSBudXZvdG9uLG1hMzVkMS1uYW5kCj4+PiBDYW4gd2UgcGxlYXNl
IHVzZSB0aGUgLW5hbmQtY29udHJvbGxlciBzdWZmaXguIEEgTkFORCBpcyBhIHRoZSBjb21tb24K
Pj4+IG5hbWUgZm9yIGEgY2hpcCB3aXRoIHN0b3JhZ2UgaW5zaWRlLiBZb3UgYXJlIGRlc2NyaWJp
bmcgYSBob3N0Cj4+PiBjb250cm9sbGVyIHRoYXQgY2FuIGJlIGNvbm5lY3RlZCB0byBpbiBvcmRl
ciB0byB0YWxrIHRvIGEgTkFORC4KPj4KPj4gT2theSwgSSB3aWxsIGNoYW5nZSBpdCB0byBudXZv
dG9uLG1hMzVkMS1uZmkuCj4+Cj4+IEJlY2F1c2UgaW4gb3VyIHBsYXRmb3JtLCBpdCBpcyB0aGUg
TkFORCBGbGFzaCBJbnRlcmZhY2UuCj4gbmZpIGlzIG5vdCBhbiBhY3JvbnltIHRoYXQgaXMgdW5k
ZXJzdGFuZGFibGUgYnkgZXZlcnlvbmUuIFBsZWFzZSB1c2UKPiAtbmFuZC1jb250cm9sbGVyLiBE
b24ndCBiZSB3b3JyaWVkIGJ5IHRoZSBzaXplIG9mIHRoZSBzdHJpbmcuCj4KPiBZb3UgY2FuIHVz
ZSB0aGUgYWNyb255bSBhcyBwcmVmaXggZm9yIHlvdXIgTkFORCBjb250cm9sbGVyIGZ1bmN0aW9u
cwo+IHRob3VnaC4KCk9rYXksIEkgd2lsbCBjaGFuZ2UgaXQgdG8gbnV2b3RvbixtYTM1ZDEtbmFu
ZC1jb250cm9sbGVyLgoKCgo+IFRoYW5rcywKPiBNaXF1w6hsCgoKQmVzdCByZWdhcmRzLAoKSHVp
LVBpbmcgQ2hlbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
