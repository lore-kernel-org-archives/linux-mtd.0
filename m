Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A0DC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 08:23:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D300561002
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 08:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D300561002
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUEgc70uA/OHc6GZUUocE+CjiSNs1LddPeBX4vieOJQ=; b=4OkbpUQ82VBXt8
	0hbQuwLpZnC5bNsTCQ9HBaxNg97hBil24FCLLx5bNATyop+xrAKOZaICDixIDYGUJYHvCLgEwk3Dk
	pxxU6BrndpPELPgtqqvWT4QalZDWEIh0IcWb/gjcTA3vII/kT/DzzMKfh4v6uinwVvx4k0qh17Dw7
	P+woRDEEIsCF0Ws9BrSWZmrCfJaFialLY3OofgH6RwI2S3Hj6isrjeTN+f4pWkumZBHKI15uBvHHJ
	MtVthgZ/KYPS6QZ/5XX9tIttN+4yfQ3O9XUmLOJeBsGdTarBYbZ+Oy8m6v7wEPHIC0X2CKBPVe0VI
	qGsxwuhGJjhfl16pVOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjzux-00FiNw-Ja; Mon, 08 Nov 2021 08:22:15 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjzut-00FiMX-Fs
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 08:22:13 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id A9D1624000A;
 Mon,  8 Nov 2021 08:22:06 +0000 (UTC)
Date: Mon, 8 Nov 2021 09:22:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Richard Weinberger
 <richard@nod.at>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] mtd: Changes for 5.16
Message-ID: <20211108092205.70b5775b@xps13>
In-Reply-To: <CAHk-=wiFoXSsfQwa8x_Ne0HYJtnLcpku67QiRn+q5tXrqiyBiA@mail.gmail.com>
References: <20211107174555.2d1a5eec@xps13>
 <CAHk-=wiFoXSsfQwa8x_Ne0HYJtnLcpku67QiRn+q5tXrqiyBiA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_002211_692266_33CC3B46 
