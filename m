Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0B7CC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 23:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70CAA20578
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 23:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rHCCRv2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70CAA20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zX3Zhnk6aIBEpLQEIWXac83oNDsFn1FDrIMJ8BqNZo=; b=rHCCRv2hvoz0pZ
	uHWf1QWjGP5yUlYGJG1ugw4If8VQUz7LDt+pYGwI9ZDYK9MbzbmmN2BXkc06qxW3r0bMB4yoGEMJF
	wnpUpQxkDk38ngU97Kuke/y4u2hq4+fqbOaFE6HRMVoQ5otrYu3nn75BJpwSg/Gw9Kxu5bojEUXLW
	22p7hQzaOzYdscdAUiwKlRQgUU374lu8gFv8OodqpTtEuAXIyhewtf949Mfbn8gOZ3og+SytIs80r
	qfi2Q560hZGcDQ6e+xAKazjpbHPmUF7t00ySiZ86eog/SymOCdroinYyV40uZNa5i8wVgwR39hNNm
	ABuyNgGvPZ4RAfNflHGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbBR2-0005oZ-3w; Tue, 19 May 2020 23:14:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbBQy-0005mf-7a
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 23:14:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8787F2A2523;
 Wed, 20 May 2020 00:14:02 +0100 (BST)
Date: Wed, 20 May 2020 01:13:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Convert the driver to exec_op()
Message-ID: <20200520011359.37477358@collabora.com>
In-Reply-To: <L8KLAQ.KW09884RLNR6@crapouillou.net>
References: <20200518165640.312220-1-boris.brezillon@collabora.com>
 <G7GJAQ.0VIFSQUDMC9H2@crapouillou.net>
 <20200518212422.23316760@collabora.com>
 <20200518213555.38e3a570@collabora.com>
 <P73LAQ.QZS4PIAER4ZK@crapouillou.net>
 <20200519192805.30fbf4fa@collabora.com>
 <L8KLAQ.KW09884RLNR6@crapouillou.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_161404_403363_E986F12C 
