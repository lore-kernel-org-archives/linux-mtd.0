Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5581AC636CC
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Smdz72o5y8NdiZHOqEm0hV3iwP4nYonjUMrlQpRwcM=; b=fsWn3UBqXjxfzz
	s69cIkUXzklHFQbZjmbe6cvIdhep0iI+vS+BgujnOMoRtwb3Nin7JNttaiOmdFWCm/5h7MHoVTP3b
	8H8L+bzudSNOchsbktkY7Xv7KPAtebUjTP/72H9en2o+NUi3swniGP/Kwa7X6qtIooL1brydSxmAi
	bhAPE747/QUXXlcyiKI1PE8FMlAo9hhsIQbGhh/qqqEG7f4f1yrDFpkNMO68A29zSUK+LPqZgXkqf
	lIYtu3UjHGLGCxFh4BvqnGw742CIrf9yLDx+JdlfoYcNS9k/hVlKpLRZxv0As2F/zyc+eZbMXYS+D
	rQck73rjyMvQ3hnxFBeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrJe-000zow-EG; Fri, 03 Feb 2023 08:21:02 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNrJZ-000zml-SE
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 08:21:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id o36so3255113wms.1
        for <linux-mtd@lists.infradead.org>; Fri, 03 Feb 2023 00:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FZB8u0hK8celsgtBGywiqDlydZ2H2zIP8KlZldNqcYw=;
        b=EAgjKJMPNyK4poNVECYtLG0rsTsJIuVTCORN0LPHrwCT/whMyMRl3IBF95/P7zq/Co
         0qnKGlA0C46ErMlxBCaNNPOWi2uIYD2Pl2UxyA+Gy7+XcLJLrY7JusV41ngfn8K9i7a0
         Gmkt+WGawsbrjSeTRFrWEkUsuR0f61vYc5NwmvK/WJkZfa3/45ThJPA1GQAjUVy09Jl/
         adWHh5T74c3JS36ZEOCMrNlCFK+4vZf/DrL2095j2AAHNUBt8/zN6W2qzCFDkW1fDtFz
         N6+yDWNvqkvk9JhPu/8maEjIjK5uHXomgHuZvxNMVpC2oqdgEUZcheb4g8PQfuOKsq+y
         L/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZB8u0hK8celsgtBGywiqDlydZ2H2zIP8KlZldNqcYw=;
        b=rrwf5cS0oVtkcblek5cIZ7U6sjnF+IPrmJ0OVnt2j4nGUKoz7wGXmAtQRL3eG8R5f6
         zyK3lggQ8+a2rG6xQZXXL63DneEV6sM+A2MFYEMRwbLbzTlanLLChEpnLcIcsiI3O9l4
         aX8RA42q9oWphQbyzdewOuN/60ZHvzqrMRGZ1sqX8KtTaCM6u9sR37T7gu/Q8/BAl2Be
         MieUbARBj2bF6qkh+R8If+PhZRoFhIGExNHMsFxLml7pQ2JkQkkBiOuwlpb5Y7wnhmZW
         56m8Zpmm2aiZY6YZnvANJ+irRq0hxvwhGKEaFFYq+rHGFMDH+nkJvonOBFDWI5IYvAeH
         IMuw==
X-Gm-Message-State: AO0yUKUwEpp1qRxychxAfA8JakpUhl6IfOFVm8eIjjnKlzu+0CLXofS9
	eoYFpb0FlYl0scWt+SzsbEtTbA==
X-Google-Smtp-Source: AK7set8+kH5SMVKA7sX9Jdesxl82jJn2oQYyylNW8iP0NfM4Mu8ony2ygAjv75ff08zF07oNTbHwjw==
X-Received: by 2002:a7b:c388:0:b0:3db:2e6e:7826 with SMTP id s8-20020a7bc388000000b003db2e6e7826mr10526474wmj.5.1675412455864;
        Fri, 03 Feb 2023 00:20:55 -0800 (PST)
Received: from [192.168.43.12] (pop.92-184-100-89.mobile.abo.orange.fr. [92.184.100.89])
        by smtp.gmail.com with ESMTPSA id k24-20020a05600c0b5800b003cfa622a18asm7026917wmr.3.2023.02.03.00.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 00:20:55 -0800 (PST)
Message-ID: <008e9ab2-fee5-90f7-f619-504e30863f8d@baylibre.com>
Date: Fri, 3 Feb 2023 09:20:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] mtd: spi_nor: Fixes out of bound shift
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc
References: <20230126142612.1518046-1-lrannou@baylibre.com>
 <8c38974f-abe6-499c-6769-e368f298deea@linaro.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <8c38974f-abe6-499c-6769-e368f298deea@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_002058_162567_D1936B0F 
