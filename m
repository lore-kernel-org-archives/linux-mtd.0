Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887E6C7EE23
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 09:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RE/Pv1MyV4B+MMW6dTS8AKsvFiaqZRiCgScTwElSetk=; b=TCEygWfd9NQSHn
	E8bpYKxRE0Y1ZG6wYneK9tJwGmnXz4UAicPgsGEPwv1/CiypBOV4raeUX0t48JQP8ZcCGP40ByGo7
	QPjUIGazwAQarqO5lmQoQSOmCeLpd11E7/WJEfb5A8EeLIb3OUT2BESnhOW8nYGon+JVNlim+tLKN
	C38SHEI2RSPJddXUYhCpS8O90V+t8QpWKMRSi3Eneb01Ox2zUy+bb+PscaCeQNNKT2v4SG2DpEDhu
	n4y758Zu33ztyXAvDKijwxmZP5EIM02z/3JMzq+6iM3wN5y4KxjYDJzh8EAQiWKKqYxCoaqibrFLT
	Wp1EM03JEIL/cBnSyo7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OUT-009dlN-0Y;
	Tue, 23 May 2023 09:39:37 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1OUQ-009dkI-2W
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 09:39:36 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D2FBD1BF20F;
	Tue, 23 May 2023 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684834772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O5bZk8oOcESNGSdQ5mgZtmpIo26jm2QJWwpx00xpmQ0=;
	b=NjICiWfDtJZRcdn2/x9r+c8u9OU2M62cctVzWqVZbZCcTFhXrgt9sZQi9iG2j5ANjqky4K
	63VbvRv9jyon2JRP/cT0M5YFUcLCsOJcmf+hj2RjVoRzCGsG1GunVxmcvjV3rtsWe1lFDx
	cS8xL7jB72T0NrK4wDIn//WHtC4zOHqjEbG87zQgfuLO94ez69r6hxfNjxPjm62l0pQbdT
	66VbOEC7i9xVeA11cYGS2j6vss+zWd0PU2zl22VD3GbIB6WYQxrlUFDsEAjDN6bb2CVFtW
	hijyF385XRg+9DD06V34v3V0Niqk/nhRRHKAn+gwn8TWJPVUc1yQI3Shsct/qg==
Date: Tue, 23 May 2023 11:39:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: ensure timing values are written
Message-ID: <20230523113930.48c631d4@xps-13>
In-Reply-To: <20230523032103.208213-1-chris.packham@alliedtelesis.co.nz>
References: <20230523032103.208213-1-chris.packham@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_023934_973254_ED86F4CD 
X-CRM114-Status: GOOD (  22.00  )
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

SGkgQ2hyaXMsCgpjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gVHVl
LCAyMyBNYXkgMjAyMyAxNToyMTowMworMTIwMDoKCj4gV2hlbiBuZXcgdGltaW5nIHZhbHVlcyBh
cmUgY2FsY3VsYXRlZCBpbiBtYXJ2ZWxsX25mY19zZXR1cF9pbnRlcmZhY2UoKQo+IGVuc3VyZSB0
aGF0IHRoZXkgd2lsbCBiZSBhcHBsaWVkIGluIG1hcnZlbGxfbmZjX3NlbGVjdF90YXJnZXQoKSBi
eQo+IGNsZWFyaW5nIHRoZSBzZWxlY3RlZF9jaGlwIHBvaW50ZXIuCj4gCj4gU3VnZ2VzdGVkLWJ5
OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4KCkkg
YmVsaWV2ZSB0aGlzIHBhdGNoIGRlc2VydmVzIEZpeGVzK0NjOnN0YWJsZT8KCj4gLS0tCj4gCj4g
Tm90ZXM6Cj4gICAgIFRoaXMgYXQgbGVhc3QgZ2V0cyBtZSB0byBhIHBvaW50IHdoZXJlIEkgY2Fu
IGlsbHVzdHJhdGVkIHRoZSBwcm9ibGVtCj4gICAgIHJlcG9ydGVkIHRvIG1lLiBJdCBhcHBlYXJz
IHRoYXQgZGVzcGl0ZSB0aGUgY2hpcCBjb3JyZWN0bHkgcmVwb3J0aW5nCj4gICAgIHN1cHBvcnQg
Zm9yIFNEUiB0aW1pbmcgbW9kZXMgdXAgdG8gNCB0aGUgb2JzZXJ2ZWQgdFdDIGlzIDIwbnMuIEkn
dmUgbm90Cj4gICAgIHNlZW4gYW55IGFjdHVhbCBwcm9ibGVtIHJ1bm5pbmcgaW4gdGhpcyBzdGF0
ZSB0aGUgb25seSBjb21wbGFpbnQgaXMgdGhhdAo+ICAgICB0aGUgZGF0YXNoZWV0IHNheXMgdGhl
IG1pbmltdW0gdFdDIGlzIDI1bnMuCj4gICAgIAo+ICAgICBJZiBJIG1ha2UgYSBjaGFuZ2UgdG8g
bXkgYm9vdGxvYWRlciBzdWNoIHRoYXQgdGhlIE5BTkQgQ2xvY2sgRnJlcXVlbmN5Cj4gICAgIFNl
bGVjdCBiaXQgKDB4RjI0NDA3MDA6MCkgdG8gMSBiZWZvcmUgYm9vdGluZyB0aGUga2VybmVsIF9h
bmRfIEkgcmVtb3ZlCj4gICAgIHRoZSBleHRyYSBmYWN0b3Igb2YgMiBmcm9tIHRoZSBwZXJpb2Rf
bnMgY2FsY3VsYXRpb24gSSBvYnNlcnZlIHRXQyBvZgo+ICAgICBhYm91dCA2MG5zLiBJZiBJIGRv
bid0IHJlbW92ZSB0aGUgZmFjdG9yIG9mIDIgdGhlIE5BTkQgaW50ZXJmYWNlIGRvZXNuJ3QKPiAg
ICAgd29yayAoY2FuJ3Qgd3JpdGUgQkJUKS4KPiAKPiAgZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFy
dmVsbF9uYW5kLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiBpbmRleCBhZmI0MjQ1NzlmMGIu
LjNiNWU0ZDVkMjIwZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxs
X25hbmQuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jCj4gQEAg
LTI0NTcsNiArMjQ1NywxMiBAQCBzdGF0aWMgaW50IG1hcnZlbGxfbmZjX3NldHVwX2ludGVyZmFj
ZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCBpbnQgY2hpcG5yLAo+ICAJCQlORFRSMV9XQUlUX01P
REU7Cj4gIAl9Cj4gIAo+ICsJLyoKPiArCSAqIFJlc2V0IG5mYy0+c2VsZWN0ZWRfY2hpcCBzbyB0
aGUgbmV4dCBjb21tYW5kIHdpbGwgY2F1c2UgdGhlIHRpbWluZwo+ICsJICogcmVnaXN0ZXJzIHRv
IGJlIHJlc3RvcmVkIGluIG1hcnZlbGxfbmZjX3NlbGVjdF90YXJnZXQoKS4KPiArCSAqLwoKcy9y
ZXN0b3JlZC91cGRhdGVkLyA/CgpSZXN0b3JlZCBmZWVscyBsaWtlIHRoZSBjb250ZW50IHZhbmlz
aGVkLgoKPiArCW5mYy0+c2VsZWN0ZWRfY2hpcCA9IE5VTEw7Cj4gKwo+ICAJcmV0dXJuIDA7Cj4g
IH0KPiAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
