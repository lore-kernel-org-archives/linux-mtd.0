Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D2EC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:MIME-Version:Date:
	Message-ID:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+GgHIo3v9P8jPz3wuI2ccdaxi5a0Szsp9vLpR9bkoY=; b=RcFv39isF5zF1kGptOlr6Juwig
	EakYIpDsdYxCo0ZBwawR0xhLFNTBBkmh5bZm4yHyZyhBxMxbkQlbt8GwBiw5wpBTikyL6NU0ppely
	VXk62hHsfxasUFEnwPzevxIvqXlmBK4q1X3BwCicdqbhzKxpKZQ60v1Fh5wqy2iV68ddfd2a0D5hm
	KxNBYeTwOR/xjvnGG0psNHcRcy93Dn9SUDTV7dPfrGvmc4w3Buca7fzpXbth8NV/WD5AWk1PrZOs/
	EBdF2JwfxA4QgG4JIMihuipKvhBbAIrdhkmc8Ei/ErlfRgH3HTwys6JQUdPd4tD/3Trke1SAF+g/m
	iUYYZl3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5kV-00HVb3-KG; Wed, 19 Oct 2022 09:52:31 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5kS-00HVYo-Cv
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 09:52:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1666173149; x=1697709149;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=j3ZIc67EX1Vfhhx7dxQlpeBf7SlEqHwgd2N3XaU4/JE=;
  b=kQzcvJeADfKGK3V/6TgI60qz4tIA900pWIzXjXdAU1ifhnKVjkDJb1vS
   OUKGKYRrbt8XBvj+itBrULKKUiR9rIYNEF4Ws6dv5DDvliD8KXoPwIWSd
   OU05RBGfmKpT3D01IfxLi4RNE4cas20c9tcoXrkA665Qns8zuVc/kMaIt
   I=;
X-IronPort-AV: E=Sophos;i="5.95,195,1661817600"; 
   d="scan'208";a="234267297"
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: micron-st: Enable locking for
 n25q256ax1/mt25qu256a
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-iad-1d-9a235a16.us-east-1.amazon.com) ([10.43.8.6])
  by smtp-border-fw-33001.sea14.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 09:52:18 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1d-9a235a16.us-east-1.amazon.com (Postfix) with ESMTPS id 4D4128020C;
	Wed, 19 Oct 2022 09:52:15 +0000 (UTC)
