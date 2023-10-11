Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC9ACD98C7
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Oct 2023 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mI7tND1NASqRzuxdfIpQmnKN8lvoRCaFCegKdiEjUJQ=; b=aFARW0m7olnWOe
	uAW/iLsOgnCS3Aq09TvGKuEd0ti2MIdygRwBP9VhrKJ+LkH8poJOnMb4zWCiF0G1RpLwpZ62fNr0e
	+ZJL+RW4qbVCZsP6aV+lwIoEbkCDO6H7HorcTzdH2JX/z+j+FSZslaYDwpGL6fJ6uARpzXhLkxmos
	jZjTBstKAtH6xPidznMZkHMA4RoLTYxC4kVXWVaDFWrpgyomqDavqknChUFVj0p76YIKNoF8EcVfT
	a4E5ZwMDYo0FqrElHR+DBz9lsQGVEi12Gu8Z2E2ZzQi9wS3W+JIEZjCx5yyeKXkjffBP0aJhF/4Hm
	1VXzZPDTY0j3bAe3xOkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTM0-00F3K7-2h;
	Wed, 11 Oct 2023 07:10:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqTLx-00F3JY-08
	for linux-mtd@lists.infradead.org;
	Wed, 11 Oct 2023 07:09:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE2CB2000A;
	Wed, 11 Oct 2023 07:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697008191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ptnxESUIcHufI5S8WgiFaBtPbjBM7fwXRdDASmyuEU=;
	b=BI/kONEqXHniRe6s+mi+zpHLEIKokdFxcFU2mqsbmdH9jvW9KL+YJHf0b88ypMI7Qk4FWW
	/w/ELITqSJN2WjOcDagmsyt9CyDkZHEs8D9qTTF7nzdPjNj211mmJ1JlHcmkqaWjppdCcf
	8tLR5ErJzFcrQhL+GM2RvooW8HJo4nywplWUU8uiF/z25hhbIvZ+r+qlBNxlsddSc8vOLv
	r7MaWNeLd62nq/CIKeVn3uFYCvwzZSDmmlrAMVfsOZOHWC7bvqOQJGqwJ86mKOGa+m4sYV
	wt9tw5YzIPrNJNqyrG4uIvfx0GFjUigWARZUtRFElxrCiU8jurzIt/DsUziycw==
Date: Wed, 11 Oct 2023 09:09:48 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bruce Suen <bruce_suen@163.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH] mtd: spinand: Add support for XTX XT26xxxDxxxxx
Message-ID: <20231011090948.1dee1a90@xps-13>
In-Reply-To: <c8dace54-bb25-957f-d7b3-8c705b480cdc@163.com>
References: <20231007090954.4569-1-bruce_suen@163.com>
	<20231009145839.0651dd29@xps-13>
	<c8dace54-bb25-957f-d7b3-8c705b480cdc@163.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_000957_390065_27634854 
X-CRM114-Status: GOOD (  13.23  )
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

