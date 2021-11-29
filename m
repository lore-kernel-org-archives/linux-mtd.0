Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59354C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 09:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4fVU8Stz2Y6v26uzbp44SJ3VBjmv9eZ07AzobGGMQU=; b=0s0Op00DNZ7nnN
	llZNgByWXM3o5Qaj6e+72Hy5szCwj5FaIqhn6SZh4kxYC6N8jDWxqqgJwjRDcOqDr7b9b51G1JkyS
	h6FnTJJ7+P0ZZJvGTTZtG2L7JSg/2J4/SODGzYCTl8HbnuoS2RHPFNVTEN54mADbkjqcd7hLuHafJ
	F+hyMzlCqtXsEBTHA4HNSIpVKT3HOcAKkY96gkwmHjjaBsm4n0uc/sqVad13l848Gc+6ALYM1Czm7
	uaLWKpvNkkNzcdVRaFGzirg+o0MPj3qVLfL7kO9ajhnJcY0CVsJ9V4LoIwb7vY3I/PXdl96xZdF2B
	lzDm84/ZCnHAaRCn+b7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrdAJ-000GeK-Cv; Mon, 29 Nov 2021 09:41:39 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrdAG-000GdD-6p
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 09:41:38 +0000
Received: from skn-laptop (unknown [185.17.218.86])
 by first.geanix.com (Postfix) with ESMTPSA id A396BE1F09;
 Mon, 29 Nov 2021 09:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1638178890; bh=NCEArx1B70jzAxcX0m4Z4cy7XyKhf3Y81vVBNvyz5Ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=JlGDa80F+jbVJ2g2JOvzWixbNqzNRqGdQ9yNkYCNv6R9ky6vKeL6zxx6pDpux3E/8
 9Of4HPzFnYgDViHO7WCLpRaoU39mNAwibE7Kqwx9mclj/d+P4HGxEGM5ZU3qC1GNiL
 VdxaZYtQE3T0DiXbZBwrGzGiGTTycP+V8EyOdpM1j2fOpjZhmtbDvK56/W+TSwzrxy
 HOeGRL3RmNv9LBUEDpZdUfHcOHO+MmcXP46fL2rwRU8LeJyAw39xBN5n3q/OoG2A2A
 N2CUEtllkWhfGMRm6PoQ8WMs9aW3r7KL1C/TMP6VSYjLJcCe/UrlBQS4WQYSW3R+5W
 sJ8q3Klk00Cyg==
Date: Mon, 29 Nov 2021 10:41:29 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while in
 suspend
Message-ID: <20211129094129.xn364czofrgtvfb4@skn-laptop>
References: <20211102110204.3334609-1-sean@geanix.com>
 <20211102110204.3334609-4-sean@geanix.com>
 <CGME20211123120353eucas1p2fb2561b7cfddd8d6e7decaef8b504f4c@eucas1p2.samsung.com>
 <21092c0f-e11b-ac16-ab96-2a0556c0e30a@samsung.com>
 <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
 <20211123140715.280b2f70@collabora.com>
 <20211129101908.6f1aa715@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211129101908.6f1aa715@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_014136_865832_A7E1976C 
X-CRM114-Status: GOOD (  15.99  )
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

T24gTW9uLCBOb3YgMjksIDIwMjEgYXQgMTA6MTk6MDhBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3
cm90ZToKPiBIaSBTZWFuLAo+IAo+IGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tIHdyb3Rl
IG9uIFR1ZSwgMjMgTm92IDIwMjEgMTQ6MDc6MTUgKzAxMDA6Cj4gCj4gPiBPbiBUdWUsIDIzIE5v
diAyMDIxIDEzOjUwOjEyICswMTAwCj4gPiBTZWFuIE55ZWtqYWVyIDxzZWFuQGdlYW5peC5jb20+
IHdyb3RlOgo+ID4gCj4gPiA+IEBCb3JpcyBkbyB3ZSBuZWVkIHRvIGRvIHNvbWV0aGluZyBzaW1p
bGFyIGhlcmUgdG8gd2hhdCB3ZSBkaWQgd2l0aCB0aGUKPiA+ID4gbXRkY29uY2F0IHN0dWZmPyAg
Cj4gPiAKPiA+IEFic29sdXRlbHksIHBoeXNtYXNwIHN1YmRldmljZXMgYXJlIG5ldmVyIGluaXRp
YWxpemVkL3JlZ2lzdGVyZWQsIHNvCj4gPiB5b3UgY2FuJ3QgY2FsbCBhbnkgb2YgdGhlIG10ZCBo
ZWxwZXJzIHRha2luZyB0aGUgc3VzcGVuZCBsb2NrIG9uIHRob3NlLgo+ID4gSSBndWVzcyBpdCdk
IGJlIGJldHRlciB0byBjYWxsIG10ZF9zdXNwZW5kL3Jlc3VtZSgpIG9uIHRoZSBjb25jYXQgZGV2
aWNlCj4gPiBpbiB0aG91Z2g6Cj4gCj4gQW55IGNoYW5jZSB0aGF0IHlvdSB3aWxsIGNvbWUgdXAg
d2l0aCBhIGZpeCBvciB2NiBvZiB0aGUgc2VyaWVzIGFueXRpbWUKPiBzb29uPwo+IAo+ID4gCj4g
PiBzdGF0aWMgdm9pZCBwaHlzbWFwX2ZsYXNoX3NodXRkb3duKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKmRldikKPiA+IHsKPiA+IAlzdHJ1Y3QgcGh5c21hcF9mbGFzaF9pbmZvICppbmZvID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEoZGV2KTsKPiA+IAo+ID4gCW10ZF9zdXNwZW5kKGluZm8tPmNtdGQp
Owo+ID4gfQo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpIaSBNaXF1w6hsLAoKSSdtIG5vdCAx
MDAlIGNvbWZvcnRhYmxlIGluIGRvaW5nIHRoaXMuCgpEdXJpbmcgdGhpcyBwYXRjaCBzZXJpZXMg
SSBoYXZlIG1vc3RseSBiZWVuIEJvcmlzJyB0ZXN0ZXIgYW5kCmltcGxlbWVudGVkIGhpcyBpZGVh
cyA6LwoKSSdtIHdpbGxpbmcgdG8gZ2l2ZSBpdCBhIHRyeSwgaWYgTWFyZWsgc2hhcmVzIGhvdyB0
byByZXByb2R1Y2UgdGhpcyB3aXRoIHFlbXUgOikKCi9TZWFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
