Return-Path: <SRS0=eoWp=6U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5349C28CBC
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 19:23:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9972076D
	for <linux-mtd@archiver.kernel.org>; Wed,  6 May 2020 19:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DW+U97mF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9972076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoOlmcRxNkcqGZcpo0478u5gGazhtG7CzEC3UGjOsLo=; b=DW+U97mFcWRFkb
	RISCd0BlR5Yw1sCdVR4g35p2E+IgqKr9eBCnzKJ4vwMpxe6jc7GiEbawMEiyF/+tquKflUMI6h8+e
	WpeQlfy3B5mBdMSmUis38qqgQHcxeCCTUxm7vrXiZvjTqVxoZRf+C1oRQjiHqcnwzqEGb6qF2F9I9
	fFpKmE53j51ENoDjOAJy/b/c+qOXDYDugXc8njo2y3Re0aDncfs0vZLtI0ZrW3QfZrvRNNiXxSn2H
	mP5PmibuvQi/Xy6fdYnLNtDoThbUsu0o/q+dQ1CFW/gIac1tGdYG17kkYSVhGGsKo5PZWo4faJe+5
	oEW1oc7LKd2qYIZ9cpVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWPde-0001k2-IT; Wed, 06 May 2020 19:23:26 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWPda-0001jD-S6
 for linux-mtd@lists.infradead.org; Wed, 06 May 2020 19:23:24 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 7FB5C6075EB6;
 Wed,  6 May 2020 21:23:21 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PHlJqG9BNkSj; Wed,  6 May 2020 21:23:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 02F766071A7C;
 Wed,  6 May 2020 21:23:19 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id RR9M9firJSF2; Wed,  6 May 2020 21:23:18 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id D2F7060CEF5D;
 Wed,  6 May 2020 21:23:18 +0200 (CEST)
Date: Wed, 6 May 2020 21:23:18 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-ID: <662469728.192614.1588792998746.JavaMail.zimbra@nod.at>
In-Reply-To: <20200506210158.7fe33cec@collabora.com>
References: <20200503114029.30257-1-miquel.raynal@bootlin.com>
 <BN7PR08MB5684D285CAE2438B355DCE80DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506104522.6c90f88f@collabora.com>
 <BN7PR08MB5684D8DFC50CB93B53705619DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <20200506180420.13996633@collabora.com>
 <BN7PR08MB56843895500F4ADA88262C59DBA40@BN7PR08MB5684.namprd08.prod.outlook.com>
 <1414270659.192477.1588790669444.JavaMail.zimbra@nod.at>
 <20200506210158.7fe33cec@collabora.com>
