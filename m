Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 446E5C2D0E5
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 14:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18926206F2
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 14:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b/yOa8Cv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="K1hCL8HE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18926206F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ss3A16qrD9vcqFVUO7bqxJibL/Nu42jBYssfc4B42Mo=; b=b/yOa8Cvf+lSQKjiRTnOkM009
	WgAzAJ12dztHS4r/pjgfm17tUi/ccuTE+BsS+z1AqZYhDS9xrJ95cttofJPKqmfKrfDOip3hP+AmJ
	AojlG/rSzuOJOWiicl7VJaKbgQl9quqLoyjLGPh8pZv3e8mBWPxxbvaRN7SJ4I/xlIAAZaMeVoIVx
	uWd9hNi2ftmaN+VLkmJDgsPJRqNWdy5FLj4aoS2JZwh3p1rnETdkKqUj6TE+qj0MOWqlt75TVQSUi
	EdqHxFqfcXWUxYk8FdTBXBIxYH/2kFyo9WfMkYfJY5HaGOL7S9+FWXhwziZnchUORN8dme4iuDy6x
	eyD4Q/kVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHqBM-0002vq-3S; Fri, 27 Mar 2020 14:42:00 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHqBH-0002uk-DM
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 14:41:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2388F22FEC;
 Fri, 27 Mar 2020 15:41:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1585320112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IhhqnEEjd7j8YFsiPIF4MDR1OPYkqd3YBJDx5dOWyuM=;
 b=K1hCL8HEIQ0t2wWT5JN3F9eKgjFQvtlGnT4UaTb+9ygZy6AV2lxWRbRkxLHU3PIDZkMdgF
 MH5SIMhDWci/IF6T2HTZdAGkucEYG49WrRkOCsuW0q/LdfFyPWA4EfNUikWz/CaLR102ht
 BbZldfsn5j/9eoNWNZLvNrkwmUid9I4=
MIME-Version: 1.0
Date: Fri, 27 Mar 2020 15:41:51 +0100
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] mtd: spi-nor: keep lock bits if they are non-volatile
In-Reply-To: <a4f3657b-8ebe-a54d-8a11-c6e4ce8a3561@ti.com>
References: <20200103221229.7287-1-michael@walle.cc>
 <8187061.UfBqSTmf1g@192.168.0.113>
 <62b578b07d5eb46a015dafd4c2f45bc2@walle.cc>
 <5323055.WqobA3rpa8@192.168.0.113>
 <990b9b16-36e5-ce73-36c7-0ebfa391c26b@ti.com>
 <e64cc3ac32d2b44c9e6f4b4f795354ae@walle.cc>
 <a4f3657b-8ebe-a54d-8a11-c6e4ce8a3561@ti.com>
Message-ID: <926471a04028dda58ff2aba2657c2fe2@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.3.10
X-Spamd-Bar: /
X-Rspamd-Server: web
X-Rspamd-Queue-Id: 2388F22FEC
X-Spamd-Result: default: False [-0.10 / 15.00]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; DKIM_SIGNED(0.00)[];
 RCPT_COUNT_SEVEN(0.00)[8]; NEURAL_HAM(-0.00)[-0.870];
 RCVD_COUNT_ZERO(0.00)[0]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_074155_755689_B3F3B0CF 
