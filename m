Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB40CD8C85
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Nov 2025 15:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXJOVokGsPNkL8kIEZKYj7DESXFEhOPfx6bYVIrzWrs=; b=M+wTuS6qIqfnsI
	hTrrIsaTcHsqC0ZdtnxcrBAd+d4wym4KuZRzf5j/7ydgo2E2eV2a6C8yHudGCN8zGazQx+97qG509
	oFLmrBt3Q0uafXamAmvWhupfTvRgo2U+B0AzNF0g6oJ0qx0XCNMu4dUwMfj00ZmA4S493hAdGiTMM
	Vzei7Dfnat0tt4ATQh7eZLzj+K4LioTGypGMeeoO6LAX0qRbIcjmfbBiuVZgmy/BIUYlUQE2+8cts
	3c1D5dpik1CYlhPCqAlwXtGdoNpYf+mp/4mlKbhgYWqQwqKgNYReu+LRW9iZWlaGJiLuiIIg0dVJT
	R/lx9xIN2xEpZ+rSPQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZJQ-0000000AjDB-2xGh;
	Thu, 13 Nov 2025 15:32:40 +0000
Received: from out-177.mta0.migadu.com ([2001:41d0:1004:224b::b1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJZJM-0000000AjB2-0BQC
	for linux-mtd@lists.infradead.org;
	Thu, 13 Nov 2025 15:32:37 +0000
Message-ID: <3f415ff1-834e-4544-a093-dcb4fd25d5c9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763047937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xbfnACF5OTG+C22l5VOv6/tW6U39u4VS9uuFSVlj28M=;
	b=nrVDHH0JXKy1x6XMICO/SM2U1WPndKvVMdCPswy7SV0uuTgfLfRi/4fyvij+HH7K3TlbB/
	7voKQ8Ftz5yo+WcxScG5yq+NMeZUoaT7k5I4zN6B2qwKf13hZyoiEZUehJ5OeGSm3RFg9D
	ABZhBX2EsB9sUb5v9N5hee8lF7qwnxE=
Date: Thu, 13 Nov 2025 10:32:05 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q00a
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
References: <20251006223409.3475001-1-sean.anderson@linux.dev>
 <mafs0ecreontu.fsf@kernel.org>
 <4888cefa-e8be-4f0d-9d4a-c82f9ff6cda0@linux.dev>
 <mafs05xcpo9sz.fsf@kernel.org>
 <26a795ac-e6ff-4363-a8b9-38793a9be794@linux.dev>
 <mafs0ikgnn07u.fsf@kernel.org>
 <d00d42ce-4262-4736-8c73-5d2544e86d33@linux.dev>
 <33cbbac1-c247-4644-b555-998eea6e8305@linaro.org>
 <92e99a96-5582-48a5-a4f9-e9b33fcff171@linux.dev> <871pm3iegf.fsf@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <871pm3iegf.fsf@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_073236_291507_95C8B1E8 
X-CRM114-Status: GOOD (  20.20  )
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

T24gMTEvMTIvMjUgMDg6MTAsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8gU2VhbiwKPiAK
Pj4gIyBmbGFzaF9sb2NrIC11IC9kZXYvbXRkL2J5LW5hbWUvc3BpMC4xCj4+ICMgZmxhc2hfbG9j
ayAtaSAvZGV2L210ZC9ieS1uYW1lL3NwaTAuMQo+PiBEZXZpY2U6IC9kZXYvbXRkL2J5LW5hbWUv
c3BpMC4xCj4+IFN0YXJ0OiAwCj4+IExlbjogMHg4MDAwMDAwCj4+IExvY2sgc3RhdHVzOiB1bmxv
Y2tlZAo+PiBSZXR1cm4gY29kZTogMAo+PiAjIHRlc3QoKSB7Cj4+PiBtdGQ9L2Rldi9tdGQvYnkt
bmFtZS8kMQo+Pj4gc3RhcnQ9JCgoJDIgKiA2NCAqIDEwMjQpKQo+Pj4gc2l6ZT0kKCgkMyAqIDY0
ICogMTAyNCkpCj4+PiBkZCBpZj0vZGV2L3VyYW5kb20gb2Y9JDEgYnM9NjRrIGNvdW50PSQzIHN0
YXR1cz1ub25lICYmIFwKPj4+IG10ZF9kZWJ1ZyBlcmFzZSAkbXRkICRzdGFydCAkc2l6ZSAmJiBc
Cj4+PiBtdGRfZGVidWcgd3JpdGUgJG10ZCAkc3RhcnQgJHNpemUgJDEgJiYgXAo+Pj4gZGQgaWY9
JG10ZCBicz02NGsgc2tpcD0kMiBjb3VudD0kMyBzdGF0dXM9bm9uZSB8IHNoYTI1NnN1bSAkMSAt
ICYmIFwKPj4+IHJtICQxCj4+PiB9Cj4gCj4gSSBhbSBhbHNvIHdvcmtpbmcgb24gbG9ja2luZyB0
aGVzZSBkYXlzLCBoYXZlIHlvdSBhbHJlYWR5IHN0YXJ0ZWQKPiB3cml0aW5nIGV4dHJhIFNQSSBO
T1IgRG9jdW1lbnRhdGlvbi9wcm9jZXNzIGJhc2VkIG9uIHRoaXMgdGhyZWFkPwoKSSBoYXZlbid0
IHN0YXJ0ZWQgd3JpdGluZyBhbnl0aGluZy4KCj4gSSBhbSBhbHNvIHRyeWluZyB0byBjbGFyaWZ5
IHdoYXQgaXMgZXhwZWN0ZWQgYW5kIHdoYXQgdGhlIEFQSSBzb21laG93Cj4gZG9lcywgYXMgaXQg
d2FzIG5vdCBmdWxseSBjbGVhciBmb3IgbWUgYXQgZmlyc3Qgc2lnaHQuCgpJIGFncmVlLCBhcyB5
b3UgY291bGQgcHJvYmFibHkgaGF2ZSBmaWd1cmVkIG91dC4KCj4+ICMgZmxhc2hfbG9jayAtdSAv
ZGV2L210ZC9ieS1uYW1lL3NwaTAuMQo+PiAjIHRlc3Qgc3BpMC4xIDY0Cj4+IDgzYThkYzYxMjVl
Yzk2NzJkMThmN2YxOGY5MmUxNmY4NjczNTRkYmU4ZTJmM2IwYWNhNTJiOWQwYWQ3ZDhmZmUgIHNw
aTAuMQo+PiA4M2E4ZGM2MTI1ZWM5NjcyZDE4ZjdmMThmOTJlMTZmODY3MzU0ZGJlOGUyZjNiMGFj
YTUyYjlkMGFkN2Q4ZmZlICAtCj4+ICMgZmxhc2hfbG9jayAtbCAvZGV2L210ZC9ieS1uYW1lL3Nw
aTAuMSAkKCgxMDI0ICogNjQgKiAxMDI0KSkgMTAyNAo+PiAjIGZsYXNoX2xvY2sgLWkgL2Rldi9t
dGQvYnktbmFtZS9zcGkwLjEgCj4+IERldmljZTogL2Rldi9tdGQvYnktbmFtZS9zcGkwLjEKPj4g
U3RhcnQ6IDAKPj4gTGVuOiAweDgwMDAwMDAKPj4gTG9jayBzdGF0dXM6IHVubG9ja2VkIDw8PDwg
V3JvbmchCj4gCj4gVGhpcyBpc24ndCB3cm9uZywgZXZlbiB0aG91Z2ggYXQgYSBmaXJzdCBnbGFu
Y2UgdGhlIG91dHB1dCBpcwo+IG1pc2xlYWRpbmcuIFRoZSBBUEkgYXBwYXJlbnRseSBkb2VzIG5v
dCBnaXZlcyB5b3UgYWxsIHRoZQo+IGxvY2tlZC91bmxvY2tlZCBzZWN0b3JzLCBpdCBpcyB3YXkg
bW9yZSBiYXNpYyB0aGFuIHRoYXQ6IGl0IHRlbGxzIHlvdQo+IHdoZXRoZXIgdGhlIGZ1bGwgcmFu
Z2UgeW91IGFza2VkIGZvciBpcyBpbmRlZWQgbG9ja2VkLgoKWWVhaCwgSSBmaWd1cmVkIHRoYXQg
b3V0IGV2ZW50dWFsbHkuCgpBY3R1YWxseSwgdGhlIG1vc3Qgc3VycHJpc2luZyB0aGluZyB0byBt
ZSBpcyB0aGF0IHRoZSBsb2NrL3VubG9jayBBUElzCmFyZSBub3QgaW5jcmVtZW50YWwuIFRoYXQg
aXMsIGlmIEkgaGF2ZSBhIGZsYXNoIG9mIDggc2Vjb25kcywgYW5kCnNlY3RvcnMgMC0zIGFyZSBs
b2NrZWQgYW5kIEkgbG9jayBzZWN0b3JzIDAtMSwgaXQgd2lsbCBzYXkgIndlbGwsCnNlY3RvcnMg
Mi0zIHNob3VsZCBiZSB1bmxvY2tlZCBub3csIGJ1dCB3ZSdyZSBub3QgYWxsb3dlZCB0byB1bmxv
Y2sKZHVyaW5nIGEgbG9jayBvcGVyYXRpb24iIGFuZCBmYWlsIHRvIGxvY2suIEkgd291bGQgaGF2
ZSBleHBlY3RlZCBpdCB0bwpzYXkgInNlY3RvcnMgMC0xIGFyZSBhbHJlYWR5IGxvY2tlZCBzbyB3
ZSBkb24ndCBuZWVkIHRvIGRvIGFueXRoaW5nIi4KVGhlIG9ubHkgd2F5IHRvIGdvIGZyb20gc2Vj
dG9ycyAwLTMgdG8gMC0xIGJlaW5nIGxvY2tlZCBpcyB0byBpc3N1ZSBhbgoqdW5sb2NrKiBvbiBz
ZWN0b3JzIDItNy4KCkNvbnZlcnNlbHksIGlmIHdoYXQgeW91IHdhbnRlZCB0byBkbyB3YXMgZW5z
dXJlIHNlY3RvcnMgMi0zIHdlcmUKdW5sb2NrZWQsIHlvdSBjYW4ndCBkbyB0aGUgbmFpdmUgdGhp
bmcgYW5kIHVubG9jayBzZWN0b3JzIDItMywgc2luY2UKdGhhdCB3aWxsIHRyeSB0byBsb2NrIHNl
Y3RvcnMgMC0xIGFuZCA0LTcsIHRoZSBsYXR0ZXIgYmVpbmcgZGlzYWxsb3dlZAppbiBhbiB1bmxv
Y2sgb3BlcmF0aW9uLiBTbyB5b3UgYWN0dWFsbHkgaGF2ZSB0byB1bmxvY2sgc2VjdG9ycyAyLTcu
CgpBbmQga25vd2luZyB3aGF0IHRvIGRvIGlzIGNvbXBsaWNhdGVkIGJ5IElTTE9DS0VEIG9ubHkg
cmV0dXJuaW5nIGEKYm9vbGVhbiBpbnN0ZWFkIG9mIGp1c3QgdGVsbGluZyB1c2Vyc3BhY2Ugd2hh
dCBzZWN0b3JzIGFyZSBsb2NrZWQgKHdoaWNoCm11c3QgYmUgYSBzbWFsbCBmaW5pdGUgc2V0IG9m
IHJhbmdlcyAodXN1YWxseSBvbmUpIG9uIGFsbCBmbGFzaGVzIEknbQpmYW1pbGlhciB3aXRoKS4K
Cj4gV2hlbiB5b3UgcnVuICIjIGZsYXNoX2xvY2sgLWkgL2Rldi9tdGQvYnktbmFtZS9zcGkwLjEi
LCB5b3UgcHJpdmlkZSBubwo+IHN0YXJ0L2xlbmd0aCB2YWx1ZXMgdG8gdGhlIGNvbW1hbmQuIEhl
bmNlLCB0aGUgZGVmYXVsdHMgYXJlIHBpY2tlZDogdGhlCj4gZW50aXJlIGRldmljZSBpcyBjb25z
aWRlcmVkIGZvciB0aGUgY2hlY2suIFRoZSB0b29sIGFza3MgdGhlIGtlcm5lbAo+IHdoZXRoZXIg
dGhlIHJhbmdlIDAtMHg3ZmZmZmZmIGlzICpmdWxseSogbG9ja2VkLiBBbnN3ZXIgaXMgbm8sIGl0
IGlzIG5vdAo+IGZ1bGx5IGxvY2tlZC4KPiAKPiBJbiB0aGUga2VybmVsIHRoZXJlIGFyZSB0d28g
aGVscGVycyBmb3IgdGhhdCwgYW5kIHRoZXkgd29uJ3QgZ2l2ZSB5b3UKPiBvcHBvc2l0ZSByZXN1
bHRzIGFsbCB0aGUgdGltZToKPiAtIGlzIGxvY2tlZDoKPiAgICAgLSByZXR1cm5zIHRydWUgaWYg
dGhlIGdpdmVuIHJhbmdlIGlzIGZ1bGx5IGxvY2tlZAo+ICAgICAtIHJldHVybnMgZmFsc2Ugb3Ro
ZXJ3aXNlCj4gLSBpcyB1bmxvY2tlZDoKPiAgICAgLSByZXR1cm5zIHllcyBpZiB0aGUgZ2l2ZW4g
cmFuZ2UgaXMgZnVsbHkgdW5sb2NrZWQKPiAgICAgLSByZXR1cm5zIGZhbHNlIG90aGVyd2lzZQo+
IAo+IFNvIGlmIHlvdSB3YW50IHRoZSB0b29sIHRvIHRlbGwgeW91ICJ5ZXMiLCB5b3Ugc2hvdWxk
IGluc3RlYWQgdXNlIHRoZQo+IGV4YWN0IHJhbmdlIHlvdSBsb2NrZWQgKDEwMjQtMjA0Nykgb3Ig
YW55IHN1YnNldCBvZiBpdC4KPiAKPiBUaGFua3MsIE1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