Subject: Re: [EXT] [PATCH v2 3/3] mtd: rawnand: micron: Address the shallow
 erase issue
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: rawnand: micron: Address the shallow erase issue
Thread-Index: gpLzgRLzpE0mvhKpxWklNyEjWDGQKQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_122323_204200_D9F78C2B 
X-CRM114-Status: GOOD (  13.86  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Steve deRosier <derosier@gmail.com>, "Zoltan Szubbocsev,
 zszubbocsev" <zszubbocsev@micron.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, tglx <tglx@linutronix.de>,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>, "Bean Huo,
 beanhuo" <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkJvcmlzIEJyZXppbGxvbiIg
PGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRA
bm9kLmF0Pgo+IENDOiAiQmVhbiBIdW8sIGJlYW5odW8iIDxiZWFuaHVvQG1pY3Jvbi5jb20+LCAi
TWlxdWVsIFJheW5hbCIgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+LCAiVmlnbmVzaCBSYWdo
YXZlbmRyYSIKPiA8dmlnbmVzaHJAdGkuY29tPiwgIlR1ZG9yIEFtYmFydXMiIDxUdWRvci5BbWJh
cnVzQG1pY3JvY2hpcC5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVh
ZC5vcmc+LCAiU3RldmUKPiBkZVJvc2llciIgPGRlcm9zaWVyQGdtYWlsLmNvbT4sICJUaG9tYXMg
UGV0YXp6b25pIiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4sICJ0Z2x4IiA8dGdseEBs
aW51dHJvbml4LmRlPiwgIlpvbHRhbgo+IFN6dWJib2NzZXYsIHpzenViYm9jc2V2IiA8enN6dWJi
b2NzZXZAbWljcm9uLmNvbT4sICJQaW90ciBXb2p0YXN6Y3p5ayIgPFdvanRhc3pjenlrUEBjdW1t
aW5zYWxsaXNvbi5jb20+Cj4gR2VzZW5kZXQ6IE1pdHR3b2NoLCA2LiBNYWkgMjAyMCAyMTowMTo1
OAo+IEJldHJlZmY6IFJlOiBbRVhUXSBbUEFUQ0ggdjIgMy8zXSBtdGQ6IHJhd25hbmQ6IG1pY3Jv
bjogQWRkcmVzcyB0aGUgc2hhbGxvdyBlcmFzZSBpc3N1ZQoKPiBPbiBXZWQsIDYgTWF5IDIwMjAg
MjA6NDQ6MjkgKzAyMDAgKENFU1QpCj4gUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5h
dD4gd3JvdGU6Cj4gCj4+IEJlYW4sIEJvcmlzLAo+PiAKPj4gLS0tLS0gVXJzcHLDvG5nbGljaGUg
TWFpbCAtLS0tLQo+PiA+PiA+IENvbmNlcm5pbmcgdGhpcywgSSBzdGlsbCBoYXZlIHF1ZXN0aW9u
LCBmb3IgdGhlIFVCSUZTLCAgSWYgSSBhbQo+PiA+PiA+IGNvcnJlY3QsIHRoZXJlIGFyZSBFQyBh
bmQgVklEIGhlYWRlciBib3RoIGJlaW5nIGRhbWFnZWQsIHRoZW4gVUJJRlMKPj4gPj4gPiB3aWxs
IHJlLWVyYXNlIGl0LiBJIGRvbid0IGtub3cgaWYgVUJJRlMgY2FuIGhhbmRsZSB0aGVyZSBpcyBk
aXJ0eS9maWxsaW5nIGRhdGEKPj4gPj4gPiBpbiB0aGUKPj4gPj4gc29tZSBwYWdlcyAgYW5kIEVD
L1ZJRCB2YWxpZC4KPj4gCj4+IFVoaC4gRGFtYWdpbmcganVzdCBwYXlsb2FkIGFza3MgZm9yIHRy
b3VibGUuCj4gCj4gSSdkIGV4cGVjdCBVQkkgdG8ganVzdCBtYXJrIHRoZSBMRUIgYXMgYmFkIGFu
ZCBzY2hlZHVsZSBpdCBmb3IgZXJhc3VyZQo+IChhZ2FpbiwgcHJldHR5IHNpbWlsYXIgdG8gYW4g
aW50ZXJydXB0ZWQgZXJhc2UpLgoKVUJJIHNjYW5zIG9ubHkgaGVhZGVycyBkdXJpbmcgYXR0YWNo
LiBJZiB5b3UgZG9uJ3QgdG91Y2ggdGhlc2UsIG5vIHdheS4KCj4+IAo+PiA+PiA+IE1heWJlIFJp
Y2hhcmQgaGFzIGZpeGVkIGl0Lgo+PiA+PiAKPj4gPj4gSWYgdGhlIGJsb2NrIGlzIGJlaW5nIGVy
YXNlZCB0aGF0IG1lYW5zIHRoZXJlJ3MgYW5vdGhlciBvbmUgbWFwcGVkIHRvIHRoZSBzYW1lCj4+
ID4+IExFQiwgb3IgdGhlIGJsb2NrIGlzIHNpbXBseSBub3QgbmVlZGVkIGFueW1vcmUuIEluIGJv
dGggY2FzZXMsIHRoaXMgb2xkIGJsb2NrCj4+ID4+IHNob3VsZG4ndCBiZSByZWZlcmVuY2VkLiBB
Z2FpbiwgaWYgdGhhdCBoYXBwZW5zLCBpdCdzIGEgYnVnLgo+PiAKPj4gU2FkbHkgaXQgaXMgbm90
IHNvIGVhc3kuCj4+IAo+PiBJSVJDIHRoZSBVQklGUyBsb2cgcmluZyBpcyBzdWNoIGEgY29ybmVy
IGNhc2UsIGl0IHVzZXMgYSBmaXhlZCBMRUIgcmFuZ2UgZm9yCj4+IHRoaXMgcHVycG9zZS4gQmVm
b3JlIHdyaXRpbmcgdG8gYSBuZXcgTEVCIGl0IHVubWFwcyBpdC4gSWYgdGhlIHJlc3VsdGluZyBl
cmFzZQo+PiBvcGVyYXRpb24KPj4gaXMgaW50ZXJydXB0ZWQgYmVmb3JlIGEgbmV3IHZlcnNpb24g
b2YgdGhlIHNhbWUgTEVCIGlzIHdyaXR0ZW4gcmVhZGluZyBmcm9tIHRoYXQKPj4gTEVCIHdvdWxk
IHJlc3VsdCBpbiBFQ0MgZXJyb3JzLgo+IAo+IER1aC4gV2hhdCBoYXBwZW5zIHdoZW4geW91IGhh
dmUgRUNDIGVycm9ycz8gRG9lcyB0aGF0IHN0b3AgdGhlIG1vdW50Pwo+IFNob3VsZG4ndCB3ZSBt
YWtlIHRoYXQgcGFydCBtb3JlIHJvYnVzdD8KClVCSUZTIHN0b3BzIGlmIHRoZXJlIGFyZSAqdW5l
eHBlY3RlZCogRUNDIGVycm9ycy4KVGhlIGxhc3Qgbm9kZSBpbiB0aGUgbGFzdCBub2RlIGdyb3Vw
IG9mIHRoZSBsYXN0IGxvZyBMRUIgaXMgYWxsb3dlZCB0byBoYXZlIEVDQyBlcnJvcnMuCgpJIGdl
dCB3aGVyZSB5b3UgdHJ5aW5nIHRvIGhlYWQgdG8uIExldCBtZSBnaXZlIHRoaXMgYSBkZWVwIHRo
b3VnaHQgYW5kIHJlLXJlYWQKdGhlIGZpeGVzIGZvciBmYXN0bWFwIEkgZGlkIGEgZmV3IHllYXJz
IGFnby4KCj4+ICAKPj4gPiBXb3VsZCB5b3UgcGxlYXNlIGhlbHAgdXMgY29uZmlybSB0aGlzPyAg
aG93IGRvZXMgdWJpZnMgaGFuZGxlIHRoaXMgc2l0dWF0aW9uPwo+PiA+IEFsc28gb3RoZXIgRlM/
IEVnLCBqZmZzMiwgeWFmZnMKPj4gCj4+IFRoZXJlIGFyZSBjYXNlcyB3aGVyZSAocGFydGlhbGx5
KSBlcmFzZWQgTEVCcyBhcmUgc3RpbGwgcmVmZXJlbmNlZC4KPj4gVUJJRlMgYXNzdW1lcyB0aGF0
IGEgTEVCIGl0IHVubWFwcyBpcyBhZnRlciBhIHBvd2VyLWN1dCBlaXRoZXIgMHhGRiBvciBpbnRh
Y3QuCj4+IEluIHJlbGllcyBpbiB0aGUgZmFjdCB0aGF0IFVCSSB3aWxsIGRldGVjdCBhbiBpbnRl
cnJ1cHRlZCBlcmFzZSBvcGVyYXRpb24gYW5kCj4+IHJlLWVyYXNlcyB0aGUgUEVCLgo+PiBGYXN0
bWFwIG9uY2UgdmlvbGF0ZWQgdGhpcyBydWxlLCBpdCB0b29rIHllYXJzIHVudGlsIHRoZSBmaXJz
dCB1c2VyIGhpdCB0aGlzLgo+PiAKPj4gU28gcGxlYXNlIG1ha2Ugc3VyZSB0aGF0IHRoZSBWSUQg
aGVhZGVyIHdpbGwgYmUgZGVzdHJveWVkLgo+IAo+IEkgcmVhbGx5IGhhdGUgdGhlIGlkZWEgb2Yg
aGF2aW5nIEZTLXNwZWNpZmljIGxvZ2ljIGluIHRoZSBNaWNyb24KPiBxdWlyay4gSXNuJ3QgdGhl
cmUgYSB3YXkgd2UgY2FuIGZpeCB0aGF0IGluIFVCSUZTPyBQbHVzLCBkbyB3ZSBoYXZlIGFueQo+
IGd1YXJhbnRlZSB0aGF0IHRoZSBFQy9WSUQgaGVhZGVycyB3aWxsIGJlIGNvcnJ1cHRlZCBhbG9u
ZyB3aXRoIFVCSUZTCj4gZGF0YSB3aGVuIGFuIGVyYXNlIGlzIGludGVycnVwdGVkPwoKQW5kIEkg
aGF0ZSB0aGUgaWRlYSBvZiBjaGFuZ2luZyBVQklGUyBzZW1hbnRpY3MuIDstKQoKSSB0aGluayB5
b3UgcmVhZCBlcXVhbGx5IG11Y2ggTkFORCBkYXRhc2hlZXRzIGFzIEkgZGlkLCBzbyB5b3Uga25v
dyBob3cgb2Z0ZW4KdGhleSBndWFyYW50ZWUgc29tZXRoaW5nLiA7LSkKVUJJRlMgKGFjdHVhbGx5
IFVCSSkgYXNzdW1lcyB0aGF0IGludGVycnVwdGVkIGVyYXNlIHdpbGwgY2F1c2UgRUNDIGVycm9y
cyBhY3Jvc3MKdGhlIHdob2xlIFBFQi4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
