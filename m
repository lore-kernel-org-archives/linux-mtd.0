Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4396BC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Apr 2022 15:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXcO2ub7lF7BmMXvgThL819zlfCFNOhH9IpAb2OnKRA=; b=DhWqna+mCaA3/b
	aHylwGEAVGieWbgAauJVemDcZR0jTrTpWgbaNrEcu1pz/r9Ns/tOxTuO+0lV7zrH4Fhp+uvTIUD8H
	063dD1Vma5gphiwn/vJp7WVD9WqlsVbIDSD41Df1owbkA5SRZ8g+APqohDqcC9MHCgx7FwWbUWwhu
	jIpedeTb0/WzbyfMKDix0yWcL1royzIAw/dtLHVWoUog8PkaxFDh7ZR1CWv1LSNqIRH5qRB/rlhBh
	c3omKEdLnkVZsJKPv647j9fnmxh99iyDuz5OBZDbfTDB/+9UkecxTc3Lq8IrMWOIIG1UZo6BhaBbP
	jtcvD8X7V2Je4Zs3dVyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkSW9-00BlkE-Tk; Fri, 29 Apr 2022 15:26:50 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkSW6-00BliP-Aq
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2022 15:26:48 +0000
Received: by mail-wr1-x433.google.com with SMTP id w4so11212995wrg.12
 for <linux-mtd@lists.infradead.org>; Fri, 29 Apr 2022 08:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=S21LZMOMIuKscCAVGlXF+uK+ApslTmDzzwG+NZhSchA=;
 b=O7ujDJaUsTmCVSelWMVE0M/07tET5WJFMVFVOCdhUlXIHobJu9cx8jwXkJxEHwTgDX
 lDDELmIAvfWIdgoFN2ZntaiQPn8pJAfUvT2iJ8ZAe1lWxrtjaOlz5xmJc6q/gdhgGtxw
 PeBRLtq5K6nAI3SESy0mfF9f0wb1GTANQU/OxHXXhO+iXvkQOt+wOCmFqlegisWPeOIy
 23XaH+jxoe98JjPdaWC4cxL6Xpd/ol0ncOOieYSbF0VF9PR7OEScLw2WFjr4xRjOw+V4
 Uq5uiJwBokrcirkgocbQ+CopKc9e+1af5OD/j7WDDW37JftCCr/v9ko9JHVu5aLXuPPL
 4N7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=S21LZMOMIuKscCAVGlXF+uK+ApslTmDzzwG+NZhSchA=;
 b=W7FMQVR2Y//7Q3SdlDXjRF8P+sTnwtYgGWDsPcaU4x3/LszKq5ff4ispWu3NEyqBa+
 ojepSz8JaxH34TF9+WfDh/xXhI6uTGAp+Q7e2ndZKPoKs2lzNOIGjfk9L12QIvWhhF/n
 HbtimkkGwMRMGcLf2JGZRmEUHnyU+s7X3USl2L4DYsIpv6dXsK6EPxE0tNT9BLWgxhtF
 Of/b7wfq2fRtqYdSo5jV101IyQE/kk0QRrJ2c7OyZj3zIYnc85oqIUqO+l3v+wdhUkbj
 PzdihhAOrNWckQ3QH2PJZq4kGSavpoAzsi+s9UOMyomWZxGdopfPx6G7Aq0CjZGgRpYH
 wk0A==
X-Gm-Message-State: AOAM533kx4Btn32ax1d0LTHPoQre6njFHcIhsAYVjzwmKLVMg2+hOYIs
 mc1R4pT6viyvthzIZ9K6B28=
X-Google-Smtp-Source: ABdhPJwlAbdiau1S8QDQQ1e543yvsafxIJSPKr5DNZyZcTNyn+IdhgE5fQGPkwu328s7IN6cwkoFrw==
X-Received: by 2002:adf:e7c1:0:b0:20a:b724:cedd with SMTP id
 e1-20020adfe7c1000000b0020ab724ceddmr31941202wrn.409.1651246003754; 
 Fri, 29 Apr 2022 08:26:43 -0700 (PDT)
