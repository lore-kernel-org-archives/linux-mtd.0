Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA61C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 17:28:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC7B82075F
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 17:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Io+hLrva"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC7B82075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmQ1enDckbNqACUWs6Z1d7ANVtxDclCS70fgehwUerE=; b=Io+hLrvat52bh5
	dSq6OwnhMBR6yLAkmN2mFasZMFvE2O9b0NyB/ymtwwL4TF/a9lhn+m0j3U7UAOCYl0owWZNtDTPQ0
	qM4LRUdghKWLmABGxo+OBci2PNRDY4li251ldSiGmpqh9PRhcYKNu2TTN5+x8bHh0aZHQqt6G8UJf
	xk00Evsnxz+/DfaDv0plUjOLWxP+vxv4VXD/RBKdOVslSn+yhy1SGvaDm0Pgcvp22uk7F4pxpmj9D
	Q4ZiP5Ka0JU7him/+nzaB+K/N1LtxTjhQMhWzws7wfiGOhPWbNyF1udVRF+q3ItQa6SEutGvFc9Gm
	Lq1ddeGLBHbsf+lO9vjQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb62G-0003Cm-Uo; Tue, 19 May 2020 17:28:12 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb62E-0003CC-Eb
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 17:28:12 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 9A4F1261136;
 Tue, 19 May 2020 18:28:08 +0100 (BST)
Date: Tue, 19 May 2020 19:28:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Convert the driver to exec_op()
Message-ID: <20200519192805.30fbf4fa@collabora.com>
In-Reply-To: <P73LAQ.QZS4PIAER4ZK@crapouillou.net>
References: <20200518165640.312220-1-boris.brezillon@collabora.com>
 <G7GJAQ.0VIFSQUDMC9H2@crapouillou.net>
 <20200518212422.23316760@collabora.com>
 <20200518213555.38e3a570@collabora.com>
 <P73LAQ.QZS4PIAER4ZK@crapouillou.net>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_102810_621866_AE885E92 
X-CRM114-Status: GOOD (  18.71  )
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

