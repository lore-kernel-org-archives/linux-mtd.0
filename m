Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8F5C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jan 2022 10:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uP1fwNeGB681bzRwBz3kG8M9RXe5macOqN+Ae996zW0=; b=LEnpB3jW3Q/NKO
	xexUvMvQW5u5Jg53sic2kX/Dot1k3ULIwKkXaqwhBxPEqNXY3fgpdL9A6YHi0hGP7gQCv3TLNQ0xt
	C7QGW7XEkWj6YuPqUuJttwYvpHjjLpAX5O53IjGWGTR4PsD5Gp8KF1is52VqFl/+JMVZUxuW1f/uf
	+hrW3UT0gldeilLp0D/0a4u/eku+pZxnYdH+BAF3S5WLO+9fPuYEieiB2veRwxJxg5eU6D53Kmz+U
	yU+RDWU2nNGJfpiy67Jnbm9DZA3KUK8tSgrx84BO/ibdVKzqGf5ZmpMbPZqUzWwyr2uSd490S6zn6
	79DH4fUpeS7uF/K6Wb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nETdS-008nKH-1r; Mon, 31 Jan 2022 10:10:10 +0000
Received: from relay05.th.seeweb.it ([5.144.164.166])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nETdO-008nGa-12
 for linux-mtd@lists.infradead.org; Mon, 31 Jan 2022 10:10:08 +0000
Received: from [192.168.1.106] (abxk84.neoplus.adsl.tpnet.pl [83.9.4.84])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 74A3C3F42A;
 Mon, 31 Jan 2022 11:09:55 +0100 (CET)
Message-ID: <0a8d6550-aa19-0af1-abae-66bf34c91ea8@somainline.org>
Date: Mon, 31 Jan 2022 11:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd: nand: raw: qcom_nandc: Don't clear_bam_transaction
 on READID
To: Sricharan Ramabadhran <sricharan@codeaurora.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 jamipkettunen@somainline.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 mdalam@codeaurora.org
References: <20220113184427.2259509-1-konrad.dybcio@somainline.org>
 <20220114082718.32a2fc83@xps13> <20220126111613.3ab0021e@xps13>
 <20220126103316.GA212068@thinkpad> <20220126114200.4cc3c21b@xps13>
 <fc80a6e7-bd44-3b3e-fca2-1316a76d65f5@codeaurora.org>
 <a6fcc533-e7cd-7b55-4db0-cec80c07b46a@codeaurora.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <a6fcc533-e7cd-7b55-4db0-cec80c07b46a@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_021006_303769_18A012A0 
