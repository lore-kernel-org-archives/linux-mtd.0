Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEC5C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 07:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80JU3L2T8KcPgHDwQnlXv+stVu3U16vCAsXK2jGh488=; b=wXNqpUt3ZqvHtH
	ABG9znMvrz+u0pgj6IqcZlRupq12WmdPfLsKkjzIVRMHh9Xk4Iu/VLwFUyHTkfnfo3t7b/K7SdP/K
	BhBdEjTmEOxqQl6Srr7PWJ+d+dTOz6OraXhRYnS5UzgWbK31DX8RrR4eK8XDQSxZ2O+7su6t6Njae
	UQ5k4HJPLnM6XNqqjH7NE8yGpA4g7YiwDmEqVjclRlt5LVMrDPIDMfUaUojWfpZo/NZt+TtMfK1tL
	9VVJT6CUqroPUDbwKah3cyHxOzDqMHL0Do+xHvUHIfauJG6/wGaJbYn/QQHnNDyPGnxAQgyIGaVnq
	TIB7ms8ageWtJ9lrGYVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFcc-00Cxp2-4N; Tue, 26 Apr 2022 07:28:30 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFcX-00CxmX-9T
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 07:28:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 023C9C0012;
 Tue, 26 Apr 2022 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650958099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tlA6eFLQiQcvdObgX0y/KAZVkQq8yyldXd7UmkZhtaw=;
 b=nILske/qJ9cD7oEE4ATOk9UuLAW6GjGK0Hs64tIkF4UtPq9cTnKW78SkDHuuIQKS2q8jjS
 gyP/2CZOIKPS8qb3EafIJXfvJFv3YMh1cBy9lxaTBAMTkTuQ28YIaFlVBHFOIgxIEUj29z
 oi0j0L/rPPvMAASHWcAHKMSS3P33mOgKfUy+swJMRtdMxB17aHDJ0xmlOXWJQ7WMPyMQsD
 iQdoBzh2TKdDPpzigBFiesu+pxZ44hDuUaaKU7N8fQE8dw/hfMp8C6rn3vPnH66LMjdpfs
 ocvTz5+KfJ9YGRjSxz/GgYusH34tQ+kfzTFYohCCRccNMFkwbt09IIEzzsAmjw==
Date: Tue, 26 Apr 2022 09:28:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] mtd: mtdoops: Add timestamp to the dumped oops
 header.
Message-ID: <20220426092818.530b7e9b@xps13>
In-Reply-To: <CAL3wywVS0EyBNQ_vp+TDdxO1=x4PgTZoyzGJ8-5qXzhCd0uOcw@mail.gmail.com>
References: <20220415001321.252848-1-jmeurin@google.com>
 <20220421234244.2172003-1-jmeurin@google.com>
 <20220425104201.173e65fa@xps13>
 <CAL3wywVS0EyBNQ_vp+TDdxO1=x4PgTZoyzGJ8-5qXzhCd0uOcw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_002825_507319_EC042C16 
X-CRM114-Status: GOOD (  20.42  )
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

SGkgSmVhbi1NYXJjLAoKam1ldXJpbkBnb29nbGUuY29tIHdyb3RlIG9uIE1vbiwgMjUgQXByIDIw
MjIgMDk6MTQ6MDggLTA3MDA6Cgo+IEhpIE1pcXVlbCwKPiAKPiAKPiBPbiBNb24sIEFwciAyNSwg
MjAyMiBhdCAxOjQyIEFNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+
IHdyb3RlOgo+ID4KPiA+IEhpIEplYW4tTWFyYywKPiA+Cj4gPiBqbWV1cmluQGdvb2dsZS5jb20g
d3JvdGUgb24gVGh1LCAyMSBBcHIgMjAyMiAxNjo0Mjo0MSAtMDcwMDoKPiA+ICAKPiA+ID4gVGhl
IGN1cnJlbnQgaGVhZGVyIGNvbnNpc3RzIG9mIDIgMzItYml0IHZhbHVlcyB3aGljaCBtYWtlcyBp
dCBkaWZmaWN1bHQKPiA+ID4gYW5kIGVycm9yIHByb25lIHRvIGV4cGFuZC4gVGhpcyBjcmVhdGVz
IGEgc3RydWN0dXJlIGZvciB0aGUgaGVhZGVyLgo+ID4gPgo+ID4gPiBTb21lIG9vcHMgb25seSBo
YXZlIHRpbWUgcmVsYXRpdmUgdG8gYm9vdCwgdGhpcyBhZGRzIGFuIGFic29sdXRlIHRpbWVzdGFt
cC4KPiA+ID4KPiA+ID4gQ2hhbmdlbG9nIHNpbmNlIHYzOgo+ID4gPiAgIEZpeCB0aGUgcHJpbnRr
IGZvcm1hdCBmb3Igc2l6ZW9mIHRvICV6dS4KPiA+ID4KPiA+ID4gQ2hhbmdlbG9nIHNpbmNlIHYy
Ogo+ID4gPiAtIEFkZCBhIHRpbWVzdGFtcCB0byB0aGUgaGVhZGVyLgo+ID4gPgo+ID4gPiBDaGFu
Z2Vsb2cgc2luY2UgdjE6Cj4gPiA+IC0gQ3JlYXRlIGEgaGVhZGVyIHN0cnVjdHVyZSB0byBzaW1w
bGlmeSBjb2RlLgo+ID4gPiAtIFBhdGNoZXMgaW4gc2VyaWVzLgo+ID4gPiAtIFBhdGNoIHByZWZp
eC4KPiA+ID4KPiA+ID4gSmVhbi1NYXJjIEV1cmluICgzKToKPiA+ID4gICBtdGQ6IG10ZG9vcHM6
IEZpeCB0aGUgc2l6ZSBvZiB0aGUgaGVhZGVyIHJlYWQgYnVmZmVyLgo+ID4gPiAgIG10ZDogbXRk
b29wczogQ3JlYXRlIGEgaGVhZGVyIHN0cnVjdHVyZSBmb3IgdGhlIHNhdmVkIG10ZG9vcHMuCj4g
PiA+ICAgbXRkOiBtdGRvb3BzOiBBZGQgYSB0aW1lc3RhbXAgdG8gdGhlIG10ZG9vcHMgaGVhZGVy
LiAgCj4gPgo+ID4gTG9va3MgbGlrZSB0aGUgbGFzdCBwYXRjaCB3YXMgbm90IHNlbnQgdG8gdGhl
IGxpc3Q/Cj4gPiAgCj4gCj4gSSdtIG5vdCBzdXJlIHdoYXQgaGFwcGVuZWQuICBJJ3ZlIGp1c3Qg
c2VudCBpdCBhbmQgdGhlbiBub3RpY2VkIHRoYXQKPiB0aGUgbWFpbCB0aHJlYWRpbmcgaXMgd3Jv
bmcuICBMZXQgbWUga25vdyBpZiB5b3Ugd2FudCBtZSB0byByZXNlbmQgdGhlCj4gZnVsbCB0aHJl
YWQuCgpJdCdzIGZpbmUgbGlrZSB0aGF0LgoKPiAKPiBJJ20gcmVhbGx5IHNvcnJ5IGFib3V0IHRo
YXQgOi0oIGFuZCB0aGFua3MgZm9yIGFsbCB5b3VyIGhlbHAuCgpObyBwcm9ibGVtIQoKQ2hlZXJz
LApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
