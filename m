Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EDD606A334
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 03:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x9BriLen;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1Jcw5Wpz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jyb8o5CRWSiphV+dqfKq/LdXqgTvm37QcgzBD4zjuZA=; b=x9BriLeni05VsmpiTSEzUE+X2i
	L8Od+64LD0TXWj6toy84xA5oYXltGNXocBfuu2xIDNhzWqWN2IC8BM2itMLVvV//wlSiPyKCNHpOK
	XDNQJJEg6PRsQkfdDhHqiyEKBy+Aqc4U3BuQH7k/K+g8fU0OdazED9bwjYpLsS52THGwUU6EtuSbm
	XsdEUWVctWc7suEniaMsqQA2s3y6nYHSBWYnZfSWHoTlYx9kgvUB5mRrqKRwenryv69rXmqht6R3F
	U17I7MJTqVT5cWg0bkS2SyHisNKZA7cpF+QZRaTNFrcizarp0HJ3vS45z65scANdnSgk1w1HUylyV
	SDlCpN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoJa-00000007gfV-0Upn;
	Thu, 05 Nov 2026 03:39:02 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOoJV-00000007geO-2lEH
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 03:39:00 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=0bmoyUkzdtIPwctA0XmmG4w/kO0aW9Vg8ocvhD7GQlc=;
	b=1Jcw5Wpz9oyiDJnwHAnO6nFeSGMqx7+lZec58dnCFBOwO03z6VN/b/BceRX9zohVd3zL43jty
	lKXNUK5pvOr56UghyjTTBUYe3a6frRI6L9LD5rzdCJGRZ+9ue6Q3NdmNiwBL7k8Z1agGDhpAimm
	JmlA+VLVSRDPJ63aF/9v5Wg=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jKp246SDSznTVh;
	Thu,  5 Nov 2026 11:38:52 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D13540578;
	Thu,  5 Nov 2026 11:38:51 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 5 Nov 2026 11:38:50 +0800
