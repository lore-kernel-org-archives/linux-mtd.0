Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B725BC001E0
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Aug 2023 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHmNQkEtG9N/etlEz48iGgliIUxviBaVuizBaNb6CWc=; b=W3CLT5zZd9dD0v
	gGkRlZP2qoXc3DSH0sTDs3canHSRtPYJCkvxFiPW0VszuyVQfAZav4GOsydUzd/j4wynCvxxOFxIM
	NCvLZT39R2/9wblO40PZVoh1ZhLGo9RzPvQ3YiiIKDGR7fPhyvc8eAZ+A1aysRSYB43CC5tn3PdCS
	85OHCUEJ48JQWiJ6mCozYkHIt7c/tYNuvNgPEDsZXQKuBcyIAZ35K4lzF9fHXPFKRYosoBqtC1xK5
	N/hGxCcODi8DiEsLbiCNqKV5XtTflUbHvvfVTqbLrComa9jXBEWPmarZsFptLEbnAmeS71lIa1D+G
	k3CEOrbwF1K51e+Eh/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFS5-004792-2u;
	Wed, 16 Aug 2023 12:16:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWFS1-00477t-2w
	for linux-mtd@lists.infradead.org;
	Wed, 16 Aug 2023 12:16:39 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c0290f0a8so798533666b.1
        for <linux-mtd@lists.infradead.org>; Wed, 16 Aug 2023 05:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692188192; x=1692792992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qfNUhMcJlVHTX5ugL614Z3rtxdFD686ztYoNw3q9y0=;
        b=H/mJ78nNtCoBbXVd1duxJf4+gPfM/iAJ2ovVQOTaNuEHibJJ0xCPAsD+UwT58Txvew
         mZTl64AXOEbMKm1wpNSzXPR9c95y+Bo1aEclJmNykBPSL3PznqC4mdCOuGQ0WLqqiks9
         OpJO0LXuPmjoEZXiHBM8mOdJaJ6osZp9Mvw38j4xtaKRO8Dz3sVXr7ZzMc/prB5lxFii
         OnBLkh+O+A5yMoahjDthsJ2sRvR7D4LGtj07ibRjO4yK5USOH+N/UALLo2SCAhpNMovg
         7cjq2Fnt1873ZEPdyk2lvjJABIEbMy4HWlFjRGUS/QsMeEYt8+h6ypqlIgrlCXAxc6r2
         48cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692188192; x=1692792992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qfNUhMcJlVHTX5ugL614Z3rtxdFD686ztYoNw3q9y0=;
        b=YeTbpDrlrV1qHCXkhn2GW6T0HlX5T/FTM31bMdtM99mwwpYX6ftMU9UoxIJ1v+/t6Z
         WRQbqqsaQY7OxMGC4/4zpJpp6SOhQmTo8AlvvTxJMK2kOHi9RpOttxvA/Z+YNx0ICcDS
         rwIEoAeYSrnF5Q4LyH4j7ePutEgjY7wsHR+H0Hoty7YyJ7Vy4ZxjiPu5lFMFHiG1evpA
         fIEO1bMmVcrFV+StefE8DwHv2uSH28qNzgR2CM2eHMrqo1hQ9iboyJ2bVwI5qGnNqDos
         sfe2GFiJx+wvSQSOD7wFxysosqChBF+0DmZgD5a1wt6MjzcfmaVVxJeYYNtMAza1Od9/
         7sSg==
X-Gm-Message-State: AOJu0YyaqOvfMDmLC8gxI5g0iAnUQGed6TGFkri8FaLXdrWewHyBoNiD
	TTEAqscrF97oL49aywi4GNDQJw==
X-Google-Smtp-Source: AGHT+IH2npSDQNyY7+hshJrvpkJswRw8jux0gNkJJiFZHSRMt71tiA/2TE9iIxDK3yb7mgMZsTxffA==
X-Received: by 2002:a17:906:704c:b0:994:2fa9:7446 with SMTP id r12-20020a170906704c00b009942fa97446mr1221712ejj.46.1692188192549;
        Wed, 16 Aug 2023 05:16:32 -0700 (PDT)
Received: from [192.168.0.107] ([79.115.63.44])
        by smtp.gmail.com with ESMTPSA id rl24-20020a170907217800b0099bd1ce18fesm8538796ejb.10.2023.08.16.05.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 05:16:32 -0700 (PDT)
