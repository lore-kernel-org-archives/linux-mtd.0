Return-Path: <SRS0=6ixN=3Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9138CC2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 14:36:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64DA020702
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Jan 2020 14:36:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pJNSPKyB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64DA020702
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCHJOjrtp/mrajb93dqs9pLRb4XjDo0TmScSJAcm3xM=; b=pJNSPKyBbJRbQo
	RKuwbKPBBZw66FNsqDHaQyPyJt5E64FZWgREKyVMfnuoY5CDuhZPJ8phej15XpVKuzf3RxhPwgDyC
	oE7qHlaBy5RHvJp/6QZw3j5E1ihvBBrLQyIyfQKgSKOs9JYcLlG+CjxIpwZpedmUjCzRmjHa50Tcq
	k5yIOSXNEvedvzhQ04+/R1MTil5ft+I/5Q90LsLUcPH8nKcpbnN5ZgM8EMqg3wGzmeITBDR2KLQF4
	5kWBk6r/mnYV1XoQjoof2MIr9JBaTfzTqIYA0S/VsvE6foQll1H+zKkhq593VVrjA6ZyO8ezxMYWc
	oqRDlGS7cr6661X4+QKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iw5Us-0004Td-Tb; Mon, 27 Jan 2020 14:36:14 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iw5Up-0004T6-Gv
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2020 14:36:13 +0000
X-Originating-IP: 90.76.211.102
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 588AC1BF204;
 Mon, 27 Jan 2020 14:36:00 +0000 (UTC)
