Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25112C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Nov 2021 11:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPi8M61Qmj1p0+n4CQVxXkRtDD0/W2uzBKrXHXMBUoA=; b=xzMUvy9IxKEqfN
	ZjDRyHG55ZyEbqrtoD9eoRJynSjLJgZYitunItdCalvN4dt7j1h+k7t8wriEKvCudSediOQbq958w
	DIRVLMEK9JC8CxXDhNHt0YT/NWmCRqWvqz/YqVNQOKGl6tnurr+HBEHz9qdrVimAE35mXIaGJ2n1Y
	leB54uAOTxVR2y6JUmxw3MAgHhuWrAqlQafhN+VvEaSh8BeSopVIyaI/4iOTOn/wqdGx+86aZRypa
	w3ajgrxBUWV4GmVKOtwYukHHFottXrSsnGzN6GD3/U9ch4mYCVegIG5U4/LBEqafe45kdrXPdxoqy
	QErPzfRaeY6obKOesWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mref3-000WFJ-4T; Mon, 29 Nov 2021 11:17:29 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mreez-000WEr-PQ
 for linux-mtd@lists.infradead.org; Mon, 29 Nov 2021 11:17:27 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211129111719euoutp02663ef0312dfce585c09d53c19b393a3d~8AD-xtk-_0704107041euoutp02K
 for <linux-mtd@lists.infradead.org>; Mon, 29 Nov 2021 11:17:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211129111719euoutp02663ef0312dfce585c09d53c19b393a3d~8AD-xtk-_0704107041euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1638184639;
 bh=b4787yqAIG/Sm26YJGtmZU3KDAroSW4RgsR2sqn2dC0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=qqvRZlU6UKEZ86bdYvDfhhvyweB9qV4qhOoiYF5C0fKfXiLApBeSMHzK/W9GC9DVf
 yxmJWIEKaXmN6LMNvyrGiYFcrTOc07NO9kJEhVtt/es+lGh58/3YXyJMXy+p4aWqBv
 6qoXNLzDpw3KiTm/5Y/mWh4TG3PVbxfwW3KYj6ss=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211129111718eucas1p1671e76d73770a7041f6d1b576f069b28~8AD-bSplV2539325393eucas1p1h;
 Mon, 29 Nov 2021 11:17:18 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id C2.38.09887.EB6B4A16; Mon, 29
 Nov 2021 11:17:18 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211129111717eucas1p1f8b73283a089fea6e64544c0bf8a0217~8AD_euorC2591225912eucas1p1X;
 Mon, 29 Nov 2021 11:17:17 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211129111717eusmtrp22000e71fe17e19dca4cd31e6bcdbda60~8AD_d5V000865908659eusmtrp2Q;
 Mon, 29 Nov 2021 11:17:17 +0000 (GMT)
X-AuditID: cbfec7f4-45bff7000000269f-81-61a4b6bee493
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.51.09404.DB6B4A16; Mon, 29
 Nov 2021 11:17:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211129111717eusmtip216db03b455cf4f50bfa08dff9e145f99~8AD9_Bvea3164531645eusmtip2T;
 Mon, 29 Nov 2021 11:17:17 +0000 (GMT)
Message-ID: <63be9121-18c3-1ef2-c448-f99fb861490f@samsung.com>
Date: Mon, 29 Nov 2021 12:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while
 in suspend
