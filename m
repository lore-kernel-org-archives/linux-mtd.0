Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C479FC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Oct 2022 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:MIME-Version:Date:
	Message-ID:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRP1l55SKZ764Nw5FyTyzBto9p2+CA4VyuhZ7F9i29U=; b=unATDIiZsWTBVB2t78+v/7Fp1a
	HRlR/HalDfIgl75yi4W8xff/O6uv3cmGdOF+vz7OIE5RLz/XdesMriAVNyfRXrllI8R/dTEH8AgW0
	uBgvGOYIupZWmv4rYhIRXygrcPoc7rakvMaSbryjf6Pqm4BBadCtO7nQmcrTwBHLx4LpxZurauQQL
	VY/ph00rQtgak/Ku9dV2rjc0jxrBnSC/p7hsaQcEXV7GMpPU11UMeZhmCvp/SQvMjr1Sldb2yiDyq
	d0ot/5l1CVhMe+rgT3QM/DkOGL5CAMtnu61smwLfPLsgV2SXBhxCzraWF6hwnFMM+XdZ/4gGeEWns
	epJzKdjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRle-00CtUn-OO; Thu, 20 Oct 2022 09:23:10 +0000
Received: from smtp-fw-80006.amazon.com ([99.78.197.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olRej-00CogC-Ct
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2022 09:16:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1666257361; x=1697793361;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=50K2fOMXsk+lwezuCkWwD6hRARUwosKvthRX0IylFyg=;
  b=eJR4fVqWljudjZc8yYBe9TsGF5sY4TH4qM8rw4KiEHaMgv29FsgsFXkq
   jjjiMuDcEV9lZvLuAHHqFIuGIkK9D9QO/rh1Ls2D7Yw7mVWoRjcYBlhCq
   5XrDexJttWjeHdajiPG0LorxdR0Tey0Ae01jTwggLPWrGwMbaf46QfiNz
   E=;
X-IronPort-AV: E=Sophos;i="5.95,198,1661817600"; 
   d="scan'208";a="142228806"
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: micron-st: Enable locking for
 n25q256ax1/mt25qu256a
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO email-inbound-relay-iad-1d-b48bc93b.us-east-1.amazon.com) ([10.25.36.210])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 09:15:50 +0000
Received: from EX13MTAUWB001.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-iad-1d-b48bc93b.us-east-1.amazon.com (Postfix) with ESMTPS id 36EC7C0932;
	Thu, 20 Oct 2022 09:15:46 +0000 (UTC)
Received: from EX19D013UWA004.ant.amazon.com (10.13.138.207) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Thu, 20 Oct 2022 09:15:46 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX19D013UWA004.ant.amazon.com (10.13.138.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.15;
 Thu, 20 Oct 2022 09:15:46 +0000
Received: from [192.168.104.103] (10.85.143.175) by mail-relay.amazon.com
 (10.43.61.243) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Thu, 20 Oct 2022 09:15:42 +0000
Message-ID: <a1411e79-d0ec-31e7-a190-ec2622928070@amazon.com>
Date: Thu, 20 Oct 2022 12:15:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
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
 <01dfdbec-1a1f-6118-23fb-8b8f7b827c82@amazon.com>
 <41a05a89cd30b21dce866bc3209fe836@walle.cc>
Content-Language: en-US
From: "Farber, Eliav" <farbere@amazon.com>
In-Reply-To: <41a05a89cd30b21dce866bc3209fe836@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_021601_526029_37B336D5 
X-CRM114-Status: GOOD (  16.82  )
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

T24gMTAvMTkvMjAyMiAxOjIzIFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+IEFtIDIwMjItMTAt
MTkgMTE6NTIsIHNjaHJpZWIgRmFyYmVyLCBFbGlhdjoKPj4gT24gMTAvMTkvMjAyMiAxMjozOCBQ
TSwgTWljaGFlbCBXYWxsZSB3cm90ZToKPj4+IEFtIDIwMjItMTAtMTkgMTE6MjUsIHNjaHJpZWIg
RmFyYmVyLCBFbGlhdjoKPj4+PiBPbiAxMC8xOS8yMDIyIDExOjIxIEFNLCBNaWNoYWVsIFdhbGxl
IHdyb3RlOgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gQW0gMjAyMi0xMC0xOSAwOToxNiwgc2Nocmll
YiBFbGlhdiBGYXJiZXI6Cj4+Pj4+PiBuMjVxMjU2YXgxIFsxXSBhbmQgbXQyNXF1MjU2YSBbMl0g
KGJvdGggaGF2ZSBzYW1lIGplZGVjX2lkIC0KPj4+Pj4+IDB4MjBiYjE5KQo+Pj4+Pj4gdXNlIHRo
ZSA0IGJpdCBCbG9jayBQcm90ZWN0aW9uIHNjaGVtZSBhbmQgc3VwcG9ydCBUb3AvQm90dG9tCj4+
Pj4+PiBwcm90ZWN0aW9uCj4+Pj4+PiB2aWEgdGhlIEJQIGFuZCBUQiBiaXRzIG9mIHRoZSBTdGF0
dXMgUmVnaXN0ZXIuCj4+Pj4+PiBCUDMgaXMgbG9jYXRlZCBpbiBiaXQgNiBvZiB0aGUgU3RhdHVz
IFJlZ2lzdGVyLgo+Pj4+Pj4gVGVzdGVkIG9uIGJvdGggbjI1cTI1NmF4MSBhbmQgbXQyNXF1MjU2
YS4KPj4+Pj4+Cj4+Pj4+PiBbMV0KPj4+Pj4+IGh0dHBzOi8vd3d3Lm1pY3Jvbi5jb20vLS9tZWRp
YS9jbGllbnQvZ2xvYmFsL2RvY3VtZW50cy9wcm9kdWN0cy9kYXRhLXNoZWV0L25vci1mbGFzaC9z
ZXJpYWwtbm9yL24yNXEvbjI1cV8yNTZtYl8zdi5wZGYgCj4+Pj4+Pgo+Pj4+Pj4gWzJdCj4+Pj4+
PiBodHRwczovL3d3dy5taWNyb24uY29tLy0vbWVkaWEvY2xpZW50L2dsb2JhbC9kb2N1bWVudHMv
cHJvZHVjdHMvZGF0YS1zaGVldC9ub3ItZmxhc2gvc2VyaWFsLW5vci9tdDI1cS9kaWUtcmV2LWEv
bXQyNXFfcWxqc191XzI1Nl9hYmFfMC5wZGYgCj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBJZiB5b3UgcmVz
cGluLCB5b3UgY2FuIHVzZSBhICJMaW5rOiIgdGFnIGZvciB0aGUgVVJMIGFib3ZlLgo+Pj4+Cj4+
Pj4gQWNrLgo+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBFbGlhdiBGYXJiZXIgPGZhcmJlcmVA
YW1hem9uLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4geHhkIC1wCj4+Pj4+PiAvc3lzL2RldmljZXMv
cGxhdGZvcm0vc29jL2ZkODgyMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3Iv
c2ZkcCAKPj4+Pj4+Cj4+Pj4+PiA1MzQ2NDQ1MDA2MDEwMWZmMDAwNjAxMTAzMDAwMDBmZjg0MDAw
MTAyODAwMDAwZmZmZmZmZmZmZmZmZmYKPj4+Pj4+IGZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmU1MjBmYmZmZmZmZmZmMGYyOWViMjc2Ygo+Pj4+Pj4gMjczYjI3YmJmZmZmZmZm
ZmZmZmYyN2JiZmZmZjI5ZWIwYzIwMTBkODBmNTIwMDAwMjQ0YTk5MDA4YjhlCj4+Pj4+PiAwM2Q0
YWMwMTI3Mzg3YTc1N2E3NWZiYmRkNTVjNGEwZjgyZmY4MWJkM2QzNmZmZmZmZmZmZmZmZmZmZmYK
Pj4+Pj4+IGZmZmZmZmZmZmZmZmZmZmZmZmU3ZmZmZjIxZGNmZmZmCj4+Pj4+Pgo+Pj4+Pj4gbWQ1
c3VtCj4+Pj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2ZkODgyMDAwLnNwaS9zcGlfbWFz
dGVyL3NwaTAvc3BpMC4wL3NwaS1ub3Ivc2ZkcCAKPj4+Pj4+Cj4+Pj4+PiA1ZWE3MzgyMTZmNjhj
OWY5ODk4N2JiMzcyNTY5OWEzMgo+Pj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9mZDg4
MjAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGktbm9yL3NmZHAgCj4+Pj4+Pgo+Pj4+
Pj4gY2F0Cj4+Pj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29jL2ZkODgyMDAwLnNwaS9zcGlf
bWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3IvamVkZWNfaWQgCj4+Pj4+Pgo+Pj4+Pj4gMjBiYjE5
MTA0NDAwCj4+Pj4+Pgo+Pj4+Pj4gY2F0Cj4+Pj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vc29j
L2ZkODgyMDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4wL3NwaS1ub3IvcGFydG5hbWUgCj4+
Pj4+Pgo+Pj4+Pj4gbXQyNXF1MjU2YQo+Pj4+Pj4KPj4+Pj4+IGNhdAo+Pj4+Pj4gL3N5cy9kZXZp
Y2VzL3BsYXRmb3JtL3NvYy9mZDg4MjAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3NwaTAuMC9zcGkt
bm9yL21hbnVmYWN0dXJlciAKPj4+Pj4+Cj4+Pj4+PiBzdAo+Pj4+Pgo+Pj4+PiBUaGF0J3MgdGhl
IG10MjVxdTI1NmEgU0ZEUC4gV2hhdCBhYm91dCB0aGUgbjI1cTI1NmF4MT8KPj4+Pgo+Pj4+IE9u
IHRoZSBzYW1lIGNhcmQsIHdpdGggc2FtZSBOT1IgZmxhc2ggbWVtb3J5IEknbSBydW5uaW5nIHR3
bwo+Pj4+IGRpZmZlcmVudAo+Pj4+IGtlcm5lbCB2ZXJzaW9ucy4KPj4+PiBGaXJzdCB2ZXJzaW9u
IGlzIHF1aXRlIG9sZCAtIDQuMTkuMjM5IHdoaWNoIGRvZXMgbm90IHN1cHBvcnQKPj4+PiBtdDI1
cXUyNTZhCj4+Pj4gYW5kIHRoZXJlZm9yZSBkZXZpY2UgaXMgZGV0ZWN0ZWQgYXMgbjI1cTI1NmF4
MS4KPj4+PiBTZWNvbmQgdmVyc2lvbiBpcyA2LjEuMC1yYzEgYW5kIGl0IGRldGVjdHMgdGhlIHNh
bWUgZGV2aWNlIGFzCj4+Pj4gbXQyNXF1MjU2YS4KPj4+PiBTbyBJIHdhcyBhYmxlIHRvIGR1bXAg
U0ZEUCB3aGVuIHJ1bm5pbmcgdmVyc2lvbiA2LjEuMC1yYzEsIGJ1dCBub3QKPj4+PiB3aGVuCj4+
Pj4gcnVubmluZyA0LjE5LjIzOSB3aGljaCBkb2VzIG5vdCBzdXBwb3J0IHRoZSBzeXNmcyB0byBk
dW1wIHRoZSBTRlBECj4+Pj4gaW5mb3JtYXRpb24uCj4+Pj4gSSBjaGVja2VkIHRoYXQgbG9ja2lu
ZyB3b3JrcyB3aXRoIG15IGNoYW5nZXMgd2hlbiBydW5uaW5nIG9uIGJvdGgKPj4+PiBrZXJuZWwK
Pj4+PiB2ZXJzaW9ucy4KPj4+Cj4+PiBTbyB5b3UndmUgb25seSB0ZXN0ZWQgb24gYW4gbXQyNXF1
MjU2YSwgY29ycmVjdD8gVGhlbiB5b3Ugc2hvdWxkIG9ubHkKPj4+IGFkZCB0aGUgbG9ja2luZyB0
byB0aGlzIGZsYXNoIGRldmljZS4gKGFuZCBtYXliZSBiYWNrcG9ydCB0aGUKPj4+IG10MjVxdTI1
NmEKPj4+IHRvIHlvdXIgb2xkZXIga2VybmVsKS4KPj4KPj4gSSBkdW1wZWQgU0ZEUCB0YWJsZXMg
b25seSBmb3IgbXQyNXF1MjU2YSwgYnV0IGFzIEkgbWVudGlvbmVkIEkgdGVzdGVkCj4+IGxvY2tp
bmcgZnVuY3Rpb25hbGl0eSBmb3IgYm90aCAob24gNC4xOS4yMzkgd2hpY2ggZGV0ZWN0cyB0aGUg
ZGV2aWNlIGFzCj4+IG4yNXEyNTZheDEgYW5kIG9uIDYuMS4wLXJjMcKgIHdoaWNoIGRldGVjdHMg
dGhlIGRldmljZSBhcyBtdDI1cXUyNTZhKS4KPj4gVGhpcyBpcyB0aGUgZmxvdyBJIHVzZWQgZm9y
IHRlc3RpbmcgdGhlIGNoYW5nZSBvbiBib3RoIHZlcnNpb25zOgo+Cj4gWW91IHNhaWQgeW91J3Zl
IHRlc3RlZCBvbiB0aGUgc2FtZSBib2FyZCwgdGh1cyBpdCBoYXMgdGhlIHNhbWUgZmxhc2gKPiBk
ZXZpY2UuIEJ1dCB3aXRoIHRoZSBvbGRlciBrZXJuZWwgaXQgd2FzIGRldGVjdGVkIGFzIGEgZGlm
ZmVyZW50IHBhcnQuCj4KPiBTbyB0aGUgcXVlc3Rpb24gaXMsIHdoYXQgaXMgdGhlIGNvcnJlY3Qg
cGFydCBudW1iZXI/IEkuZS4gd2hhdCBpcyB0aGUKPiBfYWN0dWFsXyBmbGFzaCBkZXZpY2Ugc29s
ZGVyZWQgb24geW91ciBib2FyZD8KCkkgaGF2ZSBmb3VuZCBvdXQgdGhhdCB3ZSB1c2UgTVQyNVFV
MjU2QUJBOEVTRi0wU0lUIHNvIEknbGwgcmVsZWFzZSBhCnBhdGNoIGZvciBtdDI1cXUyNTZhIG9u
bHkuCgotLQpUaGFua3MsIEVsaWF2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
