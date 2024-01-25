Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49789C46CD2
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Jan 2024 01:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDvEio3ZIQzud/vriQUaNmr2NwTPo/jth7imzm2ZTYQ=; b=KKhbZpdoJclUJyAzNN2WMKaiaZ
	1UDcoYSr4D5qZb1ki13w6bwCX+K882IwBeUIpQoWdOJGWJeB+CqOdee+Elm76pdZm85V75+p/CNXI
	iQ1ZmkLFnnPw5Tq6tAnlhL/7rYxf/oTYSuZBr+YZMcCLxOSTubf9SmINSXO82QPGnVJheKrmxyIjD
	iri2sj+7YaWxoz1fwGuAq+DZLmyvgccSVb4uw298g7wKElCWf18wfWm1I2istuTKDp43kLvpPkrRe
	tfQy+NY62MUlgQMUt+9tlEeK13hWz+tactd8ICzrXg2I83e01m13ifMHwXcHfUZZinQvoMoj2Zi29
	OJ/cnjiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSotN-005r1h-38;
	Thu, 25 Jan 2024 01:50:58 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSotJ-005r11-1u
	for linux-mtd@lists.infradead.org;
	Thu, 25 Jan 2024 01:50:56 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TL3dx0B9ZzhZMf;
	Thu, 25 Jan 2024 09:49:09 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id E4E4E1400DB;
	Thu, 25 Jan 2024 09:50:41 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jan 2024 09:50:41 +0800
Subject: Re: [PATCH v2 09/15] ubifs: Convert ubifs_write_end() to use a folio
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, Richard Weinberger
	<richard@nod.at>
CC: <linux-mtd@lists.infradead.org>
References: <20240124175302.1750912-1-willy@infradead.org>
 <20240124175302.1750912-10-willy@infradead.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <618d805c-aebb-562c-d844-e3b07323807a@huawei.com>
Date: Thu, 25 Jan 2024 09:50:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240124175302.1750912-10-willy@infradead.org>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_175053_989703_6B1195CD 
X-CRM114-Status: GOOD (  23.39  )
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

