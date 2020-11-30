Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87183C5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 08:05:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4C0B20709
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 08:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VzsXMDXd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4C0B20709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K3fGfo1pYbmZO1XvkHcJvxao17huomSNmkUa/84lxxg=; b=VzsXMDXdJwufU3teN+y/BYCGF
	eeOZaENakD61hMFRo02ikO9/GKiN7xRDRDluABolOmcxrgIWxdq54PqEUpiFljLLsmDdAO+uyb/3l
	usUfOG5sXPacGrZ0M6Tz/uRW/avgm68ic8ididqzYwEC59IWhLJXVJSh1Oz+W0tiTvlvrDsF5lqlP
	xGNdWcam0+dFCBDZ2GKix9WHlichx6wuF/X/hJ8D9xUCfc7havBLsUpsJ8uZr93rfgxBDOfh2H8nQ
	968Enz5hTwcrOFwYGs4btkH+zD3qhDmA6ZypDdnDogLGFJURVMRlB6D65PBgj/z7Aumdi/iwxXcir
	V+GdU58xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjeAb-0007NP-W6; Mon, 30 Nov 2020 08:04:26 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjeAY-0007My-9L
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 08:04:23 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id A328E240005;
 Mon, 30 Nov 2020 08:04:14 +0000 (UTC)
Date: Mon, 30 Nov 2020 09:04:12 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH 17/19] mtd: rawnand: r852: Move the ECC initialization
 to ->attach_chip()
Message-ID: <20201130090412.5fac23d3@xps13>
In-Reply-To: <20201130010755.GA1956350@ubuntu-m3-large-x86>
References: <20201113123424.32233-1-miquel.raynal@bootlin.com>
 <20201113123424.32233-18-miquel.raynal@bootlin.com>
 <20201130010755.GA1956350@ubuntu-m3-large-x86>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_030422_444256_05BD36DC 
X-CRM114-Status: GOOD (  19.14  )
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
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTmF0aGFuLAoKTmF0aGFuIENoYW5jZWxsb3IgPG5hdGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4g
d3JvdGUgb24gU3VuLCAyOSBOb3YgMjAyMAoxODowNzo1NSAtMDcwMDoKCj4gT24gRnJpLCBOb3Yg
MTMsIDIwMjAgYXQgMDE6MzQ6MjJQTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFRo
ZSBwcm9iZSBmdW5jdGlvbiBpcyBvbmx5IHN1cHBvc2VkIHRvIGluaXRpYWxpemUgdGhlIGNvbnRy
b2xsZXIKPiA+IGhhcmR3YXJlIGJ1dCBub3QgdGhlIEVDQyBlbmdpbmUuIEluZGVlZCwgd2UgZG9u
J3Qga25vdyBhbnl0aGluZyBhYm91dAo+ID4gdGhlIE5BTkQgY2hpcChzKSBhdCB0aGlzIHN0YWdl
LiBMZXQncyBtb3ZlIHRoZSBsb2dpYyBpbml0aWFsaXppbmcgdGhlCj4gPiBFQ0MgZW5naW5lLCBl
dmVuIHByZXR0eSBzaW1wbGUsIHRvIHRoZSAtPmF0dGFjaF9jaGlwKCkgaG9vayB3aGljaCBnZXRz
Cj4gPiBjYWxsZWQgZHVyaW5nIG5hbmRfc2NhbigpIHJvdXRpbmUsIGFmdGVyIHRoZSBOQU5EIGNo
aXAgZGlzY292ZXJ5LiBBcwo+ID4gdGhlIHByZXZpb3VzbHkgbWVudGlvbmVkIGxvZ2ljIGlzIHN1
cHBvc2VkIHRvIHBhcnNlIHRoZSBEVCBmb3IgdXMsIGl0Cj4gPiBpcyBsaWtlbHkgdGhhdCB0aGUg
Y2hpcC0+ZWNjLiogZW50cmllcyBiZSBvdmVyd3JpdHRlbi4gU28gbGV0J3MgYXZvaWQKPiA+IHRo
aXMgYnkgbW92aW5nIHRoZXNlIGxpbmVzIHRvIC0+YXR0YWNoX2NoaXAoKS4KPiA+IAo+ID4gRml4
ZXM6IGQ3MTU3ZmY0OWE1YiAoIm10ZDogcmF3bmFuZDogVXNlIHRoZSBFQ0MgZnJhbWV3b3JrIHVz
ZXIgaW5wdXQgcGFyc2luZyBiaXRzIikKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiBDYzogTWF4aW0gTGV2aXRza3kgPG1heGlt
bGV2aXRza3lAZ21haWwuY29tPiAgCj4gCj4gSnVzdCBhcyBhIGhlYWRzIHVwLCB0aGlzIHBhdGNo
IHdhcyBhcHBsaWVkIHRvIG10ZC9maXhlcyBhcwo+IGNvbW1pdCA3ZWY5NjlhMDQyMjggKCJtdGQ6
IHJhd25hbmQ6IHI4NTI6IE1vdmUgdGhlIEVDQwo+IGluaXRpYWxpemF0aW9uIHRvIC0+YXR0YWNo
X2NoaXAoKSIpIGJ1dCBpdCBhcHBlYXJzIHRvIGFsc28gYmUgYXBwbGllZCB0bwo+IG5hbmQvbmV4
dCBhcyBjb21taXQgMGMyYjY5ZjU1MTMyICgibXRkOiByYXduYW5kOiByODUyOiBNb3ZlIHRoZSBF
Q0MKPiBpbml0aWFsaXphdGlvbiB0byAtPmF0dGFjaF9jaGlwKCkiKSwgd2hlcmUgZHVlIHRvIGl0
cyBtaXNtZXJnZWQgbmF0dXJlLAo+IGl0IGNhdXNlcyBhIGNsYW5nIHdhcm5pbmc6Cj4gCj4gLi4v
ZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jOjg3NDoyNDogd2FybmluZzogdmFyaWFibGUgJ2Rl
dicgaXMgdW5pbml0aWFsaXplZCB3aGVuIHVzZWQgaGVyZSBbLVd1bmluaXRpYWxpemVkXQo+ICAg
ICAgICAgbmFuZF9jb250cm9sbGVyX2luaXQoJmRldi0+Y29udHJvbGxlcik7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXn5+Cj4gLi4vZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5j
Ojg0NzoyNTogbm90ZTogaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ2RldicgdG8gc2lsZW5jZSB0
aGlzIHdhcm5pbmcKPiAgICAgICAgIHN0cnVjdCByODUyX2RldmljZSAqZGV2Owo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA9IE5VTEwKPiAxIHdhcm5pbmcgZ2VuZXJhdGVkLgo+IAo+IENoZWVycywKPiBOYXRoYW4gQ2hh
bmNlbGxvcgoKQWJzb2x1dGVseSwgdGhpcyBmaXggY2FtZSBsYXRlLCBuYW5kL25leHQgd2FzIGFs
cmVhZHkgc2V0IHVwIGFuZCB0aGVyZQp3YXMgY29uZmxpY3RzIGJldHdlZW4gdGhlIHR3by4gSSBh
cHBsaWVkIHRoZXNlIHNhbWUgcGF0Y2hlcyBhdCB0aGUgcm9vdApvZiBuYW5kL25leHQgdG8gYmUg
c3VyZSB0aGUgYnJhbmNoIHdvdWxkIHN0aWxsIGJlIHZhbGlkIHVudGlsIHRoZSBuZXh0Ci1yYyB3
b3VsZCBjb21lIG91dCAodG9kYXkpLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
