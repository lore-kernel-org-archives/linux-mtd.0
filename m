Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEB6C4707B
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Jan 2024 03:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSPrXYRbZnTrzfppF3wbyuSXqK1lpGOAGw1ZIJRKlSY=; b=x9nVu10sRAOf/g
	KCNbNBifL701PGdLHqYlwc7k0s4g6VxOpEluOTILTtY74vn3+idkR7GjQKE1Eu9XbOWEFaB153KH+
	r7xGf4jAM4fzJqas5MpOxxCfEAi5vnl46lxqdiujk0bLolVq0A1/mxFYTI7gtYB7XxNoJIZRwLVN/
	lmwg/TvLXGmnmG35RG3buavz8YzsBGjrOZ9s1OX5+fGZ9ipzfNfn5im8bkaEp7RU6hJ9S9ifra9Ox
	47mt7DAPdAnCep48pm/ObqS8yXiS41AsXgC2jyNHaKXh8CalfJ9BiBRTgLDELJtVLAv+VRcmP6TQu
	XNdCTjMHG+0OJ57r5qMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNldx-00FbUM-0I;
	Thu, 11 Jan 2024 03:22:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNldt-00FbS7-0D
	for linux-mtd@lists.infradead.org;
	Thu, 11 Jan 2024 03:22:07 +0000
X-UUID: 7ba693d7b893478cb3666b0f55a16ff9-20240111
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:d96497ca-ea87-411e-bb5f-78c71e7f1c5d,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-5
X-CID-INFO: VERSION:1.1.35,REQID:d96497ca-ea87-411e-bb5f-78c71e7f1c5d,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:7fb4b882-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:2401111121497VF3I11C,BulkQuantity:0,Recheck:0,SF:64|66|24|17|19|44|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 7ba693d7b893478cb3666b0f55a16ff9-20240111
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 405513473; Thu, 11 Jan 2024 11:21:48 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 09549E000EB9;
	Thu, 11 Jan 2024 11:21:48 +0800 (CST)
X-ns-mid: postfix-659F5ECB-954882627
Received: from [172.20.15.234] (unknown [172.20.15.234])
	by mail.kylinos.cn (NSMail) with ESMTPA id 82634E000EB9;
	Thu, 11 Jan 2024 11:21:46 +0800 (CST)
Message-ID: <cc9b456f-31f6-46f0-a6e6-f553779a775b@kylinos.cn>
Date: Thu, 11 Jan 2024 11:21:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubifs: Remove unreachable code
Content-Language: en-US
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: richard@nod.at, Artem.Bityutskiy@nokia.com, kunwu.chan@hotmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231111143314.1518314-1-chentao@kylinos.cn>
 <CAFLxGvzAncnBTEbHZ0pA-oF6n9P+wKFMugz8c+8UQKoPeBiYig@mail.gmail.com>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <CAFLxGvzAncnBTEbHZ0pA-oF6n9P+wKFMugz8c+8UQKoPeBiYig@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_192205_493093_73AA8610 
X-CRM114-Status: GOOD (  12.36  )
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

