Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB96C46CD2
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jan 2024 22:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ncePGqaM9RbXS9A7cGCxwdHNGyhAvADyznc6fnwd7cw=; b=bJJ0QrqhHu170ELuhpMzkSEqsM
	qOSbXAy1sPUsngb6K4CuOH4Pgt26qRV3UIn8+GlINlSGCPRTDnfe3D8Lf3/0NgRGSS62OA7CRybuD
	r02x5BOM0lrcyUSFpNuEuGH9qaxs/MlKDS+cCRrRbV7ZYIOHYwZPCNnwuNY99EmO9aPZUenDu7Lem
	YfRh21X1+4H3U4GrTDEK7SMFv8Eh7rYX7+e9VN/1gxDGyeUDc9Rl5LQ/bpCs9EZ4XJeGWMHg1iISa
	PsiMfQTdifiGQAMu2BqCKkX5/TClX4fBW25+BggEf7pyx28HpjamNeQIeYsDItG7CL8mFwO2oBl2u
	VwqbEOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMFFG-001yZK-0c;
	Sat, 06 Jan 2024 22:34:22 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMFFC-001yYR-1R
	for linux-mtd@lists.infradead.org;
	Sat, 06 Jan 2024 22:34:20 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A356264103F0;
	Sat,  6 Jan 2024 23:34:14 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 6EOQKWiUuJHZ; Sat,  6 Jan 2024 23:34:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 764AC64103F7;
	Sat,  6 Jan 2024 23:34:13 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ITDqdefjUO7N; Sat,  6 Jan 2024 23:34:13 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 56A0764103F0;
	Sat,  6 Jan 2024 23:34:13 +0100 (CET)
Date: Sat, 6 Jan 2024 23:34:13 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: chengzhihao1 <chengzhihao1@huawei.com>
Cc: terrelln@fb.com, Eric Biggers <ebiggers@google.com>, 
	linux-fscrypt <linux-fscrypt@vger.kernel.org>, 
	linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <533956769.204398.1704580453236.JavaMail.zimbra@nod.at>
