Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F37DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28E1C60F41
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 06:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 28E1C60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6wP8UkE4ZyOp+Yf/cC+vsu98YcJIKqO0jtxSYKdQps=; b=otYTpx3cSon5o8
	hnx47O1CfqjV1ZX0MOAY0XwTCi+cCSbsUi3unqAfnS0OfzEgqymQqLa/D9DAWk87xmVfh1Zxfh5WN
	r6bTxpehfaN1PXxZFm+AoDwwyTYCE4YJrL5w02jqg9kv6QIjzkJ8wsU4GB2DF9Uu2e/iGoxlyZqUN
	jyqB8R4uIqTWidS80HPn8VR5k1efAJdNXmtfp0f4eASGqay/BMLwbgSL8d/1+AhkXT19Xdtjeqnzf
	KNEhy45Rd41AIpU870F4XNrxI2TT/wwv1hL5CwxaaJR0jYntWzMRXCA9if7EhloTJ3M+18XpG1UQs
	HwLUCjq6UpRiF45O+P6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbH6R-005c2C-1p; Fri, 15 Oct 2021 06:54:03 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbH6N-005c1L-Cu
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 06:54:01 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C40431BF20C;
 Fri, 15 Oct 2021 06:53:55 +0000 (UTC)
Date: Fri, 15 Oct 2021 08:53:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: hch <hch@lst.de>
Cc: Richard Weinberger <richard@nod.at>, joern@lazybastard.org, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd/block2mtd: don't poke into block layer internals
Message-ID: <20211015085354.5f841f64@xps13>
In-Reply-To: <20211015062809.GA29769@lst.de>
References: <20211014145206.1488967-1-hch@lst.de>
 <20211014145206.1488967-2-hch@lst.de>
 <1862961222.73085.1634239699925.JavaMail.zimbra@nod.at>
 <20211015062809.GA29769@lst.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_235359_612873_33C89E6D 
X-CRM114-Status: GOOD (  23.57  )
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

SGkgUmljaGFyZCwKCmhjaEBsc3QuZGUgd3JvdGUgb24gRnJpLCAxNSBPY3QgMjAyMSAwODoyODow
OSArMDIwMDoKCj4gT24gVGh1LCBPY3QgMTQsIDIwMjEgYXQgMDk6Mjg6MTlQTSArMDIwMCwgUmlj
aGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+ID4gPiBpbnN0ZWFkLiAgTm90ZSB0aGF0IHRoaXMgY29u
dGFpbnMgYSBzbWFsbCBiZWhhdmlvciBjaGFuZ2UgaW4gdGhhdCBlcmFzZQo+ID4gPiBub3cgdW5j
b25kaXRpb25hbGx5IHdyaXRlcyBhbGwgRnMgaW5zdGVhZCBvZiBmaXJzdCBzY2FubmluZyBmb3Ig
dGhlbS4gIAo+ID4gCj4gPiBVbmxlc3MgeW91IGhhdmUgYSBzdHJvbmcgb3Bpbm9pbiBJJ2QgbGlr
ZSB0byBrZWVwIHRoZSBzY2FubmluZy4KPiA+IFRoZSBvcmlnaW5hbCB1c2UgY2FzZSBvZiBibG9j
azJtdGQgaXMgdXNpbmcgQ29tcGFjdCBGbGFzaCAoQVRBKQo+ID4gYXMgTVRELiBTb21lIG9mIHRo
aXMgZGV2aWNlcyBhcmUgc3VwZXIgc3R1cGlkIGFuZCBJIGZlYXIgdGhlIDB4RkYgc2Nhbm5pbmcK
PiA+IGlzIGhlcmUgdG8gYXZvaWQgcHJvZ3JhbW1pbmcgMHhGRiBieXRlcyBpbnRvIHRoZSBOQU5E
Lgo+ID4gSnVzdCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlLi4uICAKPiAKPiBIbW0uICBEb2luZyB0
aGUgcmlnaHQgZmlyc3QgaXMgcXVpdGUgYSBiaXQgb2Ygb3ZlcmhlYWQsIGVzcGVjaWFsbHkgYXMK
PiB1bmxpa2UgdGhlIGRpcmVjdCBwYWdlIGNhY2hlIGFjY2VzcyB3ZSBjYW4ndCBqdXN0IHBva2Ug
aW50byB0aGUgcGFnZQo+IHdpdGhvdXQgY29weWluZyBpdC4KPiAKPiA+IEkgdGhpbmsgd2UgY2Fu
IGFjdHVhbGx5IHdlYWtlbiB0aGF0IGNoZWNrIHRvIGFsbG93IHJlZ3VsYXIgZmlsZXMgdG9vLgo+
ID4gVGhlbiBvbmUgY2FuIGRpcmVjdGx5IHVzZSBhIGZpbGUgYXMgYmFja2VuZC4gVGhlc2UgZGF5
cyBwZW9wbGUgdXNlIGJsb2NrMm10ZAo+ID4gc29tZXRpbWVzIHdpdGggYSBmaWxlIGJhY2tlbmQg
dmlhIGEgbG9vcCBkZXZpY2UuICAKPiAKPiBZZXMsIGEgZmlsZSBiYWNrZW5kIHdpbGwgd29yayBq
dXN0IGZpbmUuCj4gCj4gPiBQLnM6IFdoaWxlIHJlYWRpbmcgdGhpcyBkcml2ZXIgSSBmb3VuZCBh
bm90aGVyIGlzc3VlLiBUaGVyZSBpcyBubyB3YXkgdG8gcmVtb3ZlIGFuIE1URCBhdCBydW50aW1l
Lgo+ID4gTWlxdWVsLCB3aGF0IGRvIHlvdSB0aGluaz8gU2hhbGwgd2UgbGltaXQgYmxvY2sybXRk
IHRvIG9uZSBNVEQ/Cj4gPiBUaGUgY3VycmVudCBpbnRlcmZhY2UgdmlhIG1vZHVsZSBwYXJhbWV0
ZXJzIGlzIGhvcnJpYmxlLgoKSSBiZWxpZXZlIGlmIHdlIGRvIHRoaXMgd2Ugd2lsbCBzb21lZGF5
IGZpbmQgc29tZW9uZSB3aG8gKndhbnRzKgpzZXZlcmFsIGJsb2NrMm10ZCBkZXZpY2VzIGFuZCB3
ZSdsbCBiZSBiYWNrIHRvIHRvZGF5J3Mgc2l0dWF0aW9uLgoKV2hhdCBhYm91dCBhbiBleHRyYSBw
YXJhbWV0ZXIgd2hlcmUgeW91IHByb3ZpZGUgdGhlIG10ZCBkZXZpY2UgdG8KcmVtb3ZlIGl0PyBP
ciBwZXJoYXBzIGEgbmV3IGludGVyZmFjZSBpZiBibG9jazJtdGQgaXMgYWN0dWFsbHkgdXNlZApp
biBhbm90aGVyIHBzZXVkby1mcz8gKGxpa2UgY29uZmlnZnMgb3IgcGVyaGFwcyBkZWJ1Z2ZzIGlm
IHRoaXMgaXMKc3VpdGFibGUpCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
