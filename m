Return-Path: <SRS0=GPAM=77=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD326C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 14:36:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E05720773
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 14:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j8l9EmSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E05720773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fp3mghoe6flwS9LEVUue2F/zm1gQut41uPV1PRsGMjs=; b=j8l9EmSl6Xn1VN
	uovRXaaVhQhAEmUsn7p/aoqJJNC8IZLOlX/K6e4qIHJRXu6ZBFT7I7IFKwFnxDWWLIUJoZTof1kr5
	LhsQ71PL0gkdgekOzHJzKA/PXo7zZqXreqHI0yE2Iy5f1dt1bqfd52Gw51VwgsAF1QNAWLAMjBUyE
	jOeXfcvsJc6RW3TwbmyHNSKqXRj1YOv7bwuYBfxKA+Esv52k5tceDHo4p3ryrls6zAB9xTwHvc28g
	4LCBZcwdo664bYljNwDbPGM9OSLaBRYP+w6s765SltgYaRRcV3d2ZgPdFrXbNBn504L+x6iFiH9Wd
	48AQfWaL5+ZT76+ye3Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlveI-00086g-Lq; Thu, 18 Jun 2020 14:36:14 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlveA-0007xQ-QW
 for linux-mtd@lists.infradead.org; Thu, 18 Jun 2020 14:36:09 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 8213FC0017;
 Thu, 18 Jun 2020 14:36:03 +0000 (UTC)
Date: Thu, 18 Jun 2020 16:36:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: Re: next/master bisection: baseline.login on
 ox820-cloudengines-pogoplug-series-3N
Message-ID: <20200618163602.1727fffd@xps13>
In-Reply-To: <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
 <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
 <20200618152324.0b0007a9@xps13> <20200618160925.6f77b1d1@xps13>
 <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_073607_048608_B1781D05 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, kernelci-results@groups.io,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgR3VpbGxhdW1lLAoKLXJlZHVjaW5nIHRoZSBDYzogbGlzdAoKR3VpbGxhdW1lIFR1Y2tlciA8
