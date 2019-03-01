Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F01C43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71EC2084D
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 17:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ga4++f9D";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="iVKeUb4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E71EC2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:
	In-Reply-To:References:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45HtH2UNeGy9B6Wv4tZ6nw/gpwgDqrMZGdk9L1lUzx4=; b=ga4++f9DIEWeEP
	a1UvBQQoUiaCXP/GyxFPy2tSIaLNXR/DXg9rIQObJkgRCS5bMqPRwrm/29AoJDo8Sn4XECmIE9lxw
	LJNEah7WnN+i/EMASB0k1ehj7up+ScOqn9zAD4cORRQJoIHQO2qFM4WxsTu0Tbl7CP2jYpWLU5whN
	IjLRyDFWJmIQDZnkwjMh86yxoyVl9pblW50YBDbEALNd8uRTTQa/c9P9Xe2krYXxfJ0HMIjEoj9c4
	F+lpc5a9+DBu9+5/d6P9zRZyuUFwXiyalNCWM9Ffixs255IUBRB3PH19u9VJM+InOB9VAXHV/IVkn
	pLrgPRm1VpfKi4+diSxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzmNm-00049p-4l; Fri, 01 Mar 2019 17:55:38 +0000
Received: from nh504-vm3.bullet.mail.kks.yahoo.co.jp ([183.79.57.89])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzmNh-00049F-Td
 for linux-mtd@lists.infradead.org; Fri, 01 Mar 2019 17:55:36 +0000
Received: from [183.79.100.139] by nh504.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 01 Mar 2019 17:55:32 -0000
Received: from [183.79.101.123] by t502.bullet.mail.kks.yahoo.co.jp with NNFMP;
 01 Mar 2019 17:55:32 -0000
Received: from [127.0.0.1] by omp510.mail.kks.yahoo.co.jp with NNFMP;
 01 Mar 2019 17:55:32 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 206347.71674.bm@omp510.mail.kks.yahoo.co.jp
Received: (qmail 95858 invoked by alias); 1 Mar 2019 17:55:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1551462932; bh=3RjWpVC9+8Gd+p0Fme2GsW1qMg47mwyqSoZRJHPV/fQ=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index;
 b=iVKeUb4kWBrpF9Ms4XIHnQS45k/J7JjH43pUgJ2PmTQk3OHB7EvkHkFSCq1ovXXnyqnUvFiqVpDTyZYnFGmFBS5qfyX195t83KwrqKgsXhesYwZjchzJ2cva8MVsLvj3Kp1YrM+I1dhcU7agYcLcKw8zIo5IPEBXJRuHYCj9OMg=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:Content-Language:Thread-Index;
 b=uikgz8WpIIodi2n6QSEhs1LdsuyTPqlKRtlAhIJ8TMmkq4DNPOBjUAbgQCvO/FksKcuEdaA9r5Xmt66ANKZscOSRDhS+4n5SGEGSqNJCIJywi0HkChKDXcytMS/J8RXfOeUXddWP0v/4wmpAH3ffmAZ6C2hw2DoLe0VQhJvlMlM=
 ; 
Received: from unknown (HELO ikegamiPC) (106.72.39.32 with )
 by smtp6001.mail.ssk.ynwp.yahoo.co.jp with SMTP; 1 Mar 2019 17:55:31 -0000
X-YMail-JAS: dEXjn7MVM1nSKJNfpBbJXtCWUM.T0kJUMe7I_fH4qEebq0Qq4MNQcwUwK2Aixiat1XgH5wEliPN1KVVZcSgoMOCbXVDBlCpwA_vBitd7XDrepjq8RWGtrqIgIqVSvf6g9BCyv_cMvQ--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: wUuU2McVM1neSkL0aggl4boIsotjPmFyyvp4oppzxeB0lOE
 lRo6VVvXZ4RUv33_h4UOaBxJzlve1BE29w78EyybD5mQwTdVNsxHIfEgzGtt
 Amaoahz6nST2UTzYSaTk_WF_6lSsZeOsjYaLwttBdY2Yco8PukhIpzcfDyOv
 h0t08yK.237Ki7fc4KKyYS1TMYArfHtFxBzSmjIvULwCD5429CJX7EYpEFBI
 ZeoQ_.KYiaJQx0Z1AkMpfuxbqrastZThQwGp7ejRzYw2gyD3oLU5uzo4_Xij
 5wjxSzxOcwsszuxiL_7AtbCcxE1hC82I_x.JFL1J79gE9RllfQ3Unp8eblik
 wKcaLFhF04WdsF3XCqHHsmGJFUWtvVVZ4kiP0sP9qy4Kr.8mPD5bsRWbt6Z6
 lEHzr3YXZlX47L9ZUY85GGRqiD2QcrlzdoFy6WAJs69D19J_aacrwOPOpi3I
 ZvWbnROtaWHiWQdHoqNa2crOzCSRNlmMi4ymYIOAq3WhbGMLoh7gHPDgsbh.
 1ztLTBpms2JB_KCJw2Q3HGHPVPXNjjdquQjQ_PhXvLmmvAdwdpi.ukLddniw -
