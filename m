Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEA8C1B0F7
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 20:45:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A531C20883
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 20:45:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RLrRABST";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvwyFtrn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A531C20883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2eq1S/6KhTcbqpflkQksnQAu2tA+da4Ko6OiA6jtiK0=; b=RLrRABSTKmP2rY
	0BtXJjnJzmsH7zZb3fMV1MI9/ndtn5YTdOzf9amnbeBtj+YyN6tz68iX4k7ie9BQfpVxOCFScwvXQ
	uSKv16GRBRepyuF7yox0XU9Gd25XfpR3/6Q4FyqN7O07IQlQGTpkXdePTWB99Ahp+1BIY9fqJGW+u
	N11yLW2P8qCFnSitWEsZ3rct78mKaqKiiOLK476bWOUDASWfF5H+iDYQX1obI2sSOqLOl8iFahgqn
	jasMfD3ZuttckWb7eTDJn6mKL4yRYQXirZ1Wf95edp/NjHwvRptKR/JTZcdBBJP3Y9JgCjnRy0b82
	1UhBlePwnqrRxO0pOJ2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkb0m-0005eg-V9; Fri, 18 Jan 2019 20:45:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkb0k-0005Ie-5S
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 20:45:07 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A803C2086D;
 Fri, 18 Jan 2019 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547844305;
 bh=x/O2Mi5zm0Kh2vdOHKd3Te+tqXCFFztt11Yc8yRUhGk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lvwyFtrn+Rt3K1DXwcmLLXDJ4kxVWYUhPfBLr8yiJSCX8a/6iyff1oJV/aeprd3RF
 nFnT+FwO4QmGbtOt1W6AjrtdU2aHsB3nCw+wWLntAInL/cKWOvjUzZ3U/Wf8Q5wg2w
 +e85kcN83Gnkeq91XD/nqFS6qCehEaHe7aWLuGWM=
Date: Fri, 18 Jan 2019 21:44:55 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Marcin =?UTF-8?B?S3J6ZW1pxYRza2k=?= <mar.krzeminski@gmail.com>
Subject: Re: VIRTIO iface in mtd
Message-ID: <20190118214455.18345232@bbrezillon>
In-Reply-To: <f53fe2ac-c1a1-1e64-1f4c-046b8e9daa2b@gmail.com>
References: <7f5ad942-3857-2cbb-5c54-e27a4613cae8@gmail.com>
 <20190117214654.08542c12@bbrezillon>
 <f53fe2ac-c1a1-1e64-1f4c-046b8e9daa2b@gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_124506_248417_A1A4C6CE 