T24gVHVlLCAxOSBNYXkgMjAyMCAxNzowNDozNyArMDIwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gd3JvdGU6Cgo+IExlIGx1bi4gMTggbWFpIDIwMjAgw6AgMjE6MzUsIEJv
cmlzIEJyZXppbGxvbiAKPiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IGEgw6ljcml0
IDoKPiA+IE9uIE1vbiwgMTggTWF5IDIwMjAgMjE6MjQ6MjIgKzAyMDAKPiA+IEJvcmlzIEJyZXpp
bGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+ID4gICAKPiA+PiAg
T24gTW9uLCAxOCBNYXkgMjAyMCAxOTo1MDowNCArMDIwMAo+ID4+ICBQYXVsIENlcmN1ZWlsIDxw
YXVsQGNyYXBvdWlsbG91Lm5ldD4gd3JvdGU6Cj4gPj4gICAKPiA+PiAgPiBIaSBCb3JpcywKPiA+
PiAgPgo+ID4+ICA+IExlIGx1bi4gMTggbWFpIDIwMjAgw6AgMTg6NTYsIEJvcmlzIEJyZXppbGxv
bgo+ID4+ICA+IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4gYSDDqWNyaXQgOiAgCj4g
Pj4gID4gPiBMZXQncyBjb252ZXJ0IHRoZSBkcml2ZXIgdG8gZXhlY19vcCgpIHRvIGhhdmUgb25l
IGxlc3MgZHJpdmVyICAgCj4gPj4gcmVseWluZyAgCj4gPj4gID4gPiBvbiB0aGUgbGVnYWN5IGlu
dGVyZmFjZS4gIAo+ID4+ICA+Cj4gPj4gID4gR3JlYXQgd29yaywgdGhhbmtzIGZvciB0aGF0Lgo+
ID4+ICA+Cj4gPj4gID4gSG93ZXZlciBpdCBkb2VzIG5vdCB3b3JrIDooIG5hbmRfc2NhbigpIHJl
dHVybnMgZXJyb3IgLTE0NS4gIAo+ID4+IAo+ID4+ICBMb29rcyBsaWtlIHRoZSBSL0Igc2lnbmFs
IGlzIGludmVydGVkLiBDYW4geW91IHRyeSB3aXRoIHRoZQo+ID4+ICBmb2xsb3dpbmcgZGlmZiBh
cHBsaWVkPyAgCj4gPiAKPiA+IEkgY2hlY2tlZCB0aGUgRFQsIGFuZCB0aGUgR1BJTyBpcyBpbmRl
ZWQgZGVjbGFyZWQgR1BJT19BQ1RJVkVfTE9XLAo+ID4gd2hpY2ggZXhwbGFpbiB3aHkgdGhlIHRl
c3QgaXMgaW52ZXJ0ZWQuIEJlY2F1c2Ugb2YgRFQgQUJJIHN0YWJpbGl0eSBpdAo+ID4gbWlnaHQg
bm90IGJlIGFuIG9wdGlvbiB0byBjaGFuZ2UgdGhhdCwgYnV0IHRoZSBzaWduYWwgc2hvdWxkIGFj
dHVhbGx5IAo+ID4gYmUKPiA+IGRlY2xhcmVkIEdQSU9fQUNUSVZFX0hJR0guICAKPiAKPiBJdCBk
ZXBlbmRzIHdoYXQgeW91IGNvbnNpZGVyIHdoYXQgaXMgdGhlIGFjdGl2ZSBzdGF0ZSwgaXMgaXQg
d2hlbiAKPiAiYnVzeSIgb3IgInJlYWR5Ij8gOykKClRydWUsIHRoaXMgc2hvdWxkIHJlYWxseSBi
ZSBkb2N1bWVudGVkIGluIHRoZSBnZW5lcmljIGJpbmRpbmcgcGFydC4gQXMKeW91IHByb2JhYmx5
IGd1ZXNzZWQgZnJvbSB0aGlzIGRpc2N1c3Npb24sIGFsbCBvdGhlciBkcml2ZXJzIChhbmQgdGhl
CmZyYW1ld29yaykgaXMgYXNzdW1pbmcgInJlYWR5IiBpcyB0aGUgc3RhdGUgd2UncmUgbW9uaXRv
cmluZywgc28gaXQncwplZmZlY3RpdmVseSBhY3RpdmUgaGlnaC4KCj4gCj4gSSBjYW4gZml4IGl0
IGluIHRoZSBkZXZpY2V0cmVlLCBhbmQgdGhlIGRyaXZlciB3b3VsZCByZXR1cm4gCj4gKGdwaW9k
X2dldF92YWx1ZV9jYW5zbGVlcChncGlvZCkgXiBncGlvZF9pc19hY3RpdmVfbG93KGdwaW9kKSkg
Zm9yIAo+IGNvbXBhdGliaWxpdHkgd2l0aCB0aGUgb2xkIGRldmljZXRyZWUuCgpPciB5b3UgY291
bGQgcmVhZCB0aGUgcmF3IHZhbHVlIChncGlvZF9nZXRfcmF3X3ZhbHVlX2NhbnNsZWVwKCkpLApi
dXQgdGhhdCBzdGlsbCBtZWFucyB5b3UgY2FuJ3QgbW92ZSBhd2F5IGZyb20gdGhlIG9sZCBzZW1h
bnRpY3Mgd2l0aG91dApicmVha2luZyB0aGUgZXhpc3RpbmcgRFQgd2l0aCB0aGUgZXJyb25lb3Vz
IGFjdGl2ZS1sb3cuIEkgbWVhbiwKYWN0aXZlLWxvdyBpcyBzdGlsbCB2YWxpZCBpZiBzb21lb25l
IGhhcyB0aGUgUi9CIHNpZ25hbCBpbnZlcnRlZCwKYnV0IHlvdSBjYW4ndCBkaXNjcmltaW5hdGUg
d2hlbiBpdCdzIHZhbGlkIGFuZCB3aGVuIGl0J3Mgbm90LgoKSSBndWVzcyBoYXZpbmcgYSBjdXN0
b20gaGVscGVyLCBhbmQgZG9jdW1lbnRpbmcgdGhhdCB0aGUgYWN0aXZlIHN0YXRlCmZvciBpbmdl
bmljIGlzIEJVU1kgd291bGQgYmUgb2theS4gVW5sZXNzIHlvdSdkIGJlIHdpbGxpbmcgdG8gYnJl
YWsKdGhlIGJhY2t3YXJkIGNvbXBhdCBmb3IgdGhlIG9ubHkgYm9hcmQgdGhhdCBoYXMgYSByYi1n
cGlvcyBwcm9wZXJ0eQpkZWZpbmVkLgoKWzFdaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwaW8vZ3Bpb2xpYi5jI0w0MTY2CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