From: "Tokunori Ikegami" <ikegami_to@yahoo.co.jp>
To: "'Boris Brezillon'" <boris.brezillon@collabora.com>,
 "'Tokunori Ikegami'" <ikegami.t@gmail.com>
References: <1551189648-58073-1-git-send-email-liujian56@huawei.com>
 <016001d4cf71$865e7b60$931b7220$@gmail.com>
 <4F88C5DDA1E80143B232E89585ACE27D0264F137@DGGEMM528-MBX.china.huawei.com>
 <20190228164228.734ede80@collabora.com>
 <005a01d4d03e$39b0e0f0$ad12a2d0$@yahoo.co.jp>
 <4b3bc01a-3632-5dde-f683-94744ee7179d@ti.com>
 <000501d4d050$38eca160$aac5e420$@gmail.com>
 <20190301184317.6bad546f@collabora.com>
In-Reply-To: <20190301184317.6bad546f@collabora.com>
Subject: RE: [PATCH v3] cfi: fix deadloop in cfi_cmdset_0002.c do_write_buffer
Date: Sat, 2 Mar 2019 02:55:31 +0900
Message-ID: <001c01d4d057$f68572e0$e39058a0$@yahoo.co.jp>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Content-Language: ja
Thread-Index: AQHOptjmAmqem5WpXlLpfOi8uScBsQIgzkq5Atg5CjYCPRAs9gF4c9/ZAXvgv0sDCmo4xAHviGI+pYo9SfA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_095534_372434_C29C1371 
X-CRM114-Status: GOOD (  22.77  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: 'Vignesh Raghavendra' <vigneshr@ti.com>, bbrezillon@kernel.org,
 ikegami@allied-telesis.co.jp, richard@nod.at, linux-kernel@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 "'liujian \(CE\)'" <liujian56@huawei.com>, keescook@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

PiA+ID4gWy4uLl0KPiA+ID4gPj4+Pj4gSW4gZnVuY3Rpb24gZG9fd3JpdGVfYnVmZmVyKCksIGlu
IHRoZSBmb3IgbG9vcCwgdGhlcmUgaXMgYQo+ID4gPiA+Pj4+PiBjYXNlIGNoaXBfcmVhZHkoKSBy
ZXR1cm5zIDEgd2hpbGUgY2hpcF9nb29kKCkgcmV0dXJucyAwLCBzbwo+ID4gPiA+Pj4+PiBpdCBu
ZXZlciBicmVhayB0aGUgbG9vcC4KPiA+ID4gPj4+Pj4gVG8gZml4IHRoaXMsIGNoaXBfZ29vZCgp
IGlzIGVub3VnaCBhbmQgaXQgc2hvdWxkIHRpbWVvdXQgaWYKPiA+ID4gPj4+Pj4gaXQgc3RheSBi
YWQgZm9yIGEgd2hpbGUuCj4gPiA+ID4+Pj4+Cj4gPiA+ID4+Pj4+IEZpeGVzOiBkZmVhZTEwNzM1
ODMoIm10ZDogY2ZpX2NtZHNldF8wMDAyOiBDaGFuZ2Ugd3JpdGUKPiA+ID4gPj4+Pj4gYnVmZmVy
IHRvIGNoZWNrIGNvcnJlY3QgdmFsdWUiKQo+ID4gPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZaSBI
dWFpamllIDx5aWh1YWlqaWVAaHVhd2VpLmNvbT4KPiA+ID4gPj4+Pj4gU2lnbmVkLW9mZi1ieTog
TGl1IEppYW4gPGxpdWppYW41NkBodWF3ZWkuY29tPgo+ID4gPiA+Pj4+PiBSZXZpZXdlZC1ieTog
VG9rdW5vcmkgSWtlZ2FtaSA8aWtlZ2FtaV90b0B5YWhvby5jby5qcD4KPiA+ID4gPj4+Pj4gLS0t
Cj4gPiA+ID4+Pj4+IHYyLT52MzoKPiA+ID4gPj4+Pj4gRm9sbG93IFZpZ25lc2gncyBhZHZpY2U6
Cj4gPiA+ID4+Pj4+IGFkZCBvbmUgbW9yZSBjaGVjayBmb3IgY2hlY2tfZ29vZCgpIGV2ZW4gd2hl
biB0aW1lX2FmdGVyKCkKPiA+ID4gPj4+Pj4gcmV0dXJucwo+ID4gPiA+PiB0cnVlLgo+ID4gPiA+
Pj4+Pgo+ID4gPiA+Pj4+PiAgZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAy
ICstCj4gPiA+ID4+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKPiA+ID4gPj4+Pj4KPiA+ID4gPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4gPiA+ID4+Pj4+IGIvZHJpdmVycy9tdGQvY2hpcHMvY2Zp
X2NtZHNldF8wMDAyLmMKPiA+ID4gPj4+Pj4gaW5kZXggNzI0MjhiNi4uM2RhMjM3NiAxMDA2NDQK
PiA+ID4gPj4+Pj4gLS0tIGEvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiA+
ID4gPj4+Pj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiA+ID4g
Pj4+Pj4gQEAgLTE4NzYsNyArMTg3Niw3IEBAIHN0YXRpYyBpbnQgX194aXByYW0KPiA+ID4gPj4+
Pj4gZG9fd3JpdGVfYnVmZmVyKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpj
aGlwLAo+ID4gPiA+Pj4+PiAgCQkJY29udGludWU7Cj4gPiA+ID4+Pj4+ICAJCX0KPiA+ID4gPj4+
Pj4KPiA+ID4gPj4+Pj4gLQkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgdGltZW8pCj4gPiA+ID4+
Pj4+ICYmICFjaGlwX3JlYWR5KG1hcCwgYWRyKSkKPiA+ID4gPj4+Pj4gKwkJaWYgKHRpbWVfYWZ0
ZXIoamlmZmllcywgdGltZW8pCj4gPiA+ID4+Pj4+ICYmICFjaGlwX2dvb2QobWFwLCBhZHIsIGRh
dHVtKSkKPiA+ID4gPj4+Pgo+ID4gPiA+Pj4+ICAgSnVzdCBhbm90aGVyIGlkZWEgdG8gdW5kZXJz
dGFuZCBlYXNpbHkuCj4gPiA+ID4+Pj4KPiA+ID4gPj4+PiAgICAgdW5zaWduZWQgbG9uZyBub3cg
PSBqaWZmaWVzOwo+ID4gPiA+Pj4+Cj4gPiA+ID4+Pj4gICAgIGlmIChjaGlwX2dvb2QobWFwLCBh
ZHIsIGRhdHVtKSkgewo+ID4gPiA+Pj4+ICAgICAgICAgeGlwX2VuYWJsZShtYXAsIGNoaXAsIGFk
cik7Cj4gPiA+ID4+Pj4gICAgICAgICBnb3RvIG9wX2RvbmU7Cj4gPiA+ID4+Pj4gICAgIH0KPiA+
ID4gPj4+Pgo+ID4gPiA+Pj4+ICAgICBpZiAodGltZV9hZnRlcihub3csIHRpbWVvKSB7Cj4gPiA+
ID4+Pj4gICAgICAgICBicmVhazsKPiA+ID4gPj4+PiAgICAgfQo+ID4gPiA+Pj4+Cj4gPiA+ID4+
Pgo+ID4gPiA+Pj4gVGhhbmsgeW91fi4gSXQgaXMgbW9yZSBlYXNpZXIgdG8gdW5kZXJzdGFuZO+8
gQo+ID4gPiA+Pj4gSWYgdGhlcmUgYXJlIG5vIG90aGVyIGNvbW1lbnRzLCBJIHdpbGwgc2VuZCBu
ZXcgcGF0Y2ggYWdhaW4gKToKPiA+ID4gPj4KPiA+ID4gPj4gRXhjZXB0IHRoaXMgdmVyc2lvbiBu
byBsb25nZXIgZG9lcyB3aGF0IFZpZ25lc2ggc3VnZ2VzdGVkLiBTZWUKPiA+ID4gPj4gaG93IHlv
dSBubyBsb25nZXIgdGVzdCBpZiBjaGlwX2dvb2QoKSBpcyB0cnVlIGlmIHRpbWVfYWZ0ZXIoKQo+
ID4gPiA+PiByZXR1cm5zIHRydWUuIFNvLCBpbWFnaW5lIHRoZSB0aHJlYWQgZW50ZXJpbmcgdGhp
cyBmdW5jdGlvbiBpcwo+ID4gPiA+PiBwcmVlbXB0ZWQganVzdCBhZnRlciB0aGUgZmlyc3QgY2hp
cF9nb29kKCkgdGVzdCwgYW5kIHJlc3VtZWQgYQo+ID4gPiA+PiBmZXcgbXMgbGF0ZXIuIHRpbWVf
YWZ0ZXIoKSB3aWxsIHJldHVybiB0cnVlLCBidXQgY2hpcF9nb29kKCkKPiA+ID4gPj4gbWlnaHQg
YWxzbyByZXR1cm4gdHJ1ZSwgYW5kIHlvdSBpZ25vcmUgaXQuCj4gPiA+ID4KPiA+ID4gPiBJIHRo
aW5rIHRoYXQgdGhlIGZvbGxvd2luZyAzIHZlcnNpb25zIHdpbGwgYmUgd29ya2VkIGZvcgo+ID4g
PiA+IHRpbWVfYWZ0ZXIoKQo+ID4gPiBhcyBhIHNhbWUgcmVzdWx0IGFuZCBmb2xsb3cgdGhlIFZp
Z25lc2gtc2FuIHN1Z2dlc3Rpb24uCj4gPiA+ID4KPiA+ID4KPiA+ID4gQXMgQm9yaXMgZXhwbGFp
bmVkIGFib3ZlIHZlcnNpb24gMyBkb2VzIG5vdCByZWFsbHkgZm9sbG93IG15Cj4gPiA+IHN1Z2dl
c3Rpb24uLi4gUGxlYXNlIHNlZSBiZWxvdwo+ID4gPgo+ID4gPiA+IDEuIE9yaWdpbmFsIFZpZ25l
c2gtc2FuIHN1Z2dlc3Rpb24KPiA+ID4gPgo+ID4gPiA+IAlpZiAoY2hpcF9nb29kKG1hcCwgYWRy
LCBkYXR1bSkpIHsKPiA+ID4gPiAJCXhpcF9lbmFibGUobWFwLCBjaGlwLCBhZHIpOwo+ID4gPiA+
IAkJZ290byBvcF9kb25lOwo+ID4gPiA+IAl9Cj4gPiA+ID4KPiA+ID4gPiAJaWYgKHRpbWVfYWZ0
ZXIoamlmZmllcywgdGltZW8pKSB7Cj4gPiA+ID4gCQkvKiBUZXN0IGNoaXBfZ29vZCgpIGlmIFRS
VUUgaW5jb3JyZWN0bHkgYWdhaW4gc28KPiA+ID4gPiB3cml0ZQo+ID4gPiBmYWlsdXJlIGJ5IHRp
bWVfYWZ0ZXIoKSBjYW4gYmUgYXZvaWRlZC4gKi8KPiA+ID4gPiAJCWlmIChjaGlwX2dvb2QobWFw
LCBhZHIsIGRhdHVtKSkgewo+ID4gPiA+IAkJCXhpcF9lbmFibGUobWFwLCBjaGlwLCBhZHIpOwo+
ID4gPiA+IAkJCWdvdG8gb3BfZG9uZTsKPiA+ID4gPiAJCX0KPiA+ID4gPiAJCWJyZWFrOwo+ID4g
PiA+IAl9Cj4gPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gUmlnaHQsIGhlcmUgd2UgY2hlY2sgY2hp
cF9nb29kKCkgb25jZSBfZXZlbiB3aGVuIHRpbWVfYWZ0ZXIoKSBpcwo+ID4gPiB0cnVlXyB0byBh
dm9pZCBfc3B1cmlvdXNfIHRpbWVvdXQKPiA+ID4KPiA+ID4gPiAyLiBMaXVqaWFuLXNhbiB2MyBw
YXRjaAo+ID4gPiA+Cj4gPiA+ID4gCS8qIFRlc3QgY2hpcF9nb29kKCkgaWYgRkFMU0UgY29ycmVj
dGx5IHNvIHdyaXRlIGZhaWx1cmUKPiA+ID4gPiBieQo+ID4gPiB0aW1lX2FmdGVyKCkgY2FuIGJl
IGF2b2lkZWQuICovCj4gPiA+ID4gCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKSAmJiAh
Y2hpcF9nb29kKG1hcCwgYWRyKSkKPiA+ID4gPiAJCWJyZWFrOwo+ID4gPiA+Cj4gPiA+ID4gCWlm
IChjaGlwX2dvb2QobWFwLCBhZHIsIGRhdHVtKSkgewo+ID4gPiA+IAkJeGlwX2VuYWJsZShtYXAs
IGNoaXAsIGFkcik7Cj4gPiA+ID4gCQlnb3RvIG9wX2RvbmU7Cj4gPiA+ID4gCX0KPiA+ID4gPgo+
ID4gPgo+ID4gPiBUaGlzIGlzIGEgYmV0dGVyIHZlcnNpb24gb2YgMQo+ID4gPgo+ID4gPiA+IDMu
IE15IGlkZWEKPiA+ID4gPgo+ID4gPiA+IAkvKiBTYXZlIGN1cnJlbnQgamlmZmllcyB2YWx1ZSBi
ZWZvcmUgY2hpcF9nb29kKCkgdG8gYXZvaWQKPiA+ID4gPiB3cml0ZQo+ID4gPiBmYWlsdXJlIGJ5
IHRpbWVfYWZ0ZXIoKSB3aXRob3V0IHRlc3RpbmcgY2hpcF9nb29kKCkgYWdhaW4uICovCj4gPiA+
ID4gCXVuc2lnbmVkIGxvbmcgbm93ID0gamlmZmllczsKPiA+ID4gPgo+ID4gPiA+IAlpZiAoY2hp
cF9nb29kKG1hcCwgYWRyLCBkYXR1bSkpIHsKPiA+ID4gPiAJCXhpcF9lbmFibGUobWFwLCBjaGlw
LCBhZHIpOwo+ID4gPiA+IAkJZ290byBvcF9kb25lOwo+ID4gPiA+IAl9Cj4gPiA+ID4KPiA+ID4K
PiA+ID4gV2hhdCBpZiB0aHJlYWQgZ2V0cyBwcmUtZW1wdGVkIGF0IHRoaXMgcG9pbnQgYW5kIGlz
IHJlLXNjaGVkdWxlZAo+ID4gPiBleGFjdGx5IGFmdGVyIHRpbWVvIGppZmZpZXMgaGF2ZSBlbGFw
c2VkPyBCZWxvdyBjaGVjayB3b3VsZCBiZSB0cnVlCj4gPiA+IGFuZCBleGl0IGxvb3AKPiA+Cj4g
PiAgIEkgdGhpbmsgdGhhdCB0aGUgamlmZmllcyB2YWx1ZSBub3cgaXMgc2F2ZSBiZWZvcmUgY2hp
cF9nb29kKCkgc28KPiA+IGJlbG93IGNoZWNrIHdvdWxkIGJlIGZhbHNlIGFuZCBub3QgZXhpdCBs
b29wLgo+IAo+IFRydWUsIEkgb3Zlcmxvb2tlZCB0aGF0IHBhcnQsIGFuZCBzbyBWaWduZXNoIGRp
ZC4gVGhpcyBwcm92ZXMgb25lCj4gdGhpbmc6IGNvZGUgaXMgbm90IGVhc2llciB0byBmb2xsb3cg
d2l0aCB5b3VyIHZlcnNpb24uIElNTywgaWYgd2Ugd2FudAo+IHRvIG1ha2UgdGhpbmdzIGNsZWFy
LCB3ZSBzaG91bGQgYWRkIGEgY29tbWVudCB0byBMaXVqaWFuJ3MgZXhwbGFpbmluZwo+IHdoeSB0
aGUgZXh0cmEgdGVzdCBhZnRlciB0aW1lX2FmdGVyKGppZmZpZXMsIHRpbWVvKSBpcyBuZWVkZWQu
CgpJIHNlZSBzbyBJIGFtIG9rYXkgd2l0aCB0aGUgY2hhbmdlIG9mIExpdWppYW4tc2FuIHYzIHBh
dGNoLgpBbHNvIGFncmVlIHdpdGggdGhlIGNvbW1lbnQgdG8gYmUgYWRkZWQuCgpSZWdhcmRzLApJ
a2VnYW1pCgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