X-CRM114-Status: GOOD (  22.17  )
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
Cc: marex@denx.de, Tudor.Ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMC0wMS0yMyAxODoyMCwgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+IE9uIDEv
MjIvMjAyMCA2OjE0IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+PiBIaSBWaWduZXNoLAo+PiAK
Pj4gQW0gMjAyMC0wMS0yMiAxMzoxMCwgc2NocmllYiBWaWduZXNoIFJhZ2hhdmVuZHJhOgo+Pj4g
T24gMjIvMDEvMjAgMTI6MjMgYW0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToK
Pj4+PiBIaSwgTWljaGFlbCwgVmlnbmVzaCwKPj4+PiAKPj4+PiBPbiBTdW5kYXksIEphbnVhcnkg
MTIsIDIwMjAgMTI6NTA6NTcgQU0gRUVUIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+Pj4+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91Cj4+Pj4+IGtub3cgdGhlCj4+Pj4+IGNvbnRlbnQgaXMgc2FmZQo+Pj4gWy4uLl0KPj4+IAo+
IAo+IFsuLi5dCj4gCj4+Pj4+PiBQcmVmZXJlbmNlcyBvciBzdWdnZXN0aW9ucz8KPj4+Pj4gCj4+
Pj4gSSB3b3VsZCBnbyB3aXRoIDIvIG9yIDMvLiBWaWduZXNoLCB3aGF0IGRvIHlvdSBwcmVmZXIg
YW5kIHdoeT8KPj4+PiAKPj4+IAo+Pj4gSSBkb250IGxpa2Ugb3B0aW9uIDEsIGJlY2F1c2UgSSBh
bSBub3QgY29udmluY2VkIHRoYXQgdGhpcyBpcyBhIEhXCj4+PiBkZXNjcmlwdGlvbiB0byBiZSBw
dXQgaW4gRFQuwqAgSUlVQywgcHJvYmxlbSBpcyBtb3JlIG9mIHdoYXQgdG8gZG8gCj4+PiB3aXRo
Cj4+PiBsb2NraW5nIGNvbmZpZ3VyYXRpb24gdGhhdCBpcyBkb25lIGJlZm9yZSBMaW51eCBjb21l
cyB1cChlaXRoZXIgaW4KPj4+IHByZXZpb3VzIGJvb3Qgb3IgYnkgYm9vdGxvYWRlciBvciBQT1Ig
ZGVmYXVsdCkuIEN1cnJlbnQgY29kZSBqdXN0Cj4+PiBkaXNjYXJkcyBpdCBhbmQgdW5sb2NrcyBl
bnRpcmUgZmxhc2guCj4+IAo+PiBCdXQgdGhpcyBpcyBub3QgdGhlIG1haW4gcHJvYmxlbS4gSXQg
aXMgcmF0aGVyIHRoZSBpbnRlbnRpb24gb2YgdGhlCj4+IHVzZXIgdG8gYWN0dWFsbHkgd2FudCB3
cml0ZSBwcm90ZWN0IHRoZSBmbGFzaCAoZm9yIGZsYXNoZXMgd2hvIGhhcwo+PiBwcm9wZXIgc3Vw
cG9ydCBmb3IgdGhlbSwgdGhhdCBpcyB0aGUgb25lcyB3aGljaCBoYXZlIG5vbi12b2xhdGlsZQo+
PiBiaXRzKS4KPj4gCj4+IEZsYXNoZXMgd2l0aCB2b2xhdGlsZSBiaXRzIGFyZSBhbm90aGVyIHN1
YmplY3QuIEhlcmUgaXQgbWlnaHQgYmUgCj4+IHVzZWZ1bAo+PiB0byB1bmxvY2sgdGhlbSBlaXRo
ZXIgYXQgcHJvYmUgdGltZSBvciB3aGVuIHdlIGZpcnN0IHdyaXRlIHRvIHRoZW0sIHNvCj4+IHRo
ZSB1c2VyIGRvZXNuJ3QgbmVlZCB0byBrbm93IGlmIGl0cyB0aGlzIGtpbmQgb2YgZmxhc2ggYW5k
IGhlIHdvdWxkCj4+IGFjdHVhbGx5IGhhdmUgdG8gdW5sb2NrIHRoZSBmbGFzaCBiZWZvcmUgd3Jp
dGluZy4gSSd2ZSBsZWZ0IHRoZQo+PiBiZWhhdmlvdXIgZm9yIHRoZXNlIGZsYXNoZXMgYXMgaXQg
d2FzIGJlZm9yZS4KPj4gCj4+IEFuZCB5ZXMsIHUtYm9vdCBzdWZmZXJzIGZyb20gdGhlIHNhbWUg
cHJvYmxlbSwgZWcuIGl0IHVubG9ja3MgdGhlIAo+PiB3aG9sZQo+PiBmbGFzaCB0b28uIEkgZ3Vl
c3MgdGhleSBpbmhlcml0ZWQgdGhlIGJlaGF2aW91ciBmcm9tIGxpbnV4LiBCdXQgSQo+PiB3YW50
ZWQgdG8gc3RhcnQgd2l0aCBsaW51eCBmaXJzdC4KPj4gCj4gCj4gVS1Cb290IG9ubHkgdW5sb2Nr
cyBlbnRpcmUgZmxhc2ggaW4gY2FzZSBvZiBBdG1lbCBvciBTU1Qgb3IgSW50ZWwuCgp3ZWxsIGZv
ciBub3cuLiB1bnRpbCBzb21lb25lIHRoaW5rcyBpdHMgYSBnb29kIGlkZWEgdG8gZm9sbG93IGxp
bnV4CmJlaGF2aW91ci4KCj4+PiBCdXQgcHJvcG9zYWwgaXMgbm90IHRvIHRvdWNoIHRob3NlIGJp
dHMgYXQgcHJvYmUgdGltZSBhbmQgbGVhdmUgdGhpcwo+Pj4gdXB0byB1c2Vyc3BhY2UgdG8gaGFu
ZGxlLgo+PiAKPj4gTm8sIG15IHByb3Bvc2FsIHdhcyB0byBkaXZpZGUgdGhlIGZsYXNoZXMgaW50
byB0d28gY2F0ZWdvcmllcy4gVGhlCj4+IHVubG9ja2luZyBpcyBvbmx5IGRvbmUgb24gdGhlIGZs
YXNoZXMgd2hpY2ggaGF2ZSB2b2xhdGlsZSBsb2NraW5nIAo+PiBiaXRzLAo+PiB0aHVzIGV2ZW4g
d2hlbiB0aGUgbmV3IG9wdGlvbiBpcyBlbmFibGVkIGl0IHdvbid0IGJyZWFrIGFjY2VzcyB0byAK
Pj4gdGhlc2UKPj4gZmxhc2hlcy4KPj4gCj4gCj4gSG1tLCBsb29rcyBsaWtlIGJlZm9yZSBjb21t
aXQgM2UwOTMwZjEwOWU3ICgibXRkOiBzcGktbm9yOiBSZXdvcmsgdGhlCj4gZGlzYWJsaW5nIG9m
IGJsb2NrIHdyaXRlIHByb3RlY3Rpb24iKSBnbG9iYWwgdW5sb2NrIHdhcyBiZWluZyBkb25lIG9u
bHkKPiBmb3IgQXRtZWwsIFNTVCBhbmQgSW50ZWwgZmxhc2hlcy4gU28gM2UwOTMwZjEwOWU3IGRl
ZmluaXRlbHkgY2hhbmdlcwo+IHRoaXMgYmVoYXZpb3IgdG8gdW5sb2NrIGFsbCBmbGFzaGVzIHRo
YXQgaGF2ZSBTUElfTk9SX0hBU19MT0NLIHNldCAoaW4KPiBhZGRpdGlvbiB0byBBdG1lbCxTU1Qg
YW5kIEludGVsKS4KPiBJIHRoaW5rIHdlIHNob3VsZCBqdXN0IHJldmVydCB0byB0aGUgYmVoYXZp
b3IgYmVmb3JlIDNlMDkzMGYxMDllNyBzbyBhcwo+IG5vdCB0byBicmVhayB1c2Vyc3BhY2UgZXhw
ZWN0YXRpb24gb2YgcHJlc2VydmluZyBub24gdm9sYXRpbGUgQlAgCj4gc2V0dGluZwo+IGFjcm9z
cyBib290cwo+IAo+IEFyZSB3ZSBzdXJlIHRoZXJlIGFyZSBubyBBdG1lbCBhbmQgU1NUIGZsYXNo
ZXMgdGhhdCBoYXZlIG5vbi12b2xhdGlsZSAKPiBCUAo+IGJpdHM/IElmIHNvLCB0aGVuIEkgaGF2
ZSBubyBvYmplY3Rpb24gZm9yIHRoaXMgcGF0Y2ggYXMgdGhpcyAKPiBlZmZlY3RpdmVseQo+IHJl
dmVydHMgYmFjayB0byBiZWhhdmlvciBiZWZvcmUgM2UwOTMwZjEwOWU3LgoKSSd2ZSBnb25lIHRo
cm91Z2ggYWxsIHRoZSBmbGFzaGVzIHdoaWNoIHdlcmUgc3VwcG9ydGVkIChhdCB0aGF0IHRpbWUp
LCAKYWxsCndoaWNoIGhhdmUgbm9uLXZvbGF0aWxlIGhhdmUgdGhlIFNQSV9OT1JfVU5QUk9URUNU
IGZsYWcuIEFsc28gc29tZSBFU01UCnBhcnRzIGhhdmUgbm9uLXZvbGF0aWxlIGZsYWdzLgoKQnV0
IHRoaXMgcGF0Y2ggZG9lc24ndCByZXN0b3JlIHRoZSBzdGF0ZSBhcyBvZiBiZWZvcmUgM2UwOTMw
ZjEwOWU3LiAKQmVmb3JlCnRoaXMgY29tbWl0IGFueSBBdG1lbCwgSW50ZWwgYW5kIFNTVCBmbGFz
aGVzIHdlcmUgdW5sb2NrZWQuIFdpdGggdGhpcwpwYXRjaCBvbmx5IHRoZSBvbmVzIGFyZSB1bmxv
Y2tlZCB3aGljaCBoYXZlIHZvbGF0aWxlIGJpdHMuCgpJJ2xsIHNlbmQgYSB2MyB3aGljaCBpbnRy
b2R1Y2VzIGEgbmV3IGtlcm5lbCBjb25maWcgb3B0aW9uIHdpdGggdGhyZWUKY2hvaWNlczoKICAo
MSkgRGlzYWJsZSBXUCBvbiBhbnkgZmxhc2hlcyAobGVnYWN5IGJlaGF2aW91cikKICAoMikgRGlz
YWJsZSBXUCBvbiBmbGFzaGVzIHcvIHZvbGF0aWxlIHByb3RlY3Rpb24gYml0cwogICgzKSBLZWVw
IHdyaXRlIHByb3RlY3Rpb24gYXMgaXMKCigxKSBpcyBlbmFibGVkIGJ5IGRlZmF1bHQuIE9uZSBz
aG91bGQgY2hvb3NlICgyKSB0aG91Z2gsIGJlY2F1c2UgdGhhdCBpcwp0aGUgc2FuZSB0aGluZyB0
byBkbyBhbmQgKDMpIGlzIGZvciBjb21wbGV0ZW5lc3MgYW5kIHRoZSBzcGVjaWFsIGNhc2UgaWYK
YW55b25lIHdpbGwgYWN0dWFsbHkga2VlcCB0aGUgd3JpdGUgcHJvdGVjdGlvbiBvbiBmbGFzaGVz
IHdpdGggdm9sYXRpbGUKYml0cy4KCkkgc3RpbGwgZG9uJ3QgdGhpbmsgYSBrZXJuZWwgcGFyYW1l
dGVyIGlzIGEgZ29vZCBpZGVhIGJlY2F1c2UgeW91IG1heQptaXNzIGl0IGFuZCBlbmQgdXAgd2l0
aCB5b3VyIGZsYXNoIGJlaW5nIHVucHJvdGVjdGVkLgoKQW5kIGkgc3RpbGwgaG9wZSB0aGF0IHNv
bWV0aW1lLCAoMikgbWF5IGJlIHRoZSBkZWZhdWx0Li4KCi1taWNoYWVsCgoKPiAKPiBSZWdhcmRz
Cj4gVmlnbmVzaAo+IAo+Pj4gQWRkaW5nIGEgS2NvbmZpZyBkb2VzIG5vdCBzY2FsZSB3ZWxsIGZv
ciBtdWx0aS1wbGF0Zm9ybSBidWlsZHMuIFRoZXJlCj4+PiB3b3VsZCBub3QgYmUgYSB3YXkgdG8g
aGF2ZSBwcm90ZWN0aW9uIGVuYWJsZWQgb24gb25lIHBsYXRmb3JtIGJ1dAo+Pj4gZGlzYWJsZWQg
b24gb3RoZXIuIERvZXMgbm90IHNjYWxlIGZvciBtdWx0aXBsZSBmbGFzaGVzIGVpdGhlcgo+Pj4g
Cj4+PiBPcHRpb24gMyBzb3VuZHMgbGVhc3QgYmFkIGFtb25nIGFsbC4gSWYgbW9kdWxlIHBhcmFt
IGNhbiBiZSBkZXNpZ25lZCAKPj4+IHRvCj4+PiBiZSBhIHN0cmluZyB0aGVuLCB3ZSBjb3VsZCBj
b250cm9sIGxvY2tpbmcgYmVoYXZpb3IgdG8gYmUgcGVyIGZsYXNoCj4+PiB1c2luZyBmbGFzaCBu
YW1lLgo+PiAKPj4gV2hhdCBhYm91dCBib3RoPyBBIGtjb25maWcgb3B0aW9uIHdoaWNoIGRlZmlu
ZXMgdGhlIGRlZmF1bHQgZm9yIHRoZQo+PiBrZXJuZWwgcGFyYW1ldGVyPyBNeSBmZWFyIGlzIHRo
YXQgb25jZSBpdCBpcyBhIGtlcm5lbCBwYXJhbWV0ZXIgaXQgaXMKPj4gZWFzeSB0byBmb3JnZXQg
KHRodXMgaGF2aW5nIHRoZSBub24tdm9sYXRpbGUgYml0cywgdGhlIGZsYXNoIGlzCj4+IGNvbXBs
ZXRlbHkgdW5sb2NrZWQgYWdhaW4pIGFuZCBpdCBpcyBub3QgdmVyeSBoYW5keTsgZm9yIHByb3Bl
ciB3cml0ZQo+PiBwcm90ZWN0aW9uIHlvdSdkIGFsd2F5cyBoYXZlIHRvIGhhdmUgdGhpcyBwYXJh
bWV0ZXIuCj4+IAo+PiBidHcuIEkgZG9uJ3Qgc2VlIGEgbmVlZCB0byBoYXZlIHRoaXMgb3B0aW9u
IHBlciBmbGFzaCwgYmVjYXVzZSBvbmNlCj4+IHRoZSB1c2VyIGFjdHVhbGx5IGVuYWJsZXMgaXQs
IGhlIGlzIGF3YXJlIHRoYXQgaXRzIGZvciBhbGwgb2YgaGlzCj4+IGZsYXNoZXMuIEkgaGF2ZW4n
dCBzZWVuIGZsYXNoZXMgd2hpY2ggaGFzIG5vbi12b2xhdGlsZSBwcm90ZWN0aW9uIGJpdHMKPj4g
X2FuZF8gYXJlIHByb3RlY3RlZCBieSBkZWZhdWx0LiBUaGVyZSBzaG91bGRuJ3QgYmUgYSBub3Rp
Y2FibGUKPj4gZGlmZmVyZW5jZSBmb3IgdGhlIHVzZXIgaWYgdGhlIG9wdGlvbiB3aGVuIGVuYWJs
ZWQuCj4+IAo+PiAtbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
