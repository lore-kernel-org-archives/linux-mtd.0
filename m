Return-Path: <SRS0=wpEZ=37=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E012C352A3
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 16:07:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12DE320870
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Feb 2020 16:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fayPhx25"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12DE320870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6sXhGq3m3L2ieQsh0DjUcRKDhhunQUXHNyEYixjMQrE=; b=fayPhx25J+fvV2
	DOeFkdp15ZAs4CZofpE8orHWSiOerAPy1gMSQxjuX2wGm7tq55Dx8rfnSX5SidwMzqwY4J/IKw+qY
	u/niiWh33Bmeit9ppP22Z5tMaAchLJYhLiExvZ5XZ20tzJ3ufi7qygLOougrftnISio1qOUjK7r/t
	ZHL3tcZP3N9YzvBogNGd6YNR7mJdFDtW40ncL0CWzZFMg1eGU9ViAeDYsw1O469T54iFVkVQ/MM2Y
	9l8e3t61k3d5uujqV39zsC6nfInq/WCybozM+jO2HOvNjjM1gi39hcu5qB4VPqLKtnAqk+u86U6HU
	ldfAc/12ksMgSs0ucCrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1Y4R-0005EC-Ey; Tue, 11 Feb 2020 16:07:31 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1Y4N-0005C6-NY
 for linux-mtd@lists.infradead.org; Tue, 11 Feb 2020 16:07:29 +0000
Received: from xps13 (unknown [12.207.20.3])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A9DAF240012;
 Tue, 11 Feb 2020 16:07:12 +0000 (UTC)
Date: Tue, 11 Feb 2020 17:07:07 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Revert "mtd: rawnand: denali: get
 ->setup_data_interface() working again"
Message-ID: <20200211170707.2183625e@xps13>
In-Reply-To: <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
References: <20200205070834.3087104-1-marex@denx.de>
 <20200205101223.21d99d93@xps13>
 <45a10680-5fe6-7cab-a7ef-f7f7a952e822@denx.de>
 <20200205105045.6877aca6@xps13>
 <bdb54ba5-648a-0b79-661c-5eb9604a1ee5@denx.de>
 <b6f094b7-01a9-34a2-bf10-019a05bc7cb3@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_080728_037135_8496E406 
