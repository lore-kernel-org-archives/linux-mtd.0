Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1555FC77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmWYoFkVIC/alyTFdKB1+cGvECmWcJuKgjmr63VcOwE=; b=UrN0mbIsJa9vlb
	s532nL/5IWjlT4nBbCFB5BswCl0kHXvh3xqxzQvzvNP6NIPhu+2ZM5hz21Aj0Vq8FimvWTQu3jlb/
	qYWfXCwYVutxN+B0fPsH34xOtfgZIqwnDoQ0KXqFict19+dr9kTkddOObwaMIq7vlrJkIVl9lG/JA
	TXlsGVC3WPdHtOBzLSJzTcRh8rk9xFI/ic+977S4eLvTZW+sbcwV3GX7x+Dz5PSJfa6RcWq/jmK6T
	dvjHVV3WD7BxrhSHzX3LxTStxNBaWMe1BOrTVOheCvmHP+VQHe8wTt8cWTYSQQK0fh2zQcnOL1E8w
	FvVlKgGlwIzKueklckaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OPH-009cto-2W;
	Tue, 23 May 2023 09:34:15 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OPE-009crM-2t
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 09:34:14 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9C42B1C000B;
	Tue, 23 May 2023 09:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684834449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irbxTtFMj36QTztSinqx+K6zvjiLXjiZS7Tr5vGVeQA=;
	b=MQH74+mtNlOf4mUA+OQUVAFl8W+eC7RN11ueU2RMGlh+Uwq1wcbbyomCcUxSlkAI5NyNG3
	2TMaEiXyqLQolV9rwaPYpsE7eB6oq9qRgjQ7lXGv9e5Fkqy8eud0VjNM1Bd3o3RQCcqQLZ
	vikDp7RYUdmVy46Cv2NGjbr3pvHIDJNW4A6cX6ZD//6P8rdQyWozGOFmTEtNE+bl6sFbi5
	SRNppfd8ppRl7dBbbP6XTyvLL1K1FwSlmvyDZVICHBlkJjNG+Z+ux/uEvVGchQGOIWBi3a
	eOuUZbU5hKu1s5WmPVeQhF9hEE29NCLi5+s57dwJShnlXv/oGEnNobOwXkW7dw==
Date: Tue, 23 May 2023 11:34:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Mike
 Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pavel
 Machek <pavel@ucw.cz>, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: Re: [PATCH 23/24] mtd: block2mtd: don't call early_lookup_bdev
 after the system is running
Message-ID: <20230523113402.32fa86ba@xps-13>
In-Reply-To: <20230523074535.249802-24-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
	<20230523074535.249802-24-hch@lst.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_023413_087492_6BB7329D 
X-CRM114-Status: GOOD (  13.82  )
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

SGkgQ2hyaXN0b3BoLAoKaGNoQGxzdC5kZSB3cm90ZSBvbiBUdWUsIDIzIE1heSAyMDIzIDA5OjQ1
OjM0ICswMjAwOgoKPiBlYXJseV9sb29rdXBfYmRldiBpcyBzdXBwb3NlZCB0byBvbmx5IGJlIGNh
bGxlZCBmcm9tIHRoZSBlYXJseSBib290Cj4gY29kZSwgYnV0IG1kdGJsb2NrX2Vhcmx5X2dldF9i
ZGV2IGlzIGNhbGxlZCBhcyBhIGdlbmVyYWwgZmFsbGJhY2sgd2hlbgo+IGxvb2t1cF9iZGV2IGZh
aWxzLCB3aGljaCBpcyBwcm9ibGVtYXRpYyBiZWNhdXNlIGVhcmx5X2xvb2t1cF9iZGV2Cj4gYnlw
YXNzZXMgYWxsIG5vcm1hbCBwYXRoIGJhc2VkIHBlcm1pc3Npb24gY2hlY2tpbmcsIGFuZCBtaWdo
dCBjYXVzZQo+IHByb2JsZW1zIHdpdGggY2VydGFpbiBjb250YWluZXIgZW52aXJvbm1lbnRzIHJl
bmFtaW5nIGRldmljZXMuCj4gCj4gU3dpdGNoIHRvIG9ubHkgY2FsbCBlYXJseV9sb29rdXBfYmRl
diB3aGVuIGRtIGlzIGJ1aWx0LWluIGFuZCB0aGUgc3lzdGVtCj4gc3RhdGUgaW4gbm90IHJ1bm5p
bmcgeWV0Lgo+IAo+IE5vdGUgdGhhdCB0aGlzIHN0cmljdGx5IHNwZWFraW5nIGNoYW5nZXMgdGhl
IGtlcm5lbCBBQkkgYXMgdGhlIFBBUlRVVUlEPQo+IGFuZCBQQVJUTEFCRUw9IHN0eWxlIHN5bnRh
eCBpcyBub3cgbm90IGF2YWlsYWJsZSBkdXJpbmcgYSBydW5uaW5nCj4gc3lzdGVtcy4gIFRoZXkg
bmV2ZXIgd2VyZSBpbnRlbmRlZCBmb3IgdGhhdCwgYnV0IHRoaXMgYnJlYWtzIHRoaW5ncwo+IHdl
J2xsIGhhdmUgdG8gZmlndXJlIG91dCBhIHdheSB0byBtYWtlIHRoZW0gYXZhaWxhYmxlIGFnYWlu
LiAgQnV0IGlmCj4gYXZvaWRhYmxlIGluIGFueSB3YXkgSSdkIHJhdGhlciBhdm9pZCB0aGF0LgoK
U291bmRzIHJlYXNvbmFibGUgdG8gbWUuIFJpY2hhcmQ/CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
