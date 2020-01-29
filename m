Return-Path: <SRS0=VDEF=3S=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD3CC2D0DB
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 13:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC7320716
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jan 2020 13:37:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B4J1TKbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC7320716
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4G0y8gpDT97ohgaVDCgDCWhP1aBjIgOUDEiHoK7uwk=; b=B4J1TKbV4loUUP
	EqjII1jAXNwK0SyQ++6gE5fZI1ee/S9bhcC4ltpulDwnOEYE9qBGxzsYj5PVmy60fqBLh2+WI4NZX
	bkcWTGXw8oIAJecDNPYqP/8xsgIAC1QikPwpxmj3NfKBTiiywpql1LPqYpvGqJEMETz8kCl8Hj3pp
	R8iegWdMsfGwenz7HijwcSiIomh865s+rH5R5N2gLWPqPBDW6M8Tzxg/hpf76+SmTbCX9sn3ZIHdd
	kvRbKkoBFtkFUWWcob4gWtF5e44d+zdXSwqNAwQHUFC70tJWX5zwwqkO3FhAS3EG/S13ytLUPn3J9
	N0BxQw/d+gM/Oqv2ntIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwnWd-0002BE-CD; Wed, 29 Jan 2020 13:36:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwnWY-0002AG-Gv
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2020 13:36:57 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 04BF160002;
 Wed, 29 Jan 2020 13:36:39 +0000 (UTC)
Date: Wed, 29 Jan 2020 14:36:39 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: How to handle write-protect pin of NAND device ?
Message-ID: <20200129143639.7f80addb@xps13>
In-Reply-To: <CAK7LNAQyK+jy4pm5M5z58uD5Zdv95Day6C6D3Gwvpv2C4Vh53Q@mail.gmail.com>
References: <CAK7LNAR0FemABUg5uN5fhy5LRsOm7n5GhmFVVHE8T57knDM9Ug@mail.gmail.com>
 <20200127153559.60a83e76@xps13>
 <20200127164554.34a21177@collabora.com>
 <20200127164755.29183962@xps13>
 <20200128075833.129902f6@collabora.com>
 <CAK7LNAQyK+jy4pm5M5z58uD5Zdv95Day6C6D3Gwvpv2C4Vh53Q@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_053654_836942_6D4B9725 