Date: Mon, 27 Jan 2020 15:35:59 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: How to handle write-protect pin of NAND device ?
Message-ID: <20200127153559.60a83e76@xps13>
In-Reply-To: <CAK7LNAR0FemABUg5uN5fhy5LRsOm7n5GhmFVVHE8T57knDM9Ug@mail.gmail.com>
References: <CAK7LNAR0FemABUg5uN5fhy5LRsOm7n5GhmFVVHE8T57knDM9Ug@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200127_063611_696898_0FC94D97 
X-CRM114-Status: GOOD (  20.16  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90
ZSBvbiBNb24sIDI3IEphbiAyMDIwCjIxOjU1OjI1ICswOTAwOgoKPiBIaS4KPiAKPiBJIGhhdmUg
YSBxdWVzdGlvbiBhYm91dCB0aGUKPiBXUF9uIHBpbiBvZiBhIE5BTkQgY2hpcC4KPiAKPiAKPiBB
cyBmYXIgYXMgSSBzZWUsIHRoZSBOQU5EIGZyYW1ld29yayBkb2VzIG5vdAo+IGhhbmRsZSBpdC4K
ClRoZXJlIGlzIGEgbmFuZF9jaGVja193cCgpIHdoaWNoIHJlYWRzIHRoZSBzdGF0dXMgb2YgdGhl
IHBpbiBiZWZvcmUKZXJhc2luZy93cml0aW5nLgoKPiAKPiBJbnN0ZWFkLCBpdCBpcyBoYW5kbGVk
IGluIGEgZHJpdmVyIGxldmVsLgo+IEkgc2VlIHNvbWUgRFQtYmluZGluZ3MgdGhhdCBoYW5kbGUg
dGhlIFdQX24gcGluLgo+IAo+ICQgZ2l0IGdyZXAgd3AgLS0gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC8KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRk
L2JyY20sYnJjbW5hbmQudHh0Oi0KPiBicmNtLG5hbmQtaGFzLXdwICAgICAgICAgIDogU29tZSB2
ZXJzaW9ucyBvZiB0aGlzIElQIGluY2x1ZGUgYQo+IHdyaXRlLXByb3RlY3QKCkp1c3QgY2hlY2tl
ZDogYnJjbW5hbmQgZGUtYXNzZXJ0IFdQIHdoZW4gd3JpdGluZy9lcmFzaW5nIGFuZCBhc3NlcnRz
IGl0Cm90aGVyd2lzZS4gSU1ITyB0aGlzIHN3aXRjaGluZyBpcyB1c2VsZXNzLgoKPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsano0NzgwLW5hbmQudHh0Oi0K
PiB3cC1ncGlvczogR1BJTyBzcGVjaWZpZXIgZm9yIHRoZSB3cml0ZSBwcm90ZWN0IHBpbi4KPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL2luZ2VuaWMsano0NzgwLW5hbmQu
dHh0Ogo+ICAgICAgICAgIHdwLWdwaW9zID0gPCZncGYgMjIgR1BJT19BQ1RJVkVfTE9XPjsKPiBE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL252aWRpYS10ZWdyYTIwLW5hbmQu
dHh0Oi0KPiB3cC1ncGlvczogR1BJTyBzcGVjaWZpZXIgZm9yIHRoZSB3cml0ZSBwcm90ZWN0IHBp
bi4KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL252aWRpYS10ZWdyYTIw
LW5hbmQudHh0Ogo+ICAgICAgICAgIHdwLWdwaW9zID0gPCZncGlvIFRFR1JBX0dQSU8oUywgMCkg
R1BJT19BQ1RJVkVfTE9XPjsKCkluIGJvdGggY2FzZXMsIHRoZSBXUCBHUElPIGlzIHVudXNlZCBp
biB0aGUgY29kZSwganVzdCBkZS1hc3NlcnRlZCBhdApib290IHRpbWUgbGlrZSB3aGF0IHlvdSBk
byBpbiB0aGUgcGF0Y2ggYmVsb3cuCgo+IAo+IAo+IAo+IEkgd3JvdGUgYSBwYXRjaCB0byBhdm9p
ZCByZWFkLW9ubHkgaXNzdWUgaW4gc29tZSBjYXNlczoKPiBodHRwOi8vcGF0Y2h3b3JrLm96bGFi
cy5vcmcvcGF0Y2gvMTIyOTc0OS8KPiAKPiBHZW5lcmFsbHkgc3BlYWtpbmcsIHdlIGV4cGVjdCBO
QU5EIGRldmljZXMKPiBhcmUgd3JpdGFibGUgaW4gTGludXguIFNvLCBJIHRoaW5rIG15IHBhdGNo
IGlzIE9LLgoKSSB0aGluayB0aGUgcGF0Y2ggaXMgZmluZS4KCj4gCj4gCj4gSG93ZXZlciwgSSBh
c2tlZCB0aGlzIG15c2VsZjoKPiBJcyB0aGVyZSBhIHVzZWZ1bCBjYXNlIHRvIGFzc2VydCB0aGUg
d3JpdGUgcHJvdGVjdAo+IHBpbiBpbiBvcmRlciB0byBtYWtlIHRoZSBOQU5EIGNoaXAgcmVhbGx5
IHJlYWQtb25seT8KPiBGb3IgZXhhbXBsZSwgdGhlIHN5c3RlbSByZWNvdmVyeSBpbWFnZSBpcyBz
dG9yZWQgaW4KPiBhIHJlYWQtb25seSBkZXZpY2UsIGFuZCB0aGUgd3JpdGUtcHJvdGVjdCBwaW4g
aXMKPiBrZXB0IGFzc2VydGVkIHRvIGFzc3VyZSBub2JvZHkgYWNjaWRlbnRhbGx5IGNvcnJ1cHRz
IGl0LgoKSXQgaXMgdmVyeSBsaWtlbHkgdGhhdCB0aGUgc2FtZSBkZXZpY2UgaXMgdXNlZCBmb3Ig
Uk8gYW5kIFJXIHN0b3JhZ2Ugc28KaW4gbW9zdCBjYXNlcyB0aGlzIGlzIG5vdCBwb3NzaWJsZS4g
V2UgYWxyZWFkeSBoYXZlIHNxdWFzaGZzIHdoaWNoIGlzCmFjdHVhbGx5IHJlYWQtb25seSBhdCBm
aWxlc3lzdGVtIGxldmVsLCBJJ20gbm90IHN1cmUgaXQgaXMgbmVlZGVkIHRvCmVuZm9yY2UgdGhp
cyBhdCBhIGxvd2VyIGxldmVsLi4uIEFueXdheSBpZiB0aGVyZSBpcyBhY3R1YWxseSBhIHBpbiBm
b3IKdGhhdCwgb25lIG1pZ2h0IHdhbnQgdG8gaGFuZGxlIHRoZSBwaW4gZGlyZWN0bHkgYXMgYSBH
UElPLCB3aGF0IGRvIHlvdQp0aGluaz8KCj4gQnV0LCBJIGFtIG5vdCBzdXJlIGlmIGl0IHNob3Vs
ZCBiZSBoYW5kbGVkIGluIHRoZQo+IGZyYW1ld29yayBsZXZlbCB3aXRoIGEgbW9yZSBnZW5lcmlj
IERULWJpbmRpbmcuCj4gCj4gCj4gQ29tbWVudHMgYXJlIGFwcHJlY2lhdGVkLgo+IAo+IC0tCj4g
QmVzdCBSZWdhcmRzCj4gTWFzYWhpcm8gWWFtYWRhCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
