Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1E7C4741F
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 08:32:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1588820678
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 08:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LvmVMacW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=st.com header.i=@st.com header.b="gC2oe8fH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1588820678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2SP6JgrRnjCw29zZsjI0OVoIX++KQu/VeACfM8rfVHg=; b=LvmVMacW2zNxsTwCxn4SdSj3l
	+Jlhqh3Di/ZCBTkezhc/2Hys3t4jL3D/UgOlapcxJ+lgLuTZ1guQFHgZyoed2M4Nziyuru/WvP5+e
	+yltjop31tNo7Bo52E1yG4PppMZyQcgev6vfsLMZSwN12I725GBwEwITlFCL51A3271tR5pEeec+K
	4Bn+mVdIN8QB7Ceig6LZT+o0MnHKIfGl4jgbvuCgzSDPFugIW/0fCo9HvS3o5K8xV8v+71fEC5w8O
	7vdTiXk2cUFQwK2gcV0g44Jc3x4/+ChMS/rpANTngg6yuLT18xp5UJlN/6A4kRjNthnnDhJhs13CV
	QAMvtIRIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYPoq-0005jB-Id; Fri, 30 Oct 2020 08:31:32 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYPon-0005iX-Bj
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 08:31:30 +0000
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09U8REbs022363; Fri, 30 Oct 2020 09:31:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=ZgE/qCYfCapy4vRT52/Xdi9SuwmMVbC8pMtk6Z4UaLA=;
 b=gC2oe8fHnpczUU1vHr99ANa4HnBgRZP39L9jSe3h14yw9JgZi6mQ+uFXitt0UFK4Afle
 E33CDuanPYFWOxbwQ4cogBVqfyKFY1BYLpCe5vXDamHPI+zQE7ABy882kXHe5QRuH4Lj
 gFwiCGcJMDS0MlGr6Sqbv2enf6jtaOnL2quHzel6NQQCm5XtIvfFB+hUKXGIpmssvOZL
 hSlTNNiAIjVP5pZ2ylAK7I+takF6cyc9y8W6Q3QKfBUspbONslAeHLdttHCmIjsHblmQ
 CgrsIoUbs9ik1hDC+OAtRXCh0KJkb6TGCf3FqEKTG4hYQWe10rMGUAbzakbAMWsoIca5 uA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34ccj2deqd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2020 09:31:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4F077100034;
 Fri, 30 Oct 2020 09:31:26 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 335AD25BD99;
 Fri, 30 Oct 2020 09:31:26 +0100 (CET)
Received: from [10.48.0.224] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Oct
 2020 09:31:25 +0100
Subject: Re: [PATCH] mtd: rawnand: stm32_fmc2: fix broken ECC
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <1603989492-6670-1-git-send-email-christophe.kerello@st.com>
 <20201030091905.111aa7a4@xps13>
From: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <d3073938-e714-6b5d-1dc9-36887b11de46@st.com>
Date: Fri, 30 Oct 2020 09:31:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20201030091905.111aa7a4@xps13>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG7NODE2.st.com (10.75.127.20) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-10-29_12:2020-10-29,
 2020-10-29 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_043129_655269_B4752FC6 