Content-Language: en-US
To: Sean Nyekjaer <sean@geanix.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon
 <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211129094129.xn364czofrgtvfb4@skn-laptop>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDKsWRmVeSWpSXmKPExsWy7djPc7r7ti1JNLjZqWqxumU6o8XpM6eY
 LC7vmsNmsbtpGbvF4fZ9rBaTd75htHh/6hWbxf+zH9gdODzmran22HF3CaNHz7m37B6bVnWy
 eWxeUu9xc16hx/Eb25k8Pm+SC+CI4rJJSc3JLEst0rdL4Mp42RFUsJC/YvvO14wNjDt4uhg5
 OSQETCSadlxl7mLk4hASWMEoMWXNckYI5wujxJeGU8wgVUICnxkl7s1I7WLkAOtYdswAomY5
 o8STM9Oguj8C1by+zg7SwCtgJ3Fzy3NWEJtFQFXiza4FbBBxQYmTM5+wgNiiAkkSE07sZgKx
 hQXCJZZdOwq2jFlAXOLWk/lMIMtEBAIkVpxMgQi/ZpS4/0QQxGYTMJToetsFNpJTwFLi8p69
 rBA18hLNW2eD3SMh8INDYuKWt+wQb7pI/Pg2lxHCFpZ4dXwLVFxG4v9OkF0gDc2MEg/PrWWH
 cHoYJS43zYDqsJa4c+4XG8hFzAKaEut36UOEHSXe71jPCgkVPokbbwUhjuCTmLRtOjNEmFei
 o00IolpNYtbxdXBrD164xDyBUWkWUqjMQvL9LCTvzELYu4CRZRWjeGppcW56arFRXmq5XnFi
 bnFpXrpecn7uJkZggjr97/iXHYzLX33UO8TIxMF4iFGCg1lJhNf7zOJEId6UxMqq1KL8+KLS
 nNTiQ4zSHCxK4rwifxoShQTSE0tSs1NTC1KLYLJMHJxSDUwtN6JC792uPvxVok5r1uYzlRv3
 uJ61mvLu6CVN8U8b5mwx/qyckP5PKkd8yqdlvo+bDj9c5HbxapX6Jglbp20v5r9+6aItE+7K
 FOnT53NTcUe4p/ERB0e1qqNXy/w7hSoz/Z0sG5pfT3j/SenWVN7s74uz18sYcThJRawReVT1
 3lPA0G+GLZP+n5gLidL6gh69E07aac5Qu/59qc/Bi0xGm8Vt7RmSz1zRian1q92x9sLz1OMi
 ZTaOmuc07r2da38j5ImI1eLTVY06/3bpr9gmfqRd0cAodpuGp4Xlbu7F5fp2OVuvuTTOcK2u
 26y4enWkjt+rnNZr06aq32Fg3no16mqp1/35544Vs7k811JiKc5INNRiLipOBAA4tjuDvwMA
 AA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAIsWRmVeSWpSXmKPExsVy+t/xe7p7ty1JNLh5UMlidct0RovTZ04x
 WVzeNYfNYnfTMnaLw+37WC0m73zDaPH+1Cs2i/9nP7A7cHjMW1PtsePuEkaPnnNv2T02repk
 89i8pN7j5rxCj+M3tjN5fN4kF8ARpWdTlF9akqqQkV9cYqsUbWhhpGdoaaFnZGKpZ2hsHmtl
 ZKqkb2eTkpqTWZZapG+XoJfxsiOoYCF/xfadrxkbGHfwdDFycEgImEgsO2bQxcjFISSwlFHi
 xM5VrF2MnEBxGYmT0xqgbGGJP9e62EBsIYH3jBKH9tuD2LwCdhI3tzwHq2ERUJV4s2sBG0Rc
 UOLkzCcsILaoQJLE0wOdYHFhgXCJm7t+M4HYzALiEreezAezRQT8JPp/XWYDOYJZ4DXQ/J9N
 zBAXTWGWWPfuFztIFZuAoUTXW4grOAUsJS7v2csKMclMomtrFyOELS/RvHU28wRGoVlIDpmF
 ZOEsJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERiV24793LKDceWrj3qHGJk4
 GA8xSnAwK4nwep9ZnCjEm5JYWZValB9fVJqTWnyI0RQYGhOZpUST84FpIa8k3tDMwNTQxMzS
 wNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgUmi+ZfQjc31zUmLljBxdxnUF8fc8Xzx
 ds3kv6c53/959q+P49vJ3auL768RnV5wpWHPp3VhgqtZJa8YqZzX8plVWFt+d3ph8mZJs/ln
 je6sKshYeDpa5NkdhVWfFzAX7t9a0JJ4MkS9Ye4rfs57u7L31G3cZutltEXkQbL/kcOcYrPr
 Z3V1hO/7d/rc48AuHs+7ehOrnG4u0NUq39i2TPBRhGMZm/2jKd2ZPzyPhvjP61lnOfPczjN6
 m+vOMMuaLLG7a/WN+/3BqZv+iiwT+VN3Sb1Ted2W/oXbbt+7Jt73e3tya9mGDavOn18RdiIr
 jv1hxyynFy+Z33/SfXySn3n+5slbNHbrMkVUT7V7de3AcSWW4oxEQy3mouJEAGx5sllTAwAA
