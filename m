Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD3DCA0FE1
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 01:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFbl5XAH5XDzMdf4ew1bzNTG8t/od06oomQhAmwma3I=; b=nGz4ePYBVVWlyFU38peyFDck+D
	dnzasvPHdk+4YZZybKRMjdjZ0VRcYWA9c3vzZmqGcYSUve3N1LIcI863lIFlha5E/l/X/tQwmRtD6
	x+5tvciWtHJLND8dqS9Js67IIyEg8cL79ZrT2/lDNWkvSGRcTSduLovR+zl6B3Le1rPEO6JNo+FWK
	SokJWnuV5D0zOHRuPHsQ/gYt04PKQn4IN+g7uoOhVn03WJ6SuRk1zqIS3/Su6r4PAp4mEo4/ptB6A
	w+9KTXDxW3uWSiQLknh5+i8L94T12a6olDxd127lhlTUhif34TGLc4B4o6a/TPxBfNWP+cAmcJvrT
	D025mlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbshM-00GCkc-0D;
	Fri, 01 Sep 2023 01:11:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbshH-00GCgr-1f
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 01:11:42 +0000
Received: from kwepemm600013.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RcKgt4KVxzrS8m;
	Fri,  1 Sep 2023 09:09:46 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Fri, 1 Sep 2023 09:11:27 +0800