X-CRM114-Status: GOOD (  24.99  )
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
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxOSBNYXkgMjAyMCAyMzoxMjoyMSArMDIwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IExlIG1hci4gMTkgbWFpIDIwMjAgw6AgMTk6MjgsIEJv
cmlzIEJyZXppbGxvbiAKPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IGEgw6ljcml0
IDoKPiA+IE9uIFR1ZSwgMTkgTWF5IDIwMjAgMTc6MDQ6MzcgKzAyMDAKPiA+IFBhdWwgQ2VyY3Vl
aWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PiB3cm90ZToKPiA+ICAgCj4gPj4gIExlIGx1bi4gMTgg
bWFpIDIwMjAgw6AgMjE6MzUsIEJvcmlzIEJyZXppbGxvbgo+ID4+ICA8Ym9yaXMuYnJlemlsbG9u
QGNvbGxhYm9yYS5jb20+IGEgw6ljcml0IDogIAo+ID4+ICA+IE9uIE1vbiwgMTggTWF5IDIwMjAg
MjE6MjQ6MjIgKzAyMDAKPiA+PiAgPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBj
b2xsYWJvcmEuY29tPiB3cm90ZToKPiA+PiAgPiAgCj4gPj4gID4+ICBPbiBNb24sIDE4IE1heSAy
MDIwIDE5OjUwOjA0ICswMjAwCj4gPj4gID4+ICBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWls
bG91Lm5ldD4gd3JvdGU6Cj4gPj4gID4+ICAKPiA+PiAgPj4gID4gSGkgQm9yaXMsCj4gPj4gID4+
ICA+Cj4gPj4gID4+ICA+IExlIGx1bi4gMTggbWFpIDIwMjAgw6AgMTg6NTYsIEJvcmlzIEJyZXpp
bGxvbgo+ID4+ICA+PiAgPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IGEgw6ljcml0
IDogIAo+ID4+ICA+PiAgPiA+IExldCdzIGNvbnZlcnQgdGhlIGRyaXZlciB0byBleGVjX29wKCkg
dG8gaGF2ZSBvbmUgbGVzcyAgIAo+ID4+IGRyaXZlciAgCj4gPj4gID4+IHJlbHlpbmcgIAo+ID4+
ICA+PiAgPiA+IG9uIHRoZSBsZWdhY3kgaW50ZXJmYWNlLiAgCj4gPj4gID4+ICA+Cj4gPj4gID4+
ICA+IEdyZWF0IHdvcmssIHRoYW5rcyBmb3IgdGhhdC4KPiA+PiAgPj4gID4KPiA+PiAgPj4gID4g
SG93ZXZlciBpdCBkb2VzIG5vdCB3b3JrIDooIG5hbmRfc2NhbigpIHJldHVybnMgZXJyb3IgLTE0
NS4gIAo+ID4+ICA+Pgo+ID4+ICA+PiAgTG9va3MgbGlrZSB0aGUgUi9CIHNpZ25hbCBpcyBpbnZl
cnRlZC4gQ2FuIHlvdSB0cnkgd2l0aCB0aGUKPiA+PiAgPj4gIGZvbGxvd2luZyBkaWZmIGFwcGxp
ZWQ/ICAKPiA+PiAgPgo+ID4+ICA+IEkgY2hlY2tlZCB0aGUgRFQsIGFuZCB0aGUgR1BJTyBpcyBp
bmRlZWQgZGVjbGFyZWQgR1BJT19BQ1RJVkVfTE9XLAo+ID4+ICA+IHdoaWNoIGV4cGxhaW4gd2h5
IHRoZSB0ZXN0IGlzIGludmVydGVkLiBCZWNhdXNlIG9mIERUIEFCSSAgIAo+ID4+IHN0YWJpbGl0
eSBpdCAgCj4gPj4gID4gbWlnaHQgbm90IGJlIGFuIG9wdGlvbiB0byBjaGFuZ2UgdGhhdCwgYnV0
IHRoZSBzaWduYWwgc2hvdWxkICAgCj4gPj4gYWN0dWFsbHkgIAo+ID4+ICA+IGJlCj4gPj4gID4g
ZGVjbGFyZWQgR1BJT19BQ1RJVkVfSElHSC4gIAo+ID4+IAo+ID4+ICBJdCBkZXBlbmRzIHdoYXQg
eW91IGNvbnNpZGVyIHdoYXQgaXMgdGhlIGFjdGl2ZSBzdGF0ZSwgaXMgaXQgd2hlbgo+ID4+ICAi
YnVzeSIgb3IgInJlYWR5Ij8gOykgIAo+ID4gCj4gPiBUcnVlLCB0aGlzIHNob3VsZCByZWFsbHkg
YmUgZG9jdW1lbnRlZCBpbiB0aGUgZ2VuZXJpYyBiaW5kaW5nIHBhcnQuIEFzCj4gPiB5b3UgcHJv
YmFibHkgZ3Vlc3NlZCBmcm9tIHRoaXMgZGlzY3Vzc2lvbiwgYWxsIG90aGVyIGRyaXZlcnMgKGFu
ZCB0aGUKPiA+IGZyYW1ld29yaykgaXMgYXNzdW1pbmcgInJlYWR5IiBpcyB0aGUgc3RhdGUgd2Un
cmUgbW9uaXRvcmluZywgc28gaXQncwo+ID4gZWZmZWN0aXZlbHkgYWN0aXZlIGhpZ2guCj4gPiAg
IAo+ID4+IAo+ID4+ICBJIGNhbiBmaXggaXQgaW4gdGhlIGRldmljZXRyZWUsIGFuZCB0aGUgZHJp
dmVyIHdvdWxkIHJldHVybgo+ID4+ICAoZ3Bpb2RfZ2V0X3ZhbHVlX2NhbnNsZWVwKGdwaW9kKSBe
IGdwaW9kX2lzX2FjdGl2ZV9sb3coZ3Bpb2QpKSBmb3IKPiA+PiAgY29tcGF0aWJpbGl0eSB3aXRo
IHRoZSBvbGQgZGV2aWNldHJlZS4gIAo+ID4gCj4gPiBPciB5b3UgY291bGQgcmVhZCB0aGUgcmF3
IHZhbHVlIChncGlvZF9nZXRfcmF3X3ZhbHVlX2NhbnNsZWVwKCkpLAo+ID4gYnV0IHRoYXQgc3Rp
bGwgbWVhbnMgeW91IGNhbid0IG1vdmUgYXdheSBmcm9tIHRoZSBvbGQgc2VtYW50aWNzIAo+ID4g
d2l0aG91dAo+ID4gYnJlYWtpbmcgdGhlIGV4aXN0aW5nIERUIHdpdGggdGhlIGVycm9uZW91cyBh
Y3RpdmUtbG93LiBJIG1lYW4sCj4gPiBhY3RpdmUtbG93IGlzIHN0aWxsIHZhbGlkIGlmIHNvbWVv
bmUgaGFzIHRoZSBSL0Igc2lnbmFsIGludmVydGVkLAo+ID4gYnV0IHlvdSBjYW4ndCBkaXNjcmlt
aW5hdGUgd2hlbiBpdCdzIHZhbGlkIGFuZCB3aGVuIGl0J3Mgbm90Lgo+ID4gCj4gPiBJIGd1ZXNz
IGhhdmluZyBhIGN1c3RvbSBoZWxwZXIsIGFuZCBkb2N1bWVudGluZyB0aGF0IHRoZSBhY3RpdmUg
c3RhdGUKPiA+IGZvciBpbmdlbmljIGlzIEJVU1kgd291bGQgYmUgb2theS4gVW5sZXNzIHlvdSdk
IGJlIHdpbGxpbmcgdG8gYnJlYWsKPiA+IHRoZSBiYWNrd2FyZCBjb21wYXQgZm9yIHRoZSBvbmx5
IGJvYXJkIHRoYXQgaGFzIGEgcmItZ3Bpb3MgcHJvcGVydHkKPiA+IGRlZmluZWQuICAKPiAKPiBX
aGF0IEkgc3VnZ2VzdCwgaW4gdGhlIHByb2JlOgo+IAo+IGlmIChvZl9tYWNoaW5lX2lzX2NvbXBh
dGlibGUoInFpLGxiNjAiKSAmJiAKPiBncGlvZF9pc19hY3RpdmVfbG93KG5hbmQtPmJ1c3lfZ3Bp
bykpIHsKPiAgICAgZ3Bpb2RfdG9nZ2xlX2FjdGl2ZV9sb3cobmFuZC0+YnVzeV9ncGlvKTsKPiB9
Cj4gCgpPaCwgSSBkaWRuJ3Qgbm90aWNlIHRoaXMgZ3Bpb2RfdG9nZ2xlX2FjdGl2ZV9sb3coKSBp
biB0aGUgQVBJLgoKPiBUaGVuIGl0J3MgYmFja3dhcmQtY29tcGF0aWJsZSwgd291bGQgYWxsb3cg
bWUgdG8gZml4IHRoZSByYi1ncGlvcyBpbiAKPiBkZXZpY2V0cmVlLCBhbmQgd291bGRuJ3QgcmVx
dWlyZSBhIGN1c3RvbSBuYW5kX2dwaW9fd2FpdHJkeSgpIGZ1bmN0aW9uLgoKVGhhdCdzIGluZGVl
ZCB0aGUgYmVzdCBvcHRpb24gSU1ITy4gSSdsbCBhZGQgYSBwYXRjaCBkb2luZyB0aGF0IGluIG15
CnYyLiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