X-CRM114-Status: GOOD (  20.73  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOCBKYW4gMjAxOSAyMTowMzoxNyArMDEwMApNYXJjaW4gS3J6ZW1pxYRza2kgPG1h
ci5rcnplbWluc2tpQGdtYWlsLmNvbT4gd3JvdGU6Cgo+ID4gIAo+ID4+IE15IHVuZGVyc3RhbmRp
bmcgaXMgdGhhdCB0aGlzIGRyaXZlciB3aWxsIHVzZSBWSVJUSU8gdG8gY29tbXVuaWNhdGUKPiA+
PiB3aXRoIFFlbXUuIEZyb20gUWVtdSBzaWRlIGF0IHRoZSBlbmQgdGhlcmUgd2lsbCBiZSBhIGZp
bGUgdGhhdCB3aWxsCj4gPj4gc2ltdWxhdGUgTkFORC9OT1IuIElzIGl0IGNvcnJlY3Q/ICAKPiA+
IFRoYXQncyBteSB1bmRlcnN0YW5kaW5nLCBidXQgSSdtIG5vdCByZWFsbHkgYSB2aXJ0aW8gb3Ig
cWVtdSBleHBlcnQgc28KPiA+IEkgbWlnaHQgYmUgd3JvbmcuCj4gPiAgCj4gPj4gV2hhdCB1c2Ug
Y2FzZXMgZG8geW91IGhhdmUgaW4gbWluZCBmb3IgdGhpcz8gIAo+ID4gSSBoYXZlIG9uZSBpbiBt
aW5kOiBzaW11bGF0ZSBOQU5EIChpbiBwYXJ0aWN1bGFyIE1MQyBOQU5EKSBiZWhhdmlvciBpbgo+
ID4gYSBwc2V1ZG8tcmVhbGlzdGljIHdheSB0byB2YWxpZGF0ZSBVQkkvVUJJRlMgY29kZSAob3Ig
YW55IG90aGVyCj4gPiBGUy93ZWFyLWxldmVsaW5nL0ZUTCBjb2RlKSB3ZSBtaWdodCB3YW50IHRv
IHVzZSBvbiB0b3Agb2Ygc3VjaCBkZXZpY2VzICAKPiBJbiB0aGlzIHBsYWNlIG15IHF1ZXN0aW9u
IGlzIHdoYXQgd2UgcmVtb3ZlIGZyb20gZW11bGF0aW9uPwo+IEkgdW5kZXJzdGFuZCB0aGF0IGNv
bW11bmljYXRpb24gbGF5ZXIgaXMgcmVtb3ZlZCwgaG93ZXZlciBjb21tdW5pY2F0aW9uIAo+IHBy
b3RvY29sCj4gbmVlZCB0IG8gc3RheT8gRWcuIGJlY2F1c2UgTkFORCBhbmQgT09CLgoKSWYgYnkg
cHJvdG9jb2wgeW91IG1lYW4gdGhlIGZhY3QgdGhhdCBhIE5BTkQgaGFzIGFuIG91dC1vZi1iYW5k
IGFuZCBhbgppbi1iYW5kIGFyZWEsIHRoZW4geWVzLCB3ZSB3YW50IHRvIGVtdWxhdGUgdGhhdC4g
V2hhdCBJIG1lYW50IGJ5CiJwcm90b2NvbCIgd2FzIHRoZSBob3cgeW91IGludGVyYWN0IHdpdGgg
YSBwYXJhbGxlbCBvciBTUEkgTkFORCAoInNlbmQKdGhpcyBvcGNvZGUgdG8gZG8gdGhpcyBvciB0
aGF0IiksIGFuZCB3ZSBkZWZpbml0ZWx5IGRvbid0IHdhbnQgdG8KZW11bGF0ZSB0aGF0IHBhcnQu
Cgo+IAo+ID4KPiA+IEknZCBhbHNvIGxpa2UgdG8gcmVwbGFjZSBuYW5kc2ltIGJ5IHRoaXMgZW11
bGF0aW9uIGFwcHJvYWNoLiBJbmRlZWQsCj4gPiBuYW5kc2ltIGlzIGVtdWxhdGluZyB0aGUgcGFy
YWxsZWwgTkFORCBwcm90b2NvbCBtb3JlIHRoYW4gYW55dGhpbmcKPiA+IGVsc2UsIHdoaWNoIHdl
IGRvbid0IHJlYWxseSBjYXJlIGFib3V0IHVubGVzcyB3ZSBuZWVkIHRvIHRlc3QgdGhlIHJhdwo+
ID4gTkFORCBmcmFtZXdvcmsgKGFuZCBJIHRoaW5rIHRoZXJlIGFyZSBiZXR0ZXIgc29sdXRpb25z
IHRvIGRvIHRoYXQpLiBPbgo+ID4gdGhlIG90aGVyIGhhbmQsIGJlY2F1c2UgbmFuZHNpbSB0cmll
cyB0byB1c2UgdGhlIGZ1bGwgcmF3IE5BTkQgc3RhY2ssCj4gPiBpdCdzIG9mdGVuIGhhcmQgdG8g
ZW11bGF0ZSByZWFsIGRldmljZXMgKElELWJhc2VkIGRldGVjdGlvbiBkb2VzIG5vdAo+ID4gd29y
ayBmb3IgT05GSS9KRURFQyBjb21wYXRpYmxlIGRldmljZXMpLiBBbGwgb2YgdGhpcyBtYWtlcyBu
YW5kc2ltIGEKPiA+IHBvb3IgY2hvaWNlIHdoZW4gdGhlIHVzZXIgd2FudHMgdG8gZW11bGF0ZSBh
IE5BTkQgZGV2aWNlIHRvIGRvCj4gPiBwb3N0LW1vcnRlbSBhbmFseXNpcyB1c2luZyBhIE5BTkQg
ZHVtcC4gIAo+IFRoaXMgSSBuZWVkIHRvIHVuZGVyc3RhbmQgYmV0dGVyLiBJZiB3ZSBlZy4gaGF2
ZSBOQU5EIGR1bXAsIGRvIHdlIGNhcmUgCj4gd2l0aCBPT0Igb3IgRUNDLAo+IG9yIG5vdD8KClll
cyB3ZSBzaG91bGQuIEZvciB0aGUgRUNDIHBhcnQsIGl0IHdpbGwgYmUgaGFyZCB0byBlbXVsYXRl
IEhXIEVDQwplbmdpbmUsIGJ1dCB3ZSBjYW4gYXQgbGVhc3Qgc3BlY2lmeSB0aGUgbGF5b3V0IGlu
IHVzZSBvbiB0aGUgYm9hcmQKKHdoaWNoIE9PQiBwb3J0aW9ucyBhcmUgdXNlZCB0byBzdG9yZSBF
Q0MgYnl0ZXMgYW5kIHdoaWNoIG9uZXMgYXJlCmNvbnRhaW5pbmcgdXNlciBkYXRhIG9yIGJhZCBi
bG9jayBtYXJrZXJzKS4KCj4gCj4gQXQgdGhlIGVuZCBJIGFsc28gbmVlZCB0byBhZGQsIHRoYXQg
SSB1bmRlcnN0YW5kIE5PUiBkZXZpY2VzLCBidXQgCj4gdW5mb3J0dW5hdGVseQo+IEkgaGF2ZSBs
b3cgZXhwZXJpZW5jZSB3aXRoIE5BTkRzLiBUaGlzIGNvdWxkIGxlYWQgdG8gc29tZSBtaXN1bmRl
cnN0YW5kcyA6KAoKV2UgY2FuIGhlbHAgd2l0aCB0aGF0LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
