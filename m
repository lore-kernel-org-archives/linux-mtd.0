Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF144C35249
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 06:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82C3A2082E
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 06:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fLu3y30A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qSxEknIO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82C3A2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1+aFZm7i2F61TgRY7Oww214IbatA9DneXt28+j3b04s=; b=fLu3y30ADsYKpf
	C9KQZWlhZ9NLH5mRXue4TmQCFAsZSwO0mqIv23fet42KtJPmDI5nmksJ6qNSXk9zVDoI1CP9kgatS
	taQ07DeF2JOS70trp0nKLiIupV4GDM72Ml1vccPj1PHDWSJN2ZnSNNr9GkiVs5jI+Lx/lJmkEjVm3
	c+WQGIb3NNsCMDn52HbZeQEHlCCek3w1N0aOLa5g8Bh6d0QYT1dxUaRfp/tKgr7OUirJdI7T/9Mvq
	EZEP+5Jtgz6eD0SVl6XV+zLT9rrN9JYufNgimX1AxTStkKiLZTwpSZjZML6tsuKJT595iuLjh7MSp
	bYA19NTDG8wIGQMDSF0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izDl7-0003gS-Vn; Wed, 05 Feb 2020 06:01:57 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izDl3-0003fR-Kq
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 06:01:56 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01561Yqg108169;
 Wed, 5 Feb 2020 00:01:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1580882494;
 bh=XmBWyjbl6yfkjEDo0+P1hsMw9yP0/RhqYJf/YwABA8M=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qSxEknIOrFJ4PWxFrZ9IsM8ya9z40l6A2TavpMgjP93v9Azt3aipFJPr4dTEtCd9Z
 ij5aXZz3pKP7LGc0YWOMh9YByGXzO1HYUZ6oCeyB2ujSOt6NzLGvmLaHAGdqVHIcmh
 tmi/QkU2BtUAQcyZcAHz7/bn88uVEgNoW4CSOqsw=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01561YAX032441
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Feb 2020 00:01:34 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 5 Feb
 2020 00:01:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 5 Feb 2020 00:01:34 -0600
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01561WE7046772;
 Wed, 5 Feb 2020 00:01:32 -0600
Subject: Re: [PATCH] mtd: spi-nor: add support for GigaDevice GD25D05
To: Koen Vandeputte <koen.vandeputte@ncentric.com>,
 <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <20200106124624.28779-1-koen.vandeputte@ncentric.com>
 <1873152.psFcFxbH5H@192.168.0.113>
 <7e896e80-da33-5bd3-16bd-e62b43f5eecc@ncentric.com>
 <6ef35a1b-cadb-95c0-8569-0518e3dee2f4@ncentric.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <bcca1846-7cd5-32f5-5345-234fccc87a76@ti.com>
