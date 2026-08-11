Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3AEC5AD55
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 01:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9F3X7vO5cJCHalTxQ6e1zqNhhc9UYpUi2aAPcvrPfI=; b=AKbU3z5PAlZ3YC
	tXwGSLLpuldccnaRDliUjrqIWjA0Jg4+3xsmQZe9EcQqVdZnfSl6p4bLB6oI8b4HqbgpB6Dr1Q01I
	EruWGkfMJ+IprD/3JRgpaBW02Ee1pO4xj6JEZ2e+6O6wQpaC5IJVo/cLNvApiRRopw/JGCH9eHALq
	Nw8mo2h55j0bxGzBdTP2ZcoHZAfXr2RSkL8v0Vf1/FV5bZ8TNSfyJAzbliNu4fbuDpjbh0HOioNjv
	OrPsXahn1/rwcLdHNSsiODV2pEbNJfWmj0rMsKJb9GMZVRB/jikP7IFPbMaKzNzkx8fbyFiCqpHdg
	T15j+iwZnXa6u1ldP0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbBw-0000000D6xP-3TTe;
	Tue, 11 Aug 2026 01:22:08 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbBt-0000000D6wR-16CJ
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 01:22:08 +0000
X-UUID: 080800a8952311f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:c600b0a6-fe8d-4c78-b556-1cde846ed6ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:395547c42267a1cff929c43d641eb569,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|52,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 080800a8952311f1aa26b74ffac11d73-20260811
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 340642740; Tue, 11 Aug 2026 09:21:51 +0800
Message-ID: <11afb109-ddcb-4481-b4b2-9d9dca7f31a9@kylinos.cn>
Date: Tue, 11 Aug 2026 09:21:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>,
 syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, syzkaller-bugs@googlegroups.com,
 vigneshr@ti.com, Fabian Frederick <fabf@skynet.be>
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
 <ankxaiwtTltL0xMj@cashel.logfs.org> <ann719YIqopUBCv5@cashel.logfs.org>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <ann719YIqopUBCv5@cashel.logfs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_182206_000974_E320D8BF 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

CgrlnKggMjAyNi84LzExIDAwOjI3LCBKw7ZybiBFbmdlbCDlhpnpgZM6Cj4gT24gU3VuLCBBdWcg
MDksIDIwMjYgYXQgMDc6MDM6MjJQTSAtMDcwMCwgSsO2cm4gRW5nZWwgd3JvdGU6Cj4+Cj4+IEJl
c3QgZ3Vlc3Mgd291bGQgYmUgdGhpczoKPj4KPj4gCWlmICgobG9uZylzaXplICUgZXJhc2Vfc2l6
ZSkgewo+IAo+IFdoaWxlIGF0IGl0LCB3aGF0IHB1cnBvc2UgZG9lcyB0aGUgY2FzdCB0byAobG9u
Zykgc2VydmU/Cj4gCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwgaXQgaXMgdXNlbGVzcyBhbmQgc2hv
dWxkIGJlIHJlbW92ZWQuICBGYWJpYW4sIGRvCj4geW91IHJlbWVtYmVyIHdoeSBpdCB3YXMgbmVj
ZXNzYXJ5PwpUaGUgdHlwZSBvZiBzaXplIGlzIGxvZmZfdCAoaS5lLiwgbG9uZyBsb25nLCB3aGlj
aCBpcyBhbHdheXMgNjQtYml0KS4KQ2FzdGluZyBpdCB0byAobG9uZylzaXplIG9uIGEgMzItYml0
IHN5c3RlbSB3b3VsZCB0cnVuY2F0ZSBpdCB0byBhCjMyLWJpdCBsb25nLCBzbyBpdCBzZWVtcyB0
aGlzIGxvbmcgY2FzdCBuZWVkcyB0byBiZSByZW1vdmVkLgpJdCdzIGJlZW4gMTIgeWVhcnMuLiBJ
IHdvbmRlciBpZiB0aGUgYXV0aG9yIHN0aWxsIHJlbWVtYmVycy4KClBlaS4KPiAKPiBKw7Zybgo+
IAo+IC0tCj4gVGhlIHJlYWwgdm95YWdlIG9mIGRpc2NvdmVyeSBjb25zaXN0cyBub3QgaW4gc2Vl
a2luZyBuZXcgbGFuZHNjYXBlcywKPiBidXQgaW4gaGF2aW5nIG5ldyBleWVzLgo+IC0tIE1hcmNl
bCBQcm91c3QKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
