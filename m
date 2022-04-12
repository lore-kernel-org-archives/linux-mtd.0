Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B6C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Apr 2022 07:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsjkleXDXPeV3KGmNnlR1LAYWruBaTiN22Yn5BhIUEs=; b=sWo9mFw02Dt5xi
	gW/s5ejQkJqsHWJGGtvOYVyfW8qZsnFx8y9GSU9zpp45fy1UDDVE0B096dnBHl2sa7WCKwxwxCsxg
	8QRz1Mx9xEPPjB09pyomgJpyIp+I5ExqZ+W6HvPCjcGpsKduzW09I+94UKCmY8L7PUYlpVmiKqAIy
	C7BxMS9Yd7B8KGdnx0uRwZEczadEPYXlNoU35UdR5dyzfNJFH90yGyY2UwrxrKy4vrlaKOCxKLLxF
	aixXG/I5smoZAcrVQsdKcduETT5FfqDfNvTQM5HYCuZesjzNojfRk4j9eCnVe7/YyPInNAuObGI1S
	HVyaB7mMLXYiqZ2QjlAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neBKA-00CLEN-MM; Tue, 12 Apr 2022 07:52:31 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neBAA-00CFrq-It
 for linux-mtd@lists.infradead.org; Tue, 12 Apr 2022 07:42:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id ll10so9206323pjb.5
 for <linux-mtd@lists.infradead.org>; Tue, 12 Apr 2022 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=9p/MmKuuxvIv4B30UAt79Rd7Dhf0WljkYqYqqKzZidw=;
 b=Mwww8UeE3bRZDqRGxTl0tpXi7zSB8wG+cPSjJsKwX72aR2VUttTenmlhDSj0HVpIKr
 mvsMwcJFNkqdGZbYaHPM5uzeZoeFpecwrcIK8OEYAnVaW5o5TeYyRLpTeXRfqCv69bf5
 n6J1cRU66cR2BMH3H9aqYDV3lLKZB9Rw6np4bbofSkci3SRy9+KcFeuP7hYHjbffHk63
 yEyNWZv2HadoZOXZ5aqoTEwgNrSz1Kemr7BHJzOsiYlJnLQ3ZpbAfZ4OtzbnR9J3CYB0
 iunlNqCohohbg9zA4n+Q+FQUs1tScceI9uXcgFtChyUw7kqDfNck1YPB1bJ83RbsAI/6
 vKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9p/MmKuuxvIv4B30UAt79Rd7Dhf0WljkYqYqqKzZidw=;
 b=lYaxDKddTgDsoa1TCG46rbOo7rvnB+xz3219T1fMFtHXgSKQF+4zhkeS6O6PDIqi8H
 yjpOqaIvjaO6YaRs48a2pWZ1OFfNQTvAA2LyATA/W4wyZuoDwvYIGMBKHQa/yacaePFI
 DWGxl+UoYkLw6P2nkx+cXq8QARdOXcbJAiWBM6XCRlnWb54GAtWY9ddTQ6itmlTPES7j
 gO7KY8G2dPneB3pHpWJqniobnNbmoK9ykfdce9PRZm+SfmVUZrJdBn1BL8htz02FezQs
 5toyfZDBxwkBvzfWvZYjEP0BlOzaZA1hKGzQAMjHTRJ7e8k94fGKyrNut7dSUXeFoV7S
 LdLA==
X-Gm-Message-State: AOAM533efM3tfcpfcfymqjKz1GtbEzBnifpGefSfxskrDxmpf18NKea2
 lPmKpypmgAJjGLimFrCVBYw=
X-Google-Smtp-Source: ABdhPJzlcXA1KUAmGSh2MiKL0M75Av4U3+iAaRIGSYomSHDnFzsTSnDmh+ZVyjBGda/uRe8WPUECiQ==
X-Received: by 2002:a17:90a:6402:b0:1c9:9377:dd0e with SMTP id
 g2-20020a17090a640200b001c99377dd0emr3433787pjj.211.1649749327100; 
 Tue, 12 Apr 2022 00:42:07 -0700 (PDT)
