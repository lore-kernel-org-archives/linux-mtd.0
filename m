Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F47D41D64
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Dec 2025 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09KJPbhx8POrZh3B2ounsr4VCCERL6mejIW+X0Bvo4w=; b=ZkaHWtS6A6EiBF
	TAVF9KCve8Apuvyx+/qMwQElutrp7mofOuXyXM8U6c47Sp/ZZsL1vnfuW/rm/gsC1eY6aBQ1CKp18
	eAXqeDrdRPB46XN29OmhK8BfeTNlPLhrWcjU2dWpJGVWeiMXgDJ6bjQPVdAKCq0zvA6Qik/UjTa3B
	c+fZDu75uNUwYCWalYdx1wVr77QyrNCEheVR1Mkm529hLzpldPIyp2TiAl/YqsL+A/9EWxQnu2nVu
	91L9bwCfxcfo2IWNPrxgLcnvwjnKdWvLWrmzrwG5vh9zXBxxFOpG63HKUQ9hI4mQthYc1lV37KKy8
	LMtqXlhs2CppHjWxXnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj7n-0000000GoAY-16Zs;
	Thu, 11 Dec 2025 16:02:39 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTj7k-0000000GoA8-1zYA
	for linux-mtd@lists.infradead.org;
	Thu, 11 Dec 2025 16:02:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 83687C1934B;
	Thu, 11 Dec 2025 16:02:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87A4F6072F;
	Thu, 11 Dec 2025 16:02:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8927C103C8C7B;
	Thu, 11 Dec 2025 17:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765468949; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zc3/GTmZ6hKlh1Zm9Q6vcWDczh4tuBrUTLc2FzrMtAY=;
	b=K+XbI2G1dCJfZru6eoqVhcyr5OoBb0xfefoXzERiniD2gidLc2eLup4iSOiHTOi41GjY+L
	ZJuitLGtsuN+Y9Kq24WSKXEGNOCrxGSqtxwQH4E5LH43ULWYMt1gXQAyjcvMgWuOsKWrY4
	wLcyCybTRlFPP92Ae5dZEhYBdPwSZF28H/YMvmdi6QXOpipQs891sUH5Rh3Q4N+FUh/zDi
	BM9K+Fl1TGfgl4gLgVy1x6yBAYvko3flQGMlE+Eyu+FpSMLwKUWQO/NsFswa6Y9BXsprk1
	US9BWq5Oshf6qGKFIWmyQLMSgd7G0Uoh/PYKrkVTVGFXLhjnJg8F5dYp8yXIKg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Andrea Scian <andrea.scian@dave.eu>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mtd_nandbitserr and seed using pl35x NAND controller