X-CRM114-Status: GOOD (  32.19  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZSBvbiBX
ZWQsIDI5IEphbiAyMDIwCjE5OjA2OjQ2ICswOTAwOgoKPiBPbiBUdWUsIEphbiAyOCwgMjAyMCBh
dCAzOjU4IFBNIEJvcmlzIEJyZXppbGxvbgo+IDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNv
bT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCAyNyBKYW4gMjAyMCAxNjo0Nzo1NSArMDEwMAo+ID4g
TWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6Cj4gPiAgCj4g
PiA+IEhpIEhlbGxvLAo+ID4gPgo+ID4gPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxv
bkBjb2xsYWJvcmEuY29tPiB3cm90ZSBvbiBNb24sIDI3IEphbgo+ID4gPiAyMDIwIDE2OjQ1OjU0
ICswMTAwOgo+ID4gPiAgCj4gPiA+ID4gT24gTW9uLCAyNyBKYW4gMjAyMCAxNTozNTo1OSArMDEw
MAo+ID4gPiA+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+IHdyb3Rl
Ogo+ID4gPiA+ICAKPiA+ID4gPiA+IEhpIE1hc2FoaXJvLAo+ID4gPiA+ID4KPiA+ID4gPiA+IE1h
c2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlIG9uIE1vbiwgMjcgSmFu
IDIwMjAKPiA+ID4gPiA+IDIxOjU1OjI1ICswOTAwOgo+ID4gPiA+ID4gIAo+ID4gPiA+ID4gPiBI
aS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhlCj4g
PiA+ID4gPiA+IFdQX24gcGluIG9mIGEgTkFORCBjaGlwLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiBBcyBmYXIgYXMgSSBzZWUsIHRoZSBOQU5EIGZyYW1ld29yayBkb2VzIG5v
dAo+ID4gPiA+ID4gPiBoYW5kbGUgaXQuICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGVyZSBpcyBh
IG5hbmRfY2hlY2tfd3AoKSB3aGljaCByZWFkcyB0aGUgc3RhdHVzIG9mIHRoZSBwaW4gYmVmb3Jl
Cj4gPiA+ID4gPiBlcmFzaW5nL3dyaXRpbmcuCj4gPiA+ID4gPiAgCj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IEluc3RlYWQsIGl0IGlzIGhhbmRsZWQgaW4gYSBkcml2ZXIgbGV2ZWwuCj4gPiA+ID4g
PiA+IEkgc2VlIHNvbWUgRFQtYmluZGluZ3MgdGhhdCBoYW5kbGUgdGhlIFdQX24gcGluLgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiAkIGdpdCBncmVwIHdwIC0tIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tdGQvCj4gPiA+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tdGQvYnJjbSxicmNtbmFuZC50eHQ6LQo+ID4gPiA+ID4gPiBicmNtLG5hbmQtaGFz
LXdwICAgICAgICAgIDogU29tZSB2ZXJzaW9ucyBvZiB0aGlzIElQIGluY2x1ZGUgYQo+ID4gPiA+
ID4gPiB3cml0ZS1wcm90ZWN0ICAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBKdXN0IGNoZWNrZWQ6IGJy
Y21uYW5kIGRlLWFzc2VydCBXUCB3aGVuIHdyaXRpbmcvZXJhc2luZyBhbmQgYXNzZXJ0cyBpdAo+
ID4gPiA+ID4gb3RoZXJ3aXNlLiBJTUhPIHRoaXMgc3dpdGNoaW5nIGlzIHVzZWxlc3MuCj4gPiA+
ID4gPiAgCj4gPiA+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
aW5nZW5pYyxqejQ3ODAtbmFuZC50eHQ6LQo+ID4gPiA+ID4gPiB3cC1ncGlvczogR1BJTyBzcGVj
aWZpZXIgZm9yIHRoZSB3cml0ZSBwcm90ZWN0IHBpbi4KPiA+ID4gPiA+ID4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9pbmdlbmljLGp6NDc4MC1uYW5kLnR4dDoKPiA+ID4g
PiA+ID4gICAgICAgICAgd3AtZ3Bpb3MgPSA8JmdwZiAyMiBHUElPX0FDVElWRV9MT1c+Owo+ID4g
PiA+ID4gPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL252aWRpYS10ZWdy
YTIwLW5hbmQudHh0Oi0KPiA+ID4gPiA+ID4gd3AtZ3Bpb3M6IEdQSU8gc3BlY2lmaWVyIGZvciB0
aGUgd3JpdGUgcHJvdGVjdCBwaW4uCj4gPiA+ID4gPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tdGQvbnZpZGlhLXRlZ3JhMjAtbmFuZC50eHQ6Cj4gPiA+ID4gPiA+ICAgICAg
ICAgIHdwLWdwaW9zID0gPCZncGlvIFRFR1JBX0dQSU8oUywgMCkgR1BJT19BQ1RJVkVfTE9XPjsg
IAo+ID4gPiA+ID4KPiA+ID4gPiA+IEluIGJvdGggY2FzZXMsIHRoZSBXUCBHUElPIGlzIHVudXNl
ZCBpbiB0aGUgY29kZSwganVzdCBkZS1hc3NlcnRlZCBhdAo+ID4gPiA+ID4gYm9vdCB0aW1lIGxp
a2Ugd2hhdCB5b3UgZG8gaW4gdGhlIHBhdGNoIGJlbG93Lgo+ID4gPiA+ID4gIAo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBJIHdyb3RlIGEgcGF0Y2ggdG8g
YXZvaWQgcmVhZC1vbmx5IGlzc3VlIGluIHNvbWUgY2FzZXM6Cj4gPiA+ID4gPiA+IGh0dHA6Ly9w
YXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMjI5NzQ5Lwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBHZW5lcmFsbHkgc3BlYWtpbmcsIHdlIGV4cGVjdCBOQU5EIGRldmljZXMKPiA+ID4gPiA+ID4g
YXJlIHdyaXRhYmxlIGluIExpbnV4LiBTbywgSSB0aGluayBteSBwYXRjaCBpcyBPSy4gIAo+ID4g
PiA+ID4KPiA+ID4gPiA+IEkgdGhpbmsgdGhlIHBhdGNoIGlzIGZpbmUuCj4gPiA+ID4gPiAgCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhvd2V2ZXIsIEkgYXNrZWQgdGhpcyBt
eXNlbGY6Cj4gPiA+ID4gPiA+IElzIHRoZXJlIGEgdXNlZnVsIGNhc2UgdG8gYXNzZXJ0IHRoZSB3
cml0ZSBwcm90ZWN0Cj4gPiA+ID4gPiA+IHBpbiBpbiBvcmRlciB0byBtYWtlIHRoZSBOQU5EIGNo
aXAgcmVhbGx5IHJlYWQtb25seT8KPiA+ID4gPiA+ID4gRm9yIGV4YW1wbGUsIHRoZSBzeXN0ZW0g
cmVjb3ZlcnkgaW1hZ2UgaXMgc3RvcmVkIGluCj4gPiA+ID4gPiA+IGEgcmVhZC1vbmx5IGRldmlj
ZSwgYW5kIHRoZSB3cml0ZS1wcm90ZWN0IHBpbiBpcwo+ID4gPiA+ID4gPiBrZXB0IGFzc2VydGVk
IHRvIGFzc3VyZSBub2JvZHkgYWNjaWRlbnRhbGx5IGNvcnJ1cHRzIGl0LiAgCj4gPiA+ID4gPgo+
ID4gPiA+ID4gSXQgaXMgdmVyeSBsaWtlbHkgdGhhdCB0aGUgc2FtZSBkZXZpY2UgaXMgdXNlZCBm
b3IgUk8gYW5kIFJXIHN0b3JhZ2Ugc28KPiA+ID4gPiA+IGluIG1vc3QgY2FzZXMgdGhpcyBpcyBu
b3QgcG9zc2libGUuIFdlIGFscmVhZHkgaGF2ZSBzcXVhc2hmcyB3aGljaCBpcwo+ID4gPiA+ID4g
YWN0dWFsbHkgcmVhZC1vbmx5IGF0IGZpbGVzeXN0ZW0gbGV2ZWwsIEknbSBub3Qgc3VyZSBpdCBp
cyBuZWVkZWQgdG8KPiA+ID4gPiA+IGVuZm9yY2UgdGhpcyBhdCBhIGxvd2VyIGxldmVsLi4uIEFu
eXdheSBpZiB0aGVyZSBpcyBhY3R1YWxseSBhIHBpbiBmb3IKPiA+ID4gPiA+IHRoYXQsIG9uZSBt
aWdodCB3YW50IHRvIGhhbmRsZSB0aGUgcGluIGRpcmVjdGx5IGFzIGEgR1BJTywgd2hhdCBkbyB5
b3UKPiA+ID4gPiA+IHRoaW5rPyAgCj4gPiA+ID4KPiA+ID4gPiBGV0lXLCBJJ3ZlIGFsd2F5cyBj
b25zaWRlcmVkIHRoZSBXUCBwaW4gYXMgYSB3YXkgdG8gcHJvdGVjdCBhZ2FpbnN0Cj4gPiA+ID4g
c3B1cmlvdXMgZGVzdHJ1Y3RpdmUgY29tbWFuZCBlbWlzc2lvbiwgd2hpY2ggaXMgbW9zdCBsaWtl
bHkgdG8gaGFwcGVuCj4gPiA+ID4gZHVyaW5nIHRyYW5zaXRpb24gcGhhc2VzIChib290bG9hZGVy
IC0+IGxpbnV4LCBsaW51eCAtPiBrZXhlY2VkLWxpbnV4LAo+ID4gPiA+IHBsYXRmb3JtIHJlc2V0
LCAuLi4sIG9yIGFueSBvdGhlciB0cmFuc2l0aW9uIHdoZXJlIHRoZSBwaW4gc3RhdGUgbWlnaHQK
PiA+ID4gPiBiZSB1bmRlZmluZWQgYXQgc29tZSBwb2ludCkuIFRoaXMgYmVpbmcgc2FpZCwgaWYg
eW91J3JlIHdvcnJpZWQgYWJvdXQKPiA+ID4gPiBvdGhlciBzb3VyY2VzIG9mIHNwdXJpb3VzIGNt
ZHMgKHNheSB5b3VyIGJ1cyBpcyBzaGFyZWQgYmV0d2Vlbgo+ID4gPiA+IGRpZmZlcmVudCBraW5k
IG9mIG1lbW9yeSBkZXZpY2VzLCBhbmQgdGhlIENTIHBpbiBpcyB1bnJlbGlhYmxlKSwgeW91Cj4g
PiA+ID4gbWlnaHQgd2FudCB0byBsZWF2ZSB0aGUgTkFORCBpbiBhIHdyaXRlLXByb3RlY3RlZCBz
dGF0ZSBkZS1hc3NlcnRpbmcgV1AKPiA+ID4gPiBvbmx5IHdoZW4gZXhwbGljaXRseSBpc3N1aW5n
IGEgZGVzdHJ1Y3RpdmUgY29tbWFuZCAocHJvZ3JhbSBwYWdlLCBlcmFzZQo+ID4gPiA+IGJsb2Nr
KS4gIAo+ID4gPgo+ID4gPiBPayBzbyB3aXRoIHRoaXMgaW4gbWluZCwgb25seSB0aGUgYnJjbW5h
bmQgZHJpdmVyIGRvZXMgYSB1c2VmdWwgdXNlIG9mCj4gPiA+IHRoZSBXUCBvdXRwdXQuICAKPiA+
Cj4gPiBXZWxsLCBJJ2QganVzdCBzYXkgdGhhdCBicmNtbmFuZCBpcyBtb3JlIHBhcmFub2lkLCB3
aGljaCBpcyBhIGdvb2QKPiA+IHRoaW5nIEkgZ3Vlc3MsIGJ1dCB0aGF0IGRvZXNuJ3QgbWFrZSBv
dGhlciBzb2x1dGlvbnMgdXNlbGVzcywganVzdCBsZXNzCj4gPiBzYWZlLiBXZSBjb3VsZCBwcm9i
YWJseSBmbGFnIG9wZXJhdGlvbnMgYXMgJ2Rlc3RydWN0aXZlJyBhdCB0aGUKPiA+IG5hbmRfb3Bl
cmF0aW9uIGxldmVsLCBzbyBkcml2ZXJzIGNhbiBhc3NlcnQvZGUtYXNzZXJ0IHRoZSBwaW4gb24g
YQo+ID4gcGVyLW9wZXJhdGlvbiBiYXNpcy4gIAo+IAo+IFNvdW5kcyBhIGdvb2QgaWRlYS4KPiAK
PiBJZiBpdCBpcyBzdXBwb3J0ZWQgaW4gdGhlIE5BTkQgZnJhbWV3b3JrLAo+IEkgd2lsbCBiZSBo
YXBweSB0byBpbXBsZW1lbnQgaW4gdGhlIERlbmFsaSBOQU5EIGRyaXZlci4KPiAKClRoZXJlIGlz
IGN1cnJlbnRseSBubyBzdWNoIHRoaW5nIGF0IE5BTkQgbGV2ZWwgYnV0IEkgZG91YnQgdGhlcmUg
aXMKbW9yZSB0aGFuIGVyYXNlIGFuZCB3cml0ZSBvcGVyYXRpb24gZHVyaW5nIHdoaWNoIGl0IHdv
dWxkIGJlIG5lZWRlZAp0byBhc3NlcnQvZGVhc3NlcnQgV1AuIEkgZG9uJ3Qgc2VlIHdoeSBoYXZp
bmcgdGhpcyBmbGFnIHdvdWxkIGhlbHAKdGhlIGNvbnRyb2xsZXIgZHJpdmVycz8KClRoYW5rcywK
TWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
