Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99732606D80B
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Nov 2026 02:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DzRitIDo;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=gNV88AdX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UOrar9pNjomyB8zilZ1tAF5koiYR8Asnq9H2+6z0HuI=; b=DzRitIDomhffbRM+sLdTSpk3np
	UPGz9Oggxs9y7u70QzGqzMm3JsvylvuhnZEkTZN3Fnc/B5JTZzbA3EBFrE47egsLpL1QFlt1MapNf
	CYAvLfvS/oZK0Ds1UNXvqeUIkczxqIt1e4OMZ8N55216P1QlA9OeDqb15yOMHIOOT6zhEjaYloAgT
	2QvJx1gZq5M8eLMa28GOy79ZyYLx7pVefoXQciurUGUy3w6g4sgP+84VANeM9RB1LNy7froztH8yH
	8y0Bk8XCmE9ohj8pwxS2x8xzzKh3lGTJDPgqAlh6DhEs31h1VpkO4zs3z5137zb1hBbHrw8h8Gwaf
	fvAF0rLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3ux-00000000q4O-16MT;
	Tue, 03 Nov 2026 02:06:31 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO3uu-00000000pz6-1dHa
	for linux-mtd@lists.infradead.org;
	Tue, 03 Nov 2026 02:06:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v4u4F2x/nKEXI6K51t5Y4udoO7BBBbN73aqid42YOZ0=;
	b=gNV88AdXjFtCeALe7w+67uOqRnkXP0NvgdmDlFeVL0HFWsUtuSinEHD74eDZucPNHZhrkvcaM
	TRCRsnQvW1kZBAPJf9ko6PpN1Ar4KreivOQg37LzxesmUP+wEfyNmwZnID/e5U00oQzS7uarW9L
	+/BEAf0Uokr0K0Kp4jSR/+I=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jJX4D3Rshz12LdL;
	Tue,  3 Nov 2026 10:06:20 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 6472D40561;
	Tue,  3 Nov 2026 10:06:20 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 3 Nov 2026 10:06:19 +0800
Subject: Re: [PATCH 0/5] ubifs: harden validation of on-disk inode and node
 metadata
To: <shao.mingyin@zte.com.cn>, <richard@nod.at>,
	<linux-mtd@lists.infradead.org>