Z3VpbGxhdW1lLnR1Y2tlckBjb2xsYWJvcmEuY29tPiB3cm90ZSBvbiBUaHUsIDE4IEp1bgoyMDIw
IDE1OjIzOjQ1ICswMTAwOgoKPiBPbiAxOC8wNi8yMDIwIDE1OjA5LCBNaXF1ZWwgUmF5bmFsIHdy
b3RlOgo+ID4gSGkgR3VpbGxhdW1lLAo+ID4gCj4gPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZSBvbiBUaHUsIDE4IEp1biAyMDIwCj4gPiAxNToyMzoyNCAr
MDIwMDoKPiA+ICAgCj4gPj4gSGkgR3VpbGxhdW1lLAo+ID4+Cj4gPj4gR3VpbGxhdW1lIFR1Y2tl
ciA8Z3VpbGxhdW1lLnR1Y2tlckBjb2xsYWJvcmEuY29tPiB3cm90ZSBvbiBUaHUsIDE4IEp1bgo+
ID4+IDIwMjAgMTM6Mjg6MDUgKzAxMDA6Cj4gPj4gIAo+ID4+PiBQbGVhc2Ugc2VlIHRoZSBiaXNl
Y3Rpb24gcmVwb3J0IGJlbG93IGFib3V0IGEga2VybmVsIHBhbmljLgo+ID4+Pgo+ID4+PiBSZXBv
cnRzIGFyZW4ndCBhdXRvbWF0aWNhbGx5IHNlbnQgdG8gdGhlIHB1YmxpYyB3aGlsZSB3ZSdyZQo+
ID4+PiB0cmlhbGluZyBuZXcgYmlzZWN0aW9uIGZlYXR1cmVzIG9uIGtlcm5lbGNpLm9yZyBidXQg
dGhpcyBvbmUKPiA+Pj4gbG9va3MgdmFsaWQuCj4gPj4+Cj4gPj4+IFNlZSB0aGUga2VybmVsIE9v
cHMgZHVlIHRvIGEgTlVMTCBwb2ludGVyIGZvbGxvd2VkIGJ5IGEgcGFuaWM6Cj4gPj4+Cj4gPj4+
ICAgaHR0cHM6Ly9zdG9yYWdlLmtlcm5lbGNpLm9yZy9uZXh0L21hc3Rlci9uZXh0LTIwMjAwNjE4
L2FybS9veG5hc192Nl9kZWZjb25maWcvZ2NjLTgvbGFiLWJheWxpYnJlL2Jhc2VsaW5lLW94ODIw
LWNsb3VkZW5naW5lcy1wb2dvcGx1Zy1zZXJpZXMtMy5odG1sI0w1MDQgIAo+ID4+Cj4gPj4gVGhh
bmtzIGZvciB0aGUgcmVwb3J0LCBJIHdpbGwgbm90IGJlIGFibGUgdG8gbWFuYWdlIGl0IGJlZm9y
ZSBNb25kYXksCj4gPj4gYnV0IEknbGwgdHJ5IHRvIHRha2UgY2FyZSBvZiBpdCBlYXJseSBuZXh0
IHdlZWsuICAKPiA+IAo+ID4gQWN0dWFsbHkgQm9yaXMgc2F3IHRoZSBpc3N1ZSwgSSBqdXN0IHVw
ZGF0ZWQgbmFuZC9uZXh0LCBpdCBzaG91bGQgYmUKPiA+IHBhcnQgb2YgdG9tb3Jyb3cncyBsaW51
eC1uZXh0LiBDb3VsZCB5b3UgcGxlYXNlIHJlcG9ydCBpZiBpdCBmaXhlcyB5b3VyCj4gPiBib290
PyAgCj4gCj4gU3VyZSwgd2lsbCBjaGVjayB0b21vcnJvdy4gIFRoYW5rcyBmb3IgdGhlIHVwZGF0
ZS4KPiAKPiBXZSBtYXkgYWxzbyBjb25zaWRlciBhZGRpbmcgdGhlIG5hbmQvbmV4dCBicmFuY2gg
dG8ga2VybmVsY2kub3JnCj4gYW5kIGNhdGNoIGlzc3VlcyBlYXJsaWVyLiAgV2UgY2FuIGRpc2N1
c3MgdGhhdCBzZXBhcmF0ZWx5LgoKVGhhdCB3b3VsZCBiZSBncmVhdCEgU28gZmFyLCB3ZSAtTVRE
LSBoYXZlIGJlZW4gbGF6eSBhbmQgcmVsaWVkIG9uCmxpbnV4LW5leHQgdGVzdGluZyBvbmx5LiBX
ZSBkbyBjb2RlIGFuYWx5c2lzIHdpdGggSW50ZWwncyAwLWRheSByb2JvdHMKYnV0IHRoZXkgdGVu
ZCB0byBiZSB2ZXJ5IHNsb3cgd2hlbiBhcHByb2FjaGluZyAtcmM2Ly1yYzcgd2hpY2ggaXMgYWxz
bwphbiBpc3N1ZSBmb3IgdXMgYmVjYXVzZSBvZiB0aGUgd2lkZSB2YXJpZXR5IG9mIGFyY2hpdGVj
dHVyZXMgd2Ugc3RpbGwKc3VwcG9ydC4KCkN1cnJlbnRseSB3ZSBtYWludGFpbiB0aGUgZm9sbG93
aW5nIGJyYW5jaGVzLCB3aGljaCBhcmUgYWxsIHB1bGxlZAppbiBsaW51eC1uZXh0OgogKiBuYW5k
L25leHQgLT4gUmF3IE5BTkQgYW5kIFNQSS1OQU5EIHN0dWZmCiAqIHNwaS1ub3IvbmV4dCAtPiBT
UEktTk9SIHN0dWZmCiAqIGNmaS9uZXh0IC0+IENGSSBzdHVmZgogKiBtdGQvbmV4dCAtPiBldmVy
eXRoaW5nIGVsc2UKICogbXRkL2ZpeGVzIG9jY2FzaW9uYWxseSBmb3IgYWxsIE1URCBmaXhlcyAo
bm8gc3Vic3lzdGVtIHNwZWNpZmljCmJyYW5jaCkKCkFyZSB0aGVyZSBhbnkga2VybmVsLWNpIHBy
ZXJlcXVpc2l0ZXMgd2Ugc2hvdWxkIGJlIGF3YXJlIG9mPwoKVGhhbmtzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
