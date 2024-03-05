Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F07FC5478C
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Mar 2024 07:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uyc07WFqVoT/3UdM19vz3wC7AJ7zaCHNSa9mDDlf8S0=; b=1DoJq7uN9jck+h
	iP2RdMQ/7GqFwLAuX1aEYlNjeE97Hl1kzWfRWRPPXXFkRT2hyAt35bs1ehcxbMSUNJlXjaPoQbyNf
	dws9E7xo4J6N1bjAD0TwqoouCrmjDEVXX6IuGS2WMut8j9pC5JtHLOBSpVSlhU0WvVP9YCixVwJc3
	X2agDfgXEdB+tqzNLd3lz3v0YaZmYcl91VdECBMlO+UWoLrBswldzse+m0Hup6BTT6SGhFObaOkD9
	TxxFPFMfnDyQOfPRbZf2vDiKatHqDEmz23S/2qgxxwIpqtmw2Jo5TqSoB1L1Se8N0VBQTU04lgb8u
	bWjAhtZS7TxigPqLF/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPPE-0000000CPMp-47Zs;
	Tue, 05 Mar 2024 07:40:08 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhPPC-0000000CPKU-01Wc
	for linux-mtd@lists.infradead.org;
	Tue, 05 Mar 2024 07:40:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E2A9E0004;
	Tue,  5 Mar 2024 07:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709624400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M9CgQs4ynqWUwnYDaz6v9W6gEUCksQOjUxkpVeVTbM0=;
	b=nAl2ejfawUP1SVqpiVTpDYCXKPoATeIBUGh8X9ova3xpF9O/qiglA1ZJYeBojmBX0IlGsZ
	8/4mXHzigKOkZaGzHZcpA/7JOiBkECFgDVh+qeYw/XYvavBe+f3M8s/qYSyg8F4zs8fb97
	MfRpZm8BHKdkEko9SuHvz77aqWsFSIWJnBVebb0jtsRL2iE/o6G3KNde+OXr+VEJyLjqQy
	Kz92Nlnf7j4NSl6K/BOQAVTyk9gzWpbSl942XtdZxKnAC5VbUNHUY4LBMcDIp2rZw6TwgO
	tsz1hodTdFz3651H5YFqfTmhw5WCzNJPCisg5ORD4oEglyZbB+8N9NVddp42wA==
Date: Tue, 5 Mar 2024 08:39:57 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Kyeongrho.Kim" <kr.kim@skyhighmemory.com>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "mmkurbanov@salutedevices.com" <mmkurbanov@salutedevices.com>,
 "ddrokosov@sberdevices.ru" <ddrokosov@sberdevices.ru>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mohamed
 Sardi <moh.sardi@skyhighmemory.com>, "Changsub.Shim"
 <changsub.shim@skyhighmemory.com>
Subject: Re: [PATCH] Skyhighmemory
Message-ID: <20240305083957.46e80312@xps-13>
In-Reply-To: <SE2P216MB2102DA0C880653E08D03747383222@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
References: <20240223063522.641771-1-kr.kim@skyhighmemory.com>
	<20240223100132.142c7c07@xps-13>
	<SE2P216MB2102DA0C880653E08D03747383222@SE2P216MB2102.KORP216.PROD.OUTLOOK.COM>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_234006_232351_8D19E969 
X-CRM114-Status: GOOD (  15.51  )
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

SGVsbG8sCgprci5raW1Ac2t5aGlnaG1lbW9yeS5jb20gd3JvdGUgb24gVHVlLCA1IE1hciAyMDI0
IDAyOjI4OjMxICswMDAwOgoKPiBIZWxsbyBNaXF1ZWwsCj4gCj4gUGxlYXNlIGZpbmQgdGhlIHJl
cGx5IGluIGJlbG93Lgo+IAo+IEkgdHJpZWQgdG8gc2VuZCBhbiBlbWFpbCB1c2luZyAnZ2l0IHNl
bmQtZW1haWwnLCBidXQgJzUuMS4zIEludmFsaWQgYWRkcmVzcycgZXJyb3IgaXMgb2NjdXJyaW5n
LCBzbyBJIHNlbmQgaXQgdG8gT3V0bG9vayBmaXJzdC4KCkknbSBzb3JyeSBidXQgSSB3aWxsIG5v
dyB3YWl0IGZvciB5b3VyIHNldHVwIHRvIGJlIGZpeGVkLgoKPiA+IHNwaW5hbmRfZGV2aWNlICpz
cGluYW5kKSAgc3RhdGljIGludCBzcGluYW5kX2VjY19lbmFibGUoc3RydWN0IHNwaW5hbmRfZGV2
aWNlICpzcGluYW5kLCAgCj4gCj4gPiAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBlbmFibGUp
ICAKPiAKPiA+ICB7ICAKPiAKPiA+ICsgICAvKiBTSE0gOiBhbHdheXMgRUNDIGVuYWJsZSAqLyAg
Cj4gCj4gPiArICAgaWYgKHNwaW5hbmQtPmZsYWdzICYgU1BJTkFORF9PTl9ESUVfRUNDX01BTkRB
VE9SWSkgIAo+IAo+ID4gKyAgICAgICAgIHJldHVybiAwOyAgCj4gCj4gPiArICAKPiAKPiAKPiAK
PiBDYW4geW91IHBsZWFzZSBtb3ZlIHRoaXMgbG9naWMgdG8geW91ciB2ZW5kb3IgZHJpdmVyPwo+
IAo+IFNITSdzIFNQSSBOYW5kIG11c3QgaGF2ZSDigJxFQ0MgQWx3YXlzIG9u4oCdIGFwcGxpZWQu
CgpXaHk/IERpc2FibGluZyB0aGUgRUNDIGlzIG5vdCBwb3NzaWJsZT8gSW4gdGhpcyBjYXNlIGV4
dHJhIGNhcmUgbXVzdCBiZQp0YWtlbiBpbiB0aGUgZHJpdmVyLgoKPiAKPiBIb3dldmVyLCBJIHRo
aW5rIHRoZXJlIGlzIG5vIHdheSB0byBiZSBtb3ZlZCB0byB0aGUgdmVuZG9yIGRyaXZlci4KPiAK
Ci4uLgoKPiA+ICtzdGF0aWMgaW50IHNreWhpZ2hfc3BpbmFuZF9vb2JsYXlvdXRfZWNjKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwgIAo+IAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBtdGRfb29iX3JlZ2lvbiAqcmVnaW9uKSAgCj4gCj4gPiAreyAgCj4g
Cj4gPiArICAgaWYgKHNlY3Rpb24pICAKPiAKPiA+ICsgICAgICAgICByZXR1cm4gLUVSQU5HRTsg
IAo+IAo+ID4gKyAgCj4gCj4gPiArICAgcmVnaW9uLT5sZW5ndGggPSAwOyAgCj4gCj4gPiArICAg
cmVnaW9uLT5vZmZzZXQgPSBtdGQtPm9vYnNpemU7ICAKPiAKPiAKPiAKPiBUaGUgRUNDIGJ5dGVz
IGFyZSBub3Qgc3RvcmVkIGFueXdoZXJlPwo+IAo+IFRoZXJlIGlzIG5vIHByb2JsZW0gYmVjYXVz
ZSBza3loaWdoJ3MgZWNjIHBhcml0eSBpcyBzdG9yZWQgaW4gdGhlIGludGVybmFsIGhpZGRlbiBh
cmVhIGFuZCBpcyBub3QgbmVlZGVkIGZvciB0aGVtLgoKUGxlYXNlIGFkZCBhIGNvbW1lbnQuCgpU
aGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
