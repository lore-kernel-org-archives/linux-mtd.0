Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A68AC5AD55
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 03:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESnW+tU5Wl3P2b3/mLm09QhGSl+H9KYDiN4jjQOQ5us=; b=b7mg7jM8jMH87z
	+QJD70Sv7/0/7Z32gk/x3/cNzLESaVrTsudqZHQhBjtjgs88TcCqp3nOMdOt9xF6dq5i5wjIusw28
	UWyE4VHVjAJ7bbtLE5evxCirJd37C/YMoCKYtHow/N82SBgeHzOGdePAhZcQX6/H99bar24lDRK0L
	xYNXvaE/qMlVCQf1EvQYmw4Y0DR8uL9sc98GlAoTYTCiPytCAOqb2HpGi1iGvLWpo1lvGehahHVVW
	ye886CxRbvgTyE0RoIUaEEbYyc+2AhT99qKpvNdzTnpJtr591u5jp2ox/1yLRJL14IruQdYpZ04Cz
	VVFZ7R63PAlul6APvgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtclb-0000000DCJG-3G4Q;
	Tue, 11 Aug 2026 03:03:03 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtclZ-0000000DCIu-1QPJ
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 03:03:02 +0000
X-UUID: 26f7cdf0953111f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8c1247a5-3f74-41a5-abd0-2592716be547,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7a5901f6422c9cbc13adb769584ce2d6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|52,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 26f7cdf0953111f1aa26b74ffac11d73-20260811
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1146900479; Tue, 11 Aug 2026 11:02:56 +0800
Message-ID: <bbbff0ba-09c4-49dc-9aac-371c0c7d6902@kylinos.cn>
Date: Tue, 11 Aug 2026 11:02:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>,
 syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>,
 joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at,
 syzkaller-bugs@googlegroups.com, vigneshr@ti.com
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
 <ankxaiwtTltL0xMj@cashel.logfs.org>
 <29397db9-7db4-4969-bb0e-5bb71f0c0303@kylinos.cn>
 <87se4mqhc3.fsf@bootlin.com>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <87se4mqhc3.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_200301_694824_59344348 
X-CRM114-Status: UNSURE (   7.70  )
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

CgrlnKggMjAyNi84LzEwIDIwOjQwLCBNaXF1ZWwgUmF5bmFsIOWGmemBkzoKPiBIaSBQZWksCj4g
Cj4+PiBCZXN0IGd1ZXNzIHdvdWxkIGJlIHRoaXM6Cj4+Pgo+Pj4gCWlmICgobG9uZylzaXplICUg
ZXJhc2Vfc2l6ZSkgewo+Pj4KPj4+IFNvbWVvbmUgcGFzc2luZyBhbiBlcmFzZV9zaXplIG9mIDAg
d291bGQgaW5kZWVkIHRyaWdnZXIgYW4gZXhjZXB0aW9uLgo+Pj4gRml4IHdvdWxkIGJlIHNvbWV0
aGluZyBsaWtlIHRoaXM6Cj4+Pgo+Pj4gLQlpZiAoKGxvbmcpc2l6ZSAlIGVyYXNlX3NpemUpIHsK
Pj4+ICsJaWYgKCFlcmFzZV9zaXplIHx8IChsb25nKXNpemUgJSBlcmFzZV9zaXplKSB7Cj4+Pgo+
Pj4gSSBoYXZlbid0IHRvdWNoZWQgdGhlIGNvZGUgaXMgbmVhcmx5IHR3byBkZWNhZGVzLiAgSWYg
c29tZWJvZHkgZWxzZQo+Pj4gZmVlbHMgbGlrZSBzZW5kaW5nIGEgcGF0Y2ggYW5kIGdhdGhlcmlu
ZyBhbGwgdGhlIGdsb3J5LCBwbGVhc2UgYmUgbXkKPj4+IGd1ZXN0IQo+PiBUaGFuayB5b3UgZm9y
IHlvdXIgY29udHJpYnV0aW9uLiBJIGhhdmUgc2VudCB0aGlzIHBhdGNoLCBidXQgSSBmb3Jnb3Qg
dG8KPj4gYWRkIHRoZSBTdWdnZXN0ZWQtYnk6IHRhZwo+IAo+IFlvdSBhcmUgaW52aXRlZCB0byBz
ZW5kIGEgdjIgd2l0aCB0aGUgc2FpZCB0YWcgOikKVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5LiBJ
IGFtIHdhaXRpbmcgZm9yIGEgcmVwbHkgb24gd2hldGhlciB0aGUgY2FzdApvbiAnbG9uZycgbmVl
ZHMgdG8gYmUgcmVtb3ZlZC4gT25jZSB0aGF0IGlzIGNvbmZpcm1lZCwgSSB3b3VsZCBiZSBoYXBw
eQp0byBkbyBpdC4gVGhhbmsgeW91LgoKUGVpLgo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