Received: from EX19D013UWB003.ant.amazon.com (10.13.138.111) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 19 Oct 2022 09:52:14 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX19D013UWB003.ant.amazon.com (10.13.138.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.15;
 Wed, 19 Oct 2022 09:52:14 +0000
Received: from [192.168.160.198] (10.85.143.176) by mail-relay.amazon.com
 (10.43.60.234) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Wed, 19 Oct 2022 09:52:09 +0000
Message-ID: <01dfdbec-1a1f-6118-23fb-8b8f7b827c82@amazon.com>
Date: Wed, 19 Oct 2022 12:52:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: Michael Walle <michael@walle.cc>
CC: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<talel@amazon.com>, <jonnyc@amazon.com>, <hhhawa@amazon.com>,
	<hanochu@amazon.com>, <itamark@amazon.com>, <shellykz@amazon.com>,
	<amitlavi@amazon.com>, <dkl@amazon.com>, "Farber, Eliav" <farbere@amazon.com>
References: <20221019071631.15191-1-farbere@amazon.com>
 <73bfa5ae90e2269387540019806c2839@walle.cc>
 <1ba2e7ff-cf6c-1292-72e0-14b5b5b9282c@amazon.com>
 <f489048bd1fa65db1a050f1321c640de@walle.cc>
Content-Language: en-US
From: "Farber, Eliav" <farbere@amazon.com>
In-Reply-To: <f489048bd1fa65db1a050f1321c640de@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_025228_496995_59F32EE7 
X-CRM114-Status: GOOD (  16.97  )
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

T24gMTAvMTkvMjAyMiAxMjozOCBQTSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBBbSAyMDIyLTEw
LTE5IDExOjI1LCBzY2hyaWViIEZhcmJlciwgRWxpYXY6Cj4+IE9uIDEwLzE5LzIwMjIgMTE6MjEg
QU0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+PiBBbSAyMDIyLTEwLTE5IDA5
OjE2LCBzY2hyaWViIEVsaWF2IEZhcmJlcjoKPj4+PiBuMjVxMjU2YXgxIFsxXSBhbmQgbXQyNXF1
MjU2YSBbMl0gKGJvdGggaGF2ZSBzYW1lIGplZGVjX2lkIC0KPj4+PiAweDIwYmIxOSkKPj4+PiB1
c2UgdGhlIDQgYml0IEJsb2NrIFByb3RlY3Rpb24gc2NoZW1lIGFuZCBzdXBwb3J0IFRvcC9Cb3R0
b20KPj4+PiBwcm90ZWN0aW9uCj4+Pj4gdmlhIHRoZSBCUCBhbmQgVEIgYml0cyBvZiB0aGUgU3Rh
dHVzIFJlZ2lzdGVyLgo+Pj4+IEJQMyBpcyBsb2NhdGVkIGluIGJpdCA2IG9mIHRoZSBTdGF0dXMg
UmVnaXN0ZXIuCj4+Pj4gVGVzdGVkIG9uIGJvdGggbjI1cTI1NmF4MSBhbmQgbXQyNXF1MjU2YS4K
Pj4+Pgo+Pj4+IFsxXQo+Pj4+IGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vLS9tZWRpYS9jbGllbnQv
Z2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25vci1mbGFzaC9zZXJpYWwtbm9y
L24yNXEvbjI1cV8yNTZtYl8zdi5wZGYgCj4+Pj4KPj4+PiBbMl0KPj4+PiBodHRwczovL3d3dy5t
aWNyb24uY29tLy0vbWVkaWEvY2xpZW50L2dsb2JhbC9kb2N1bWVudHMvcHJvZHVjdHMvZGF0YS1z
aGVldC9ub3ItZmxhc2gvc2VyaWFsLW5vci9tdDI1cS9kaWUtcmV2LWEvbXQyNXFfcWxqc191XzI1
Nl9hYmFfMC5wZGYgCj4+Pj4KPj4+Cj4+PiBJZiB5b3UgcmVzcGluLCB5b3UgY2FuIHVzZSBhICJM
aW5rOiIgdGFnIGZvciB0aGUgVVJMIGFib3ZlLgo+Pgo+PiBBY2suCj4+Cj4+Pj4gU2lnbmVkLW9m
Zi1ieTogRWxpYXYgRmFyYmVyIDxmYXJiZXJlQGFtYXpvbi5jb20+Cj4+Pj4gLS0tCj4+Pj4geHhk
IC1wCj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZDg4MjAwMC5zcGkvc3BpX21hc3Rl
ci9zcGkwL3NwaTAuMC9zcGktbm9yL3NmZHAgCj4+Pj4KPj4+PiA1MzQ2NDQ1MDA2MDEwMWZmMDAw
NjAxMTAzMDAwMDBmZjg0MDAwMTAyODAwMDAwZmZmZmZmZmZmZmZmZmYKPj4+PiBmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZlNTIwZmJmZmZmZmZmZjBmMjllYjI3NmIKPj4+PiAy
NzNiMjdiYmZmZmZmZmZmZmZmZjI3YmJmZmZmMjllYjBjMjAxMGQ4MGY1MjAwMDAyNDRhOTkwMDhi
OGUKPj4+PiAwM2Q0YWMwMTI3Mzg3YTc1N2E3NWZiYmRkNTVjNGEwZjgyZmY4MWJkM2QzNmZmZmZm
ZmZmZmZmZmZmZmYKPj4+PiBmZmZmZmZmZmZmZmZmZmZmZmZlN2ZmZmYyMWRjZmZmZgo+Pj4+Cj4+
Pj4gbWQ1c3VtCj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZDg4MjAwMC5zcGkvc3Bp
X21hc3Rlci9zcGkwL3NwaTAuMC9zcGktbm9yL3NmZHAgCj4+Pj4KPj4+PiA1ZWE3MzgyMTZmNjhj
OWY5ODk4N2JiMzcyNTY5OWEzMgo+Pj4+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZmQ4ODIw
MDAuc3BpL3NwaV9tYXN0ZXIvc3BpMC9zcGkwLjAvc3BpLW5vci9zZmRwIAo+Pj4+Cj4+Pj4gY2F0
Cj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZDg4MjAwMC5zcGkvc3BpX21hc3Rlci9z
cGkwL3NwaTAuMC9zcGktbm9yL2plZGVjX2lkIAo+Pj4+Cj4+Pj4gMjBiYjE5MTA0NDAwCj4+Pj4K
Pj4+PiBjYXQKPj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2ZkODgyMDAwLnNwaS9zcGlf
bWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3IvcGFydG5hbWUgCj4+Pj4KPj4+PiBtdDI1cXUyNTZh
Cj4+Pj4KPj4+PiBjYXQKPj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2ZkODgyMDAwLnNw
aS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3IvbWFudWZhY3R1cmVyIAo+Pj4+Cj4+Pj4g
c3QKPj4+Cj4+PiBUaGF0J3MgdGhlIG10MjVxdTI1NmEgU0ZEUC4gV2hhdCBhYm91dCB0aGUgbjI1
cTI1NmF4MT8KPj4KPj4gT24gdGhlIHNhbWUgY2FyZCwgd2l0aCBzYW1lIE5PUiBmbGFzaCBtZW1v
cnkgSSdtIHJ1bm5pbmcgdHdvIGRpZmZlcmVudAo+PiBrZXJuZWwgdmVyc2lvbnMuCj4+IEZpcnN0
IHZlcnNpb24gaXMgcXVpdGUgb2xkIC0gNC4xOS4yMzkgd2hpY2ggZG9lcyBub3Qgc3VwcG9ydCBt
dDI1cXUyNTZhCj4+IGFuZCB0aGVyZWZvcmUgZGV2aWNlIGlzIGRldGVjdGVkIGFzIG4yNXEyNTZh
eDEuCj4+IFNlY29uZCB2ZXJzaW9uIGlzIDYuMS4wLXJjMSBhbmQgaXQgZGV0ZWN0cyB0aGUgc2Ft
ZSBkZXZpY2UgYXMKPj4gbXQyNXF1MjU2YS4KPj4gU28gSSB3YXMgYWJsZSB0byBkdW1wIFNGRFAg
d2hlbiBydW5uaW5nIHZlcnNpb24gNi4xLjAtcmMxLCBidXQgbm90IHdoZW4KPj4gcnVubmluZyA0
LjE5LjIzOSB3aGljaCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBzeXNmcyB0byBkdW1wIHRoZSBTRlBE
Cj4+IGluZm9ybWF0aW9uLgo+PiBJIGNoZWNrZWQgdGhhdCBsb2NraW5nIHdvcmtzIHdpdGggbXkg
Y2hhbmdlcyB3aGVuIHJ1bm5pbmcgb24gYm90aAo+PiBrZXJuZWwKPj4gdmVyc2lvbnMuCj4KPiBT
byB5b3UndmUgb25seSB0ZXN0ZWQgb24gYW4gbXQyNXF1MjU2YSwgY29ycmVjdD8gVGhlbiB5b3Ug
c2hvdWxkIG9ubHkKPiBhZGQgdGhlIGxvY2tpbmcgdG8gdGhpcyBmbGFzaCBkZXZpY2UuIChhbmQg
bWF5YmUgYmFja3BvcnQgdGhlIG10MjVxdTI1NmEKPiB0byB5b3VyIG9sZGVyIGtlcm5lbCkuIAoK
SSBkdW1wZWQgU0ZEUCB0YWJsZXMgb25seSBmb3IgbXQyNXF1MjU2YSwgYnV0IGFzIEkgbWVudGlv
bmVkIEkgdGVzdGVkCmxvY2tpbmcgZnVuY3Rpb25hbGl0eSBmb3IgYm90aCAob24gNC4xOS4yMzkg
d2hpY2ggZGV0ZWN0cyB0aGUgZGV2aWNlIGFzCm4yNXEyNTZheDEgYW5kIG9uIDYuMS4wLXJjMcKg
IHdoaWNoIGRldGVjdHMgdGhlIGRldmljZSBhcyBtdDI1cXUyNTZhKS4KVGhpcyBpcyB0aGUgZmxv
dyBJIHVzZWQgZm9yIHRlc3RpbmcgdGhlIGNoYW5nZSBvbiBib3RoIHZlcnNpb25zOgoKIyBmbGFz
aF9sb2NrIC1pIC9kZXYvbXRkMApmRGV2aWNlOiAvZGV2L210ZDAKU3RhcnQ6IDAKbExlbjogMHgx
MDAwMDAwCkxvY2sgc3RhdHVzOiB1bmxvY2tlZApSZXR1cm4gY29kZTogMAojIGZsYXNoX2xvY2sg
LWwgL2Rldi9tdGQwCiMgZmxhc2hfbG9jayAtaSAvZGV2L210ZDAKZkRldmljZTogL2Rldi9tdGQw
ClN0YXJ0OiAwCkxlbjogMHgxMDAwMDAwCkxvY2sgc3RhdHVzOiBsb2NrZWQKUmV0dXJuIGNvZGU6
IDEKIyBmbGFzaF9sb2NrIC11IC9kZXYvbXRkMAojIGZsYXNoX2xvY2sgLWkgL2Rldi9tdGQwCkRl
dmljZTogL2Rldi9tdGQwClN0YXJ0OiAwCkxlbjogMHgxMDAwMDAwCkxvY2sgc3RhdHVzOiB1bmxv
Y2tlZAoKRG8geW91IHN0aWxsIHdhbnQgdGhpcyBwYXRjaCB0byBjaGFuZ2Ugb25seSBtdDI1cXUy
NTZhPwoKLS0KUmVnYXJkcywgRWxpYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
