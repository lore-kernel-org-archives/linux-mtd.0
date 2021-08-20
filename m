Return-Path: <SRS0=qXjq=NL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80900C432BE
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:19:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86BF60FE8
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Aug 2021 12:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E86BF60FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tRGjKf6q6gnFpiOFj8/4j7zh9gAzB+eYJ6MLn7KOu0E=; b=EQT5cMkjup+q9G
	yFW4PVOEEQJKWIl0qaQXBiF4GTryA3JJ3Jc4bCyl9o8dvTVrUJ3f7gZOnM/KuMc6HISqdbbhdk42T
	mEeuZnn7NyFnF36baGXxY6l5NVnRmBZYfOBv7l9NtRZ2lSLe7gDfAjQYArD0clVJPrrKLXwrsUKox
	4PoVwAPUxB0atp0w3giut2rDjARZqml8MBW3suygTUQf+9uoTBKvNLNE4ajQRV+BgJZ8//fgLFhYD
	0xlboMrdO2iUxFb0h0vnjTPN4L4VFIjkT11vVfOBLt8TvNt01dgekzS8VcZ7E78XkLOrFjUWqcsmb
	SMJ8iSX7QQEZhwiDhjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH3Tl-00B6AN-UI; Fri, 20 Aug 2021 12:18:34 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH3Tf-00B68b-0O
 for linux-mtd@lists.infradead.org; Fri, 20 Aug 2021 12:18:31 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 48BC224000C;
 Fri, 20 Aug 2021 12:18:24 +0000 (UTC)
Date: Fri, 20 Aug 2021 14:18:22 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>
Subject: Re: [PATCH 11/13] mtd: spinand: Add support for Power-on-Reset
 (PoR) instruction
Message-ID: <20210820141822.03d658b8@xps13>
In-Reply-To: <403a2b26-fd95-31ab-8992-a6e6862249e6@ti.com>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-12-a-nandan@ti.com>
 <20210806210840.65c06b67@xps13>
 <403a2b26-fd95-31ab-8992-a6e6862249e6@ti.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_051827_454777_899D7D78 
X-CRM114-Status: GOOD (  25.68  )
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

