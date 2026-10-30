Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E9C606A31A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2026 03:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HEqWlQbE;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6lgTf+Ts
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qeP/Fs+bmuz6VERH2NOupLWTeDj9Vn2hGsMLH+Ib+i8=; b=HEqWlQbEFI803pizpSyTgHWJzF
	cYeeNeRP4xrvcy/EW2s/tVpDpGmmg21I02y6mR4bahBqRTUKqIP2fJKUgsPyZMp6vS2vCr5sdsVTU
	cBcepUwJJfBVmbxNa5EydoBC5DGGc0dhCtW9fyI83oaj5TuTxrM8oDIKPAHwKghWze7ADGS1YqYlU
	O9WH/9zL8IMIHUxH3KDAsP3cl/k582PLs4PWo29EAHA8+CJAcBA55/2hfpT2k/ZcDHkY9qL3n345J
	Y9HfGKh7CiKO7JhIRwRsnDLGY0pDnsljhGzdtf4gAJufUgMIDpdzAX7/aNsYjWXIji1oaVghJ79cG
	ss0AnQDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdVd-0000000Al8j-0XhK;
	Fri, 30 Oct 2026 03:42:29 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMdVY-0000000Al2y-01yY
	for linux-mtd@lists.infradead.org;
	Fri, 30 Oct 2026 03:42:27 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=lyCCkGxsVqCH5Jxp2Gx73Ra2R6gYJ0X0+xLM8KV7Nyw=;
	b=6lgTf+Ts1V+YHSBCrEFvDEXDhiMC9GXMq3b2wsOqtZVSt4aNi9cNouzzS6JDieVJF34tbk3Eh
	hET2+S5R51zLlg3+fDdAp58YFcw5B6/T2rmuCau0hbz720kofk1l0vMy/ktC5xSYSNUX71IMs/h
	Me1Uuzuu58wyIDDAb/XNnkQ=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jG6NZ0f5mz1T4G5;
	Fri, 30 Oct 2026 11:42:06 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 483B3202E6;
	Fri, 30 Oct 2026 11:42:18 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 30 Oct 2026 11:42:16 +0800
Subject: Re: [PATCH v2 28/34] ubifs: don't set SB_RDONLY after errors
To: Christian Brauner <brauner@kernel.org>, <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.com>
CC: Al Viro <viro@zeniv.linux.org.uk>, <ecryptfs@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <jfs-discussion@lists.sourceforge.net>,
	<linux-nilfs@vger.kernel.org>, <exfat@lists.linux.dev>, <linux-mm@kvack.org>,
	<ntfs@lists.linux.dev>, <ocfs2-devel@lists.linux.dev>,
	<linux-btrfs@vger.kernel.org>, <gfs2@lists.linux.dev>,
	<linux-efi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<linux-xfs@vger.kernel.org>
References: <20261029-work-fs-sb_rdonly-v2-0-2f44f64f0b66@kernel.org>
 <20261029-work-fs-sb_rdonly-v2-28-2f44f64f0b66@kernel.org>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <0d472865-6cbb-cbb5-b361-1f2bf71dd528@huawei.com>
Date: Fri, 30 Oct 2026 11:42:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261029-work-fs-sb_rdonly-v2-28-2f44f64f0b66@kernel.org>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_204224_704611_BAC8DAC9 
X-CRM114-Status: GOOD (  23.89  )
X-Spam-Score: -3.3 (---)
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
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

