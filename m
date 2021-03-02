Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C92C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:12:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B5A64EE7
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 20:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B5A64EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=milecki.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gc485e3kbmplDAAgZ7M41I1hzJnMBcWtivwU/lvPTL4=; b=kxYa6IwAhrqvw2ojEHU0igkbv
	llz8F2whp4ajPIRs7OpnZ3hamU2ifJ4hzPxhg4FBrRLMwwwi0udxf5gOy/jJ8CQATdzvW3CSZNt/W
	OQehGla1XO/pTEcwnjj8ZAO2ATy+7hHbF94J2cvD33II+xeODaa+e735lX4z+b61DzLo24e/xP24k
	AYpxuE9QdpvOPT8AKPbjl/K8eg713ZEHX9mGzIDfAeRrUHNEl7jJISNt0lUnQhUYQCa1PtNASwo5N
	2p+lHLO99iiqJUN3Y0+vmfJZPvSjsWE4Fxu/jg0+IsRXDVXYd7Y0v0N0tuD1eY/xfgDsZc2DTu1dT
	2YKhOFp5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHXqX-006NFE-B8; Wed, 03 Mar 2021 20:11:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT5L-005IgZ-FY
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 15:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=IcvtPW3dwHuMUNFiZ1gjS7g8vW7ddPD7fRIh42eM2j0=; b=qrub+Tdjn33is0cW3iCqwM/4KG
 j/zHwdr/x0KqMn8PaXnYqL7dCcQwu2bhxf5NIOLDWbISajS+5MyXty8kzvGSvlvMM6/iU09M0ia3n
 vxlEz/CqQRWYMtUDhPl0+OBdsJZ8s8fPm0JUfSgIqa2oezedG71vB4EYHz/SZL5+TPrOUBxaE2uiN
 zavBzBw56L+OomLunvVI45/0d8a7gXGdOtxtO7pduGcZzXp2dcjDo3FWEhzBO5mXsbajReyhZT+QT
 qv5HH93tMrfNQzNKouxV6IHvslV1WyYqOEl1w6SBD3ntQXVH2Vi1xai5kLABeoB6d65HZ8bVNXLOn
 9594rmAA==;
Received: from 11.mo6.mail-out.ovh.net ([188.165.38.119])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHBcD-000HID-Tv
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 20:27:34 +0000
Received: from player794.ha.ovh.net (unknown [10.108.57.14])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id CACE5242A86
 for <linux-mtd@lists.infradead.org>; Tue,  2 Mar 2021 21:27:27 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl
 [194.187.74.233]) (Authenticated sender: rafal@milecki.pl)
 by player794.ha.ovh.net (Postfix) with ESMTPSA id 82AD9187B2853;
 Tue,  2 Mar 2021 20:27:18 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G0034e92458d-6d63-4a0b-8483-a6f6cbf85a5f,
 30A6642CDD8C470EE0968BB77936367BDB6FAF8D) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: R: [PATCH] mtd: parsers: ofpart: limit parsing of deprecated DT
 syntax
To: ansuelsmth@gmail.com, =?UTF-8?B?J1JhZmHFgiBNacWCZWNraSc=?=
 <zajec5@gmail.com>, 'Miquel Raynal' <miquel.raynal@bootlin.com>,
 'Richard Weinberger' <richard@nod.at>,
 'Vignesh Raghavendra' <vigneshr@ti.com>
Cc: 'Boris Brezillon' <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
References: <20210302190012.1255-1-zajec5@gmail.com>
 <000801d70f9b$9c902980$d5b07c80$@gmail.com>
 <98afbb1a-d80e-4c0a-90c9-077c2361d753@milecki.pl>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <68e1031b-1098-b6ea-10e4-989633bf97fe@milecki.pl>
Date: Tue, 2 Mar 2021 21:27:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <98afbb1a-d80e-4c0a-90c9-077c2361d753@milecki.pl>
Content-Language: en-US
X-Ovh-Tracer-Id: 11506134100179979955
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgudeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeftrghfrghlucfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeekudehjeehffdufefhgffhgeejjeelteekveeuleevgeekhffhffeiheellefgveenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_202734_929345_58131467 
X-CRM114-Status: GOOD (  11.50  )
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