X-CMS-MailID: 20211129111717eucas1p1f8b73283a089fea6e64544c0bf8a0217
X-Msg-Generator: CA
X-RootMTR: 20211123120353eucas1p2fb2561b7cfddd8d6e7decaef8b504f4c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211123120353eucas1p2fb2561b7cfddd8d6e7decaef8b504f4c
References: <20211102110204.3334609-1-sean@geanix.com>
 <20211102110204.3334609-4-sean@geanix.com>
 <CGME20211123120353eucas1p2fb2561b7cfddd8d6e7decaef8b504f4c@eucas1p2.samsung.com>
 <21092c0f-e11b-ac16-ab96-2a0556c0e30a@samsung.com>
 <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
 <20211123140715.280b2f70@collabora.com> <20211129101908.6f1aa715@xps13>
 <20211129094129.xn364czofrgtvfb4@skn-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_031726_212376_127E9A9A 
X-CRM114-Status: GOOD (  14.92  )
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

SGkgU2VhbiwKCk9uIDI5LjExLjIwMjEgMTA6NDEsIFNlYW4gTnlla2phZXIgd3JvdGU6Cj4gT24g
TW9uLCBOb3YgMjksIDIwMjEgYXQgMTA6MTk6MDhBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90
ZToKPj4gYm9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20gd3JvdGUgb24gVHVlLCAyMyBOb3Yg
MjAyMSAxNDowNzoxNSArMDEwMDoKPj4+IE9uIFR1ZSwgMjMgTm92IDIwMjEgMTM6NTA6MTIgKzAx
MDAKPj4+IFNlYW4gTnlla2phZXIgPHNlYW5AZ2Vhbml4LmNvbT4gd3JvdGU6Cj4+Pj4gQEJvcmlz
IGRvIHdlIG5lZWQgdG8gZG8gc29tZXRoaW5nIHNpbWlsYXIgaGVyZSB0byB3aGF0IHdlIGRpZCB3
aXRoIHRoZQo+Pj4+IG10ZGNvbmNhdCBzdHVmZj8KPj4+IEFic29sdXRlbHksIHBoeXNtYXNwIHN1
YmRldmljZXMgYXJlIG5ldmVyIGluaXRpYWxpemVkL3JlZ2lzdGVyZWQsIHNvCj4+PiB5b3UgY2Fu
J3QgY2FsbCBhbnkgb2YgdGhlIG10ZCBoZWxwZXJzIHRha2luZyB0aGUgc3VzcGVuZCBsb2NrIG9u
IHRob3NlLgo+Pj4gSSBndWVzcyBpdCdkIGJlIGJldHRlciB0byBjYWxsIG10ZF9zdXNwZW5kL3Jl
c3VtZSgpIG9uIHRoZSBjb25jYXQgZGV2aWNlCj4+PiBpbiB0aG91Z2g6Cj4+IEFueSBjaGFuY2Ug
dGhhdCB5b3Ugd2lsbCBjb21lIHVwIHdpdGggYSBmaXggb3IgdjYgb2YgdGhlIHNlcmllcyBhbnl0
aW1lCj4+IHNvb24/Cj4+Cj4+PiBzdGF0aWMgdm9pZCBwaHlzbWFwX2ZsYXNoX3NodXRkb3duKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikKPj4+IHsKPj4+IAlzdHJ1Y3QgcGh5c21hcF9mbGFz
aF9pbmZvICppbmZvID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEoZGV2KTsKPj4+Cj4+PiAJbXRkX3N1
c3BlbmQoaW5mby0+Y210ZCk7Cj4+PiB9Cj4+Cj4+IFRoYW5rcywKPj4gTWlxdcOobAo+IEhpIE1p
cXXDqGwsCj4KPiBJJ20gbm90IDEwMCUgY29tZm9ydGFibGUgaW4gZG9pbmcgdGhpcy4KPgo+IER1
cmluZyB0aGlzIHBhdGNoIHNlcmllcyBJIGhhdmUgbW9zdGx5IGJlZW4gQm9yaXMnIHRlc3RlciBh
bmQKPiBpbXBsZW1lbnRlZCBoaXMgaWRlYXMgOi8KPgo+IEknbSB3aWxsaW5nIHRvIGdpdmUgaXQg
YSB0cnksIGlmIE1hcmVrIHNoYXJlcyBob3cgdG8gcmVwcm9kdWNlIHRoaXMgd2l0aCBxZW11IDop
CgpGcmFua2x5IHNwZWFraW5nIHRoZXJlIGlzIG5vdGhpbmcgc3BlY2lhbCBpbiBteSBzZXR1cCwg
dHlwaWNhbCBvcHRpb25zIAp0byBydW4gQVJNNjQvdmlydCBtYWNoaW5lLiBKdXN0IHJ1biByZWNl
bnQgcWVtdSAoSSBkaWQgbXkgdGVzdCB3aXRoIAo1LjIuMCkgd2l0aCBhbnkgYmFzaWMgYXJtL2Fy
bTY0IHJvb3RmcyAoSSd2ZSB1c2VkIERlYmlhbikuIFRoZSBxZW11IApjb21tYW5kIGxpbmUgKGNv
cGllZCBzb21ld2hlcmUgZnJvbSB0aGUgSW50ZXJuZXQpIEkndmUgdXNlZCBpczoKCnFlbXUtc3lz
dGVtLWFhcmNoNjQgLXNlcmlhbCBzdGRpbyAtbW9uaXRvciBudWxsIC1rZXJuZWwgSW1hZ2UgLWFw
cGVuZCAKImNvbnNvbGU9dHR5QU1BMCByb290PS9kZXYvdmRhIHJvb3R3YWl0IiAtTSB2aXJ0IC1j
cHUgY29ydGV4LWE1NyAtc21wIDIgCi1tIDEwMjQgLWRldmljZSB2aXJ0aW8tYmxrLWRldmljZSxk
cml2ZT12aXJ0aW8tYmxrMCAtZHJpdmUgCmZpbGU9cWVtdS12aXJ0LXJvb3Rmcy5yYXcsaWQ9dmly
dGlvLWJsazAsaWY9bm9uZSxmb3JtYXQ9cmF3IC1uZXRkZXYgCnVzZXIsaWQ9dXNlciAtZGV2aWNl
IHZpcnRpby1uZXQtZGV2aWNlLG5ldGRldj11c2VyIC1kaXNwbGF5IG5vbmUKCk9uY2UgaXQgYm9v
dHMgdG8gc2hlbGwsIGp1c3QgdHlwZSAncmVib290JyBhbmQgd2FpdCB1bnRpbCBpc3N1ZSBhcHBl
YXJzLgoKQmVzdCByZWdhcmRzCgotLSAKTWFyZWsgU3p5cHJvd3NraSwgUGhEClNhbXN1bmcgUiZE
IEluc3RpdHV0ZSBQb2xhbmQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