X-CRM114-Status: GOOD (  18.08  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgp0b3J2YWxkc0BsaW51eC1mb3VuZGF0aW9uLm9yZyB3cm90ZSBvbiBTdW4sIDcg
Tm92IDIwMjEgMTE6MDU6MDIgLTA4MDA6Cgo+IE9uIFN1biwgTm92IDcsIDIwMjEgYXQgODo0NiBB
TSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4g
PiBUaGlzIGlzIHRoZSBNVEQgUFIgZm9yIDUuMTYuICAKPiAKPiBJIHdhbnQgX2V4cGxhbmF0aW9u
c18gZm9yIHdoYXQgSSdtIHB1bGxpbmcuCj4gCj4gWWVzLCBJIGNhbiBzZWUgaXQgYnkgbG9va2lu
ZyBhdCB0aGUgZGlmZnMgYW5kIHNob3J0bG9nLCBidXQgSSBzaG91bGRuJ3QgbmVlZCB0by4KPiAK
PiBJIHdhbnQgYSBzaG9ydCBibHVyYiBhYm91dCB3aGF0IHRoZSBwdWxsIGlzIGdldHRpbmcgbWUs
IGFuZCB3aHkgSQo+IHNob3VsZCBwdWxsIGl0LCBub3QganVzdCBhICJoZXJlJ3MgYSByYW5kb20g
cHVsbCIuCgpTb3JyeSBmb3IgdGhlIGVycm9yLCBhcyB5b3UgY2FuIHNlZSBpbiB0aGUgb3JpZ2lu
YWwgZS1tYWlsLCBJIGdlbmVyYXRlZAp0aGUgcHVsbCByZXF1ZXN0IGFnaW5zdCAnbXRkL25leHQn
ICh0aGUgYnJhbmNoIG5hbWUpLCBpbnN0ZWFkIG9mCidtdGQvZm9yLTUuMTYnLCB0aGUgc2lnbmVk
IHRhZyB3aXRoIHRoZSBiZWxvdyBkZXNjcmlwdGlvbiB3cml0dGVuIGZvcgp0aGUgb2NjYXNpb24u
IEkgYW0gZ29pbmcgdG8gcmVzZW5kIHRoZSBwdWxsLXJlcXVlc3Qgd2l0aCB0aGVzZSBtaXNzaW5n
CmJpdHMuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCkNvcmU6CiogUmVtb3ZlIG9ic29sZXRlIG1hY3JvcyBvbmx5IHVzZWQg
YnkgdGhlIG9sZCBuYW5kX2VjY2xheW91dCBzdHJ1Y3QKKiBEb24ndCByZW1vdmUgZGVidWdmcyBk
aXJlY3RvcnkgaWYgZGV2aWNlIGlzIGluIHVzZQoqIE1BSU5UQUlORVJTOgogIC0gQWRkIGVudHJ5
IGZvciBRdWFsY29tbSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVyCiAgLSBVcGRhdGUgdGhlIGRldmlj
ZXRyZWUgZG9jdW1lbnRhdGlvbiBwYXRoIG9mIGh5cGVyYnVzCgpNVEQgZGV2aWNlczoKKiBibG9j
azJtdGQ6CiAgLSBBZGQgc3VwcG9ydCBmb3IgYW4gb3B0aW9uYWwgY3VzdG9tIE1URCBsYWJlbAog
IC0gTWlub3IgcmVmYWN0b3IgdG8gYXZvaWQgaGFyZCBjb2RlZCBjb25zdGFudAoqIG10ZHN3YXA6
IFJlbW92ZSByZWR1bmRhbnQgYXNzaWdubWVudCBvZiBwb2ludGVyIGViCgpDRkk6CiogRml4dXAg
Q0ZJIG9uIGl4cDR4eAoKUmF3IE5BTkQgY29udHJvbGxlciBkcml2ZXJzOgoqIEFyYXNhbjoKICAt
IFByZXZlbnQgYW4gdW5zdXBwb3J0ZWQgY29uZmlndXJhdGlvbgoqIFh3YXksIFNvY3JhdGVzOiBw
bGF0X25hbmQsIFBhc2VtaSwgT3Jpb24sIG1wYzUxMjEsIEdQSU8sIEF1MTU1MG5kLCBBTVMtRGVs
dGE6CiAgLSBLZWVwIHRoZSBkcml2ZXIgY29tcGF0aWJsZSB3aXRoIG9uLWRpZSBFQ0MgZW5naW5l
cwoqIGNzNTUzeCwgbHBjMzJ4eF9zbGMsIG5kZmMsIHNoYXJwc2wsIHRtaW8sIHR4eDluZGZtYzoK
ICAtIFJldmVydCB0aGUgY29tbWl0czogIkZpeCBleHRlcm5hbCB1c2Ugb2YgU1cgSGFtbWluZyBF
Q0MgaGVscGVyIgogIC0gQW5kIGxldCBjYWxsZXJzIHVzZSB0aGUgYmFyZSBIYW1taW5nIGhlbHBl
cnMKKiBGc21jOiBGaXggdXNlIG9mIFNNIE9SREVSCiogSW50ZWw6CiAgLSBGaXggcG90ZW50aWFs
IGJ1ZmZlciBvdmVyZmxvdyBpbiBwcm9iZQoqIHh3YXksIHZmNjEwLCB0eHg5bmRmbSwgdGVncmEs
IHN0bTMyLCBwbGF0X25hbmQsIG94bmFzLCBvbWFwLCBtdGssIGhpc2k1MDQsCiAgZ3BtaSwgZ3Bp
bywgZGVuYWxpLCBiY202MzY4LCBhdG1lbDoKICAtIE1ha2UgdXNlIG9mIHRoZSBoZWxwZXIgZnVu
Y3Rpb24gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNleyxieW5hbWV9KCkKCk9uZW5hbmQg
ZHJpdmVyczoKKiBTYW1zdW5nOiBEcm9wIEV4eW5vczQgYW5kIGRlc2NyaWJlIGRyaXZlciBpbiBL
Q29uZmlnCgpSYXcgTkFORCBjaGlwIGRyaXZlcnM6CiogSHluaXg6IEFkZCBzdXBwb3J0IGZvciBI
MjdVQ0c4VDJFVFItQkMgTUxDIE5BTkQKClNQSSBOT1IgY29yZToKKiBBZGQgc3BpLW5vciBkZXZp
Y2UgdHJlZSBiaW5kaW5nIHVuZGVyIFNQSSBOT1IgbWFpbnRhaW5lcnMKClNQSSBOT1IgbWFudWZh
Y3R1cmVyIGRyaXZlcnM6CiogRW5hYmxlIGxvY2tpbmcgZm9yIG4yNXExMjhhMTMKClNQSSBOT1Ig
Y29udHJvbGxlciBkcml2ZXJzOgoqIFVzZSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2Vf
YnluYW1lKCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0KCj4gCj4gSSB3cm90ZSBteSBvd24gZXhwbGFuYXRpb24sIGFuZCB0
aGVuIGRlY2lkZWQgdGhhdCBubywgSSdtIG5vdCBnb2luZyB0bwo+IHB1bGwgYXQgYWxsIGJlY2F1
c2UgdGhlIHB1bGwgcmVxdWVzdCB3YXMgc28gYmFkIGFuZCBkZWZpY2llbnQuCgpJIGhvcGUgeW91
IHdpbGwgcmVjb25zaWRlciB0aGlzIHBvc2l0aW9uIHdoZW4gSSB3aWxsIHJlLXNlbmQgdGhlCmFj
dHVhbCBwdWxsIHJlcXVlc3Qgd2l0aCB0aGUgYWJvdmUgdGV4dCB3aGljaCB3YXMgbWlzc2luZy4K
ClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