Subject: Re: [PATCH] ubi: Reject device with erasesize 0
To: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, Yu Hao <yhao016@ucr.edu>
References: <20230831111100.26862-1-jack@suse.cz>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <742eaa4e-3b74-5dc5-cf0a-71940b945133@huawei.com>
Date: Fri, 1 Sep 2023 09:11:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20230831111100.26862-1-jack@suse.cz>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_181139_905925_B0CCC386 
X-CRM114-Status: GOOD (  17.53  )
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyMy84LzMxIDE5OjExLCBKYW4gS2FyYSDQtLXAOgpIaSBKYW4sCj4gSW4gcHJpbmNpcGxl
IE1URCBkZXZpY2Ugd2l0aCBlcmFzZXNpemUgMCBjYW4gZXhpc3QgYW5kIGl0IGlzIHBvc3NpYmxl
IHRvCj4gY3JlYXRlIHRoZW0gZS5nLiB2aWEgS1ZNLiBJZiB0aGF0IGhhcHBlbnMgVUJJIGxheWVy
IGN1cnJlbnRseSBjcmFzaGVzCj4gd2l0aDoKPiAKPiB1Ymk3OiBhdHRhY2hpbmcgbXRkMTQ3Cj4g
ZGl2aWRlIGVycm9yOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgS0FTQU4KPiBDUFU6IDAgUElEOiAy
MDAyMyBDb21tOiBzeXotZXhlY3V0b3IuMCBOb3QgdGFpbnRlZCA2LjIuMCAjNgo+IEhhcmR3YXJl
IG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYpLCBCSU9TCj4gMS4x
My4wLTF1YnVudHUxLjEgMDQvMDEvMjAxNAo+IFJJUDogMDAxMDptdGRfZGl2X2J5X2ViIGluY2x1
ZGUvbGludXgvbXRkL210ZC5oOjU4MCBbaW5saW5lXQo+IFJJUDogMDAxMDppb19pbml0IGRyaXZl
cnMvbXRkL3ViaS9idWlsZC5jOjYyMCBbaW5saW5lXQo+IFJJUDogMDAxMDp1YmlfYXR0YWNoX210
ZF9kZXYrMHg3N2YvMHgyZmUwIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jOjk1NQo+IENvZGU6IGZj
IGZmIGRmIDQ4IGMxIGVhIDAzIDBmIGI2IDE0IDAyIDRjIDg5IGYwIDgzIGUwIDA3IDgzIGMwIDAz
IDM4Cj4gZDAgN2MgMDggODQgZDIgMGYgODUgMWYgMjUgMDAgMDAgNDEgOGIgNGMgMjQgMTAgNDgg
ODkgZDggMzEgZDIgPDQ4PiBmNwo+IGYxIDQ4IDg5IGMzIGU4IGI2IGYzIDFiIGZjIDQ4IDhkIDg1
IDQwIDE3IDAwIDAwIDQ4IDg5IGMyIDQ4Cj4gUlNQOiAwMDE4OmZmZmZjOTAwMGJlMGZkMzAgRUZM
QUdTOiAwMDAxMDI0Ngo+IFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAw
MDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwCj4gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogZmZm
Zjg4ODA0N2E0OWQ0MCBSREk6IDAwMDAwMDAwMDAwMDAwMDIKPiBSQlA6IGZmZmY4ODgwMjRlMWMw
MDAgUjA4OiAwMDAwMDAwMDAwMDAwMDE2IFIwOTogZmZmZmY1MjAwMTdjMWY0Nwo+IFIxMDogZmZm
ZmM5MDAwYmUwZmEzNyBSMTE6IGZmZmZmNTIwMDE3YzFmNDYgUjEyOiBmZmZmODg4MDY1NDVhMDAw
Cj4gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZjg4ODA2NTQ1YTAxMCBSMTU6IDAwMDAw
MDAwMDAwMDAwMDcKPiBGUzogIDAwMDA3ZmQ0NWU4NWM3MDAoMDAwMCkgR1M6ZmZmZjg4ODAyY2Ew
MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwCj4gQ1M6ICAwMDEwIERTOiAwMDAwIEVT
OiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+IENSMjogMDAwMDdmNjRhZWVmNTNhNCBDUjM6
IDAwMDAwMDAwNGYzOWEwMDAgQ1I0OiAwMDAwMDAwMDAwMzUwZWYwCj4gQ2FsbCBUcmFjZToKPiAg
IDxUQVNLPgo+ICAgY3RybF9jZGV2X2lvY3RsKzB4MzAzLzB4M2EwIGRyaXZlcnMvbXRkL3ViaS9j
ZGV2LmM6MTA0Mwo+ICAgdmZzX2lvY3RsIGZzL2lvY3RsLmM6NTEgW2lubGluZV0KPiAgIF9fZG9f
c3lzX2lvY3RsIGZzL2lvY3RsLmM6ODcwIFtpbmxpbmVdCj4gICBfX3NlX3N5c19pb2N0bCBmcy9p
b2N0bC5jOjg1NiBbaW5saW5lXQo+ICAgX194NjRfc3lzX2lvY3RsKzB4MTk4LzB4MjEwIGZzL2lv
Y3RsLmM6ODU2Cj4gICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo1MCBb
aW5saW5lXQo+ICAgZG9fc3lzY2FsbF82NCsweDM1LzB4YjAgYXJjaC94ODYvZW50cnkvY29tbW9u
LmM6ODAKPiAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDYzLzB4Y2QKPiAKPiBI
YW5kbGUgc3VjaCBkZXZpY2VzIGdyYWNlZnVsbHkgYW5kIGp1c3QgcmVqZWN0IGF0dGFjaGluZyBV
QkkgdG8gdGhlbQo+IGluc3RlYWQgb2YgY3Jhc2hpbmcuCj4gCj4gUmVwb3J0ZWQtYnk6IFl1IEhh
byA8eWhhbzAxNkB1Y3IuZWR1Pgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9D
QStVQmN0RHNIUnBrTEc1cHBkaXVWOE1zbjREeC1aSjJ4RHJ4ZmE0OFZNYjdaRSt4QkFAbWFpbC5n
bWFpbC5jb20KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+IC0tLQo+
ICAgZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMgfCAzICsrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQo+IAo+IEl0IGRvZXNuJ3Qgc2VlbSB0aGUgZGlzY3Vzc2lvbiBsaW5rZWQg
YWJvdmUgY29uY2x1ZGVkIGluIGEgcGF0Y2guIFNvIGlzCj4gYW55dGhpbmcgd3Jvbmcgd2l0aCB0
aGUgdHJpdmlhbCBhcHByb2FjaCBoZXJlIHNvIHRoYXQgd2UgY2FuIGNsb3NlIHRoZSBpc3N1ZT8K
ClRoZXJlIHdhcyBhIHBhdGNoLCBzZWUgCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9saW51eC1tdGQvcGF0Y2gvMjAyMzA0MjMxMTEwNDEuNjg0Mjk3LTEtY2hlbmd6aGloYW8x
QGh1YXdlaS5jb20vCgoKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvdWJpL2J1aWxkLmMg
Yi9kcml2ZXJzL210ZC91YmkvYnVpbGQuYwo+IGluZGV4IDhiOTFhNTVlYzBkMi4uNjg0MjczZTEz
ZWZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL3ViaS9idWlsZC5jCj4gKysrIGIvZHJpdmVy
cy9tdGQvdWJpL2J1aWxkLmMKPiBAQCAtNjEzLDYgKzYxMyw5IEBAIHN0YXRpYyBpbnQgaW9faW5p
dChzdHJ1Y3QgdWJpX2RldmljZSAqdWJpLCBpbnQgbWF4X2JlYl9wZXIxMDI0KQo+ICAgCWlmICh1
YmktPnZpZF9oZHJfb2Zmc2V0IDwgMCkKPiAgIAkJcmV0dXJuIC1FSU5WQUw7Cj4gICAKPiArCWlm
ICh1YmktPm10ZC0+ZXJhc2VzaXplID09IDApCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAg
CS8qCj4gICAJICogTm90ZSwgaW4gdGhpcyBpbXBsZW1lbnRhdGlvbiB3ZSBzdXBwb3J0IE1URCBk
ZXZpY2VzIHdpdGggMHg3RkZGRkZGRgo+ICAgCSAqIHBoeXNpY2FsIGVyYXNlYmxvY2tzIG1heGlt
dW0uCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