CgpPbiAyMDI0LzEvNSAyMzo1NSwgUmljaGFyZCBXZWluYmVyZ2VyIHdyb3RlOgo+IE9uIFNhdCwg
Tm92IDExLCAyMDIzIGF0IDM6MzPigK9QTSBLdW53dSBDaGFuIDxjaGVudGFvQGt5bGlub3MuY24+
IHdyb3RlOgo+Pgo+PiBCZWNhdXNlIHRoZXJlIGlzIG5vIGJyZWFrIHN0YXRlbWVudCBpbiB0aGUg
ZGVhZCBsb29wIGFib3ZlLGl0IGlzCj4+IGltcG9zc2libGUgdG8gZXhlY3V0ZSB0aGUgJ2Vycj0w
JyBzdGF0ZW1lbnQuRGVsZXRlIHRoZSBjb2RlIHRoYXQKPj4gd2lsbCBuZXZlciBleGVjdXRlIGFu
ZCBpbml0aWFsaXplICdlcnInIGF0IHRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24uCj4+Cj4+IEZp
eGVzOiA2ZmIzMjRhNGIwYzMgKCJVQklGUzogYWxsb2NhdGUgbHRhYiBjaGVja2luZyBidWZmZXIg
b24gZGVtYW5kIikKPj4gU2lnbmVkLW9mZi1ieTogS3Vud3UgQ2hhbiA8Y2hlbnRhb0BreWxpbm9z
LmNuPgo+PiAtLS0KPj4gICBmcy91Ymlmcy9scHRfY29tbWl0LmMgfCA1ICsrLS0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2ZzL3ViaWZzL2xwdF9jb21taXQuYyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+PiBp
bmRleCBjNGQwNzkzMjhiOTIuLmQ0NzUxNjI4ZmU3MCAxMDA2NDQKPj4gLS0tIGEvZnMvdWJpZnMv
bHB0X2NvbW1pdC5jCj4+ICsrKyBiL2ZzL3ViaWZzL2xwdF9jb21taXQuYwo+PiBAQCAtMTU4OSw4
ICsxNTg5LDggQEAgc3RhdGljIGludCBkYmdfaXNfbm9kZV9kaXJ0eShzdHJ1Y3QgdWJpZnNfaW5m
byAqYywgaW50IG5vZGVfdHlwZSwgaW50IGxudW0sCj4+ICAgICovCj4+ICAgc3RhdGljIGludCBk
YmdfY2hlY2tfbHRhYl9sbnVtKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSkKPj4gICB7
Cj4+IC0gICAgICAgaW50IGVyciwgbGVuID0gYy0+bGViX3NpemUsIGRpcnR5ID0gMCwgbm9kZV90
eXBlLCBub2RlX251bSwgbm9kZV9sZW47Cj4+IC0gICAgICAgaW50IHJldDsKPj4gKyAgICAgICBp
bnQgbGVuID0gYy0+bGViX3NpemUsIGRpcnR5ID0gMCwgbm9kZV90eXBlLCBub2RlX251bSwgbm9k
ZV9sZW47Cj4+ICsgICAgICAgaW50IHJldCwgZXJyID0gMDsKPj4gICAgICAgICAgdm9pZCAqYnVm
LCAqcDsKPiAKPiBOb3cgaXQgaXMgc3RpbGwgZGVhZCBjb2RlLgo+IEEgZmV3IGxpbmVzIGxhdGVy
IGVyciB3aWxsIGJlIHVzZWQgZm9yIHRoZSByZXN1bHQgb2YgdWJpZnNfbGViX3JlYWQoKS4KPiBT
byB5b3UgY2FuIHJlbW92ZSB0aGUgaW5pdGlhbGl6YXRpb24gb2YgZXJyIGNvbXBsZXRlbHkuCgpU
aGFua3MsIEkgd2lsbCBtb2RpZnkgaW4gdjIgcGF0Y2guCgo+IAo+PiAgICAgICAgICBpZiAoIWRi
Z19pc19jaGtfbHByb3BzKGMpKQo+PiBAQCAtMTY0Niw3ICsxNjQ2LDYgQEAgc3RhdGljIGludCBk
YmdfY2hlY2tfbHRhYl9sbnVtKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBpbnQgbG51bSkKPj4gICAg
ICAgICAgICAgICAgICBsZW4gLT0gbm9kZV9sZW47Cj4+ICAgICAgICAgIH0KPj4KPj4gLSAgICAg
ICBlcnIgPSAwOwo+PiAgIG91dDoKPj4gICAgICAgICAgdmZyZWUoYnVmKTsKPj4gICAgICAgICAg
cmV0dXJuIGVycjsKPj4gLS0KPj4gMi4zNC4xCj4+Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
