Return-Path: <SRS0=bx7I=26=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA94DC282DD
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB67420678
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2020 19:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lV7nomrE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB67420678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSITpKcg/bLLMM5YiDbmsRUuA0Vrf+8c6cgDtWYscMM=; b=lV7nomrEPaXdWV
	DlUIRhturdQJlG0eAUHVY8xK9ZGM3UML8sDWlixndob1b0lELdRIUTu8v092Uwr2wG/A9CrPyss5H
	73Ml3lPx0v00j2Y2KycRYSUzgAq6q6F0H+YAX2oEC8LEjzMO/u3T2aTg8eKN2LgbtHirqS/zBJ27e
	cX4XGOFNuk9PiuOjxxrEX2yXk+FSPo8ColS3XadgVYDm66aV79g3Kf5JamZegkAMHCNVzUcPF7mLX
	10jA19FQk3bQjU+dx9ORs0/rWK7tC3cMdq/dcAXlVxh1wGdA70oaeKOJnqKUvtJ3ujbXppI1q/tVa
	m9L+O99+GaJ3xZm0fdew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipdPZ-0005gj-Bp; Thu, 09 Jan 2020 19:24:05 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipdPW-0005gE-Gt
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2020 19:24:03 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 3BCD9200004;
 Thu,  9 Jan 2020 19:24:00 +0000 (UTC)
Date: Thu, 9 Jan 2020 20:23:58 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: implement proper partition handling
Message-ID: <20200109202358.2a428a8d@xps13>
In-Reply-To: <20200109201355.707c5b0d@collabora.com>
References: <20191230111948.27005-1-miquel.raynal@bootlin.com>
 <1651325521.16954.1578526458487.JavaMail.zimbra@nod.at>
 <20200109191304.636c82e7@xps13>
 <1737779363.17836.1578595384783.JavaMail.zimbra@nod.at>
 <20200109194556.34cf67dc@xps13>
 <20200109201355.707c5b0d@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_112402_698506_40E48FEE 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29t