X-CRM114-Status: GOOD (  24.32  )
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

Ck9uIDAyLzAyLzIwMjMgMjA6MTgsIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4gSGkhCj4gCj4gT24g
MjYuMDEuMjAyMyAxNjoyNiwgbHJhbm5vdUBiYXlsaWJyZS5jb20gd3JvdGU6Cj4+IEZyb206IExv
dWlzIFJhbm5vdSA8bHJhbm5vdUBiYXlsaWJyZS5jb20+Cj4+Cj4+IHNwaV9ub3Jfc2V0X2VyYXNl
X3R5cGUgaXMgY2FsbGVkIHR3aWNlIGluIHNmZHAuYyB3aXRoIGEgbnVsbCBzaXplLiBUaGUKPj4g
cmV0dXJuIGZyb20gZmZzIGlzIDAgYXMgd2VsbCBhbmQgdGhlIHNoaWZ0IHNpemUgYmVjb21lcyAo
Ml4zMiAtIDEpIAo+PiB3aGljaCBpcwo+PiBvdXQgb2YgYm91bmQgd2hlbiBhcHBsaWVkIHRvIHRo
ZSA8PCBvcGVyYXRvci4KPj4KPj4gVGhpcyBjb25zaWRlcnMgYXMgaWxsZWdhbCBhIGNhbGwgdG8g
dGhpcyBmdW5jdGlvbiB3aXRoIG51bGwgc2l6ZS4gSXQKPj4gY3JlYXRlcyBhIHJlcGxhY2VtZW50
IHNwaV9ub3JfbWFza19lcmFzZV90eXBlIGZvciBleHBsaWNpdCBjYWxscyB0byBtYXNrCj4+IHRo
ZSBlcmFzZSB0eXBlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBSYW5ub3UgPGxyYW5ub3VA
YmF5bGlicmUuY29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCAx
OSArKysrKysrKysrKysrKysrKy0tCj4+IMKgIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jIHzC
oCA0ICsrLS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+PiBpbmRleCBkNjdjOTI2YmNhOGIuLjE0MGE4ZmE4
MWYwMyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPj4gQEAgLTIwMTUsMTUgKzIwMTUsMzAgQEAgc3Bp
X25vcl9zcGltZW1fYWRqdXN0X2h3Y2FwcyhzdHJ1Y3Qgc3BpX25vciAKPj4gKm5vciwgdTMyICpo
d2NhcHMpCj4+IMKgwqAgKiBAZXJhc2U6wqDCoMKgIHBvaW50ZXIgdG8gYSBzdHJ1Y3R1cmUgdGhh
dCBkZXNjcmliZXMgYSBTUEkgTk9SIGVyYXNlIAo+PiB0eXBlCj4+IMKgwqAgKiBAc2l6ZTrCoMKg
wqAgdGhlIHNpemUgb2YgdGhlIHNlY3Rvci9ibG9jayBlcmFzZWQgYnkgdGhlIGVyYXNlIHR5cGUK
Pj4gwqDCoCAqIEBvcGNvZGU6wqDCoMKgIHRoZSBTUEkgY29tbWFuZCBvcCBjb2RlIHRvIGVyYXNl
IHRoZSBzZWN0b3IvYmxvY2sKPj4gKyAqCj4+ICsgKiBSZXR1cm46IDAgb24gc3VjY2VzcywgLWVy
cm5vIG90aGVyd2lzZQo+PiDCoMKgICovCj4+IC12b2lkIHNwaV9ub3Jfc2V0X2VyYXNlX3R5cGUo
c3RydWN0IHNwaV9ub3JfZXJhc2VfdHlwZSAqZXJhc2UsIHUzMiBzaXplLAo+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHU4IG9wY29kZSkKPj4gK2ludCBzcGlfbm9yX3NldF9lcmFz
ZV90eXBlKHN0cnVjdCBzcGlfbm9yX2VyYXNlX3R5cGUgKmVyYXNlLCB1MzIgc2l6ZSwKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTggb3Bjb2RlKQo+PiDCoCB7Cj4+IMKgwqDCoMKg
wqAgZXJhc2UtPnNpemUgPSBzaXplOwo+PiDCoMKgwqDCoMKgIGVyYXNlLT5vcGNvZGUgPSBvcGNv
ZGU7Cj4+IMKgwqDCoMKgwqAgLyogSkVERUMgSkVTRDIxNkIgU3RhbmRhcmQgaW1wb3NlcyBlcmFz
ZSBzaXplcyB0byBiZSBwb3dlciBvZiAyLiAqLwo+PiArwqDCoMKgIGlmIChzaXplID09IDApCj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiAKPiB3ZSBzaG91bGQgY2hlY2sgdGhl
IHJldHVybiB2YWx1ZSBvbiBlYWNoIGNhbGwgdGhlbi4KPiAKPj4gwqDCoMKgwqDCoCBlcmFzZS0+
c2l6ZV9zaGlmdCA9IGZmcyhlcmFzZS0+c2l6ZSkgLSAxOwo+PiDCoMKgwqDCoMKgIGVyYXNlLT5z
aXplX21hc2sgPSAoMSA8PCBlcmFzZS0+c2l6ZV9zaGlmdCkgLSAxOwo+PiArwqDCoMKgIHJldHVy
biAwOwo+PiArfQo+PiArCj4+ICsvKioKPj4gKyAqIHNwaV9ub3JfbWFza19lcmFzZV90eXBlKCkg
LSBtYXNrIG91dCBhIFNQSSBOT1IgZXJhc2UgdHlwZQo+PiArICogQGVyYXNlOsKgwqDCoCBwb2lu
dGVyIHRvIGEgc3RydWN0dXJlIHRoYXQgZGVzY3JpYmVzIGEgU1BJIE5PUiBlcmFzZSB0eXBlCj4+
ICsgKi8KPj4gK3ZvaWQgc3BpX25vcl9tYXNrX2VyYXNlX3R5cGUoc3RydWN0IHNwaV9ub3JfZXJh
c2VfdHlwZSAqZXJhc2UpCj4+ICt7Cj4+ICvCoMKgwqAgZXJhc2UtPnNpemUgPSAwOwo+IAo+IGJ1
dCBJIGxpa2UgdGhlIGlkZWEgb2YgaW50cm9kdWNpbmcgYSBtYXNrIG91dCBtZXRob2QuCj4gCj4g
SSBzZW50IGEgc2xpZ2h0bHkgZGlmZmVyZW50IHZlcnNpb24gd2hlcmUgSSBhZGRlZCB5b3VyIFN1
Z2dlc3RlZC1ieSB0YWcKPiBmb3IgdGhlIG1hc2sgb3V0IGlkZWEuIExldCBtZSBrbm93IGlmIGl0
J3MgZmluZSBieSB5b3U6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjMw
MjAyMTkxNDUxLjM1MTQyLTEtdHVkb3IuYW1iYXJ1c0BsaW5hcm8ub3JnL1QvI3UKCk9mIGNvdXJz
ZSBpdCdzIGZpbmUgZm9yIG1lLiBJIGFsc28gYWdyZWUgdG8gdGhlIHYzLgoKVGhhbmtzICEKTG91
aXMKCj4gCj4gQ2hlZXJzLAo+IHRhCj4+ICvCoMKgwqAgZXJhc2UtPm9wY29kZSA9IDB4RkY7Cj4+
IMKgIH0KPj4gwqAgLyoqCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAu
YyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc2ZkcC5jCj4+IGluZGV4IDg0MzRmNjU0ZWNhMS4uOGQx
NTgyNDNmZTQ5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+PiAr
KysgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYwo+PiBAQCAtODc1LDcgKzg3NSw3IEBAIHN0
YXRpYyBpbnQgCj4+IHNwaV9ub3JfaW5pdF9ub25fdW5pZm9ybV9lcmFzZV9tYXAoc3RydWN0IHNw
aV9ub3IgKm5vciwKPj4gwqDCoMKgwqDCoMKgICovCj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsg
aSA8IFNOT1JfRVJBU0VfVFlQRV9NQVg7IGkrKykKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgh
KHJlZ2lvbnNfZXJhc2VfdHlwZSAmIEJJVChlcmFzZVtpXS5pZHgpKSkKPj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc3BpX25vcl9zZXRfZXJhc2VfdHlwZSgmZXJhc2VbaV0sIDAsIDB4RkYpOwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGlfbm9yX21hc2tfZXJhc2VfdHlwZSgmZXJhc2Vb
aV0pOwo+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+IEBAIC0xMDg5LDcgKzEwODks
NyBAQCBzdGF0aWMgaW50IHNwaV9ub3JfcGFyc2VfNGJhaXQoc3RydWN0IHNwaV9ub3IgKm5vciwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJhc2VfdHlwZVtpXS5vcGNvZGUgPSAoZHdv
cmRzWzFdID4+Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVyYXNlX3R5cGVbaV0uaWR4ICogOCkgJiAweEZGOwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZWxzZQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGlfbm9yX3NldF9lcmFzZV90eXBl
KCZlcmFzZV90eXBlW2ldLCAwdSwgMHhGRik7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNw
aV9ub3JfbWFza19lcmFzZV90eXBlKCZlcmFzZV90eXBlW2ldKTsKPj4gwqDCoMKgwqDCoCB9Cj4+
IMKgwqDCoMKgwqAgLyoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