Subject: Re: [PATCH] ubifs: account for short copies in ubifs_write_end
To: Hungyu Lin <dennylin0707@gmail.com>, <richard@nod.at>
CC: <lin.nan@h3c.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20261104191132.89515-1-dennylin0707@gmail.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <fb5c1cc4-d974-73ae-3b61-c0dc1363305a@huawei.com>
Date: Thu, 5 Nov 2026 11:38:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261104191132.89515-1-dennylin0707@gmail.com>
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_193858_307830_A730D160 
X-CRM114-Status: GOOD (  20.97  )
X-Spam-Score: -3.8 (---)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMS81IDM6MTEsIEh1bmd5dSBMaW4g0LS1wDoKPiB1Ymlmc193cml0ZV9lbmQoKSB1
cGRhdGVzIGlfc2l6ZSBhbmQgdWlfc2l6ZSB0byBwb3MgKyBsZW4gZXZlbiB3aGVuCj4gZmV3ZXIg
Ynl0ZXMgd2VyZSBjb3BpZWQuIEEgb25lLWJ5dGUgd3JpdGUgYXQgRU9GIGZyb20gYW4gdW5yZWFk
YWJsZQo+IGJ1ZmZlciBjYW4gZmFpbCB3aXRoIEVGQVVMVCB3aGlsZSBleHRlbmRpbmcgdGhlIGZp
bGUgYnkgb25lIGJ5dGUuCj4gUGFydGlhbCB3cml0ZXMgY2FuIGFsc28gZXh0ZW5kIHRoZSBmaWxl
IHBhc3QgdGhlIGxhc3QgYnl0ZSBjb3BpZWQuCj4gCj4gVXNlIHBvcyArIGNvcGllZCBmb3Igc2l6
ZSB1cGRhdGVzIGFuZCBjYW5jZWwgdGhlIGJ1ZGdldCB3aGVuIG5vIGRhdGEKPiB3YXMgY29waWVk
LiBLZWVwIHRoZSBhcHBlbmRpbmcgZGVjaXNpb24gYmFzZWQgb24gdGhlIHJlcXVlc3RlZCBsZW5n
dGgKPiB0byBtYXRjaCB0aGUgaW5vZGUgYnVkZ2V0aW5nIGFuZCB1aV9tdXRleCBsb2NraW5nIGlu
IHViaWZzX3dyaXRlX2JlZ2luKCkuCj4gSWYgYSBzaG9ydCBjb3B5IGVuZHMgd2l0aGluIHRoZSBv
bGQgc2l6ZSwgcmVsZWFzZSBhbnkgdW51c2VkIGlub2RlIGJ1ZGdldAo+IHdpdGhvdXQgcmVkdWNp
bmcgdGhlIHNpemUsIGFuZCBzdGlsbCB1bmxvY2sgdWlfbXV0ZXguCj4gCj4gRml4ZXM6IDFlNTE3
NjRhM2MyYSAoIlVCSUZTOiBhZGQgbmV3IGZsYXNoIGZpbGUgc3lzdGVtIikKPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tdGQvMjAyNjEwMjcwNjEyMjYuMzUwNjUxNy0xLWxp
bi5uYW5AaDNjLmNvbS8KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IEh1bmd5dSBMaW4gPGRlbm55bGluMDcwN0BnbWFpbC5jb20+Cj4gLS0tCj4gICBmcy91Ymlm
cy9maWxlLmMgfCAyOSArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQpSZXZpZXdlZC1ieTogWmhp
aGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBkaWZmIC0tZ2l0IGEvZnMv
dWJpZnMvZmlsZS5jIGIvZnMvdWJpZnMvZmlsZS5jCj4gaW5kZXggOTlkZDUyNzE1ZWUuLjhlYmQz
ZjRjZGRmIDEwMDY0NAo+IC0tLSBhL2ZzL3ViaWZzL2ZpbGUuYwo+ICsrKyBiL2ZzL3ViaWZzL2Zp
bGUuYwo+IEBAIC01MjMsOCArNTIzLDggQEAgc3RhdGljIGludCB1Ymlmc193cml0ZV9lbmQoY29u
c3Qgc3RydWN0IGtpb2NiICppb2NiLAo+ICAgCXN0cnVjdCBpbm9kZSAqaW5vZGUgPSBtYXBwaW5n
LT5ob3N0Owo+ICAgCXN0cnVjdCB1Ymlmc19pbm9kZSAqdWkgPSB1Ymlmc19pbm9kZShpbm9kZSk7
Cj4gICAJc3RydWN0IHViaWZzX2luZm8gKmMgPSBpbm9kZS0+aV9zYi0+c19mc19pbmZvOwo+IC0J
bG9mZl90IGVuZF9wb3MgPSBwb3MgKyBsZW47Cj4gLQlpbnQgYXBwZW5kaW5nID0gISEoZW5kX3Bv
cyA+IGlub2RlLT5pX3NpemUpOwo+ICsJbG9mZl90IGVuZF9wb3MgPSBwb3MgKyBjb3BpZWQ7Cj4g
KwlpbnQgYXBwZW5kaW5nID0gISEocG9zICsgbGVuID4gaW5vZGUtPmlfc2l6ZSk7Cj4gICAKPiAg
IAlkYmdfZ2VuKCJpbm8gJWxsdSwgcG9zICVsbHUsIHBnICVsdSwgbGVuICV1LCBjb3BpZWQgJWQs
IGlfc2l6ZSAlbGxkIiwKPiAgIAkJaW5vZGUtPmlfaW5vLCBwb3MsIGZvbGlvLT5pbmRleCwgbGVu
LCBjb3BpZWQsIGlub2RlLT5pX3NpemUpOwo+IEBAIC01NTIsNiArNTUyLDExIEBAIHN0YXRpYyBp
bnQgdWJpZnNfd3JpdGVfZW5kKGNvbnN0IHN0cnVjdCBraW9jYiAqaW9jYiwKPiAgIAkJZ290byBv
dXQ7Cj4gICAJfQo+ICAgCj4gKwlpZiAodW5saWtlbHkoIWNvcGllZCkpIHsKPiArCQljYW5jZWxf
YnVkZ2V0KGMsIGZvbGlvLCB1aSwgYXBwZW5kaW5nKTsKPiArCQlnb3RvIG91dDsKPiArCX0KPiAr
Cj4gICAJaWYgKGxlbiA9PSBmb2xpb19zaXplKGZvbGlvKSkKPiAgIAkJZm9saW9fbWFya191cHRv
ZGF0ZShmb2xpbyk7Cj4gICAKPiBAQCAtNTYyLDE0ICs1NjcsMTggQEAgc3RhdGljIGludCB1Ymlm
c193cml0ZV9lbmQoY29uc3Qgc3RydWN0IGtpb2NiICppb2NiLAo+ICAgCX0KPiAgIAo+ICAgCWlm
IChhcHBlbmRpbmcpIHsKPiAtCQlpX3NpemVfd3JpdGUoaW5vZGUsIGVuZF9wb3MpOwo+IC0JCXVp
LT51aV9zaXplID0gZW5kX3BvczsKPiAtCQkvKgo+IC0JCSAqIFdlIGRvIG5vdCBzZXQgQElfRElS
VFlfUEFHRVMgKHdoaWNoIG1lYW5zIHRoYXQKPiAtCQkgKiB0aGUgaW5vZGUgaGFzIGRpcnR5IHBh
Z2VzKSwgdGhpcyB3YXMgZG9uZSBpbgo+IC0JCSAqIGZpbGVtYXBfZGlydHlfZm9saW8oKS4KPiAt
CQkgKi8KPiAtCQlfX21hcmtfaW5vZGVfZGlydHkoaW5vZGUsIElfRElSVFlfREFUQVNZTkMpOwo+
ICsJCWlmIChlbmRfcG9zID4gaW5vZGUtPmlfc2l6ZSkgewo+ICsJCQlpX3NpemVfd3JpdGUoaW5v
ZGUsIGVuZF9wb3MpOwo+ICsJCQl1aS0+dWlfc2l6ZSA9IGVuZF9wb3M7Cj4gKwkJCS8qCj4gKwkJ
CSAqIFdlIGRvIG5vdCBzZXQgQElfRElSVFlfUEFHRVMgKHdoaWNoIG1lYW5zIHRoYXQKPiArCQkJ
ICogdGhlIGlub2RlIGhhcyBkaXJ0eSBwYWdlcyksIHRoaXMgd2FzIGRvbmUgaW4KPiArCQkJICog
ZmlsZW1hcF9kaXJ0eV9mb2xpbygpLgo+ICsJCQkgKi8KPiArCQkJX19tYXJrX2lub2RlX2RpcnR5
KGlub2RlLCBJX0RJUlRZX0RBVEFTWU5DKTsKPiArCQl9IGVsc2UgaWYgKCF1aS0+ZGlydHkpIHsK
PiArCQkJdWJpZnNfcmVsZWFzZV9kaXJ0eV9pbm9kZV9idWRnZXQoYywgdWkpOwo+ICsJCX0KPiAg
IAkJdWJpZnNfYXNzZXJ0KGMsIG11dGV4X2lzX2xvY2tlZCgmdWktPnVpX211dGV4KSk7Cj4gICAJ
CW11dGV4X3VubG9jaygmdWktPnVpX211dGV4KTsKPiAgIAl9Cj4gCj4gYmFzZS1jb21taXQ6IDY2
MjhlN2Q0YzZiMjVjOGQxOGYxMzQ1ZTNhMjBkMjE4MjlhYWU3ZTQKPiAKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
