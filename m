Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E07AC47258
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jan 2024 04:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=425CU4xWyK31fd+3jVAbDCNnGpSMHmgBFp3xkyLK3sE=; b=pF7wST30AgpdWo3BkvqoiNQSMY
	kCTMIsyZFMQvGKkjShLikQDLkhXHU6XtQU7D3wWgcyFJ+h3P9VhJ7qvpykgu6KTL4fde9nxDobD7k
	7n2gdED8BEX/K6JDtkNb83L+ygmDOYIIvJ2GlKUDWtvl2DWq9UB0UM4udolBGBRIwlzRun4teo7sM
	xrU8xUWQ+EDiF5t20j9murfO4WGx52AIS+bJOoZMaoyOr0WpkuUf4pLg8sxyXuXotgEjjeXcLNbu+
	jmxP8n7yaUuHb0qiYJqW+OCALhmmbWW4zzqtzoVibjUyhBNkS5PaQjxHOOFriJkOazv3+q9+ocN2y
	l8fqzrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8ZZ-00F4f7-2w;
	Tue, 23 Jan 2024 04:39:41 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS8ZV-00F4dp-0g
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jan 2024 04:39:39 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4TJvVN45zpz1xmXF;
	Tue, 23 Jan 2024 12:38:36 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id A3A1B1402CF;
	Tue, 23 Jan 2024 12:39:27 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 12:39:27 +0800
Subject: Re: [PATCH 09/15] ubifs: Convert ubifs_write_end() to use a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-10-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <cb68632e-e813-4c42-0cdc-b68f92a01604@huawei.com>
Date: Tue, 23 Jan 2024 12:39:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240120230824.2619716-10-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_203937_888079_E6ECCC88 
X-CRM114-Status: GOOD (  23.97  )
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