X-CRM114-Status: GOOD (  20.24  )
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
Cc: Dinh Nguyen <dinguyen@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Tim Sander <tim@krieglstein.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFyZWssIE1hc2FoaXJvLAoKTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+IHdyb3RlIG9u
IFR1ZSwgMTEgRmViIDIwMjAgMTE6MDQ6MTAgKzAxMDA6Cgo+IE9uIDIvNS8yMCAxMTowOCBBTSwg
TWFyZWsgVmFzdXQgd3JvdGU6Cj4gPiBPbiAyLzUvMjAgMTA6NTAgQU0sIE1pcXVlbCBSYXluYWwg
d3JvdGU6ICAKPiA+PiBIaSBNYXJlaywKPiA+Pgo+ID4+IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPiB3cm90ZSBvbiBXZWQsIDUgRmViIDIwMjAgMTA6NDE6MDUgKzAxMDA6Cj4gPj4gIAo+ID4+
PiBPbiAyLzUvMjAgMTA6MTIgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6ICAKPiA+Pj4+IEhpIE1h
cmVrLAo+ID4+Pj4KPiA+Pj4+IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPiB3cm90ZSBvbiBX
ZWQsICA1IEZlYiAyMDIwIDA4OjA4OjM0ICswMTAwOgo+ID4+Pj4gICAgIAo+ID4+Pj4+IFRoaXMg
cmV2ZXJ0cyBjb21taXQgZDMxMWUwYzI3YjhmY2MyN2Y3MDdmOGNhYzQ4Y2Q4YmRjNDE1NTIyNCwg
d2hpY2gKPiA+Pj4+PiBjb21wbGV0ZWx5IGJyZWFrcyBOQU5EIGFjY2VzcyBvbiBBbHRlcmEgU29D
RlBHQSAoZGV0ZWN0ZWQgb24gQXJyaWFWCj4gPj4+Pj4gU29DKS4KPiA+Pj4+Pgo+ID4+Pj4+IE9u
IFNvQ0ZQR0EsIGRlbmFsaS0+Y2xrX3JhdGUgPSAzMS4yNSBNSHogYW5kIGRlbmFsaS0+Y2xrX3hf
cmF0ZSA9IDEyNSBNSHosCj4gPj4+Pj4gaGVuY2UgdGhlIGRyaXZlciBzZXRzIE5BTkRfS0VFUF9U
SU1JTkdTIGZsYWcuIFRoaXMgZGlkIG5vdCBoYXBwZW4gYmVmb3JlCj4gPj4+Pj4gYW5kIGlzIGFj
dHVhbGx5IGluY29ycmVjdCwgYXMgb24gU29DRlBHQSB3ZSBkbyBub3Qgd2FudCB0byByZXRhaW4g
dGltaW5ncwo+ID4+Pj4+IGZyb20gcHJldmlvdXMgc3RhZ2UgKHRoZSB0aW1pbmdzIG1pZ2h0IGJl
IGluY29ycmVjdCBvciBvdXRyaWdodCBpbnZhbGlkKS4KPiA+Pj4+Pgo+ID4+Pj4+IENjOiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgo+ID4+Pj4+IENjOiBE
aW5oIE5ndXllbiA8ZGluZ3V5ZW5Aa2VybmVsLm9yZz4KPiA+Pj4+PiBDYzogTWFzYWhpcm8gWWFt
YWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KPiA+Pj4+PiBDYzogTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+Pj4+PiBDYzogVGltIFNhbmRlciA8dGltQGtyaWVn
bHN0ZWluLm9yZz4KPiA+Pj4+PiBUbzogbGludXgtbXRkIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFk
ZWFkLm9yZz4KPiA+Pj4+PiAtLS0KPiA+Pj4+PiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxp
LmMgfCAyICstCj4gPj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4+Pj4+Cj4gPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3
L2RlbmFsaS5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMKPiA+Pj4+PiBpbmRleCBi
NmM0NjNkMDIxNjcuLjVmZTNjNjJhNzU2ZSAxMDA2NDQKPiA+Pj4+PiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9kZW5hbGkuYwo+ID4+Pj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Rl
bmFsaS5jCj4gPj4+Pj4gQEAgLTEyMDksNyArMTIwOSw3IEBAIGludCBkZW5hbGlfY2hpcF9pbml0
KHN0cnVjdCBkZW5hbGlfY29udHJvbGxlciAqZGVuYWxpLAo+ID4+Pj4+ICAJfQo+ID4+Pj4+ICAK
PiA+Pj4+PiAgCS8qIGNsayByYXRlIGluZm8gaXMgbmVlZGVkIGZvciBzZXR1cF9kYXRhX2ludGVy
ZmFjZSAqLwo+ID4+Pj4+IC0JaWYgKCFkZW5hbGktPmNsa19yYXRlIHx8ICFkZW5hbGktPmNsa194
X3JhdGUpICAgIAo+ID4+Pj4KPiA+Pj4+IEkgZG9uJ3QgZ2V0IGl0LCBpZiBib3RoIGNsa19yYXRl
IGFuZCBjbGtfeF9yYXRlIGFyZSBzZXQsIHRoZSBpZgo+ID4+Pj4gY29uZGl0aW9uIHdpbGwgbm90
IGJlIGVudGVyZWQsIHJpZ2h0PyAgICAKPiA+Pj4KPiA+Pj4gRXJyLCB0aGVuIGl0J3MgdGhlIG90
aGVyIHdheSBhcm91bmQgYW5kIEkgbmVlZCB0byBrZWVwIHRoZSB0aW1pbmdzIG9uCj4gPj4+IHNv
Y2ZwZ2EgPyAgCj4gPj4KPiA+PiBPay4KPiA+Pgo+ID4+IERvIHlvdSBoYXZlIGEgZGlmZmVyZW50
IGNvbXBhdGlibGU/IE9yIGEgcmVnaXN0ZXIgdG8gY2hlY2s/IEhvdyBkbyB5b3UKPiA+PiBkaXNj
cmltaW5hdGUgdGhlIGRpZmZlcmVudCBwbGF0Zm9ybXMgYnkgc29mdHdhcmU/IFRoZSBxdWljayBh
bmQgZGlydHkKPiA+PiBzb2x1dGlvbiBpcyB0byBhZGQgYSBzcGVjaWFsIGNhc2UgZm9yIHlvdXIg
cGxhdGZvcm0gYW5kIHNwZWNpZmljYWxseQo+ID4+IHVzZSB0aGUgTkFORF9LRUVQX1RJTUlOR1Mg
aG9ycm9yLiAgCj4gPiAKPiA+IFN1cmUsIHRoZXJlJ3MgYSBzb2NmcGdhIGNvbXBhdGlibGUgYW5k
IGF0IGxlYXN0IHR3byBmb3IgdW5pcGhpZXIuCj4gPiAgIAo+ID4+IEJ1dCBJIHRoaW5rIHVzaW5n
IC0+c29mdHdhcmVfZGF0YV9pbnRlcmZhY2UgaXMgdGhlIHJpZ2h0IHNvbHV0aW9uLiBTbwo+ID4+
IEkgd291bGQgaGlnaGx5IHJlY29tbWVuZCBmaXhpbmcgdGhlIGltcGxlbWVudGF0aW9uIG9mIHRo
aXMgaG9vawo+ID4+IGZvciB5b3VyIHBsYXRmb3JtIGFuZCBpbiB0aGlzIGNhc2UgdGhlIGNvbW1p
dCByZXZlcnRlZCBpcyBub3QgdGhlCj4gPj4gY3VscHJpdCwgdGhlIG9uZSBpbnRyb2R1Y2luZyBz
ZXR1cF9kYXRhX2ludGVyZmFjZSBpcyAoZm9yIHRoZSBGaXhlczoKPiA+PiB0YWcpLiAgCj4gPiAK
PiA+IEknbGwgbGVhdmUgdGhlIGRldGFpbHMgdG8gWWFtYWRhLXNhbi4gIAo+IAo+IEp1c3QgZ290
IGEgY29uZmlybWF0aW9uIHRoYXQgdGhpcyBmaXhlcyBOQU5EIGJlaGF2aW9yIG9uIFNvQ0ZQR0Es
IHNvCj4gdGhpcyBwYXRjaCBzaG91bGQgZ28gaW4gaW4gc29tZSBmb3JtLgoKSSdtIHN1cmUgaXQg
Zml4ZXMgaXQsIGJ1dCBpdCBpcyBkZWZpbml0ZWx5IG5vdCBnb2luZyBpbiB0aGUgcmlnaHQKZGly
ZWN0aW9uIQoKVGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGlzIGZpeGluZyAtPnNldHVwX2RhdGFfaW50
ZXJmYWNlKCkuCgpUaGUgYmFkIHRoaW5nIHRvIGRvIGlmIHNvbWVvbmUgdGVsbHMgbWUgdGhhdCBo
ZSB3aWxsIGZpeAotPnNldHVwX2RhdGFfaW50ZXJmYWNlKCkgaW4gYSBzZWNvbmQgdGltZSBpcyB0
byBrZWVwIHRoZQpOQU5EX0tFRVBfVElNSU5HUyBmbGFnIG9ubHkgZm9yIGEgc2luZ2xlIGNvbXBh
dGlibGUuCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