Date: Wed, 5 Feb 2020 11:32:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6ef35a1b-cadb-95c0-8569-0518e3dee2f4@ncentric.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200204_220153_761570_AF4FC883 
X-CRM114-Status: GOOD (  11.53  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: richard@nod.at, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkKCk9uIDA0LzAyLzIwIDc6NDAgcG0sIEtvZW4gVmFuZGVwdXR0ZSB3cm90ZToKPiAKPiBPbiAx
NC4wMS4yMCAxMDoxMywgS29lbiBWYW5kZXB1dHRlIHdyb3RlOgo+Pgo+PiBPbiAxMS4wMS4yMCAx
Njo1MiwgVHVkb3IuQW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOgo+Pj4gSGksIEtvZW4sCj4+
Pgo+Pj4gT24gTW9uZGF5LCBKYW51YXJ5IDYsIDIwMjAgMjo0NjoyNCBQTSBFRVQgS29lbiBWYW5k
ZXB1dHRlIHdyb3RlOgo+Pj4+IFRlc3RlZCBvbiBhIE1pa3JvVGlrIFJCOTEyVUFHLTVIUG5EIHIy
Cj4+Pj4KPj4+PiBbwqDCoMKgIDAuNjQxNzE0XSBtMjVwODAgc3BpMC4wOiBmb3VuZCBnZDI1ZDA1
LCBleHBlY3RlZCBtMjVwODAKPj4+PiBbwqDCoMKgIDAuNjQ5OTE2XSBtMjVwODAgc3BpMC4wOiBn
ZDI1ZDA1ICg2NCBLYnl0ZXMpCj4+Pj4gW8KgwqDCoCAwLjY1NTEyMl0gQ3JlYXRpbmcgNCBNVEQg
cGFydGl0aW9ucyBvbiAic3BpMC4wIjoKPj4+PiBbwqDCoMKgIDAuNjYwMTY0XSAweDAwMDAwMDAw
MDAwMC0weDAwMDAwMDAwYzAwMCA6ICJyb3V0ZXJib290Igo+Pj4+IFvCoMKgwqAgMC42Njc3ODJd
IDB4MDAwMDAwMDBjMDAwLTB4MDAwMDAwMDBkMDAwIDogImhhcmRfY29uZmlnIgo+Pj4+IFvCoMKg
wqAgMC42NzUwNzNdIDB4MDAwMDAwMDBkMDAwLTB4MDAwMDAwMDBlMDAwIDogImJpb3MiCj4+Pj4g
W8KgwqDCoCAwLjY4MjYxM10gMHgwMDAwMDAwMGUwMDAtMHgwMDAwMDAwMGYwMDAgOiAic29mdF9j
b25maWciCj4+PiBJJ20gYWZyYWlkIHRoYXQgdGhpcyBpcyBub3QgZW5vdWdoLiBZb3UnbGwgaGF2
ZSB0byB0ZXN0IGFsbCB0aGUgZmxhZ3MKPj4+IHRoYXQgeW91Cj4+PiBhZHZlcnRpc2VkLiBUeXBp
Y2FsbHkgb25lIHNob3VsZCBkbyBhIHJlYWQsIGVyYXNlLCB3cml0ZSwgcmVhZC1iYWNrCj4+PiB0
ZXN0LCBhbmQKPj4+IHRoZW4gdG8gZXhlcmNpc2UgdGhlIGxvY2sgYW5kIHVubG9jayBmZWF0dXJl
cy4gSWYgeW91IHdhbnQgdG8gYmUKPj4+IGV4aGF1c3RpdmUsCj4+PiB5b3UgY2FuIGZvcmNlIHRo
ZSBjb250cm9sbGVyIHRvIGRvIHRoZSByZWFkcyBpbiBzaW5nbGUsIGR1YWwgb3IgcXVhZAo+Pj4g
bW9kZXMsCj4+PiBidXQgaWYgeW91IGNob29zZSB0byB0ZXN0IGp1c3QgdGhlIGJlc3Qgc3VwcG9y
dGVkIHJlYWQgbW9kZSwgaXQgaXMKPj4+IGZpbmUgdG9vLgo+Pj4gUGxlYXNlIHNwZWNpZnkgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlIHdoYXQgeW91IHRlc3RlZC4KPj4+Cj4+PiBDaGVlcnMsCj4+PiB0
YQo+PiBIaSBUdWRvciwKPj4KPj4gVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UgaGVyZSBhcyBpdCdz
IG15IGZpcnN0IHBhdGNoIHRvd2FyZHMgdGhpcyBwYXJ0Cj4+IG9mIHRoZSBrZXJuZWwuCj4+Cj4+
IEkndmUgbm90IG9ubHkgd2VudCB0aHJvdWdoIHRoZSBkYXRhc2hlZXQgb2YgdGhpcyBkZXZpY2Us
IGJ1dCBhbHNvIHRoZQo+PiBkYXRhc2hlZXQgZnJvbSBhbm90aGVyIHZlcnkgc2ltaWxhciBHRCBj
aGlwIGNhcnJ5aW5nIHRoZSBzYW1lIHNwZWNzCj4+IEFsbCBmZWF0dXJlcyBhcyBpbmRpY2F0ZWQg
YnkgdGhlIGZsYWdzIGFyZSBjbGVhcmx5IGRlc2NyaWJlZCBpbiBib3RoCj4+IGRhdGFzaGVldHMu
IChsaWtlLCBTaW5nbGUsIER1YWwsIFF1YWQgbW9kZXMpCj4+Cj4+IFRoZSBvbmx5IGRlbHRhIGlz
IHRoZSBhbW91bnQgb2YgYWR2ZXJ0aXNlZCBibG9ja3MsIGFuZCBzb21lIG90aGVyIGNoaXAKPj4g
cGFja2FnZSBkZXRhaWxzIG91dC1vZi1zY29wZSBmcm9tIGVsZWN0cmljYWwgcGVyZm9ybWFuY2Uu
Cj4+Cj4+IElzIHRoaXMgY2xhcmlmaWNhdGlvbiBlbm91Z2ggdG8gc2VuZCBhIFYyIHdpdGggYSBt
b2RpZmllZCBjb21taXQgbXNnPwo+PgoKUGxlYXNlIGFkZCB3aGF0IG1vZGVzIHdlcmUgdGVzdGVk
IGFzIHBhcnQgb2YgY29tbWl0IG1lc3NhZ2UgYW5kIHJlc3Bpbi4KCkJUVywgdGhlcmUgaXMgR0Qy
NUQwNUIgYW5kIEdEMjVEMDVDLiBXaGljaCBpcyB0aGUgZmxhc2ggdGhpcyB0aGF0IHlvdQpoYXZl
IHRlc3RlZCB3aXRoIChwbGVhc2UgYWRkIHRoYXQgaW5mbyB0byBjb21taXQgbWVzc2FnZSk/CgpS
ZWdhcmRzClZpZ25lc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