1NogMjAyNi8xMC8zMCAwOjA3LCBDaHJpc3RpYW4gQnJhdW5lciDQtLXAOgo+IHViaWZzX3JvX21v
ZGUoKSBzZXRzIGMtPnJvX2Vycm9yIGFuZCBTQl9SRE9OTFkgZnJvbSB3aGF0ZXZlciBjb250ZXh0
IGhpdAo+IHRoZSBlcnJvciwgZS5nLiBhIGZhaWxpbmcgd3JpdGUsIGFuZCB3aXRob3V0IGhvbGRp
bmcgc191bW91bnQuIFVCSUZTCj4gY2FuJ3QgYmUgZnJvemVuIGJ1dCB0aGF0IHN0aWxsIHJhY2Vz
IHdpdGggZXZlcnlvbmUgZWxzZSBjaGFuZ2luZwo+IHNiLT5zX2ZsYWdzLiBBbmQgYy0+cm9fZXJy
b3IgYWxvbmUgYWxyZWFkeSBtYWtlcyBldmVyeSB3cml0ZSBmYWlsIHdpdGgKPiBFUk9GUy4KPiAK
PiBTbyBvbmx5IHNldCBTQl9SRE9OTFkgd2hpbGUgdGhlIGZpbGVzeXN0ZW0gaXMgc3RpbGwgYmVp
bmcgbW91bnRlZCBhbmQKPiBjYWxsIHNiX3NldF9lbWVyZ2VuY3lfcm8oKSBhZnRlciB0aGF0LiBU
aGUgeGF0dHIgc2V0dGVycyBjaGVjawo+IGMtPnJvX2Vycm9yIGFzIHdlbGwgYmVjYXVzZSBlY3J5
cHRmcyBjYWxscyB0aGVtIHdpdGhvdXQgd3JpdGUgYWNjZXNzIG9uCj4gdGhlIGxvd2VyIG1vdW50
IGFuZCB0aGV5IGNoYW5nZSB0aGUgaW5vZGUgaW4gbWVtb3J5IGZpcnN0Lgo+IAo+IFNvIGZhciBh
IHJlbW91bnQgdG8gcmVhZC1vbmx5IGFmdGVyIGFuIGVycm9yIHdhcyByZWZ1c2VkIGFuZCBhIHJl
bW91bnQKPiB0byByZWFkLXdyaXRlIHdlbnQgdGhyb3VnaCBhbmQgY2xlYXJlZCBTQl9SRE9OTFkg
YWdhaW4gYmVjYXVzZQo+IGMtPnJvX21vdW50IHdhcyBuZXZlciBzZXQuIE5vdyBnb2luZyByZWFk
LW9ubHkgd29ya3MgYW5kIGl0cyB3cml0ZXMgZmFpbAo+IHdpdGggRVJPRlMgYmVmb3JlIGFueSBJ
L08sIGFuZCBnb2luZyByZWFkLXdyaXRlIGlzIHJlZnVzZWQgYnkgdGhlIFZGUy4KPiBmc3luYygp
IGZhaWxzIHdpdGggRVJPRlMgaW5zdGVhZCBvZiB0YWtpbmcgdWJpZnNfZnN5bmMoKSdzIHJlYWQt
b25seQo+IHNob3J0Y3V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBCcmF1bmVyIChB
bXV0YWJsZSkgPGJyYXVuZXJAa2VybmVsLm9yZz4KPiAtLS0KPiAgIGZzL3ViaWZzL2lvLmMgICAg
fCA5ICsrKysrKysrLQo+ICAgZnMvdWJpZnMvc3VwZXIuYyB8IDUgKy0tLS0KPiAgIGZzL3ViaWZz
L3hhdHRyLmMgfCA2ICsrKysrKwo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9pby5jIGIvZnMvdWJp
ZnMvaW8uYwo+IGluZGV4IDZjNmQ2ODI0Mjc3OS4uN2E1OWFhMWVhNWNlIDEwMDY0NAo+IC0tLSBh
L2ZzL3ViaWZzL2lvLmMKPiArKysgYi9mcy91Ymlmcy9pby5jCj4gQEAgLTcyLDcgKzcyLDE0IEBA
IHZvaWQgdWJpZnNfcm9fbW9kZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgaW50IGVycikKPiAgIAlp
ZiAoIWMtPnJvX2Vycm9yKSB7Cj4gICAJCWMtPnJvX2Vycm9yID0gMTsKPiAgIAkJYy0+bm9fY2hr
X2RhdGFfY3JjID0gMDsKPiAtCQljLT52ZnNfc2ItPnNfZmxhZ3MgfD0gU0JfUkRPTkxZOwo+ICsJ
CS8qCj4gKwkJICogQmVmb3JlIFNCX0JPUk4gdGhlIG1vdW50ZXIgaG9sZHMgc191bW91bnQsIGxh
dGVyIHNlZQo+ICsJCSAqIHNiX3NldF9lbWVyZ2VuY3lfcm8oKS4KPiArCQkgKi8KPiArCQlpZiAo
IShjLT52ZnNfc2ItPnNfZmxhZ3MgJiBTQl9CT1JOKSkKPiArCQkJYy0+dmZzX3NiLT5zX2ZsYWdz
IHw9IFNCX1JET05MWTsKPiArCQllbHNlCj4gKwkJCXNiX3NldF9lbWVyZ2VuY3lfcm8oYy0+dmZz
X3NiKTsKPiAgIAkJdWJpZnNfd2FybihjLCAic3dpdGNoZWQgdG8gcmVhZC1vbmx5IG1vZGUsIGVy
cm9yICVkIiwgZXJyKTsKPiAgIAkJZHVtcF9zdGFjaygpOwo+ICAgCX0KPiBkaWZmIC0tZ2l0IGEv
ZnMvdWJpZnMvc3VwZXIuYyBiL2ZzL3ViaWZzL3N1cGVyLmMKPiBpbmRleCAzODk3Mjc4NjgxN2Uu
LmVmMzlkYTRlNzgwYiAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9zdXBlci5jCj4gKysrIGIvZnMv
dWJpZnMvc3VwZXIuYwo+IEBAIC0xOTc3LDEwICsxOTc3LDcgQEAgc3RhdGljIGludCB1Ymlmc19y
ZWNvbmZpZ3VyZShzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCj4gICAJCWlmIChlcnIpCj4gICAJCQly
ZXR1cm4gZXJyOwo+ICAgCX0gZWxzZSBpZiAoIWMtPnJvX21vdW50ICYmIChmYy0+c2JfZmxhZ3Mg
JiBTQl9SRE9OTFkpKSB7Cj4gLQkJaWYgKGMtPnJvX2Vycm9yKSB7Cj4gLQkJCXViaWZzX21zZyhj
LCAiY2Fubm90IHJlLW1vdW50IFIvTyBkdWUgdG8gcHJpb3IgZXJyb3JzIik7Cj4gLQkJCXJldHVy
biAtRVJPRlM7Cj4gLQkJfQo+ICsJCS8qIEFmdGVyIGFuIGVycm9yIHViaWZzX3JlbW91bnRfcm8o
KSBjYW4ndCB3cml0ZSBidXQgc3RpbGwgd29ya3MuICovCgpIaSwgQnJhdW5lcgpJZiB3ZSByZW1v
dmUgdGhlIGMtPnJvX2Vycm9yIGNoZWNrLCB1Ymlmc19yZW1vdW50X3JvLT51Ymlmc193YnVmX3N5
bmMgCndpbGwgcmV0dXJuIEVST0ZTIGFuZCB0cmlnZ2VyIHViaWZzX3JvX21vZGUoKSBhZ2Fpbiwg
SSB0aGluayB3ZSBjYW4gCnJldGFpbiB0aGUgcHJlLWNoZWNrIHBsYWNlbWVudCB0byB0cmlnZ2Vy
IG1vcmUgZXJyb3IgcHJpbnRpbmcuCkJUVywgYSByZW1vdW50IHRvIHJlYWQtd3JpdGUgYWZ0ZXIg
YW4gZXJyb3IgaXMgcmVmdXNlZCB0b28uCj4gICAJCXViaWZzX3JlbW91bnRfcm8oYyk7Cj4gICAJ
fQo+ICAgCj4gZGlmZiAtLWdpdCBhL2ZzL3ViaWZzL3hhdHRyLmMgYi9mcy91Ymlmcy94YXR0ci5j
Cj4gaW5kZXggM2IwZThhMjcwZjU5Li41NzJmNmYzZTUyYWQgMTAwNjQ0Cj4gLS0tIGEvZnMvdWJp
ZnMveGF0dHIuYwo+ICsrKyBiL2ZzL3ViaWZzL3hhdHRyLmMKPiBAQCAtMjYwLDYgKzI2MCw5IEBA
IGludCB1Ymlmc194YXR0cl9zZXQoc3RydWN0IGlub2RlICpob3N0LCBjb25zdCBjaGFyICpuYW1l
LCBjb25zdCB2b2lkICp2YWx1ZSwKPiAgIAlpZiAoY2hlY2tfbG9jaykKPiAgIAkJdWJpZnNfYXNz
ZXJ0KGMsIGlub2RlX2lzX2xvY2tlZChob3N0KSk7Cj4gICAKPiArCWlmIChjLT5yb19lcnJvcikK
PiArCQlyZXR1cm4gLUVST0ZTOwo+ICsKPiAgIAlpZiAoc2l6ZSA+IFVCSUZTX01BWF9JTk9fREFU
QSkKPiAgIAkJcmV0dXJuIC1FUkFOR0U7Cj4gICAKPiBAQCAtNTY0LDYgKzU2Nyw5IEBAIHN0YXRp
YyBpbnQgdWJpZnNfeGF0dHJfcmVtb3ZlKHN0cnVjdCBpbm9kZSAqaG9zdCwgY29uc3QgY2hhciAq
bmFtZSkKPiAgIAo+ICAgCXViaWZzX2Fzc2VydChjLCBpbm9kZV9pc19sb2NrZWQoaG9zdCkpOwo+
ICAgCj4gKwlpZiAoYy0+cm9fZXJyb3IpCj4gKwkJcmV0dXJuIC1FUk9GUzsKPiArCj4gICAJaWYg
KGZuYW1lX2xlbigmbm0pID4gVUJJRlNfTUFYX05MRU4pCj4gICAJCXJldHVybiAtRU5BTUVUT09M
T05HOwo+ICAgCj4gClRoZSBzYl9yZG9ubHkgd29uJ3QgYWZmZWN0IHRoZSBzeW5jX2ZzX29uZV9z
YigpIGFmdGVyIGFuIGVycm9yLCBhbmQgCnNiX2VtZXJnZW5jeV9ybyBjaGVjayBpbiBub3QgYWRk
ZWQgaW50byBzeW5jX2ZzX29uZV9zYiwgc2hvdWxkIHdlIGFkZCAKdGhlIGMtPnJvX2Vycm9yIGNo
ZWNrIGluIHViaWZzX3N5bmNfZnMoKSB0byBwcmV2ZW50IHRoZSBmYWlsdXJlIAp1Ymlmc193YnVm
X3N5bmMgZXhlY3V0aW5nPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