1NogMjAyNC8xLzI1IDE6NTIsIE1hdHRoZXcgV2lsY294IChPcmFjbGUpINC0tcA6Cj4gQ29udmVy
dCB0aGUgaW5jb21pbmcgcGFnZSBwb2ludGVyIHRvIGEgZm9saW8gYW5kIHVzZSBpdCB0aHJvdWdo
b3V0LAo+IHNhdmluZyBzZXZlcmFsIGNhbGxzIHRvIGNvbXBvdW5kX2hlYWQoKS4gIEFsc28gcmVt
b3ZlIHNvbWUgUEFHRV9TSVpFCj4gYXNzdW1wdGlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0
dGhldyBXaWxjb3ggKE9yYWNsZSkgPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gLS0tCj4gICBmcy91
Ymlmcy9maWxlLmMgfCA0MSArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoK
UmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cgo+IAo+
IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9maWxlLmMgYi9mcy91Ymlmcy9maWxlLmMKPiBpbmRleCAx
M2MwNzhiZGYxNTYuLmZlYWI5NWI1OWIwNSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9maWxlLmMK
PiArKysgYi9mcy91Ymlmcy9maWxlLmMKPiBAQCAtNTMwLDYgKzUzMCw3IEBAIHN0YXRpYyBpbnQg
dWJpZnNfd3JpdGVfZW5kKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3QgYWRkcmVzc19zcGFjZSAq
bWFwcGluZywKPiAgIAkJCSAgIGxvZmZfdCBwb3MsIHVuc2lnbmVkIGxlbiwgdW5zaWduZWQgY29w
aWVkLAo+ICAgCQkJICAgc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmZzZGF0YSkKPiAgIHsKPiAr
CXN0cnVjdCBmb2xpbyAqZm9saW8gPSBwYWdlX2ZvbGlvKHBhZ2UpOwo+ICAgCXN0cnVjdCBpbm9k
ZSAqaW5vZGUgPSBtYXBwaW5nLT5ob3N0Owo+ICAgCXN0cnVjdCB1Ymlmc19pbm9kZSAqdWkgPSB1
Ymlmc19pbm9kZShpbm9kZSk7Cj4gICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBpbm9kZS0+aV9z
Yi0+c19mc19pbmZvOwo+IEBAIC01MzcsNDcgKzUzOCw0NyBAQCBzdGF0aWMgaW50IHViaWZzX3dy
aXRlX2VuZChzdHJ1Y3QgZmlsZSAqZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcs
Cj4gICAJaW50IGFwcGVuZGluZyA9ICEhKGVuZF9wb3MgPiBpbm9kZS0+aV9zaXplKTsKPiAgIAo+
ICAgCWRiZ19nZW4oImlubyAlbHUsIHBvcyAlbGx1LCBwZyAlbHUsIGxlbiAldSwgY29waWVkICVk
LCBpX3NpemUgJWxsZCIsCj4gLQkJaW5vZGUtPmlfaW5vLCBwb3MsIHBhZ2UtPmluZGV4LCBsZW4s
IGNvcGllZCwgaW5vZGUtPmlfc2l6ZSk7Cj4gKwkJaW5vZGUtPmlfaW5vLCBwb3MsIGZvbGlvLT5p
bmRleCwgbGVuLCBjb3BpZWQsIGlub2RlLT5pX3NpemUpOwo+ICAgCj4gLQlpZiAodW5saWtlbHko
Y29waWVkIDwgbGVuICYmIGxlbiA9PSBQQUdFX1NJWkUpKSB7Cj4gKwlpZiAodW5saWtlbHkoY29w
aWVkIDwgbGVuICYmICFmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkpIHsKPiAgIAkJLyoKPiAt
CQkgKiBWRlMgY29waWVkIGxlc3MgZGF0YSB0byB0aGUgcGFnZSB0aGF0IGl0IGludGVuZGVkIGFu
ZAo+ICsJCSAqIFZGUyBjb3BpZWQgbGVzcyBkYXRhIHRvIHRoZSBmb2xpbyB0aGFuIGl0IGludGVu
ZGVkIGFuZAo+ICAgCQkgKiBkZWNsYXJlZCBpbiBpdHMgJy0+d3JpdGVfYmVnaW4oKScgY2FsbCB2
aWEgdGhlIEBsZW4KPiAtCQkgKiBhcmd1bWVudC4gSWYgdGhlIHBhZ2Ugd2FzIG5vdCB1cC10by1k
YXRlLCBhbmQgQGxlbiB3YXMKPiAtCQkgKiBAUEFHRV9TSVpFLCB0aGUgJ3ViaWZzX3dyaXRlX2Jl
Z2luKCknIGZ1bmN0aW9uIGRpZAo+ICsJCSAqIGFyZ3VtZW50LiBJZiB0aGUgZm9saW8gd2FzIG5v
dCB1cC10by1kYXRlLAo+ICsJCSAqIHRoZSAndWJpZnNfd3JpdGVfYmVnaW4oKScgZnVuY3Rpb24g
ZGlkCj4gICAJCSAqIG5vdCBsb2FkIGl0IGZyb20gdGhlIG1lZGlhIChmb3Igb3B0aW1pemF0aW9u
IHJlYXNvbnMpLiBUaGlzCj4gLQkJICogbWVhbnMgdGhhdCBwYXJ0IG9mIHRoZSBwYWdlIGNvbnRh
aW5zIGdhcmJhZ2UuIFNvIHJlYWQgdGhlCj4gLQkJICogcGFnZSBub3cuCj4gKwkJICogbWVhbnMg
dGhhdCBwYXJ0IG9mIHRoZSBmb2xpbyBjb250YWlucyBnYXJiYWdlLiBTbyByZWFkIHRoZQo+ICsJ
CSAqIGZvbGlvIG5vdy4KPiAgIAkJICovCj4gICAJCWRiZ19nZW4oImNvcGllZCAlZCBpbnN0ZWFk
IG9mICVkLCByZWFkIHBhZ2UgYW5kIHJlcGVhdCIsCj4gICAJCQljb3BpZWQsIGxlbik7Cj4gLQkJ
Y2FuY2VsX2J1ZGdldChjLCBwYWdlLCB1aSwgYXBwZW5kaW5nKTsKPiAtCQlDbGVhclBhZ2VDaGVj
a2VkKHBhZ2UpOwo+ICsJCWNhbmNlbF9idWRnZXQoYywgJmZvbGlvLT5wYWdlLCB1aSwgYXBwZW5k
aW5nKTsKPiArCQlmb2xpb19jbGVhcl9jaGVja2VkKGZvbGlvKTsKPiAgIAo+ICAgCQkvKgo+ICAg
CQkgKiBSZXR1cm4gMCB0byBmb3JjZSBWRlMgdG8gcmVwZWF0IHRoZSB3aG9sZSBvcGVyYXRpb24s
IG9yIHRoZQo+ICAgCQkgKiBlcnJvciBjb2RlIGlmICdkb19yZWFkcGFnZSgpJyBmYWlscy4KPiAg
IAkJICovCj4gLQkJY29waWVkID0gZG9fcmVhZHBhZ2UocGFnZSk7Cj4gKwkJY29waWVkID0gZG9f
cmVhZHBhZ2UoJmZvbGlvLT5wYWdlKTsKPiAgIAkJZ290byBvdXQ7Cj4gICAJfQo+ICAgCj4gLQlp
ZiAobGVuID09IFBBR0VfU0laRSkKPiAtCQlTZXRQYWdlVXB0b2RhdGUocGFnZSk7Cj4gKwlpZiAo
bGVuID09IGZvbGlvX3NpemUoZm9saW8pKQo+ICsJCWZvbGlvX21hcmtfdXB0b2RhdGUoZm9saW8p
Owo+ICAgCj4gLQlpZiAoIVBhZ2VQcml2YXRlKHBhZ2UpKSB7Cj4gLQkJYXR0YWNoX3BhZ2VfcHJp
dmF0ZShwYWdlLCAodm9pZCAqKTEpOwo+ICsJaWYgKCFmb2xpby0+cHJpdmF0ZSkgewo+ICsJCWZv
bGlvX2F0dGFjaF9wcml2YXRlKGZvbGlvLCAodm9pZCAqKTEpOwo+ICAgCQlhdG9taWNfbG9uZ19p
bmMoJmMtPmRpcnR5X3BnX2NudCk7Cj4gLQkJX19zZXRfcGFnZV9kaXJ0eV9ub2J1ZmZlcnMocGFn
ZSk7Cj4gKwkJZmlsZW1hcF9kaXJ0eV9mb2xpbyhtYXBwaW5nLCBmb2xpbyk7Cj4gICAJfQo+ICAg
Cj4gICAJaWYgKGFwcGVuZGluZykgewo+ICAgCQlpX3NpemVfd3JpdGUoaW5vZGUsIGVuZF9wb3Mp
Owo+ICAgCQl1aS0+dWlfc2l6ZSA9IGVuZF9wb3M7Cj4gICAJCS8qCj4gLQkJICogTm90ZSwgd2Ug
ZG8gbm90IHNldCBASV9ESVJUWV9QQUdFUyAod2hpY2ggbWVhbnMgdGhhdCB0aGUKPiAtCQkgKiBp
bm9kZSBoYXMgZGlydHkgcGFnZXMpLCB0aGlzIGhhcyBiZWVuIGRvbmUgaW4KPiAtCQkgKiAnX19z
ZXRfcGFnZV9kaXJ0eV9ub2J1ZmZlcnMoKScuCj4gKwkJICogV2UgZG8gbm90IHNldCBASV9ESVJU
WV9QQUdFUyAod2hpY2ggbWVhbnMgdGhhdAo+ICsJCSAqIHRoZSBpbm9kZSBoYXMgZGlydHkgcGFn
ZXMpLCB0aGlzIHdhcyBkb25lIGluCj4gKwkJICogZmlsZW1hcF9kaXJ0eV9mb2xpbygpLgo+ICAg
CQkgKi8KPiAgIAkJX19tYXJrX2lub2RlX2RpcnR5KGlub2RlLCBJX0RJUlRZX0RBVEFTWU5DKTsK
PiAgIAkJdWJpZnNfYXNzZXJ0KGMsIG11dGV4X2lzX2xvY2tlZCgmdWktPnVpX211dGV4KSk7Cj4g
QEAgLTU4NSw4ICs1ODYsOCBAQCBzdGF0aWMgaW50IHViaWZzX3dyaXRlX2VuZChzdHJ1Y3QgZmls
ZSAqZmlsZSwgc3RydWN0IGFkZHJlc3Nfc3BhY2UgKm1hcHBpbmcsCj4gICAJfQo+ICAgCj4gICBv
dXQ6Cj4gLQl1bmxvY2tfcGFnZShwYWdlKTsKPiAtCXB1dF9wYWdlKHBhZ2UpOwo+ICsJZm9saW9f
dW5sb2NrKGZvbGlvKTsKPiArCWZvbGlvX3B1dChmb2xpbyk7Cj4gICAJcmV0dXJuIGNvcGllZDsK
PiAgIH0KPiAgIAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