Message-ID: <5911201a-f703-abbd-3c7b-769f70df08a8@linaro.org>
Date: Wed, 16 Aug 2023 13:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2,1/2] mtd: spi-nor: giga: gd25lq64c: Disable quad mode
 according to bus width
To: Michael Walle <michael@walle.cc>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 "Miquel Raynal )" <miquel.raynal@bootlin.com>,
 "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230816104245.2676965-1-hsinyi@chromium.org>
 <6702bac712daab13698b9bb9ad81d49e@walle.cc>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <6702bac712daab13698b9bb9ad81d49e@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_051638_007782_9C6FBDC8 
X-CRM114-Status: GOOD (  25.27  )
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

CgpPbiA4LzE2LzIzIDEyOjUxLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjMtMDgtMTYg
MTI6MzgsIHNjaHJpZWIgSHNpbi1ZaSBXYW5nOgo+PiBnZDI1bHE2NGMgaGFzIFF1YWQgRW5hYmxl
IFJlcXVpcmVtZW50IGZsYWcgcGFyc2VkIGFzCj4+IEJGUFRfRFdPUkQxNV9RRVJfU1IyX0JJVDFf
QlVHR1kgaW4gQkZQVCwgZXZlbiBpZiBzcGkte3J4L3R4fS1idXMtd2lkdGgKPj4gc2V0IGFzIG5v
biBRVUFELCBlZy4gMCwgMSwgMi4uLiBUaHVzIHF1YWRfZW5hYmxlIHdpbGwgbm90IGJlIE5VTEwg
YW5kCj4+IHF1YWQgZW5hYmxlIChRRSkgYml0IHdpbGwgYmUgc2V0IHRvIDEgYnkgZGVmYXVsdC4g
QWNjb3JkaW5nIHRvCj4+IGRhdGFzaGVldFsxXSwgaWYgUUUgYml0IGlzIGVuYWJsZWQsIFdQIHBp
biB3aWxsIGJlY29tZSBJTyBwaW4gYW5kIHRoZQo+PiBzeXN0ZW0gY2FuJ3QgdXNlIHdyaXRlIHBy
b3RlY3Rpb24gZmVhdHVyZSwgYW5kIGl0J3MgYWxzbyBub3QgcmVjb21tZW5kZWQKPj4gdG8gc2V0
IFFFIGJpdCB0byAxWzFdLgo+Pgo+PiBBZGQgYSBwb3N0X2JmcHQgZml4dXAgdGhhdCByZWFkcyBz
cGktcngtYnVzLXdpZHRoIHRvIHJlbW92ZSBxdWFkX2VuYWJsZQo+PiBpZiB0aGUgd2lkdGggaXMg
c2V0IHRvIGJlbG93IFFVQUQgbW9kZS4KPj4KPj4gWzFdCj4+IGh0dHBzOi8vd3d3LmdpZ2FkZXZp
Y2UuY29tLmNuL1B1YmxpYy9VcGxvYWRzL3VwbG9hZGZpbGUvZmlsZXMvMjAyMjA3MTQvRFMtMDAw
MTItR0QyNUxRNjRDLVJldjMuNC5wZGYKPj4gcGFnZSAxMwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBI
c2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4+IC0tLQo+PiDCoGRyaXZlcnMvbXRk
L3NwaS1ub3IvZ2lnYWRldmljZS5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2dpZ2FkZXZpY2UuYyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jCj4+IGluZGV4IGQ1N2RkYWYxNTI1YjMuLjhlYTg5ZTE4
NThmOWIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jCj4+
ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvZ2lnYWRldmljZS5jCj4+IEBAIC0zMyw2ICszMywz
MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9ub3JfZml4dXBzIGdkMjVxMjU2X2ZpeHVwcyA9
IHsKPj4gwqDCoMKgwqAgLnBvc3RfYmZwdCA9IGdkMjVxMjU2X3Bvc3RfYmZwdCwKPj4gwqB9Owo+
Pgo+PiArc3RhdGljIGludAo+PiArZ2QyNWxxNjRjX3Bvc3RfYmZwdChzdHJ1Y3Qgc3BpX25vciAq
bm9yLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0
ZXJfaGVhZGVyICpiZnB0X2hlYWRlciwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qg
c3RydWN0IHNmZHBfYmZwdCAqYmZwdCkKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wID0gc3BpX25vcl9nZXRfZmxhc2hfbm9kZShub3IpOwo+PiArwqDCoMKgIHUzMiB2YWx1
ZTsKPj4gKwo+PiArwqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIEV2ZW4gaWYgc3BpLXt0eCxyeH0t
YnVzLXdpZHRoIGlzIHNldCB0byBEVUFMIG1vZGUsIGR1ZSB0byB0aGUgUUVSCj4+ICvCoMKgwqDC
oCAqIGZsYWcgcGFyc2VkIGZyb20gQkZQVCBpcyBCRlBUX0RXT1JEMTVfUUVSX1NSMl9CSVQxX0JV
R0dZLCBzbyB0aGUKPj4gK8KgwqDCoMKgICogcXVhZF9lbmFibGUgd2lsbCBiZSBzZXQgYW5kIFFF
IGJpdCBzZXQgdG8gMS4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgaWYgKCFvZl9wcm9wZXJ0
eV9yZWFkX3UzMihucCwgInNwaS1yeC1idXMtd2lkdGgiLCAmdmFsdWUpKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAodmFsdWUgPD0gMikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9yLT5w
YXJhbXMtPnF1YWRfZW5hYmxlID0gTlVMTDsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBy
ZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBnZDI1
bHE2NGNfZml4dXBzID0gewo+PiArwqDCoMKgIC5wb3N0X2JmcHQgPSBnZDI1bHE2NGNfcG9zdF9i
ZnB0LAo+IAo+IE5vLiBQbGVhc2UgZml4IGl0IGluIHRoZSBjb3JlIGFuZCBub3QganVzdCBmb3Ig
dGhpcyBwYXJ0LiBUbyBtZSBpdCBzZWVtcwoKVGhlIGNvcmUgc2VlbXMgZmluZSB0byBtZS4gV2Ug
YWxyZWFkeSBhZGp1c3QgdGhlIGh3IGNhcHMgYnkga2VlcGluZyBqdXN0IHRoZQpoYXJkd2FyZSBj
YXBhYmlsaXRpZXMgc3VwcG9ydGVkIGJ5IGJvdGggdGhlIFNQSSBjb250cm9sbGVyIGFuZCB0aGUg
Zmxhc2gsCnNlZSBzcGlfbm9yX3NwaW1lbV9hZGp1c3RfaHdjYXBzKCkuIElmIHlvdSBzZXQgc3Bp
LXJ4LWJ1cy13aWR0aCA9IDwyPjsgCihzcGlfbm9yX2dldF9wcm90b2NvbF93aWR0aChub3ItPnJl
YWRfcHJvdG8pIHdpbGwgYmUgMiwgdGh1cyB0aGUgcXVhZCBlbmFibGUKbWV0aG9kIHdpbGwgbm90
IGJlIGNhbGxlZC4gQXJlIHlvdSBzdXJlIHlvdSBkb24ndCBoYXZlIHRoZSBxdWFkIGVuYWJsZSBi
aXQKc2V0IGJ5IHRoZSBib290bG9hZGVycz8gUGxlYXNlIGFkZCBzb21lIHByaW50cyBhbmQgY2hl
Y2sgd2hldGhlciB0aGUKcXVhZF9lbmFibGUgbWV0aG9kIGlzIGNhbGxlZCBvciBub3QuCgo+IGxp
a2UgYSBmdW5kYW1lbnRhbCBwcm9ibGVtIGFuZCB0aGF0IGNvbW1pdCAzOWQxZTMzNDBjNzMgKCJt
dGQ6IHNwaS1ub3I6Cj4gRml4IGNsZWFyaW5nIG9mIFFFIGJpdCBvbiBsb2NrKCkvdW5sb2NrKCki
KSBpcyBicm9rZW4gaW4gdGhhdCByZWdhcmQuCgp3aGF0J3Mgd3Jvbmcgd2l0aCB0aGUgbWVudGlv
bmVkIGNvbW1pdD8KCkNoZWVycywKdGEKPiBUdWRvcj8KPiAKPiAtbWljaGFlbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