CC: <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20261102214531231UAVA89ay_BDVcwFmrv8cq@zte.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <49cebc00-3827-e24c-3e0c-74ea6ca8c7e4@huawei.com>
Date: Tue, 3 Nov 2026 10:06:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261102214531231UAVA89ay_BDVcwFmrv8cq@zte.com.cn>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200011.china.huawei.com (7.152.185.179)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_180628_746652_2A340546 
X-CRM114-Status: GOOD (  24.92  )
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYvMTEvMiAyMTo0NSwgc2hhby5taW5neWluQHp0ZS5jb20uY24g5YaZ6YGTOgo+IFRo
aXMgc2VyaWVzIHRpZ2h0ZW5zIHRoZSBjaGVja3MgdWJpZnMgcGVyZm9ybXMgb24gdGhlIG1ldGFk
YXRhIGl0IHJlYWRzCj4gZnJvbSBmbGFzaC4gIEFsbCBmaXZlIHBhdGNoZXMgYXJlIGFib3V0IHNp
emUgYW5kIGFjY291bnRpbmcgZmllbGRzIHRoYXQKPiBhcmUgdGFrZW4gZnJvbSB0aGUgaW1hZ2Ug
YW5kIGxhdGVyIHVzZWQgd2l0aG91dCBhIHJhbmdlIGNoZWNrOyBhbiBpbWFnZQo+IHdob3NlIENS
Q3MgYW5kIG5vZGUgdGFncyBhcmUgaW50YWN0IGNhbiB0aGVyZWZvcmUgZHJpdmUgdGhlIGNvZGUg
aW50bwo+IHN0YXRlIGl0IG5ldmVyIGV4cGVjdHMuCj4gCj4gUGF0Y2ggMSByZWplY3RzIGlub2Rl
cyB3aG9zZSBzaXplIGRvZXMgbm90IGZpdCB0aGUgc2lnbmVkIGxvZmZfdCB0aGUgc2l6ZQo+IGlz
IHN0b3JlZCBpbi4gIEEgNjQtYml0IHZhbHVlIHdpdGggdGhlIHRvcCBiaXQgc2V0IGJlY29tZXMg
bmVnYXRpdmUgYW5kCj4gcGFzc2VzIHRoZSBtYXhfaW5vZGVfc3ogY2hlY2ssIGFuZCB0aGUgcmVh
ZCBwYXRocyB0aGVuIGRvIHNpemUgYXJpdGhtZXRpYwo+IHdpdGggaXQsIGZvciBleGFtcGxlIChp
X3NpemUgKyBVQklGU19CTE9DS19TSVpFIC0gMSkgPj4gVUJJRlNfQkxPQ0tfU0hJRlQKPiBpbiBk
b19yZWFkcGFnZSgpIGFuZCAoaV9zaXplIC0gMSkgPj4gUEFHRV9TSElGVCBpbiBwb3B1bGF0ZV9w
YWdlKCkuCj4gCj4gUGF0Y2ggMiByZWplY3RzIHhhdHRyIGlub2RlcyB3aG9zZSBpX3NpemUgZG9l
cyBub3QgbWF0Y2ggZGF0YV9sZW4uICB1Ymlmcwo+IGtlZXBzIHRoZSB0d28gZXF1YWwgZm9yIGF0
dHJpYnV0ZSBpbm9kZXMsIGFuZCB1Ymlmc194YXR0cl9nZXQoKSBhbmQKPiByZW1vdmVfeGF0dHIo
KSBhc3NlcnQgb24gdGhlIGludmFyaWFudDsgd2l0aCBhc3NlcnQ9cmVhZC1vbmx5IG9yCj4gYXNz
ZXJ0PXBhbmljIGEgcGxhaW4gZ2V0eGF0dHIoKSBvciByZW1vdmV4YXR0cigpIHR1cm5zIHRoZSBm
aWxlIHN5c3RlbQo+IHJlYWQtb25seSBvciBwYW5pY3MgdGhlIGtlcm5lbC4KPiAKPiBQYXRjaCAz
IGNoZWNrcyB0aGUgbG93ZXIgYm91bmQgb2YgdGhlIG1hc3RlciBub2RlJ3MgaGlnaGVzdF9pbnVt
LiAgVG9kYXkKPiBvbmx5IHRoZSB1cHBlciBib3VuZCBpcyB2YWxpZGF0ZWQsIHNvIGEgdmFsdWUg
YmVsb3cgVUJJRlNfRklSU1RfSU5PIGlzCj4gYWNjZXB0ZWQgYW5kIHViaWZzX25ld19pbm9kZSgp
IGFsbG9jYXRlcyBudW1iZXJzIGZyb20gdGhlIHJhbmdlIHJlc2VydmVkCj4gZm9yIHNwZWNpYWwg
aW5vZGVzLiAgV2l0aCBoaWdoZXN0X2ludW0gPT0gMCB0aGUgZmlyc3QgbmV3IGlub2RlIGdldHMK
PiBudW1iZXIgMSwgd2hpY2ggaXMgVUJJRlNfUk9PVF9JTk8gYW5kIGFscmVhZHkgaW4gdXNlLCBh
bmQgdGhlIGluZGV4IGVuZHMKPiB1cCB3aXRoIHR3byBpbm9kZXMgc2hhcmluZyBhIG51bWJlci4K
PiAKPiBQYXRjaCA0IHZhbGlkYXRlcyBpbm9kZSBhbmQgZGF0YSBub2RlIHNpemVzIGR1cmluZyBy
ZXBsYXkuICByZXBsYXlfYnVkKCkKPiB0cnVzdHMgdGhlbSwgYW5kIHViaWZzX3JlY292ZXJfc2l6
ZSgpIG1heSB0aGVuIGV4dGVuZCBhbiBpbm9kZSB0byBhIGJvZ3VzCj4gc2l6ZS4gIFRoZSBub3Jt
YWwgcmVhZCBwYXRocyBhbHJlYWR5IHJlamVjdCBzdWNoIG5vZGVzLCBhbmQgdHJ1bmNhdGlvbgo+
IG5vZGVzIGFyZSBjaGVja2VkIGluIHJlcGxheV9idWQoKSBhcyB3ZWxsOyBkbyB0aGUgc2FtZSBo
ZXJlLiAgVGhlIGRhdGEKPiBub2RlIGVuZCBvZmZzZXQgaXMgYWxzbyBjb21wdXRlZCBpbiA2NCBi
aXRzIHNvIHRoYXQgYSBsYXJnZSBibG9jayBudW1iZXIKPiBjYW5ub3Qgd3JhcC4KPiAKPiBQYXRj
aCA1IHJlZnVzZXMgeGF0dHIgYWNjb3VudGluZyB0aGF0IGNhbm5vdCBiZSBkZWNyZW1lbnRlZC4g
IE9uIGFuIGltYWdlCj4gd2hvc2UgY291bnRlcnMgYXJlIGFscmVhZHkgemVybyBvciBzbWFsbGVy
IHRoYW4gdGhlIGVudHJ5IGJlaW5nIHJlbW92ZWQsCj4gdGhlIHVuc2lnbmVkIGNvdW50ZXJzIHdy
YXAgYW5kIHViaWZzX2pubF9kZWxldGVfeGF0dHIoKSB3cml0ZXMgdGhlIGJvZ3VzCj4gdmFsdWVz
IGJhY2sgdG8gZmxhc2g7IHRoZSBuZXh0IG1vdW50IHRoZW4gcmVqZWN0cyB0aGUgaW5vZGUgYmVj
YXVzZQo+IHhhdHRyX25hbWVzICsgeGF0dHJfY250IGV4Y2VlZHMgWEFUVFJfTElTVF9NQVgsIHNv
IGEgc2luZ2xlIHJlbW92ZXhhdHRyKCkKPiBtYWtlcyB0aGUgaW1hZ2UgdW5tb3VudGFibGUuCj4g
Cj4gVG8ga2VlcCB0aGUgc2V2ZXJpdHkgY2xhaW1zIGhvbmVzdDogbW91bnRpbmcgc3VjaCBhbiBp
bWFnZSBuZWVkcwo+IENBUF9TWVNfQURNSU4gaW4gdGhlIG1vdW50aW5nIG5hbWVzcGFjZSAob3Ig
YWNjZXNzIHRvIHRoZSBmbGFzaCksIHNvIG5vbmUKPiBvZiB0aGVzZSBpcyBhIG5vbi1yb290IGF0
dGFjay4gIFBhdGNoIDIgb25seSB0dXJucyBpbnRvIHJlYWQtb25seSBvciBwYW5pYwo+IHdpdGgg
dGhlIGFzc2VydD0gb3B0aW9uOyB0aGUgZGVmYXVsdCBhY3Rpb24gaXMgdG8gcmVwb3J0LiAgUGF0
Y2ggNSBpcyB0aGUKPiBvbmUgd2l0aCBhIHBlcnNpc3RlbnQgZWZmZWN0LiAgUGF0Y2hlcyAxLTMg
YXJlIG1vdW50LXRpbWUgdmFsaWRhdGlvbiwKPiBwYXRjaCA0IGlzIGluIHJlcGxheSwgcGF0Y2gg
NSBpcyBydW50aW1lIGFjY291bnRpbmcuCj4gCj4gVGhlIHBhdGNoZXMgYXJlIGluZGVwZW5kZW50
LCBoYXZlIG5vIGludGVyLXBhdGNoIGRlcGVuZGVuY2llcyBhbmQgY2FuIGJlCj4gYXBwbGllZCBp
biBhbnkgb3JkZXIgb3IgYXMgYSBzdWJzZXQuICBBbGwgZml2ZSBjYXJyeSBGaXhlczogYW5kCj4g
Q2M6IHN0YWJsZS4KPiAKPiBUZXN0aW5nOiBlYWNoIHBhdGNoIGFwcGxpZXMgdG8gbmV4dC0yMDI2
MTAzMCwgcGFzc2VzIGNoZWNrcGF0Y2gucGwKPiAtLXN0cmljdCB3aXRoIDAgZXJyb3JzLzAgd2Fy
bmluZ3MvMCBjaGVja3MsIGFuZCBmcy91Ymlmcy8gYnVpbGRzIHdpdGgKPiBDT05GSUdfVUJJRlNf
RlNfQVVUSEVOVElDQVRJT04sIENPTkZJR19VQklGU19GU19YQVRUUiBhbmQKPiBDT05GSUdfVUJJ
RlNfRlNfU0VDVVJJVFkgZW5hYmxlZCBhbmQgVz0xIHdpdGhvdXQgbmV3IHdhcm5pbmdzLiAgSSBk
aWQgbm90Cj4gbW91bnQgY3JhZnRlZCBpbWFnZXM6IHRoaXMgbWFjaGluZSBoYXMgbm8gbWtmcy51
Ymlmcy91YmkgdG9vbHMgYW5kIG5vCj4gbXRkcmFtIG9yIG5hbmRzaW0gc2V0dXAuICBJIGNhbiBw
dXQgdG9nZXRoZXIgYW4gaW1hZ2UgZm9yIGFueSBvZiB0aGUgZml2ZQo+IGlmIGEgcnVudGltZSBj
aGVjayB3b3VsZCBoZWxwIHRoZSByZXZpZXcuCj4gCkhpLAogRnJvbSBteSBwZXJzcGVjdGl2ZSwg
SSdtIG5vdCByZWFsbHkgaW50ZXJlc3RlZCBpbiB0aGUgcHJvYmxlbSBzY2VuYXJpb3MgCnRyaWdn
ZXJlZCBieSBtYWxpY2lvdXMgZnMgaW1hZ2UsIGxldCBSaWNoYXJkIGRlY2lkZSB3aGV0aGVyIHRv
IG1lcmdlIGl0LgpUaGlzIHNlcmllcyBkb2VzIG5vdCBzZWVtIHRvIGludHJvZHVjZSBhbnkgaXNz
dWVzLCB0aGVyZSBhcmUgdHdvIHNtYWxsIApuaXRzIGluIHBhdGNoIDImMy4KCj4gU2lnbmVkLW9m
Zi1ieTogU2hhbyBNaW5neWluIDxzaGFvLm1pbmd5aW5AenRlLmNvbS5jbj4KPiAtLS0KPiBiYXNl
LWNvbW1pdDogNzY0OWJhNzNmOWU3ZTFlMDRkMGI0NjIxM2UzOWM3OWFlMDlkZDU1Ywo+IC4KPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