PiB3cm90ZSBvbiBUaHUsIDkgSmFuCjIwMjAgMjA6MTM6NTUgKzAxMDA6Cgo+IE9uIFRodSwgOSBK
YW4gMjAyMCAxOTo0NTo1NiArMDEwMAo+IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+IAo+ID4gSGkgUmljaGFyZCwKPiA+IAo+ID4gUmljaGFyZCBXZWlu
YmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4gd3JvdGUgb24gVGh1LCA5IEphbiAyMDIwIDE5OjQzOjA0
Cj4gPiArMDEwMCAoQ0VUKToKPiA+ICAgCj4gPiA+IE1pcXVlbCwKPiA+ID4gCj4gPiA+IC0tLS0t
IFVyc3Byw7xuZ2xpY2hlIE1haWwgLS0tLS0gICAgCj4gPiA+ID4+IFdoYXQgcHJvYmxlbSBkb2Vz
IHRoaXMgc29sdmU/Cj4gPiA+ID4+IC4uLmJlc2lkZSBvZiBhIG5pY2UgZGlmZnN0YXQgd2hpY2gg
cmVtb3ZlcyBtb3JlIHRoYW4gaXQgYWRkcy4gOi0pICAgICAgCj4gPiA+ID4gCj4gPiA+ID4gSXQg
aXMgbXVjaCBlYXNpZXIgdG8gZXNjYWxhZGUgdG8gdGhlIHRvcCBtb3N0ICJtYXN0ZXIiIGRldmlj
ZSB3aGVuCj4gPiA+ID4gdGhlcmUgYXJlIG11bHRpcGxlIGxldmVscyBvZiBwYXJ0aXRpb25pbmcs
IHdoaWNoIHdhcyBub3QgY2xlYW5seQo+ID4gPiA+IGRlc2NyaWJlZCBJTUhPLiBBbHNvIGl0IGlz
IGFscmVhZHkgdXNlZCBpbiB0aGUgTUxDLWluLXBzZXVkby1TTEMtbW9kZQo+ID4gPiA+IHNlcmll
cyA6KSAgICAgIAo+ID4gPiAKPiA+ID4gT2suIEluIGZhY3QgSSAiZm91bmQiIHRoaXMgcGF0Y2gg
bXkgbG9va2luZyBhdCB0aGUgU0xDIGVtdWxhdGlvbiBwYXRjaGVzLgo+ID4gPiAgICAgCj4gPiA+
ID4+ID4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IG10ZF9pbmZvICptdGRfZ2V0X21hc3RlcihzdHJ1
Y3QgbXRkX2luZm8gKm10ZCkKPiA+ID4gPj4gPiArewo+ID4gPiA+PiA+ICsJd2hpbGUgKG10ZC0+
cGFyZW50KQo+ID4gPiA+PiA+ICsJCW10ZCA9IG10ZC0+cGFyZW50Owo+ID4gPiA+PiA+ICsKPiA+
ID4gPj4gPiArCXJldHVybiBtdGQ7Cj4gPiA+ID4+ID4gK30gICAgICAKPiA+ID4gPj4gCj4gPiA+
ID4+IFNvLCBwYXJlbnQgPT0gbWFzdGVyPyAgICAgIAo+ID4gPiA+IAo+ID4gPiA+IHRvcCBtb3N0
IHBhcmVudCAodGhlIG9uZSB3aXRob3V0IHBhcmVudCkgPT0gbWFzdGVyICEKPiA+ID4gPiAgICAg
ICAKPiA+ID4gPj4gCj4gPiA+ID4+IFdoZW4gSSBjcmVhdGUgYSBNVEQgb250b3Agb2YgVUJJIHVz
aW5nIGdsdWViaSwgd2hvIHdpbGwgYmUgcGFyZW50L21hc3Rlcj8gICAgICAKPiA+ID4gPiAKPiA+
ID4gPiBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHRoZSBpc3N1ZSBoZXJlPyAgICAgIAo+ID4g
PiAKPiA+ID4gTGV0J3Mgc2F5IEkgaGF2ZSBtdGQwIHdpdGggYW4gdWJpIGFuZCBhIHZvbHVtZSAi
eHh4Ii4gQWZ0ZXIgZW5hYmxpbmcKPiA+ID4gZ2x1ZWJpIGEgbmV3IG10ZDEgd2lsbCBhcnJpdmUg
b24gdGhlIHN5c3RlbS4KPiA+ID4gVGhlIHN0YWNraW5nIGlzIG10ZDAgLT4gdWJpICh2b2x1bWUg
eHh4KSAtPiBtdGQxLiAgICAKPiA+IAo+ID4gVGhpcyBpcyBtdWNoIGNsZWFyZXIsIHRoYW5rcyEK
PiA+ICAgCj4gPiA+IElzIG5vdyBhIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIG10ZDEgYW5kIG10ZDA/
ICAgIAo+ID4gCj4gPiBObyB0aGVyZSBpcyBub25lLiAKPiA+ICAgCj4gPiA+IEknZCBleHBlY3Qg
bXRkMSdzIHBhcmVudCBiZWluZyBtdGQwLiAgICAKPiA+IAo+ID4gVGhpcyB3b3VsZCBiZSBhIG5l
dyBmZWF0dXJlLCByaWdodD8gSSBkb24ndCB0aGluayBpdCBpcyB0aGUgY2FzZSB0b2RheS4gIAo+
IAo+IFdlIGRlZmluaXRlbHkgZG9uJ3Qgd2FudCBtdGQxIHRvIGFwcGVhciBhcyBhIHBhcnRpdGlv
biBvZiBtdGQwIGluIHRoYXQKPiBjYXNlIChibG9ja3MgaW4gbXRkMSBjYW4ndCBiZSBtYXBwZWQg
dG8gYmxvY2tzIGluIG10ZDAgd2l0aG91dCB0aGUgVUJJCj4gbGF5ZXIgYmVpbmcgaW52b2x2ZWQp
LiBNYXliZSBpdCdkIGJlIGNsZWFyZXIgaWYgd2UgbW92ZSB0aGUgcGFyZW50Cj4gZmllbGQgdG8g
bXRkX3BhcnQgYW5kIGFkZCBhbiBNVERfSVNfUEFSVElUSU9OIGZsYWcuIE9yIG1heWJlIHdlIGNh
bgo+IGp1c3QgY2hvb3NlIGEgYmV0dGVyIG5hbWUuCgpJIHByZWZlciB0aGUgbmFtZSBjaGFuZ2Uu
IEkgdGhpbmsgdGhlIGN1cnJlbnQgc3RydWN0IG9yZ2FuaXphdGlvbgppcyByaWdodC4gV2hhdCBk
byB5b3Ugc3VnZ2VzdD8KCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