SGkgQXB1cnZhLAoKQXB1cnZhIE5hbmRhbiA8YS1uYW5kYW5AdGkuY29tPiB3cm90ZSBvbiBGcmks
IDIwIEF1ZyAyMDIxIDE3OjA5OjA3CiswNTMwOgoKPiBIaSBNaXF1w6hsLAo+IAo+IE9uIDA3LzA4
LzIxIDEyOjM4IGFtLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+ID4gSGkgQXB1cnZhLAo+ID4gCj4g
PiBBcHVydmEgTmFuZGFuIDxhLW5hbmRhbkB0aS5jb20+IHdyb3RlIG9uIFR1ZSwgMTMgSnVsIDIw
MjEgMTM6MDU6MzYKPiA+ICswMDAwOgo+ID4gICAKPiA+PiBNYW51ZmFjdHVyZXJzIGxpa2UgR2ln
YWRldmljZSBhbmQgV2luYm9uZCBhcmUgYWRkaW5nIFBvd2VyLW9uLVJlc2V0Cj4gPj4gZnVuY3Rp
b25hbGl0eSBpbiB0aGVpciBTUEkgTkFORCBmbGFzaCBjaGlwcy4gUG9SIGluc3RydWN0aW9uIGNv
bnNpc3RzCj4gPj4gb2YgYSA2NmggY29tbWFuZCBmb2xsb3dlZCBieSA5OWggY29tbWFuZCwgYW5k
IGlzIGRpZmZlcmVudCBmcm9tIHRoZSBGRmgKPiA+PiByZXNldC4gVGhlIHJlc2V0IGNvbW1hbmQg
RkZoIGp1c3QgY2xlYXJzIHRoZSBzdGF0dXMgb25seSByZWdpc3RlcnMsCj4gPj4gd2hpbGUgdGhl
IFBvUiBjb21tYW5kIGVyYXNlcyBhbGwgdGhlIGNvbmZpZ3VyYXRpb25zIHdyaXR0ZW4gdG8gdGhl
Cj4gPj4gZmxhc2ggYW5kIGlzIGVxdWl2YWxlbnQgdG8gYSBwb3dlci1kb3duIC0+IHBvd2VyLXVw
IGN5Y2xlLgo+ID4+Cj4gPj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBQb3dlci1vbi1SZXNldCBjb21t
YW5kIGZvciBhbnkgZmxhc2ggdGhhdCBwcm92aWRlcwo+ID4+IHRoaXMgZmVhdHVyZS4KPiA+Pgo+
ID4+IERhdGFzaGVldDogaHR0cHM6Ly93d3cud2luYm9uZC5jb20vZXhwb3J0L3NpdGVzL3dpbmJv
bmQvZGF0YXNoZWV0L1czNU4wMUpXX0RhdGFzaGVldF9CcmllZi5wZGYKPiA+Pgo+ID4+IFNpZ25l
ZC1vZmYtYnk6IEFwdXJ2YSBOYW5kYW4gPGEtbmFuZGFuQHRpLmNvbT4KPiA+PiAtLS0gIAo+ID4g
Cj4gPiBbLi4uXQo+ID4gCQkJCVwgIAo+ID4+IEBAIC0yMTgsNiArMjMwLDggQEAgc3RydWN0IHNw
aW5hbmRfZGV2aWNlOwo+ID4+ICAgICogcmVhZGluZy9wcm9ncmFtbWluZy9lcmFzaW5nIHdoZW4g
dGhlIFJFU0VUIG9jY3Vycy4gU2luY2Ugd2UgYWx3YXlzCj4gPj4gICAgKiBpc3N1ZSBhIFJFU0VU
IHdoZW4gdGhlIGRldmljZSBpcyBJRExFLCA1dXMgaXMgc2VsZWN0ZWQgZm9yIGJvdGggaW5pdGlh
bAo+ID4+ICAgICogYW5kIHBvbGwgZGVsYXkuCj4gPj4gKyAqIFBvd2VyIG9uIFJlc2V0IGNhbiB0
YWtlIG1heCB1cHRvIDUwMCB1cyB0byBjb21wbGV0ZSwgc28gc2xlZXAgZm9yIDEwMDAgdXMgIAo+
ID4gCj4gPiBzL21heCB1cHRvL3VwIHRvLwo+ID4gICAKPiAKPiBPa2F5IQo+IAo+ID4+ICsgKiB0
byAxMjAwIHVzIHNhZmVseS4gIAo+ID4gCj4gPiBJIGRvbid0IHJlYWxseSBnZXQgd2h5LCBpZiB0
aGUgbWF4aW11bSBpcyA1MDAsIHRoZW4gbGV0J3Mgd2FpdCBmb3IKPiA+IDUwMHVzLgo+ID4gICAK
PiAKPiBHZW5lcmFsbHkgd2Uga2VlcCBzb21lIG1hcmdpbiBmcm9tIHRoZSBtYXhpbXVtIHRpbWUs
IG5vPwoKV2VsbCwgeWVzIGFuZCBuby4KCklmIHlvdSBrbm93IHRoYXQgYW4gb3BlcmF0aW9uIHdp
bGwgbGFzdCBYbXMgYW5kIGhhdmUgbm90aGluZyBlbHNlIHRvCmRvLCB0aGVuIHlvdSBjYW4gdGFr
ZSBzb21lIG1hcmdpbiBpZiB5b3UgYXJlIGluIGEgcHJvYmUgKGNhbGxlZCBvbmNlKQpidXQgZGVm
aW5pdGVseSBub3QgaWYgeW91IGFyZSBpbiBhIGZhc3QgcGF0aC4KCk90aGVyd2lzZSB0aGUgYmVz
dCBpcyB0byBoYXZlIHNvbWUga2luZCBvZiBzaWduYWxpbmcgYnV0IEknbSBub3Qgc3VyZQp5b3Un
bGwgaGF2ZSBvbmUgZm9yIHRoZSByZXNldCBvcC4uLgoKPiAKPiA+PiAgICAqLwo+ID4+ICAgI2Rl
ZmluZSBTUElOQU5EX1JFQURfSU5JVElBTF9ERUxBWV9VUwk2Cj4gPj4gICAjZGVmaW5lIFNQSU5B
TkRfUkVBRF9QT0xMX0RFTEFZX1VTCTUKPiA+PiBAQCAtMjI3LDYgKzI0MSw4IEBAIHN0cnVjdCBz
cGluYW5kX2RldmljZTsKPiA+PiAgICNkZWZpbmUgU1BJTkFORF9XUklURV9QT0xMX0RFTEFZX1VT
CTE1Cj4gPj4gICAjZGVmaW5lIFNQSU5BTkRfRVJBU0VfSU5JVElBTF9ERUxBWV9VUwkyNTAKPiA+
PiAgICNkZWZpbmUgU1BJTkFORF9FUkFTRV9QT0xMX0RFTEFZX1VTCTUwCj4gPj4gKyNkZWZpbmUg
U1BJTkFORF9QT1JfTUlOX0RFTEFZX1VTCTEwMDAKPiA+PiArI2RlZmluZSBTUElOQU5EX1BPUl9N
QVhfREVMQVlfVVMJMTIwMCAgCj4gPj4gICA+PiAgICNkZWZpbmUgU1BJTkFORF9XQUlUUkRZX1RJ
TUVPVVRfTVMJNDAwCj4gPj4gICA+PiBAQCAtMzUxLDYgKzM2Nyw3IEBAIHN0cnVjdCBzcGluYW5k
X2VjY19pbmZvIHsgIAo+ID4+ICAgI2RlZmluZSBTUElOQU5EX0hBU19RRV9CSVQJCUJJVCgwKQo+
ID4+ICAgI2RlZmluZSBTUElOQU5EX0hBU19DUl9GRUFUX0JJVAkJQklUKDEpCj4gPj4gICAjZGVm
aW5lIFNQSU5BTkRfSEFTX09DVEFMX0RUUl9CSVQJQklUKDIpCj4gPj4gKyNkZWZpbmUgU1BJTkFO
RF9IQVNfUE9SX0NNRF9CSVQJCUJJVCgzKSAgCj4gPj4gICA+PiAgIC8qKiAgCj4gPj4gICAgKiBz
dHJ1Y3Qgc3BpbmFuZF9vbmRpZV9lY2NfY29uZiAtIHByaXZhdGUgU1BJLU5BTkQgb24tZGllIEVD
QyBlbmdpbmUgc3RydWN0dXJlICAKPiA+IAo+ID4gCj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4g
TWlxdcOobAo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdAo+ID4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCj4g
PiAgIAo+IAo+IFRoYW5rcywKPiBBcHVydmEgTmFuZGFuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