In-Reply-To: <MI2P293MB02644E845892FAFBEC01AD5997D6A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
	(Andrea Scian's message of "Tue, 25 Nov 2025 10:12:47 +0000")
References: <MI2P293MB02644E845892FAFBEC01AD5997D6A@MI2P293MB0264.ITAP293.PROD.OUTLOOK.COM>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 11 Dec 2025 17:02:26 +0100
Message-ID: <87wm2t57n1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_080236_694598_3FBCBCFA 
X-CRM114-Status: GOOD (  19.85  )
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

SGVsbG8gQW5kcmVhLAoKT24gMjUvMTEvMjAyNSBhdCAxMDoxMjo0NyBHTVQsIEFuZHJlYSBTY2lh
biA8YW5kcmVhLnNjaWFuQGRhdmUuZXU+IHdyb3RlOgoKPiBEZWFyIGFsbCwKPgo+IEknbSBmYWNp
bmcgYSB3ZWlyZCBiZWhhdmlvciBvbiBtdGRfbmFuZGJpdHNlcnIgbXRkX3Rlc3Qgd2hpbGUgd29y
a2luZyBvbiBhIFp5bms3ayBiYXNlZCBwbGF0Zm9ybSwgcnVubmluZyBrZXJuZWwgNi42LjAKPgo+
IEFzIG1hbnkgb2YgeW91IHN1Z2dlc3QgbWUsIHRoaXMgdGVzdCBpcyBwYXJ0IG9mIG91ciB2YWxp
ZGF0aW9uIGZvciB0aGUgd2hvbGUgbG93bGV2ZWwgc3VwcG9ydCAoTkFORCBjaGlwLCBoYXJkd2Fy
ZSBkZXNpZ24sIE5BTkQgY29udHJvbGxlcikuCj4KPiBJJ3ZlIGZvdW5kIHRoYXQgdGhpcyB0ZXN0
LCBpbiBteSB0ZXN0YmVkLCBmYWlscyB3aGVuIHVzaW5nIHNlZWQ9MSBidXQgaXQgc2VlbXMgdG8g
ZW5kIHN1Y2Nlc3NmdWxseSB3aGVuIHVzaW5nIGRlZmF1bHQgcGFyYW1ldGVycyAoc28gc2VlZD0w
KQo+Cj4gSGVyZSBpdCBpcyB0aGUgdGVzdCBvdXRwdXQgaW4gdGhlIHR3byBjYXNlczoKPgo+IHJv
b3RAc3cwMDA1LWRldmVsOn4jIG1vZHByb2JlIG10ZF9uYW5kYml0ZXJycyBzZWVkPTEKCi4uLgoK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9wbDM1eC1uYW5kLWNvbnRyb2xsZXIuYwo+ICsr
KyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L3BsMzV4LW5hbmQtY29udHJvbGxlci5jCj4gQEAgLTEw
NjQsNyArMTA2NCw3IEBAIHN0YXRpYyBpbnQgcGwzNXhfbmFuZF9jaGlwX2luaXQoc3RydWN0IHBs
MzV4X25hbmRjICpuZmMsCj4gIOKAguKAguKAguKAguKAgnBsbmFuZC0+Y3MgPSBjczsKPiAgCj4g
IOKAguKAguKAguKAguKAgmNoaXAgPSAmcGxuYW5kLT5jaGlwOwo+IC3igILigILigILigILigIJj
aGlwLT5vcHRpb25zID0gTkFORF9CVVNXSURUSF9BVVRPIHwgTkFORF9VU0VTX0RNQSB8IE5BTkRf
Tk9fU1VCUEFHRV9XUklURTsKPiAr4oCC4oCC4oCC4oCC4oCCY2hpcC0+b3B0aW9ucyA9IE5BTkRf
QlVTV0lEVEhfQVVUTyB8IE5BTkRfVVNFU19ETUE7CgpJIG5vIGxvbmdlciByZW1lbWJlciB3aHkg
dGhpcyBmbGFnIHdhcyBzZXQsIHRiaC4gSWYgeW91IGVuYWJsZSBzdWJwYWdlCndyaXRlcywgeW91
IHNob3VsZCBtYWtlIHN1cmUgdGhhdCBwYWdlIGFuZCBzdWJwYWdlIHRlc3RzIHJlYWxseSBwYXNz
LApiZWNhdXNlIGl0IG1lYW5zIEkgaGF2ZSBub3QgdGVzdGVkIHRoaXMgcG9zc2liaWxpdHkuCgpO
ZXZlcnRoZWxlc3MsIEkgZmluZCB0aGlzIGNhdXNhbCBlZmZlY3QgdmVyeSB1bnNhdGlzZnlpbmcu
IEkgZG8gbm90CnVuZGVyc3RhbmQgaG93IHRoaXMgbWlnaHQgYmUgcmVsYXRlZCB0byB5b3VyIGlz
c3VlLgoKQXJlIHlvdSBzdXJlIG9mIHRoZSBFQ0MgY29uZmlndXJhdGlvbiAoY2FuIHlvdSBzaG93
IHRoZSBEVCBzbmlwcGV0KT8KCklzIHRoZSBpc3N1ZSBjb25zaXN0ZW50PwoKPiAqIGlzIGl0IGNv
cnJlY3QgdGhhdCBjaGFuZ2luZyBzZWVkIGluIG10ZF9uYW5kYml0ZXJycyBtYWtlIHN1Y2ggYQo+
IGRpZmZlcmVuY2U/IElJVUMgdGhpcyBpcyBqdXN0IGEgInJhbmRvbSIgc2VlZCBzbyBJJ2xsIGV4
cGVjdCB0byBmYWlsCj4gaW4gYm90aCBjYXNlcyBvciBub25lCgpZZXMsIGV4YWN0bHkuIEkgY2Fu
J3QgbWFrZSBzZW5zZSBvdXQgb2YgdGhpcyBvYnNlcnZhdGlvbiA6LSkKCj4gKiBpcyBpdCBjb3Jy
ZWN0IHRoYXQgc3VicGFnZSB3cml0ZSBoYXMgYmVlbiBkaXNhYmxlZCBpbiBwbDM1eCBOQU5ECj4g
Y29udHJvbGxlcj8gQUZBSUsgb24gb2xkZXIga2VybmVsIHN1YnBhZ2VzIHdlcmUgZW5hYmxlIGJ1
dCBtYXliZSBJJ20KPiBtaXNzaW5nIHNvbWV0aGluZy4gVW5mb3J0dW5hdGVseSBnaXQgaGlzdG9y
eSBkb2Vzbid0IGhlbHAgaW4gdGhpcwoKVGhpcyBmbGFnIGhhcyBhbHdheXMgYmVlbiB0aGVyZSwg
c28gd2hhdCBkb2VzIHRoYXQgbWVhbj8gQXJlbid0IHlvdQp0YWxraW5nIGFib3V0IGEgWGlsaW54
IGRvd25zdHJlYW0ga2VybmVsIGhlcmU/Cgo+IEkgZGlkbid0IGhhdmUgdGhlIGNoYW5jZSB0byB0
cnkgYSBuZXdlciBrZXJuZWwgYnV0LCBhdCBsZWFzdCBvbiB0aGVzZQo+IHR3byBmaWxlcywgSSBk
b24ndCBzZWUgYW55IHNpZ25pZmljYW50IGNoYW5nZXMKCkRpZCB5b3Ugb2JzZXJ2ZSB3aGF0IHNl
ZWQ9MC8xIG1lYW50IGluIHByYWN0aWNlPyBJIGNsZWFybHkgZG8gbm90CnVuZGVyc3RhbmQgdGhl
IGxpbmsgaXQgbWlnaHQgaGF2ZSB3aXRoIHN1YnBhZ2VzLgoKQ2FuIHlvdSB0cnkgd2l0aCB0aGUg
bXRkLXV0aWxzIHVzZXJzcGFjZSB0b29sIGluc3RlYWQ/IEtlcm5lbCBtb2R1bGVzCmFyZSBubyBs
b25nZXIgYWN0aXZlbHkgbWFpbnRhaW5lZCwgc28gbWF5YmUgdGhlcmUgaXMgYSBidWcgKD8pIGlu
c2lkZS4KCkFsc28sIGNhbiB5b3UgdHJ5IG1hbnVhbGx5IGZsaXBwaW5nIGJpdHMgd2l0aCBuYW5k
ZmxpcGJpdHMgYW5kIHRhcmdldAp2YXJpb3VzIGFyZWEgaW4gdGhlIHBhZ2UgKG91dHNpZGUgb2Yg
dGhlIGZpcnN0IHN1YnBhZ2UsIHVubGlrZSB0aGUKbmFuZGJpdGVycnMgdGVzdCkuCgpUaGFua3Ms
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