Received: from [192.168.1.101] ([159.226.95.33])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a63b606000000b003808b0ea96fsm1814254pgf.66.2022.04.12.00.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 00:42:06 -0700 (PDT)
Message-ID: <61783400-4df2-47af-78a7-7acb715c3a71@gmail.com>
Date: Tue, 12 Apr 2022 15:42:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] mtd: rawnand: Fix return value check of
 wait_for_completion_timeout
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Bastian Hecht <hechtb@googlemail.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <202204121253.NcZifMQi-lkp@intel.com>
 <20220412063703.8537-1-linmq006@gmail.com> <20220412090649.33bb3f8b@xps13>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <20220412090649.33bb3f8b@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_004210_653494_7D7EDE1B 
X-CRM114-Status: GOOD (  21.49  )
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

CkhpIE1pcXVlbCwKClRoYW5rcyBmb3IgeW91ciByZXBseS4KCk9uIDIwMjIvNC8xMiAxNTowNiwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPiBIaSBNaWFvcWlhbiwKPgo+IGxpbm1xMDA2QGdtYWlsLmNv
bSB3cm90ZSBvbiBUdWUsIDEyIEFwciAyMDIyIDA2OjM2OjUyICswMDAwOgo+Cj4+IHdhaXRfZm9y
X2NvbXBsZXRpb25fdGltZW91dCgpIHJldHVybnMgdW5zaWduZWQgbG9uZyBub3QgaW50Lgo+PiBJ
dCByZXR1cm5zIDAgaWYgdGltZWQgb3V0LCBhbmQgcG9zaXRpdmUgaWYgY29tcGxldGVkLgo+PiBU
aGUgY2hlY2sgZm9yIDw9IDAgaXMgYW1iaWd1b3VzIGFuZCBzaG91bGQgYmUgPT0gMCBoZXJlCj4+
IGluZGljYXRpbmcgdGltZW91dCB3aGljaCBpcyB0aGUgb25seSBlcnJvciBjYXNlLgo+Pgo+PiBG
aXhlczogODM3MzhkODdlM2EwICgibXRkOiBzaF9mbGN0bDogQWRkIERNQSBjYXBhYmlsdHkiKQo+
PiBTaWduZWQtb2ZmLWJ5OiBNaWFvcWlhbiBMaW4gPGxpbm1xMDA2QGdtYWlsLmNvbT4KPj4gLS0t
Cj4+IGNoYW5nZSBpbiB2MjoKPj4gLSBpbml0aWFsaXplIHJldCB0byAxLgo+PiAtLS0KPj4gIGRy
aXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMgfCA4ICsrKysrLS0tCj4+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvc2hfZmxjdGwuYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3No
X2ZsY3RsLmMKPj4gaW5kZXggYjg1YjljNmZjYzQyLi4yMzczMjUxZjU4NWIgMTAwNjQ0Cj4+IC0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3NoX2ZsY3RsLmMKPj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc2hfZmxjdGwuYwo+PiBAQCAtMzg0LDcgKzM4NCw4IEBAIHN0YXRpYyBpbnQgZmxj
dGxfZG1hX2ZpZm8wX3RyYW5zZmVyKHN0cnVjdCBzaF9mbGN0bCAqZmxjdGwsIHVuc2lnbmVkIGxv
bmcgKmJ1ZiwKPj4gIAlkbWFfYWRkcl90IGRtYV9hZGRyOwo+PiAgCWRtYV9jb29raWVfdCBjb29r
aWU7Cj4+ICAJdWludDMyX3QgcmVnOwo+PiAtCWludCByZXQ7Cj4+ICsJaW50IHJldCA9IDE7Cj4g
RG9lcyBub3QgbG9vayByaWdodC4gSSBrbm93IHRoaXMgZnVuY3Rpb24gcmV0dXJucyA+IDAgb24g
cG9zaXRpdmUKPiBvdXRjb21lcyBidXQgdGhpcyBkb2VzIG5vdCBtYWtlIGFueSBzZW5zZSBpbiB0
aGUgZmlyc3QgcGxhY2UuCgpZZXMsIEkgbWFkZSBhIG1pc3Rha2UsIE5vdyBJIHJlYWxpemUgdGhh
dCBpbiB2MiwgaXQgd2lsbCByZXR1cm4gMSBpbiBlcnJvciBwYXRoCgp3aGVuIERNQSBzdWJtaXQg
ZmFpbGVkLgoKQW5kIGZvciBwYXRjaCB2MSwgaXQgd2lsbCByZXR1cm4gMMKgIGlmIGNhbGxzIHdh
aXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCBzdWNjZWVkcy4KCj4gVGhpcyBmdW5jdGlvbiBpcyBz
dGF0aWMgYW5kIG9ubHkgY2FsbGVkIHR3aWNlLCBwbGVhc2UgdHVybiBpdCBpbnRvCj4gc29tZXRo
aW5nIGxpa2U6Cj4KPiBpZiAoZG1hX2ZpZm9fdHJhbnNmZXIoKSkKPiAJZXJyb3IKPiBlbHNlCj4g
CW9rCgpTbyBJIHdhbnQgdG8ga2VlcCByZXQ+MCBtZWFucyBzdWNjZXNzLgoKT3IgY291bGQgSSBz
ZXQgcmV0ID4gMCBhZnRlciBpbiB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoKSBzdWNjZXNz
IHBhdGg/CgpsaWtlOgoKwqDCoMKgIGlmKHRpbWVfbGVmdCA9PSAwKQoKwqDCoMKgIMKgwqDCoCDC
oMKgwqAgcmV0ID0gLUVUSU1FRE9VVDsKCsKgwqDCoCBlbHNlCgrCoMKgwqAgwqDCoMKgwqDCoCDC
oCByZXQgPSAxOwoKV2hhdCBkbyB5b3UgdGhpbms/CgoKVGhhbmtzLAoKPj4gKwl1bnNpZ25lZCBs
b25nIHRpbWVfbGVmdDsKPj4gIAo+PiAgCWlmIChkaXIgPT0gRE1BX0ZST01fREVWSUNFKSB7Cj4+
ICAJCWNoYW4gPSBmbGN0bC0+Y2hhbl9maWZvMF9yeDsKPj4gQEAgLTQyNSwxMyArNDI2LDE0IEBA
IHN0YXRpYyBpbnQgZmxjdGxfZG1hX2ZpZm8wX3RyYW5zZmVyKHN0cnVjdCBzaF9mbGN0bCAqZmxj
dGwsIHVuc2lnbmVkIGxvbmcgKmJ1ZiwKPj4gIAkJZ290byBvdXQ7Cj4+ICAJfQo+PiAgCj4+IC0J
cmV0ID0KPj4gKwl0aW1lX2xlZnQgPQo+PiAgCXdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgm
ZmxjdGwtPmRtYV9jb21wbGV0ZSwKPj4gIAkJCQltc2Vjc190b19qaWZmaWVzKDMwMDApKTsKPj4g
IAo+PiAtCWlmIChyZXQgPD0gMCkgewo+PiArCWlmICh0aW1lX2xlZnQgPT0gMCkgewo+PiAgCQlk
bWFlbmdpbmVfdGVybWluYXRlX2FsbChjaGFuKTsKPj4gIAkJZGV2X2VycigmZmxjdGwtPnBkZXYt
PmRldiwgIndhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dFxuIik7Cj4+ICsJCXJldCA9IC1FVElN
RURPVVQ7Cj4+ICAJfQo+PiAgCj4+ICBvdXQ6Cj4KPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