X-CRM114-Status: GOOD (  30.31  )
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
Cc: richard@nod.at, linux-stm32@st-md-mailman.stormreply.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMTAvMzAvMjAgOToxOSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBDaHJpc3RvcGhlLAo+IAo+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxv
QHN0LmNvbT4gd3JvdGUgb24gVGh1LCAyOSBPY3QKPiAyMDIwIDE3OjM4OjEyICswMTAwOgo+IAo+
PiBTaW5jZSBjb21taXQgZDcxNTdmZjQ5YTViICgibXRkOiByYXduYW5kOiBVc2UgdGhlIEVDQyBm
cmFtZXdvcmsgdXNlcgo+PiBpbnB1dCBwYXJzaW5nIGJpdHMiKSwgRUNDIGFyZSBicm9rZW4gaW4g
Rk1DMiBkcml2ZXIgaW4gY2FzZSBvZgo+PiBuYW5kLWVjYy1zdGVwLXNpemUgYW5kIG5hbmQtZWNj
LXN0cmVuZ3RoIGFyZSBub3Qgc2V0IGluIHRoZSBkZXZpY2UgdHJlZS4KPj4gVGhlIGRlZmF1bHQg
dXNlciBjb25maWd1cmF0aW9uIHNldCBpbiBGTUMyIGRyaXZlciBpcyBsb3N0IHdoZW4KPj4gcmF3
bmFuZF9kdF9pbml0IGZ1bmN0aW9uIGlzIGNhbGxlZC4gVG8gYXZvaWQgdG8gbG9zZSB0aGUgZGVm
YXVsdCB1c2VyCj4+IGNvbmZpZ3VyYXRpb24sIGl0IGlzIG5lZWRlZCB0byBtb3ZlIGl0IGluIHRo
ZSBuZXcgdXNlcl9jb25mIHN0cnVjdHVyZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
ZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+PiBGaXhlczogZDcxNTdmZjQ5
YTViICgibXRkOiByYXduYW5kOiBVc2UgdGhlIEVDQyBmcmFtZXdvcmsgdXNlciBpbnB1dCBwYXJz
aW5nIGJpdHMiKQo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25h
bmQuYyB8IDggKysrKystLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3Rt
MzJfZm1jMl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+
PiBpbmRleCBiMzFhNTgxLi5kYzg2YWM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9zdG0zMl9mbWMyX25hbmQuYwo+PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0z
Ml9mbWMyX25hbmQuYwo+PiBAQCAtMTg0Niw2ICsxODQ2LDcgQEAgc3RhdGljIGludCBzdG0zMl9m
bWMyX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgIAlzdHJ1Y3Qg
cmVzb3VyY2UgKnJlczsKPj4gICAJc3RydWN0IG10ZF9pbmZvICptdGQ7Cj4+ICAgCXN0cnVjdCBu
YW5kX2NoaXAgKmNoaXA7Cj4+ICsJc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kZGV2Owo+PiAgIAlz
dHJ1Y3QgcmVzb3VyY2UgY3JlczsKPj4gICAJaW50IGNoaXBfY3MsIG1lbV9yZWdpb24sIHJldCwg
aXJxOwo+PiAgIAlpbnQgc3RhcnRfcmVnaW9uID0gMDsKPj4gQEAgLTE5NTIsMTAgKzE5NTMsMTEg
QEAgc3RhdGljIGludCBzdG0zMl9mbWMyX25mY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+PiAgIAljaGlwLT5vcHRpb25zIHw9IE5BTkRfQlVTV0lEVEhfQVVUTyB8IE5BTkRf
Tk9fU1VCUEFHRV9XUklURSB8Cj4+ICAgCQkJIE5BTkRfVVNFU19ETUE7Cj4+ICAgCj4+IC0JLyog
RGVmYXVsdCBFQ0Mgc2V0dGluZ3MgKi8KPj4gKwkvKiBEZWZhdWx0IEVDQyB1c2VyIHNldHRpbmdz
ICovCj4+ICAgCWNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX09O
X0hPU1Q7Cj4+IC0JY2hpcC0+ZWNjLnNpemUgPSBGTUMyX0VDQ19TVEVQX1NJWkU7Cj4+IC0JY2hp
cC0+ZWNjLnN0cmVuZ3RoID0gRk1DMl9FQ0NfQkNIODsKPj4gKwluYW5kZGV2ID0gbXRkX3RvX25h
bmRkZXYobXRkKTsKPj4gKwluYW5kZGV2LT5lY2MudXNlcl9jb25mLnN0ZXBfc2l6ZSA9IEZNQzJf
RUNDX1NURVBfU0laRTsKPj4gKwluYW5kZGV2LT5lY2MudXNlcl9jb25mLnN0cmVuZ3RoID0gRk1D
Ml9FQ0NfQkNIODsKPj4gICAKPj4gICAJLyogU2NhbiB0byBmaW5kIGV4aXN0ZW5jZSBvZiB0aGUg
ZGV2aWNlICovCj4+ICAgCXJldCA9IG5hbmRfc2NhbihjaGlwLCBuYW5kLT5uY3MpOwo+IAo+IFNv
cnJ5IGZvciBicmVha2luZyB0aGUgZHJpdmVyIHdpdGggdGhpcyBjaGFuZ2UsIGJ1dCBub3cgSSB0
aGluayB3ZQo+IHNob3VsZCBoYXZlIGFsbCBFQ0MgcmVsYXRlZCBiaXRzIGluIC0+YXR0YWNoKCkg
aW5zdGVhZCBvZiAtPnByb2JlKCkuCj4gVGhlIC0+YXR0YWNoKCkgaG9vayBpcyBjYWxsZWQgZHVy
aW5nIHRoZSBuYW5kX3NjYW4oKSBvcGVyYXRpb24gYW5kIGF0Cj4gdGhpcyBwb2ludCB0aGUgY2hp
cCdzIHJlcXVpcmVtZW50cy9sYXlvdXQgYXJlIGtub3duIChub3QgYmVmb3JlKS4gSQo+IGtub3cg
dGhhdCBjZXJ0YWluIGNvbnRyb2xsZXJzIGRvbid0IHJlYWxseSBjYXJlIGFib3V0IHRoYXQsIGhl
cmUgeW91cgo+IHNpbXBseSBoYXJkY29kZSB0aGVzZSB0d28gZmllbGRzIGFuZCB5b3UgZG9uJ3Qg
bmVlZCB0byBrbm93IGFueXRoaW5nCj4gYWJvdXQgdGhlIGNoaXAncyBwcm9wZXJ0aWVzLiBCdXQg
YXMgYSBiaWQgdG8gaGFybW9uaXplIGFsbCBkcml2ZXJzIHdpdGgKPiB0aGUgdGFyZ2V0IG9mIGEg
Z2VuZXJpYyBFQ0MgZW5naW5lIGluIG1pbmQsIEkgdGhpbmsgaXQncyBub3cgdGltZSB0bwo+IG1v
dmUgdGhlc2UgdGhyZWUgbGluZXMgKGNoaXAtPmVjYy4qID0gLi4uKSBhdCB0aGUgdG9wIG9mIC0+
YXR0YWNoKCkuCj4gQWxzbywgdGhlc2UgZmllbGRzIHNob3VsZCBoYXZlIGJlZW4gcG9wdWxhdGVk
IGJ5IHRoZSBjb3JlIHNvIHBlcmhhcHMKPiB0aGUgYmVzdCBhcHByb2FjaCBpcyB0byBjaGVjayBp
ZiB0aGUgdXNlciByZXF1aXJlbWVudHMgYXJlIHN5bmNlZCB3aXRoCj4gdGhlIGNvbnRyb2xsZXIn
cyBjYXBhYmlsaXRpZXMgYW5kIGVycm9yIG91dCBvdGhlcndpc2U/Cj4gCj4gV2UgcGxhbiB0byBz
ZW5kIGEgZml4ZXMgUFIgZm9yIC1yYzIsIGlmIHRoZSB2MiBhcnJpdmVzIHRvZGF5IEknbGwKPiBp
bnRlZ3JhdGUgaXQuCgpPay4gSXNzdWUgaXMgdGhhdCB0aGUgY29udHJvbGxlciBpcyBpbml0aWFs
aXplZCB3aGVuIApzdG0zMl9mbWMyX25mY19zZWxlY3RfY2hpcCBpcyBjYWxsZWQuIFRoaXMgZnVu
Y3Rpb24gd2lsbCBiZSBjYWxsZWQgCmJlZm9yZSB0aGUgLT5hdHRhY2goKSBob29rLCB3aGVuIHRo
ZSBmaXJzdCBjb21tYW5kIHdpbGwgYmUgc2VudCB0byB0aGUgCk5BTkQgZGV2aWNlIChyZXNldCBj
b21tYW5kKS4gU28sIG1vdmluZyB0aGUgZGVmYXVsdCBFQ0MgaW5pdGlhbGl6YXRpb24KbmVlZHMg
cHJvYmFibHkgbW9yZSBtb2RpZmljYXRpb25zIGluIHRoZSBkcml2ZXIuCkkgd2lsbCB0cnkgdG8g
c2VuZCBhIHYyIHRvZGF5LgoKUmVnYXJkcywKQ2hyaXN0b3BoZSBLZXJlbGxvLgoKPiAKPiBUaGFu
a3MsCj4gTWlxdcOobAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
