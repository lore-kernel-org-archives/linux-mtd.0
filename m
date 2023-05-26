Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A81C7EE2E
	for <linux-mtd@archiver.kernel.org>; Fri, 26 May 2023 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nwREHRHIHI/2QfGzqi4c3MHST2CcMGlHDvzHh0ztWc=; b=L8Q0MESxypJBX4
	2LhpeJXIBc+0hS2Stekj4qks5kTsTTJuza6z9meR9IsnTjPXRDdLW5svUUS0zRQccty/bdQZZouqS
	QXtfboiyexTGpzq6gokbhP9XSUa5GOdDDDWG2LALz3LjVfiNSOTCPyiLtLhrPibif0o+/21QLzxmF
	/bWPNuFPNpmIuFllyrCD89eQN5Qt7GXZaaKrSSkSZrT86dLAj1UO29QBaU+n3fqfpQSPbqwSMFO2P
	bjk0z5WCsb72Vv14Sf2kiNdu9GqtwYESmnMdWPFoQ7NCZQSegGywkFa4HnX7upWGpvX9eJ7zDYo8U
	aIlMn0V9225lHXWs/dbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bxM-003Rcz-1q;
	Fri, 26 May 2023 18:14:28 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bxJ-003Rad-2N
	for linux-mtd@lists.infradead.org;
	Fri, 26 May 2023 18:14:27 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1685124862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o00Zf1/zRqidGx+zADkWSCzcMcXSFGFIcWqNE5+IWTw=;
	b=af3X+T4BBB70pm1jFCiWWeh5AIqqtnsQ3sV1msvZCa9/O/7IOFzBnWbLl/VCDIeWFEiXFb
	zPbCdZDu373FSU8K/R1f+c0ADehOoRnNrud89YPTeO9BcNUDTdhwjTrRj4BVPAaAmGv0qn
	zuIC5op+RWxd390q+KYyMmDYt8eQ24eEFsYaNXV3HDu4uOXCcHmEldtZC9D0ZMp3kOHQZk
	4OI6tV4RuiOsRDPFaS6afP94GqlreJHG5Zszv9lAkSYdIH0UYn1DNEIxN3ZMXuLB+lIYAF
	IVk7TN7IpE0dIIE/JeAgrJ7htSZgL+9gBkPZSuza4HV8K+y/vW8pqvpR6tR+Uw==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD9DF240004;
	Fri, 26 May 2023 18:14:21 +0000 (UTC)
Date: Fri, 26 May 2023 20:14:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: JaimeLiao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: Boot failed after patch "mtd: rawnand: Support for sequential
 cache reads"
Message-ID: <20230526201420.231092a0@xps-13>
In-Reply-To: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
References: <CAP1tNvS=NVAm-vfvYWbc3k9Cx9YxMc2uZZkmXk8h1NhGX877Zg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_111426_082339_EEB25F8E 
X-CRM114-Status: GOOD (  19.56  )
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