1NogMjAyNC8xLzIxIDc6MDgsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gQ29udmVy
dCB0aGUgaW5jb21pbmcgcGFnZSBwb2ludGVyIHRvIGEgZm9saW8gYW5kIHVzZSBpdCB0aHJvdWdo
b3V0LAo+IHNhdmluZyBzZXZlcmFsIGNhbGxzIHRvIGNvbXBvdW5kX2hlYWQoKS4gIEFsc28gcmVt
b3ZlIHNvbWUgUEFHRV9TSVpFCj4gYXNzdW1wdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0
dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gLS0tCj4gICBmcy91
Ymlmcy9maWxlLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9maWxlLmMgYi9mcy91Ymlmcy9maWxlLmMKPiBpbmRl
eCBlZjI2MjQ5OWYyMjguLjUyMDI3YjRmZWViZiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9maWxl
LmMKPiArKysgYi9mcy91Ymlmcy9maWxlLmMKPiBAQCAtNTMyLDYgKzUzMiw3IEBAIHN0YXRpYyBp
bnQgdWJpZnNfd3JpdGVfZW5kKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFj
ZSAqbWFwcGluZywKPiAgIAkJCSAgIGxvZmZfdCBwb3MsIHVuc2lnbmVkIGxlbiwgdW5zaWduZWQg
Y29waWVkLAo+ICAgCQkJICAgc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmZzZGF0YSkKPiAgIHsK
PiArCXN0cnVjdCBmb2xpbyAqZm9saW8gPSBwYWdlX2ZvbGlvKHBhZ2UpOwo+ICAgCXN0cnVjdCBp
bm9kZSAqaW5vZGUgPSBtYXBwaW5nLT5ob3N0Owo+ICAgCXN0cnVjdCB1Ymlmc19pbm9kZSAqdWkg
PSB1Ymlmc19pbm9kZShpbm9kZSk7Cj4gICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBpbm9kZS0+
aV9zYi0+c19mc19pbmZvOwo+IEBAIC01MzksNDcgKzU0MCw0NyBAQCBzdGF0aWMgaW50IHViaWZz
X3dyaXRlX2VuZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBp
bmcsCj4gICAJaW50IGFwcGVuZGluZyA9ICEhKGVuZF9wb3MgPiBpbm9kZS0+aV9zaXplKTsKPiAg
IAo+ICAgCWRiZ19nZW4oImlubyAlbHUsIHBvcyAlbGx1LCBwZyAlbHUsIGxlbiAldSwgY29waWVk
ICVkLCBpX3NpemUgJWxsZCIsCj4gLQkJaW5vZGUtPmlfaW5vLCBwb3MsIHBhZ2UtPmluZGV4LCBs
ZW4sIGNvcGllZCwgaW5vZGUtPmlfc2l6ZSk7Cj4gKwkJaW5vZGUtPmlfaW5vLCBwb3MsIGZvbGlv
LT5pbmRleCwgbGVuLCBjb3BpZWQsIGlub2RlLT5pX3NpemUpOwo+ICAgCj4gLQlpZiAodW5saWtl
bHkoY29waWVkIDwgbGVuICYmIGxlbiA9PSBQQUdFX1NJWkUpKSB7Cj4gKwlpZiAodW5saWtlbHko
Y29waWVkIDwgbGVuICYmICFmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkpIHsKPiAgIAkJLyoK
PiAtCQkgKiBWRlMgY29waWVkIGxlc3MgZGF0YSB0byB0aGUgcGFnZSB0aGF0IGl0IGludGVuZGVk
IGFuZAo+ICsJCSAqIFZGUyBjb3BpZWQgbGVzcyBkYXRhIHRvIHRoZSBmb2xpbyB0aGFuIGl0IGlu
dGVuZGVkIGFuZAo+ICAgCQkgKiBkZWNsYXJlZCBpbiBpdHMgJy0+d3JpdGVfYmVnaW4oKScgY2Fs
bCB2aWEgdGhlIEBsZW4KPiAtCQkgKiBhcmd1bWVudC4gSWYgdGhlIHBhZ2Ugd2FzIG5vdCB1cC10
by1kYXRlLCBhbmQgQGxlbiB3YXMKPiAtCQkgKiBAUEFHRV9TSVpFLCB0aGUgJ3ViaWZzX3dyaXRl
X2JlZ2luKCknIGZ1bmN0aW9uIGRpZAo+ICsJCSAqIGFyZ3VtZW50LiBJZiB0aGUgZm9saW8gd2Fz
IG5vdCB1cC10by1kYXRlLAo+ICsJCSAqIHRoZSAndWJpZnNfd3JpdGVfYmVnaW4oKScgZnVuY3Rp
b24gZGlkCj4gICAJCSAqIG5vdCBsb2FkIGl0IGZyb20gdGhlIG1lZGlhIChmb3Igb3B0aW1pemF0
aW9uIHJlYXNvbnMpLiBUaGlzCj4gLQkJICogbWVhbnMgdGhhdCBwYXJ0IG9mIHRoZSBwYWdlIGNv
bnRhaW5zIGdhcmJhZ2UuIFNvIHJlYWQgdGhlCj4gLQkJICogcGFnZSBub3cuCj4gKwkJICogbWVh
bnMgdGhhdCBwYXJ0IG9mIHRoZSBmb2xpbyBjb250YWlucyBnYXJiYWdlLiBTbyByZWFkIHRoZQo+
ICsJCSAqIGZvbGlvIG5vdy4KPiAgIAkJICovCj4gICAJCWRiZ19nZW4oImNvcGllZCAlZCBpbnN0
ZWFkIG9mICVkLCByZWFkIHBhZ2UgYW5kIHJlcGVhdCIsCj4gICAJCQljb3BpZWQsIGxlbik7Cj4g
LQkJY2FuY2VsX2J1ZGdldChjLCBwYWdlLCB1aSwgYXBwZW5kaW5nKTsKPiAtCQlDbGVhclBhZ2VD
aGVja2VkKHBhZ2UpOwo+ICsJCWNhbmNlbF9idWRnZXQoYywgJmZvbGlvLT5wYWdlLCB1aSwgYXBw
ZW5kaW5nKTsKPiArCQlmb2xpb19jbGVhcl9jaGVja2VkKGZvbGlvKTsKPiAgIAo+ICAgCQkvKgo+
ICAgCQkgKiBSZXR1cm4gMCB0byBmb3JjZSBWRlMgdG8gcmVwZWF0IHRoZSB3aG9sZSBvcGVyYXRp
b24sIG9yIHRoZQo+ICAgCQkgKiBlcnJvciBjb2RlIGlmICdkb19yZWFkcGFnZSgpJyBmYWlscy4K
PiAgIAkJICovCj4gLQkJY29waWVkID0gZG9fcmVhZHBhZ2UocGFnZSk7Cj4gKwkJY29waWVkID0g
ZG9fcmVhZHBhZ2UoJmZvbGlvLT5wYWdlKTsKPiAgIAkJZ290byBvdXQ7Cj4gICAJfQo+ICAgCj4g
LQlpZiAobGVuID09IFBBR0VfU0laRSkKPiAtCQlTZXRQYWdlVXB0b2RhdGUocGFnZSk7Cj4gKwlp
ZiAobGVuID49IGZvbGlvX3NpemUoZm9saW8pKQo+ICsJCWZvbGlvX21hcmtfdXB0b2RhdGUoZm9s
aW8pOwoKU28gSSB0aGluayAnbGVuID09IGZvbGlvX3NpemUoZm9saW8pJyBpcyByaWdodD8gU2lu
Y2UgbGVuIGlzIHBhc3NlZCBmcm9tIAonYnl0ZXMnIHdoaWNoIGlzIHJlY2FsY3VsYXRlZCBhZnRl
ciB3cml0ZV9iZWdpbjoKICBpZiAoYnl0ZXMgPiBmb2xpb19zaXplKGZvbGlvKSAtIG9mZnNldCkK
ICAgICAgYnl0ZXMgPSBmb2xpb19zaXplKGZvbGlvKSAtIG9mZnNldDsKVGhlICdsZW4nIGNhbid0
IGJlIGdyZWF0ZXIgdGhhbiBmb2xpb19zaXplLgoKPiAgIAo+IC0JaWYgKCFQYWdlUHJpdmF0ZShw
YWdlKSkgewo+IC0JCWF0dGFjaF9wYWdlX3ByaXZhdGUocGFnZSwgKHZvaWQgKikxKTsKPiArCWlm
ICghZm9saW8tPnByaXZhdGUpIHsKPiArCQlmb2xpb19hdHRhY2hfcHJpdmF0ZShmb2xpbywgKHZv
aWQgKikxKTsKPiAgIAkJYXRvbWljX2xvbmdfaW5jKCZjLT5kaXJ0eV9wZ19jbnQpOwo+IC0JCV9f
c2V0X3BhZ2VfZGlydHlfbm9idWZmZXJzKHBhZ2UpOwo+ICsJCWZpbGVtYXBfZGlydHlfZm9saW8o
bWFwcGluZywgZm9saW8pOwo+ICAgCX0KPiAgIAo+ICAgCWlmIChhcHBlbmRpbmcpIHsKPiAgIAkJ
aV9zaXplX3dyaXRlKGlub2RlLCBlbmRfcG9zKTsKPiAgIAkJdWktPnVpX3NpemUgPSBlbmRfcG9z
Owo+ICAgCQkvKgo+IC0JCSAqIE5vdGUsIHdlIGRvIG5vdCBzZXQgQElfRElSVFlfUEFHRVMgKHdo
aWNoIG1lYW5zIHRoYXQgdGhlCj4gLQkJICogaW5vZGUgaGFzIGRpcnR5IHBhZ2VzKSwgdGhpcyBo
YXMgYmVlbiBkb25lIGluCj4gLQkJICogJ19fc2V0X3BhZ2VfZGlydHlfbm9idWZmZXJzKCknLgo+
ICsJCSAqIFdlIGRvIG5vdCBzZXQgQElfRElSVFlfUEFHRVMgKHdoaWNoIG1lYW5zIHRoYXQKPiAr
CQkgKiB0aGUgaW5vZGUgaGFzIGRpcnR5IHBhZ2VzKSwgdGhpcyB3YXMgZG9uZSBpbgo+ICsJCSAq
IGZpbGVtYXBfZGlydHlfZm9saW8oKS4KPiAgIAkJICovCj4gICAJCV9fbWFya19pbm9kZV9kaXJ0
eShpbm9kZSwgSV9ESVJUWV9EQVRBU1lOQyk7Cj4gICAJCXViaWZzX2Fzc2VydChjLCBtdXRleF9p
c19sb2NrZWQoJnVpLT51aV9tdXRleCkpOwo+IEBAIC01ODcsOCArNTg4LDggQEAgc3RhdGljIGlu
dCB1Ymlmc193cml0ZV9lbmQoc3RydWN0IGZpbGUgKmZpbGUsIHN0cnVjdCBhZGRyZXNzX3NwYWNl
ICptYXBwaW5nLAo+ICAgCX0KPiAgIAo+ICAgb3V0Ogo+IC0JdW5sb2NrX3BhZ2UocGFnZSk7Cj4g
LQlwdXRfcGFnZShwYWdlKTsKPiArCWZvbGlvX3VubG9jayhmb2xpbyk7Cj4gKwlmb2xpb19wdXQo
Zm9saW8pOwo+ICAgCXJldHVybiBjb3BpZWQ7Cj4gICB9Cj4gICAKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
