Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7795C5AC67
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 01:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUFiqXEEib9sP3oj5zuMoP87f95zjharUjjukS5XHZc=; b=MFw40GmiT8p2LP
	mtSW48wjhAHQQRmojaTKlnhZFO2dBcan+dsGbyxZMwwYDRmCWCvoezwub4vlg9moUHHGzsUyczM1W
	wdTGF8MFuzAPmysLoO1LL9yFPJ2GZBDHMjxTy+2JSwqBO4GR8Vf1BsbfZeTuC83vXP7OsJ3jy9kzy
	wbp7TY4+1yK3AzPjpKVUX3GJfAQ23lCRYUTrn64abLWrqaRm5B5JO4F6ep3wZz4afMbcg2GKNYh1F
	LIZSxGMA3Xqazhfb+qcdZEwm/wh/Qo5RJ7g/uVLuogYnLJYQ8LDQ+f8nJQnyM891Wl8NnvudGNR3A
	7RA/g9Ws5t2OOCpENdpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wty2e-0000000FDk0-0ZK7;
	Wed, 12 Aug 2026 01:46:04 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wty2Z-0000000FDjN-3FwX
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 01:46:02 +0000
X-UUID: 8a1b8eee95ef11f1aa26b74ffac11d73-20260812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b6d0c329-ac53-4cc0-be62-193de3856941,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:7d9e79fc07126134cae3d2a8fec19051,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|136|865|898,TC:nil,Conte
	nt:0|15|52,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8a1b8eee95ef11f1aa26b74ffac11d73-20260812
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1115329211; Wed, 12 Aug 2026 09:45:47 +0800
Message-ID: <29b0eb3f-8d9f-47ba-b0bd-c605a411c0ec@kylinos.cn>
Date: Wed, 12 Aug 2026 09:45:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [mtd?] divide error in block2mtd_setup2
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 syzbot <syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com>,
 joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at,
 syzkaller-bugs@googlegroups.com, vigneshr@ti.com
References: <6a791c94.01d0871a.3a0d52.009b.GAE@google.com>
 <ankxaiwtTltL0xMj@cashel.logfs.org>
 <29397db9-7db4-4969-bb0e-5bb71f0c0303@kylinos.cn>
 <87se4mqhc3.fsf@bootlin.com>
 <bbbff0ba-09c4-49dc-9aac-371c0c7d6902@kylinos.cn>
 <antnynHuZ2W8JmCc@cashel.logfs.org>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <antnynHuZ2W8JmCc@cashel.logfs.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_184600_163414_098734A2 
X-CRM114-Status: GOOD (  14.68  )
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