SGkgQnJ1Y2UsCgo+ICJFQ0NTMy9FQ0NTMi9FQ0NTMS9FQ0NTMCBwcm92aWRlcyBFQ0MgU3RhdHVz
IGFzIGZvbGxvd3M6Cj4gWFgwMGI9IE5vIGJpdCBlcnJvcnMgd2VyZSBkZXRlY3RlZCBkdXJpbmcg
dGhlIHByZXZpb3VzIHJlYWQgYWxnb3JpdGhtLgo+IDAwMDFiPSBCaXQgZXJyb3JzKOKJpDQpIHdl
cmUgZGV0ZWN0ZWQgYW5kIGNvcnJlY3RlZC4KPiAwMTAxYj0gQml0IGVycm9ycyg9NSkgd2VyZSBk
ZXRlY3RlZCBhbmQgY29ycmVjdGVkLgo+IDEwMDFiPSBCaXQgZXJyb3JzKD02KSB3ZXJlIGRldGVj
dGVkIGFuZCBjb3JyZWN0ZWQuCj4gMTEwMWI9IEJpdCBlcnJvcnMoPTcpIHdlcmUgZGV0ZWN0ZWQg
YW5kIGNvcnJlY3RlZC4KPiBYWDEwYj0gQml0IGVycm9ycyBncmVhdGVyIHRoYW4gRUNDIGNhcGFi
aWxpdHkgKDggYml0cykgYW5kIG5vdCBjb3JyZWN0ZWQKPiBYWDExYj0gQml0IGVycm9ycyByZWFj
aCBFQ0MgY2FwYWJpbGl0eSAoOCBiaXRzKSBhbmQgY29ycmVjdGVkIgoKTmljZQoKPiAKPiBFQ0NT
MSxFQ0NTMCA9IDAwOiBObyBiaXQgZXJyb3JzCj4gRUNDUzEsRUNDUzAgPSAxMDogYml0IGVycm9y
cyA+IDgKPiBFQ0NTMSxFQ0NTMCA9IDExOiBiaXQgZXJyb3JzID0gOAo+IEVDQ1MxLEVDQ1MwID0g
MDE6IDE8PWJpdCBlcnJvcnM8PTcKPiAKPiBzbyBJIHVzZSA0IGNhc2VzIHRvIHJlcHJlc2VudCBp
dC4KPiAKPiBmb3IgRUNDUzEsRUNDUzAgPSAxMSwgYml0ZmlscHMgY2FuIGJlIHN1YmRpdmlkZWQg
YnkgRUNDUzMgRUNDUzI6Cj4gCj4gRUNDUzMgRUNDUzIgPSAwMDogYml0ZmlwPD00PTQrMCwgSSBy
ZXR1cm4gNCBmb3IgdGhpczsKPiBFQ0NTMyBFQ0NTMiA9IDAxOiBiaXRmaXA9NT00KzEsIEkgcmV0
dXJuIDUgZm9yIHRoaXM7Cj4gRUNDUzMgRUNDUzIgPSAxMDogYml0ZmlwPTY9NCsyLCBJIHJldHVy
biA2IGZvciB0aGlzOwo+IEVDQ1MzIEVDQ1MyID0gMTE6IGJpdGZpcD03PTQrMywgSSByZXR1cm4g
NyBmb3IgdGhpczsKClBsZWFzZSB1c2UgRklFTERfR0VUKCkgYW5kIGNyZWF0ZSBtYWNyb3MgdG8g
Y2xhcmlmeSB3aGF0IHlvdSBhcmUKbG9va2luZyBhdC4gUGxlYXNlIGluY2x1ZGUgYWxsIHZhbHVl
cy4KCj4gc28sSSB1c2UgIjQrKChzdGF0dXMgJiBYVDI2WFhYRF9TVEFUVVNfRUNDX01BU0spID4+
IDYpIiB0byByZXByZXNlbnQgaXQuCj4gCj4gPgo+ID4gQWxzbyBwbGVhc2UgcnVuIGNoZWNrcGF0
Y2gucGwgLS1zdHJpY3QuICAKPiBJIHJ1biBjaGVja3BhdGNoLnBsIHdpdGhvdXQgLS1zdHJpY3Qs
dGhlcmUgYXJlIG5vIGNoZWNrcy4KPiBJIHJ1biBjaGVja3BhdGNoLnBsIC0tc3RyaWN0LHRoZXJl
IGFyZSA1IGNoZWNrcy4KPiBJJ20gc29ycnkgZm9yIHRoYXQsSSB3aWxsIGZpeCBpdCBpbiBuZXh0
IHZlcnNpb24gb2YgcGF0Y2guCj4gPj4gKwljYXNlIFhUMjZYWFhEX1NUQVRVU19FQ0NfOF9DT1JS
RUNURUQ6Cj4gPj4gKwkJcmV0dXJuIDg7Cj4gPj4gKwlkZWZhdWx0Ogo+ID4+ICsJCWJyZWFrOwo+
ID4+ICsJfQo+ID4+ICsKPiA+PiArCXJldHVybiAtRUlOVkFMOwo+ID4+ICt9CgpUaGFua3MsCk1p
cXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