X-CRM114-Status: GOOD (  19.60  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDI4LzAxLzIwMjIgMTg6NTAsIFNyaWNoYXJhbiBSYW1hYmFkaHJhbiB3cm90ZToKPiBIaSBL
b25yYWQsCj4KPiBPbiAxLzI4LzIwMjIgOTo1NSBBTSwgU3JpY2hhcmFuIFJhbWFiYWRocmFuIHdy
b3RlOgo+PiBIaSBNaXF1ZWwsCj4+Cj4+IE9uIDEvMjYvMjAyMiA0OjEyIFBNLCBNaXF1ZWwgUmF5
bmFsIHdyb3RlOgo+Pj4gSGkgTWFuaSwKPj4+Cj4+PiBtYW5pQGtlcm5lbC5vcmcgd3JvdGUgb24g
V2VkLCAyNiBKYW4gMjAyMiAxNjowMzoxNiArMDUzMDoKPj4+Cj4+Pj4gT24gV2VkLCBKYW4gMjYs
IDIwMjIgYXQgMTE6MTY6MTNBTSArMDEwMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4gSGVs
bG8sCj4+Pj4+Cj4+Pj4+IG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20gd3JvdGUgb24gRnJpLCAx
NCBKYW4gMjAyMiAwODoyNzoxOCArMDEwMDoKPj4+Pj4+IEhpIEtvbnJhZCwKPj4+Pj4+Cj4+Pj4+
PiBrb25yYWQuZHliY2lvQHNvbWFpbmxpbmUub3JnIHdyb3RlIG9uIFRodSwgMTMgSmFuIDIwMjIg
MTk6NDQ6MjYgCj4+Pj4+PiArMDEwMDoKPj4+Pj4+PiBXaGlsZSBJIGhhdmUgYWJzb2x1dGVseSAw
IGlkZWEgd2h5IGFuZCBob3csIHJ1bm5pbmcgCj4+Pj4+Pj4gY2xlYXJfYmFtX3RyYW5zYWN0aW9u
Cj4+Pj4+Pj4gd2hlbiBSRUFESUQgaXMgaXNzdWVkIG1ha2VzIHRoZSBETUEgdG90YWxseSBjbG9n
IHVwIGFuZCByZWZ1c2UgCj4+Pj4+Pj4gdG8gZnVuY3Rpb24KPj4+Pj4+PiBhdCBhbGwgb24gbWRt
OTYwNy4gSW4gZmFjdCwgaXQgaXMgc28gYmFkIHRoYXQgYWxsIHRoZSBkYXRhIGdldHMgCj4+Pj4+
Pj4gZ2FyYmxlZAo+Pj4+Pj4+IGFuZCBhZnRlciBhIHNob3J0IHdoaWxlIGluIHRoZSBuYW5kIHBy
b2JlIGZsb3csIHRoZSBDUFUgZGVjaWRlcyAKPj4+Pj4+PiB0aGF0Cj4+Pj4+Pj4gc2VwdWt1IGlz
IHRoZSBvbmx5IG9wdGlvbi4KPj4+Pj4+Pgo+Pj4+Pj4+IFJlbW92aW5nIF9SRUFESUQgZnJvbSB0
aGUgaWYgY29uZGl0aW9uIG1ha2VzIGl0IHdvcmsgbGlrZSBhIAo+Pj4+Pj4+IGNoYXJtLCBJIGNh
bgo+Pj4+Pj4+IHJlYWQgZGF0YSBhbmQgbW91bnQgcGFydGl0aW9ucyB3aXRob3V0IGEgcHJvYmxl
bS4KPj4+Pj4+Pgo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5k
eWJjaW9Ac29tYWlubGluZS5vcmc+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gVGhpcyBpcyB0b3RhbGx5
IGp1c3QgYW4gb2JzZXJ2YXRpb24gd2hpY2ggdG9vayBtZSBhbiBpbmh1bWFuZSAKPj4+Pj4+PiBh
bW91bnQgb2YKPj4+Pj4+PiBkZWJ1ZyBwcmludHMgdG8gZmluZC4uIHBlcmhhcHMgdGhlcmUncyBh
IGJldHRlciByZWFzb24gYmVoaW5kIAo+Pj4+Pj4+IHRoaXMsIGJ1dAo+Pj4+Pj4+IEkgY2FuJ3Qg
c2VlbSB0byBmaW5kIGFueSBhbnN3ZXJzLi4gVGhlcmVmb3JlLCB0aGlzIGlzIGEgQklHIFJGQyEK
Pj4+Pj4+IEknbSBhZGRpbmcgdHdvIHBlb3BsZSBmcm9tIGNvZGVhdXJvcmEgd2hvIHdvcmtlZCBh
IGxvdCBvbiB0aGlzIAo+Pj4+Pj4gZHJpdmVyLgo+Pj4+Pj4gSG9wZWZ1bGx5IHRoZXkgd2lsbCBo
YXZlIGFuIGlkZWEgOikKPj4+Pj4gU2FkcmUsIEkndmUgc3BlbnQgYSBzaWduaWZpY2FudCBhbW91
bnQgb2YgdGltZSByZXZpZXdpbmcgeW91ciAKPj4+Pj4gcGF0Y2hlcywKPj4+Pj4gbm93IGl0J3Mg
eW91ciB0dXJuIHRvIG5vdCB0YWtlIGEgbW9udGggdG8gYW5zd2VyIHRvIHlvdXIgcGVlcnMKPj4+
Pj4gcHJvcG9zYWxzLgo+Pj4+Pgo+Pj4+PiBQbGVhc2UgaGVscCByZXZpZXdpbmcgdGhpcyBwYXRj
aC4KPj4+PiBTb3JyeS4gSSB3YXMgaG9waW5nIHRoYXQgUWNvbSBmb2xrcyB3b3VsZCBjaGltZSBp
biBhcyBJIGRvbid0IGhhdmUgCj4+Pj4gYW55IGlkZWEKPj4+PiBhYm91dCB0aGUgbWRtOTYwNyBw
bGF0Zm9ybS4gSXQgY291bGQgYmUgdGhhdCB0aGUgbWFpbCBzZXJ2ZXIgCj4+Pj4gbWlncmF0aW9u
IGZyb20KPj4+PiBjb2RlYXVyb3JhIHRvIHF1aWNpbmMgcHV0IGEgYmFycmllciBoZXJlLgo+Pj4+
Cj4+Pj4gTGV0IG1lIHBpbmcgdGhlbSBpbnRlcm5hbGx5Lgo+Pj4gT2gsIG9rLCBJIGRpZG4ndCBr
bm93LiBUaGFua3MhCj4+Cj4+IMKgwqAgU29ycnkgTWlxdWVsLCBzb21laG93IHdlIGRpZCBub3Qg
Z2V0IHRoaXMgZW1haWwgaW4gb3VyIGluYm94Lgo+PiDCoMKgIFRoYW5rcyB0byBNYW5pIGZvciBw
aW5naW5nIHVzLCB3ZSB3aWxsIHRlc3QgdGhpcyB1cCB0b2RheSBhbmQgZ2V0IAo+PiBiYWNrLgo+
Pgo+IMKgIMKgIMKgIFdoaWxlIHdlIGNvdWxkIG5vdCByZXByb2R1Y2UgdGhpcyBpc3N1ZSBvbiBv
dXIgaXBxIGJvYXJkcyAoZG8gCj4gbm90IGhhdmUgYSBtZG05NjA3IHJpZ2h0IG5vdykgYW5kCj4g
wqDCoMKgwqDCoMKgIGlzc3VlIGRvZXMgbm90IGxvb2sgYW55IG9idmlvdXMuCj4gwqAgwqAgwqAg
Y2FuIHlvdSBwbGVhc2UgZ2l2ZSB0aGUgZGVidWcgbG9ncyB0aGF0IHlvdSBkaWQgZm9yIHRoZSBh
Ym92ZSAKPiBzdGFnZSBieSBzdGFnZSA/CgpJIHdvbid0IGhhdmUgYWNjZXNzIHRvIHRoZSBib2Fy
ZCBmb3IgYWJvdXQgdHdvIHdlZWtzLCBzb3JyeS4KCldoZW4gSSBnZXQgdG8gaXQsIEknbGwgc3Vy
ZWx5IHRyeSB0byBzZW5kIHlvdSB0aGUgbG9ncywgdGhvdWdoIHRoZXJlCgp3YXNuJ3QgbXVjaCBt
b3JlIHRoYW4ganVzdCBzb21ldGhpbmcganVtcGluZyB0byB3aG8ta25vd3Mtd2hlcmUKCmFmdGVy
IGNsZWFyX2JhbV90cmFuc2FjdGlvbiB3YXMgY2FsbGVkLCByZXN1bHRpbmcgaW4gdmFsdWVzIGFz
c29jaWF0ZWQgd2l0aAoKdGhlIE5BTkQgYmVpbmcgYWxsIHplcm9lZCBvdXQgaW4gcHJfZXJyL19k
ZWJ1Zy9ldGMuCgoKS29ucmFkCgo+Cj4gwqAgUmVnYXJkcywKPiDCoMKgwqDCoMKgIFNyaWNoYXJh
bgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