SGkgQWxleGFuZGVyLAoKZWFnbGUuYWxleGFuZGVyOTIzQGdtYWlsLmNvbSB3cm90ZSBvbiBUaHUs
IDI1IE1heSAyMDIzIDEwOjQ4OjM5ICswMzAwOgoKPiBIZWxsby4KPiAKPiBLZXJuZWwgYm9vdCBm
YWlscyBhZnRlciBwYXRjaCAibXRkOiByYXduYW5kOiBTdXBwb3J0IGZvciBzZXF1ZW50aWFsCj4g
Y2FjaGUgcmVhZHMiICh0aGFua3MgdG8gZ2l0IGJpc2VjdCkuCj4gUGxlYXNlIGFkdmlzZSB3aGF0
IGNhbiBiZSBkb25lIGhlcmUgYW5kIHdoZXJlIHRvIGxvb2sgZm9yIGEgYnVnLgoKVGhhbmtzIGZv
ciB0aGUgcmVwb3J0LCBhbmQgc29ycnkgZm9yIHRoZSB0cm91YmxlLiBSaWdodCBub3cgSSBkb24n
dAprbm93IHdoYXQncyB3cm9uZyB3aXRoIHRoZSBkcml2ZXIgYnV0IGFzIGEgZmlyc3Qgc3RlcCwg
eW91IGNvdWxkIGp1c3QKdHJ5IHRvIHJlc2V0IGNoaXAtPmNvbnRyb2xsZXItPnN1cHBvcnRlZF9v
cC5jb250X3JlYWQgYWZ0ZXIKcmF3bmFuZF9jaGVja19jb250X3JlYWRfc3VwcG9ydCgpLiBJdCBz
aG91bGQganVzdCBhdm9pZCB1c2luZyB0aGUKb3B0aW1pemF0aW9uIGFuZCBzb2x2ZSB0aGUgYm9v
dC4gVGhhdCdzIG9mIGNvdXJzZSBhIHZlcnkgZWFybHkgZml4LCB3ZQpub3cgbmVlZCB0byB1bmRl
cnN0YW5kIGZ1cnRoZXIgd2hhdCdzIGdvaW5nIG9uLgoKTXkgZmlyc3QgZ3Vlc3Mgd291bGQgYmUg
dGhhdCB0aGUgc2VxdWVudGlhbCByZWFkIHBhdHRlcm5zIGFyZSBub3QKc3VwcG9ydGVkIGJ5IHRo
ZSBjb250cm9sbGVyIG9yIGJhZGx5IGltcGxlbWVudGVkIGJ5IGl0cyBkcml2ZXIuIEJ1dAp0aGF0
IGlzIHN0cmFuZ2UgZ2l2ZW4gdGhlIHNpbXBsaWNpdHkgb2YgdGhpcyBjb250cm9sbGVyLiBUaGlz
CmNvbnRyb2xsZXIgaXMgbWVhbnQgdG8gYmUgdmVyc2F0aWxlLCBJIGRvdWJ0IGl0IGRvZXMgbm90
IHN1cHBvcnQgdGhlc2UKb3BlcmF0aW9ucy4gUGx1cywgSSB3b3VsZCBleHBlY3QgcGFnZSBhY2Nl
c3NlcyB0byBiZSBkaXJlY3RseQppbXBsZW1lbnRlZCBieSB0aGUgZHJpdmVyIGFuZCBub3QgYmUg
YWZmZWN0ZWQgYnkgdGhpcyBsb2dpYy4gQ291bGQgeW91CnRyeSB0byB0cmFjZSB0aGUgYWN0dWFs
IGNhbGxzIHdoaWNoIGFyZSBtYWRlIHRocm91Z2ggdGhlIG10ZCBsYXllcgp3aGljaCBsZWFkIHRv
IHRoZXNlIGVycm9ycz8gSXMgLT5leGVjX29wKCkgaW52b2x2ZWQgaW4gdGhlIHByb2Nlc3M/Cldo
ZXJlPyBIb3c/CgpBbHNvLCB3aGF0IGtlcm5lbCBhcmUgeW91IHVzaW5nIGV4YWN0bHk/IEknbSBz
dXJwcmlzZWQgdGhlcmUgaXMgbm8KbXRkLXJlbGF0ZWQgZXJyb3IuIElmIHlvdSByZWJvb3Qgd2l0
aCBhbiBvbGRlciBrZXJuZWwsIHlvdSBnZXQgeW91cgpkYXRhLCByaWdodD8KCk90aGVyd2lzZSBt
YXliZSB0aGUgTWljcm9uIGNoaXAgaXMgaW4gZmF1bHQuIFdoaWNoIHdvdWxkIG1lYW4gdGhhdAp0
aGVyZSBhcmUgdW5zdXBwb3J0ZWQgY29tbWFuZHMuIEkgYmVsaWV2ZWQgdGhleSB3ZXJlIGFsbCBz
dGFuZGFyZCwKbWF5YmUgc29tZSBvZiB0aGVtIGFyZSBvcHRpb25hbD8gQ291bGQgeW91IGNoZWNr
IGluIHRoZSBjaGlwIGRhdGFzaGVldAppZiB0aGVyZSBpcyBhbnkgY29tbWFuZCB1c2VkIHRoZXJl
IHRoYXQgaXMgdW5zdXBwb3J0ZWQ/Cgo+IAo+IFRoYW5rcy4KPiAKPiAuLi4KPiBvbWFwLWdwbWMg
NTAwMDAwMDAuZ3BtYzogR1BNQyByZXZpc2lvbiA2LjAKPiAuLi4KPiBuYW5kOiBkZXZpY2UgZm91
bmQsIE1hbnVmYWN0dXJlciBJRDogMHgyYywgQ2hpcCBJRDogMHhkYQo+IG5hbmQ6IE1pY3JvbiBN
VDI5RjJHMDhBQkFFQVdQCj4gbmFuZDogMjU2IE1pQiwgU0xDLCBlcmFzZSBzaXplOiAxMjggS2lC
LCBwYWdlIHNpemU6IDIwNDgsIE9PQiBzaXplOiA2NAo+IG5hbmQ6IHVzaW5nIE9NQVBfRUNDX0JD
SDhfQ09ERV9IVyBFQ0Mgc2NoZW1lCj4gLi4uCj4gVkZTOiBNb3VudGVkIHJvb3QgKHNxdWFzaGZz
IGZpbGVzeXN0ZW0pIHJlYWRvbmx5IG9uIGRldmljZSAyNTQ6MC4KPiBkZXZ0bXBmczogbW91bnRl
ZAo+IEZyZWVpbmcgdW51c2VkIGtlcm5lbCBpbWFnZSAoaW5pdG1lbSkgbWVtb3J5OiAxMDI0Swo+
IFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcwo+IFNRVUFTSEZTIGVycm9yOiBsem8gZGVj
b21wcmVzc2lvbiBmYWlsZWQsIGRhdGEgcHJvYmFibHkgY29ycnVwdAo+IFNRVUFTSEZTIGVycm9y
OiBGYWlsZWQgdG8gcmVhZCBibG9jayAweGQyOTFjMjogLTUKPiBTUVVBU0hGUyBlcnJvcjogbHpv
IGRlY29tcHJlc3Npb24gZmFpbGVkLCBkYXRhIHByb2JhYmx5IGNvcnJ1cHQKPiBTUVVBU0hGUyBl
cnJvcjogRmFpbGVkIHRvIHJlYWQgYmxvY2sgMHhkMjkxYzI6IC01Cj4gU1FVQVNIRlMgZXJyb3I6
IFVuYWJsZSB0byByZWFkIGRhdGEgY2FjaGUgZW50cnkgW2QyOTFjMl0KPiBTUVVBU0hGUyBlcnJv
cjogVW5hYmxlIHRvIHJlYWQgcGFnZSwgYmxvY2sgZDI5MWMyLCBzaXplIDE0MzA3Cj4gU1FVQVNI
RlMgZXJyb3I6IFVuYWJsZSB0byByZWFkIGRhdGEgY2FjaGUgZW50cnkgW2QyOTFjMl0KPiBTUVVB
U0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgcGFnZSwgYmxvY2sgZDI5MWMyLCBzaXplIDE0MzA3
Cj4gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIGluaXQhCj4g
ZXhpdGNvZGU9MHgwMDAwMDAwNyBDUFU6IDAgUElEOiAxIENvbW06IGluaXQgTm90IHRhaW50ZWQg
Ni4zLjArICMxMDUKPiBIYXJkd2FyZSBuYW1lOiBHZW5lcmljIEFNMzNYWCAoRmxhdHRlbmVkIERl
dmljZSBUcmVlKQo+ICB1bndpbmRfYmFja3RyYWNlIGZyb20gc2hvd19zdGFjaysweGIvMHhjCj4g
IHNob3dfc3RhY2sgZnJvbSBkdW1wX3N0YWNrX2x2bCsweDJiLzB4MzQKPiAgZHVtcF9zdGFja19s
dmwgZnJvbSBwYW5pYysweGJkLzB4MjMwCj4gIHBhbmljIGZyb20gbWFrZV90YXNrX2RlYWQrMHgx
LzB4MTIwCj4gIG1ha2VfdGFza19kZWFkIGZyb20gMHhjMTAyY2E4MAo+IC0tLVsgZW5kIEtlcm5l
bCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0IQo+IGV4aXRjb2Rl
PTB4MDAwMDAwMDcgXS0tLQoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