In-Reply-To: <20231222085446.781838-2-chengzhihao1@huawei.com>
References: <20231222085446.781838-1-chengzhihao1@huawei.com> <20231222085446.781838-2-chengzhihao1@huawei.com>
Subject: Re: [PATCH v2 1/2] ubifs: dbg_check_idx_size: Fix kmemleak if
 loading znode failed
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: dbg_check_idx_size: Fix kmemleak if loading znode failed
Thread-Index: qSQOXRqIT8PxNyX+dFCgPpVolDIDMQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_143418_796231_496EF2E2 
X-CRM114-Status: GOOD (  12.87  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImNoZW5nemhpaGFvMSIgPGNo
ZW5nemhpaGFvMUBodWF3ZWkuY29tPgo+IEFuOiAicmljaGFyZCIgPHJpY2hhcmRAbm9kLmF0Piwg
dGVycmVsbG5AZmIuY29tLCAiRXJpYyBCaWdnZXJzIiA8ZWJpZ2dlcnNAZ29vZ2xlLmNvbT4KPiBD
QzogImxpbnV4LWZzY3J5cHQiIDxsaW51eC1mc2NyeXB0QHZnZXIua2VybmVsLm9yZz4sICJsaW51
eC1tdGQiIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4KPiBHZXNlbmRldDogRnJlaXRh
ZywgMjIuIERlemVtYmVyIDIwMjMgMDk6NTQ6NDUKPiBCZXRyZWZmOiBbUEFUQ0ggdjIgMS8yXSB1
YmlmczogZGJnX2NoZWNrX2lkeF9zaXplOiBGaXgga21lbWxlYWsgaWYgbG9hZGluZyB6bm9kZSBm
YWlsZWQKCj4gSWYgZnVuY3Rpb24gZGJnX2NoZWNrX2lkeF9zaXplKCkgZmFpbGVkIGJ5IGxvYWRp
bmcgem5vZGUgaW4gbW91bnRpbmcKPiBwcm9jZXNzLCB0aGVyZSBhcmUgdHdvIHByb2JsZW1zOgo+
ICAxLiBBbGxvY2F0ZWQgem5vZGVzIHdvbid0IGJlIGZyZWVkLCB3aGljaCBjYXVzZXMga21lbWxl
YWsgaW4ga2VybmVsOgo+ICAgICB1Ymlmc19tb3VudAo+ICAgICAgZGJnX2NoZWNrX2lkeF9zaXpl
Cj4gICAgICAgZGJnX3dhbGtfaW5kZXgKPiAgICAgICAgYy0+enJvb3Quem5vZGUgPSB1Ymlmc19s
b2FkX3pub2RlCj4JY2hpbGQgPSB1Ymlmc19sb2FkX3pub2RlIC8vIGZhaWxlZAo+CS8vIExvYWRl
ZCB6bm9kZXMgd29uJ3QgYmUgZnJlZWQgaW4gZXJyb3IgaGFuZGxpbmcgcGF0aC4KPiAgMi4gR2xv
YmFsIHZhcmlhYmxlIHViaWZzX2NsZWFuX3puX2NudCBpcyBub3QgZGVjcmVhc2VkLCBiZWNhdXNl
Cj4gICAgIHViaWZzX3RuY19jbG9zZSgpIGlzIG5vdCBpbnZva2VkIGluIGVycm9yIGhhbmRsaW5n
IHBhdGgsIHdoaWNoCj4gICAgIHRyaWdnZXJzIGEgd2FybmluZyBpbiB1Ymlmc19leGl0KCk6Cj4g
ICAgICBXQVJOSU5HOiBDUFU6IDEgUElEOiAxNTc2IGF0IGZzL3ViaWZzL3N1cGVyLmM6MjQ4NiB1
Ymlmc19leGl0Cj4gICAgICBNb2R1bGVzIGxpbmtlZCBpbjogenN0ZCB1YmlmcygtKSB1YmkgbmFu
ZHNpbQo+ICAgICAgQ1BVOiAxIFBJRDogMTU3NiBDb21tOiBybW1vZCBOb3QgdGFpbnRlZCA2Ljcu
MC1yYzYKPiAgICAgIENhbGwgVHJhY2U6Cj4JdWJpZnNfZXhpdCsweGNhLzB4YzcwIFt1Ymlmc10K
PglfX2RvX3N5c19kZWxldGVfbW9kdWxlKzB4MjlhLzB4NGEwCj4JZG9fc3lzY2FsbF82NCsweDZm
LzB4MTQwCj4gCj4gRml4IGl0IGJ5IGludm9raW5nIGRlc3Ryb3lfam91cm5hbCgpIGlmIGRiZ19j
aGVja19pZHhfc2l6ZSgpIGZhaWxlZC4KPiAKPiBGaXhlczogMWU1MTc2NGEzYzJhICgiVUJJRlM6
IGFkZCBuZXcgZmxhc2ggZmlsZSBzeXN0ZW0iKQo+IFNpZ25lZC1vZmYtYnk6IFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+Cj4gLS0tCj4gZnMvdWJpZnMvc3VwZXIuYyB8IDIg
Ky0KPiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZnMvdWJpZnMvc3VwZXIuYyBiL2ZzL3ViaWZzL3N1cGVyLmMKPiBpbmRleCAw
OWUyNzBkNmVkMDIuLmVhYmIwZjQ0ZWEzZSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9zdXBlci5j
Cj4gKysrIGIvZnMvdWJpZnMvc3VwZXIuYwo+IEBAIC0xNDQ5LDcgKzE0NDksNyBAQCBzdGF0aWMg
aW50IG1vdW50X3ViaWZzKHN0cnVjdCB1Ymlmc19pbmZvICpjKQo+IAo+IAllcnIgPSBkYmdfY2hl
Y2tfaWR4X3NpemUoYywgYy0+Ymkub2xkX2lkeF9zeik7Cj4gCWlmIChlcnIpCj4gLQkJZ290byBv
dXRfbHB0Owo+ICsJCWdvdG8gb3V0X2pvdXJuYWw7CgpXaGlsZSBpdCBpcyB0ZWNobmljYWxseSBu
b3Qgd3JvbmcsIGNhbGxpbmcgZGVzdHJveV9qb3VybmFsKCkgYmVmb3JlIHViaWZzX3JlcGxheV9q
b3VybmFsKCkgaXMgaGlnaGx5IGNvbmZ1c2luZwp0byBmdXR1cmUgcmVhZGVycyBvZiB0aGUgc291
cmNlIGNvZGUuCkl0IHNlZW0gdG8gd29yayBiZWNhdXNlIHViaWZzX3JlcGxheV9qb3VybmFsKCkg
Y2FuIGRlYWwgd2l0aCB0aGUgZmFjdCB0aGUgam91cm5hbCBpcyBub3QgeWV0IGluaXRpYWxpemVk
LgpJJ2QgcmF0aGVyIHN1Z2dlc3QgdG8gYWRkIGEgZGlzdGluY3QgZnVuY3Rpb24gd2hpY2ggdW5k
b2VzIHdoYXQgZGJnX2NoZWNrX2lkeF9zaXplKCkgZGlkLgpBbHRlcm5hdGl2ZWx5LCBkYmdfY2hl
Y2tfaWR4X3NpemUoKSBjb3VsZCBhbHNvIGNsZWFudXAgaXRzZWxmIGFmdGVyIGZhaWx1cmUuCgpU
aGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