T24gMDIuMDMuMjAyMSAyMToyMywgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+IE9uIDAyLjAzLjIw
MjEgMjA6MzgsIGFuc3VlbHNtdGhAZ21haWwuY29tIHdyb3RlOgo+Pj4gRnJvbTogUmFmYcWCIE1p
xYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+Pj4KPj4+IEZvciBiYWNrd2FyZCBjb21wYXRpYmls
aXR5IG9mcGFydCBzdGlsbCBzdXBwb3J0cyB0aGUgb2xkIHN5bnRheCBsaWtlOgo+Pj4gc3BpLWZs
YXNoQDAgewo+Pj4gwqDCoMKgwqBjb21wYXRpYmxlID0gImplZGVjLHNwaS1ub3IiOwo+Pj4gwqDC
oMKgwqByZWcgPSA8MHgwPjsKPj4+Cj4+PiDCoMKgwqDCoHBhcnRpdGlvbkAwIHsKPj4+IMKgwqDC
oMKgwqDCoMKgIGxhYmVsID0gImJvb3Rsb2FkZXIiOwo+Pj4gwqDCoMKgwqDCoMKgwqAgcmVnID0g
PDB4MCAweDEwMDAwMD47Cj4+PiDCoMKgwqDCoH07Cj4+PiB9Owo+Pj4gKHdpdGhvdXQgInBhcnRp
dGlvbnMiIHN1Ym5vZGUpLgo+Pj4KPj4+IFRoZXJlIGlzIG5vIHJlYXNvbiBob3dldmVyIHRvIHN1
cHBvcnQgbmVzdGVkIHBhcnRpdGlvbnMgd2l0aG91dCBhIGNsZWFyCj4+PiAiY29tcGF0aWJsZSIg
c3RyaW5nIGxpa2U6Cj4+PiBwYXJ0aXRpb25zIHsKPj4+IMKgwqDCoMKgY29tcGF0aWJsZSA9ICJm
aXhlZC1wYXJ0aXRpb25zIjsKPj4+IMKgwqDCoMKgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+PiDC
oMKgwqDCoCNzaXplLWNlbGxzID0gPDE+Owo+Pj4KPj4+IMKgwqDCoMKgcGFydGl0aW9uQDAgewo+
Pj4gwqDCoMKgwqDCoMKgwqAgbGFiZWwgPSAiYm9vdGxvYWRlciI7Cj4+PiDCoMKgwqDCoMKgwqDC
oCByZWcgPSA8MHgwIDB4MTAwMDAwPjsKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoCBwYXJ0aXRpb25A
MCB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxhYmVsID0gImNvbmZpZyI7Cj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDgwMDAwIDB4ODAwMDA+Owo+Pj4gwqDCoMKgwqDC
oMKgwqAgfTsKPj4+IMKgwqDCoMKgfTsKPj4+IH07Cj4+PiAod2UgbmV2ZXIgb2ZmaWNpYWxseSBz
dXBwb3J0ZWQgb3IgZG9jdW1lbnRlZCB0aGF0KS4KPj4+Cj4+PiBNYWtlIHN1cmUgb2ZwYXJ0IGRv
ZXNuJ3QgYXR0ZW1wdCB0byBwYXJzZSBhYm92ZS4KPj4+Cj4+Cj4+IEkgaGF2ZSBvbmUgcXVlc3Rp
b24uCj4+IMKgRnJvbSB3aGF0IEkgY2FuIHNlZSBpbiB0aGUgbmV3IGNvZGUsIGluIHRoaXMgZXhh
bXBsZSAic29tZXRoaW5nIgo+PiBwYXJ0aXRpb24gd29uJ3QgYmUgcGFyc2VkIHdpdGggdGhlIGZp
eGVkLXBhcnRpdGlvbiBwYXJzZXIuIENvcnJlY3Q/Cj4+Cj4+IHBhcnRpdGlvbnMgewo+PiDCoMKg
wqDCoGNvbXBhdGlibGUgPSAiZml4ZWQtcGFydGl0aW9ucyI7Cj4+IMKgwqDCoMKgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47Cj4+IMKgwqDCoMKgI3NpemUtY2VsbHMgPSA8MT47Cj4+Cj4+IMKgwqDCoMKg
cGFydGl0aW9uQDAgewo+PiDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJib290bG9hZGVyIjsKPj4g
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDEwMDAwMD47Cj4+IMKgwqDCoMKgwqDCoMKgIGNv
bXBhdGlibGUgPSAicmFuZG9tLXBhcnNlciI7Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgIHBhcnRpdGlv
bkAwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsYWJlbCA9ICJzb21ldGhpbmciOwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHgxMDA+Owo+PiDCoMKgwqDCoMKgwqDC
oCB9Owo+PiDCoMKgwqDCoH07Cj4+IH07Cj4gCj4gQ29ycmVjdC4KPiAKPiBCb3RoOiAiYm9vdGxv
YWRlciIgYW5kICJzb21ldGhpbmciIHBhcnRpdGlvbnMgaW4geW91ciBleGFtcGxlIHdpbGwgaGF2
ZQo+IG1hc3Rlci0+cGFyZW50IHNldCB0byB0aGVpciBwYXJlbnRzLiBQYXJzZXIgIm9mcGFydCIg
d2lsbCBOT1QgYXR0ZW1wdCB0bwo+IHBhcnNlICJib290bG9hZGVyIiBzdWJub2RlcyBvciAic29t
ZXRoaW5nIiBzdWJub2Rlcy4KCkkgZXZlbiB2ZXJpZmllZCB0aGF0IHdpdGgKQ09ORklHX01URF9Q
QVJUSVRJT05FRF9NQVNURVI9eQoKYXMgd2VsbCBhcyB3aXRoCiMgQ09ORklHX01URF9QQVJUSVRJ
T05FRF9NQVNURVIgaXMgbm90IHNldAoKOikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