Received: from ?IPV6:2a06:a003:501a:a7ce:d836:2ab4:b41d:7819?
 ([2a06:a003:501a:a7ce:d836:2ab4:b41d:7819])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a5d5648000000b0020af42ae172sm2667111wrw.87.2022.04.29.08.26.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 08:26:43 -0700 (PDT)
Message-ID: <1c19faf9-fc1c-9adf-d038-97b673a8f0be@gmail.com>
Date: Fri, 29 Apr 2022 18:26:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v2 1/2] dt-bindings: mtd: partitions: Add binding for Sercomm
 parser
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <bd533827-b575-caad-c230-af060851b231@gmail.com>
 <db70e53b-7484-43bf-e9c8-b6a2dce1fbb5@linaro.org>
 <25da3f43-c46e-8108-2da9-0e4f2b7cc1a4@gmail.com>
 <b279040a-a782-a2ca-2acb-2d8f07709081@linaro.org>
From: Mikhail Zhilkin <csharper2005@gmail.com>
In-Reply-To: <b279040a-a782-a2ca-2acb-2d8f07709081@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_082646_412683_64B864C5 
X-CRM114-Status: GOOD (  18.96  )
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

T24gNC8yOS8yMDIyIDk6NDYgQU0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cgo+Pj4gSSBh
bSBzb3JyeSwgYnV0IHlvdSBjaGFuZ2VkIG5vdyBhIGxvdCBpbiB0aGUgYmluZGluZ3MgYW5kIGl0
IGxvb2tzCj4+PiBlbnRpcmVseSBkaWZmZXJlbnQuIFRoaW5ncyBwcmV2aW91c2x5IGJlaW5nIGNv
cnJlY3Qgbm93IGFyZSB3cm9uZywgc28KPj4+IHJhdGhlciBzdGFydCBmcm9tIHlvdXIgb2xkIGJp
bmRpbmdzLi4uCj4+Cj4+IExvb2tzIGxpa2UgSSdtIGEgYml0IGNvbmZ1c2VkLi4uIEkgdXNlIGR1
YWwgImNvbXBhdGlibGUiIGluIG15IHJlYWwgZHRzCj4+IGFuZCBJIHJlYWxpemVkIHRoYXQ6Cj4+
Cj4+IDEuIFRoZXJlZm9yZSBJIGhhdmUgdG8gdXNlwqAgZHVhbCAiY29tcGF0aWJsZSIgaW4gZXhh
bXBsZSB0b286Cj4+Cj4+IGNvbXBhdGlibGUgPSAic2VyY29tbSxzYy1wYXJ0aXRpb25zIiwgImZp
eGVkLXBhcnRpdGlvbnMiOwo+Pgo+PiAyLiBXaGVuIEknbSB0cnlpbmcgdG8gcmV1c2UgImZpeGVk
LXBhcnRpdGlvbnMiIGNvbXBhdGlibGUgZnJvbQo+PiBmaXhlZC1wYXJ0aXRpb25zLnlhbWwgaW4g
bXkgbmV3IC55YW1sIEkgZ2V0ICJ0b28gbG9uZyIgZXJyb3JzLgo+IFllcywgdGhlIGZpeGVkLXBh
cnRpdGlvbnMueWFtbCB3b3VsZCBoYXZlIHRvIGJlIGNoYW5nZWQgdG8gYWxsb3cgZXh0ZW5zaW9u
LgoKV2VsbC4KCj4+IFJlYWwgZHRzOgo+Pgo+PiBMaW5rOgo+PiBodHRwczovL2dpdGh1Yi5jb20v
b3BlbndydC9vcGVud3J0L2Jsb2IvZWRjYzFhOWE3MzRiYjNmY2RjOTI0MjAyNTI5MGQzZjE3M2U3
MWI3OC90YXJnZXQvbGludXgvcmFtaXBzL2R0cy9tdDc2MjFfYmVlbGluZV9zbWFydGJveC1naWdh
LmR0cyNMNzkKPj4KPj4gU28sIEkgY3VycmVudGx5IGZvdW5kIGFub3RoZXIgc29sdXRpb24gLSB0
byBleHRlbmQgZml4ZWQtcGFydGl0aW9ucy55YW1sCj4+IHdpdGggInNlcmNvbW0sc2MtcGFydGl0
aW9ucyIuIElzIEl0IG9rIGZyb20geW91ciBzaWRlPyBDYW4gSSB1c2UgdGhpcwo+PiBjb2RlIGlu
IHYzPwo+IE5vdCByZWFsbHksIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgZG8geW91IG5lZWQgaXQg
CgpUaGUgbWFpbiBpZGVhIGlzIGtlZXBpbmcgb3JpZ2luYWwgU2VyY29tbSBmaXJtd2FyZSBiZWhh
dmlvcjoKCjEuIElmIGR5bmFtaWMgcGFydGl0aW9uIG1hcCBmb3VuZCB0aGVuIHVzZSBvZmZzZXRz
IGFuZCBtdGQgc2l6ZXMgc3RvcmVkCmluIHBhcnRpdGlvbiBtYXAuIEl0J3MgcHJvdmlkZWQgYnkg
InNlcmNvbW0sc2MtcGFydGl0aW9ucyIgY29tcGF0aWJsZS4KCjIuIElmIGR5bmFtaWMgcGFydGl0
aW9uIG1hcCBkb2Vzbid0IGV4aXN0IG9yIGJyb2tlbiB0aGVuIGRlZmF1bHQgdmFsdWVzCihmcm9t
IGR0cykgYXJlIHVzZWQuIEl0J3MgcHJvdmlkZWQgYnkgImZpeGVkLXBhcnRpdGlvbnMiIGNvbXBh
dGlibGUuCgo+IGFuZCBpdCBkb2VzIG5vdAo+IGluY2x1ZGUgb3VyIHByZXZpb3VzIHRhbGtzLgoK
QXQgdGhlIHRpbWUsIEkgZGlkbid0IHJlYWxpemUgaG93IGltcG9ydGFudCBpcyBpdC4gVW5kZXJz
dGFuZGluZyBiZWdhbgp0byBjb21lIGFmdGVyIGRvemVucyBvZiBleHBlcmltZW50cyBhbmQgY2hl
Y2tpbmcgdGhlIHNpbWlsYXIgTGludXggcGF0Y2hlcy4KCj4+IGRpZmYgLS1naXQKPj4gYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0
aW9ucy55YW1sCj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9wYXJ0
aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbAo+PiBpbmRleCBlYTRjYWNlNmE5NTUuLjllZWJl
MzlhNTdmYiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L210ZC9wYXJ0aXRpb25zL2ZpeGVkLXBhcnRpdGlvbnMueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55
YW1sCj4+IEBAIC0xOSw3ICsxOSwxMSBAQCBtYWludGFpbmVyczoKPj4gwqAKPj4gwqBwcm9wZXJ0
aWVzOgo+PiDCoMKgIGNvbXBhdGlibGU6Cj4+IC3CoMKgwqAgY29uc3Q6IGZpeGVkLXBhcnRpdGlv
bnMKPj4gK8KgwqDCoCBvbmVPZjoKPj4gK8KgwqDCoMKgwqAgLSBjb25zdDogZml4ZWQtcGFydGl0
aW9ucwo+PiArwqDCoMKgwqDCoCAtIGl0ZW1zOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29u
c3Q6IHNlcmNvbW0sc2MtcGFydGl0aW9ucwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6
IGZpeGVkLXBhcnRpdGlvbnMKPj4gwqAKPj4gwqDCoCAiI2FkZHJlc3MtY2VsbHMiOiB0cnVlCj4+
IMKgCj4+IEBAIC0yNyw3ICszMSwxOCBAQCBwcm9wZXJ0aWVzOgo+PiDCoAo+PiDCoHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+PiDCoMKgICJAWzAtOWEtZl0rJCI6Cj4+IC3CoMKgwqAgJHJlZjogInBhcnRp
dGlvbi55YW1sIyIKPj4gK8KgwqDCoCBhbGxPZjoKPj4gK8KgwqDCoMKgwqAgLSAkcmVmOiAicGFy
dGl0aW9uLnlhbWwjIgo+PiArwqDCoMKgwqDCoCAtIGlmOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
IHByb3BlcnRpZXM6Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250YWluczoKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBjb25zdDogc2VyY29tbSxzYy1wYXJ0aXRpb25zCj4+ICvCoMKgwqDCoMKg
wqDCoCB0aGVuOgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNjcGFydC1pZDoKPiBJdCBzdGlsbCBtaXNzZXMgdmVuZG9yIHByZWZp
eCBhbmQgd2UgYWdyZWVkIHlvdSBkb24ndCBuZWVkIGl0LCBkaWRuJ3Qgd2U/CgpEbyB5b3UgbWVh
biAic2VyY29tbSIgdmVuZG9yIHByZWZpeD8gSWYgc28gdGhlbiB3ZSBhZ3JlZWQgdGhhdCBJIGlu
Y2x1ZGUKaXQgaW4gYSBzZXBhcmF0ZSBwYXRjaDoKCkxpbms6Cmh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LW10ZC8xYjM5MTM5OS05ODRiLTdhNjMtMzI2NS02MmVmMDljYWVjMzlAZ21haWwu
Y29tLwoKSSdtIGdvaW5nIHRvIHNlbmQgaXQgaW4gdjM6CgotLS0KZHQtYmluZGluZ3M6IEFkZCBT
ZXJjb21tIChTdXpob3UpIENvcnBvcmF0aW9uIHZlbmRvciBwcmVmaXgKClVwZGF0ZSBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgdG8gaW5jbHVk
ZQoic2VyY29tbSIgYXMgYSB2ZW5kb3IgcHJlZml4IGZvciAiU2VyY29tbSAoU3V6aG91KSBDb3Jw
b3JhdGlvbiIuCkNvbXBhbnkgd2Vic2l0ZToKTGluazogaHR0cHM6Ly93d3cuc2VyY29tbS5jb20v
CgpTaWduZWQtb2ZmLWJ5OiBNaWtoYWlsIFpoaWxraW4gPGNzaGFycGVyMjAwNUBnbWFpbC5jb20+
Ci0tLQrCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMu
eWFtbCB8IDIgKysKwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
CmIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1s
CmluZGV4IDAxNDMwOTczZWNlYy4uNjVmZjIyMzY0ZmIzIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sCkBAIC0xMDgy
LDYgKzEwODIsOCBAQCBwYXR0ZXJuUHJvcGVydGllczoKwqDCoMKgwqAgZGVzY3JpcHRpb246IFNl
bnNpcmlvbiBBRwrCoMKgICJec2Vuc29ydGVrLC4qIjoKwqDCoMKgwqAgZGVzY3JpcHRpb246IFNl
bnNvcnRlayBUZWNobm9sb2d5IENvcnBvcmF0aW9uCivCoCAiXnNlcmNvbW0sLioiOgorwqDCoMKg
IGRlc2NyaXB0aW9uOiBTZXJjb21tIChTdXpob3UpIENvcnBvcmF0aW9uCsKgwqAgIl5zZmYsLioi
OgrCoMKgwqDCoCBkZXNjcmlwdGlvbjogU21hbGwgRm9ybSBGYWN0b3IgQ29tbWl0dGVlCsKgwqAg
Il5zZ2QsLioiOgotLSAKMi4yNS4xCgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCi0tIApC
ZXN0IHJlZ2FyZHMsCk1pa2hhaWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