CgrlnKggMjAyNi84LzEyIDAyOjE5LCBKw7ZybiBFbmdlbCDlhpnpgZM6Cj4gT24gVHVlLCBBdWcg
MTEsIDIwMjYgYXQgMTE6MDI6NTNBTSArMDgwMCwgUGVpIFhpYW8gd3JvdGU6Cj4+Pgo+PiBUaGFu
ayB5b3UgZm9yIHlvdXIgcmVwbHkuIEkgYW0gd2FpdGluZyBmb3IgYSByZXBseSBvbiB3aGV0aGVy
IHRoZSBjYXN0Cj4+IG9uICdsb25nJyBuZWVkcyB0byBiZSByZW1vdmVkLiBPbmNlIHRoYXQgaXMg
Y29uZmlybWVkLCBJIHdvdWxkIGJlIGhhcHB5Cj4+IHRvIGRvIGl0LiBUaGFuayB5b3UuCj4gCj4g
SXQgZG9lc24ndCBuZWVkIHRvIGJlIHJlbW92ZWQsIGJ1dCBpdCBzaG91bGQgYmUgcmVtb3ZlZC4g
IEFueQo+IHVubmVjZXNzYXJ5IGNvZGUgc2hvdWxkIGJlIHJlbW92ZWQgaW4gZ2VuZXJhbCBhbmQg
dW5uZWNlc3NhcnkgY2FzdHMgaW4KPiBwYXJ0aWN1bGFyIHNob3VsZC4KPiAKPiBPbmUgb2YgYmV0
dGVyIHBhcnRzIG9mIHRoZSBDIGxhbmd1YWdlIGlzIHRoYXQgY2FzdHMgYXJlIGhhcmRseSBldmVy
Cj4gbmVjZXNzYXJ5LiAgV2hpY2ggbWVhbnMgdGhhdCBhbnkgcmVtYWluaW5nIG5lY2Vzc2FyeSBj
YXN0cyBzaG91bGQKPiBpbW1lZGlhdGVseSBkcmF3IGF0dGVudGlvbiBvZiB0aGUgcmVhZGVyIC0g
c29tZXRoaW5nIHRyaWNreSBhbmQKPiBwb3RlbnRpYWxseSBkYW5nZXJvdXMgaXMgZ29pbmcgb24g
aGVyZS4KPiAKPiBCdXQgeW91IHN0b3AgcGF5aW5nIGF0dGVudGlvbiB3aGVuIHRoaW5ncyBiZWNv
bWUgdG9vIGNvbW1vbi4gIFdoaWNoCj4gbWVhbnMgdGhhdCB1bm5lY2Vzc2FyeSBjYXN0cyBhcmUg
bm90IGp1c3Qgbm9pc2UsIHRoZXkgYWN0aXZlbHkgZG8gaGFybS4KPiAKPiAKPiBJbiB0aGlzIHBh
cnRpY3VsYXIgY2FzZSwgd2UgY2FuIHNpbXBseSB0ZXN0IHdoZXRoZXIgdGhlIGNhc3QgbWFrZXMg
YW55Cj4gZGlmZmVyZW5jZToKPiAKPiAjaW5jbHVkZSA8YXNzZXJ0Lmg+Cj4gI2luY2x1ZGUgPHN0
ZGlvLmg+Cj4gCj4gaW50IG1haW4odm9pZCkKPiB7Cj4gCWZvciAoaW50IGk9MDsgaTw9MTw8MTY7
IGkrKykgewo+IAkJZm9yIChpbnQgaz0xOyBrPD0xPDwxNjsgaysrKSB7Cj4gCQkJbG9uZyBsb25n
IHNpemUgPSAobG9uZyBsb25nKWkgPDwgMzI7Cj4gCQkJaW50IGVyYXNlX3NpemUgPSBrOwo+IAo+
IAkJCWxvbmcgbG9uZyBhID0gc2l6ZSAlIGVyYXNlX3NpemU7Cj4gCQkJbG9uZyBsb25nIGIgPSAo
bG9uZylzaXplICUgZXJhc2Vfc2l6ZTsKPiAJCQlhc3NlcnQoYT09Yik7Cj4gCQl9Cj4gCX0KPiB9
CkdyZWF0IHRlc3QhIFlvdSdyZSB0cnVseSBwcm9mZXNzaW9uYWwsIGFuZCBJJ3ZlIGxlYXJuZWQg
YSBsb3QuIEknbGwgc2VuZAp0aGUgdjIgcGF0Y2guIFRoYW5rIHlvdSBmb3IgeW91ciBndWlkYW5j
ZS4KClBlaS4KPiAKPiBDb21waWxlIHdpdGggb3B0aW1pemF0aW9ucyBhbmQgdGhlIGNvbXBpbGVy
IGRlY2lkZXMgdG8gcmVtb3ZlIHRoZSBsb29wLgo+IFVubGVzcyB5b3Ugc3VzcGVjdCBhIGNvbXBp
bGVyIGJ1ZywgSSBndWVzcyB0aGF0IHNldHRsZXMgdGhlIHF1ZXN0aW9uLiA7KQo+IAo+IErDtnJu
Cj4gCj4gLS0KPiBTZW1wZXIgdWJpIHN1YiB1YmkgdWJpcXVlLgo+IC0tIGxhdGluIHB1bgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
