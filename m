Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F10FD735E4
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Nov 2024 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YsEXzVVIc1tDCF51l86Cu3i5i+FXvcbLibpau0FTKws=; b=ExJ6IiLmRrPHq2
	Nb8aAn6iIzyJIv42glYLsRYXjC87lnf2UQW3uc4pB8P/DEXfYQ/GvOKzrSBilR5xf+K/+DH3T6EOx
	Vdtz2LuMecyhERoBhCsqnvXn1cmL402b2xY40Nce7EtF7rbwd2ivjF6k/MUbWIod4M4BJeEzv9QdV
	kQW0cOw6qqWYNDylFLcsa3n/ptrY5WJpSyFEMlHXnAsv9b6D81ThMzCoajF1UgQ34a4C0Kv1o1FKV
	SRLRRCaeUWHy/xvoG4f3iD2b/fELEnubbIQ9srrLYJk43caweCpy5yfBIjkeJ9xroOAMi6WQALiSY
	88jL8aP9eNRnc2uMrkTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHA4S-000000014vU-3jd5;
	Fri, 29 Nov 2024 23:06:44 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHA4P-000000014tl-26aH
	for linux-mtd@lists.infradead.org;
	Fri, 29 Nov 2024 23:06:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 58CA72F3327;
	Sat, 30 Nov 2024 00:06:40 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id rXHNB-TZja_I; Sat, 30 Nov 2024 00:06:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DDCA22F3326;
	Sat, 30 Nov 2024 00:06:39 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SImoWFlGvozQ; Sat, 30 Nov 2024 00:06:39 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id BC6232F3325;
	Sat, 30 Nov 2024 00:06:39 +0100 (CET)
Date: Sat, 30 Nov 2024 00:06:39 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1445196426.11806664.1732921599708.JavaMail.zimbra@nod.at>
Subject: [GIT PULL] JFFS, UBI and UBIFS changes for v6.13-rc1
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF133 (Linux)/8.8.12_GA_3809)
Thread-Index: ZnsWLHxGkw9Ed9uDAQ5Gbmjga6vi3Q==
Thread-Topic: JFFS, UBI and UBIFS changes for v6.13-rc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_150641_826294_6B8BCC1C 
X-CRM114-Status: UNSURE (   8.03  )
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

TGludXMsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDJkNTQwNGNhYThjN2Ji
NWM0ZTA0MzVmOTRiMjg4MzRhZTU0NTY2MjM6CgogIExpbnV4IDYuMTItcmM3ICgyMDI0LTExLTEw
IDE0OjE5OjM1IC0wODAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ydy91Ymlm
cy5naXQgdGFncy91Ymlmcy1mb3ItbGludXMtNi4xMy1yYzEKCmZvciB5b3UgdG8gZmV0Y2ggY2hh
bmdlcyB1cCB0byBiY2RjYjExNWVhZWQ1ZTk4OGNmMzdjYzlhMWRkNWY1ZGQyMDBlOTI3OgoKICB1
YmlmczogRml4IHVuaW5pdGlhbGl6ZWQgdXNlIG9mIGVyciBpbiB1Ymlmc19qbmxfd3JpdGVfaW5v
ZGUoKSAoMjAyNC0xMS0xNSAxNzo0NToyNSArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVGhpcyBwdWxsIHJlcXVl
c3QgY29udGFpbnMgdXBkYXRlcyBmb3IgSkZGUzIsIFVCSSBhbmQgVUJJRlM6CgpKRkZTMjoKLSBC
dWcgZml4IGZvciBydGltZSBjb21wcmVzc2lvbgotIFZhcmlvdXMgY2xlYW51cHMKClVCSToKLSBD
bGVhbnVwcyBmb3IgZmFzdG1hcCBhbmQgd2VhciBsZXZlbGluZwoKVUJJRlM6Ci0gQWRkIHN1cHBv
cnQgZm9yIEZTX0lPQ19HRVRGU1NZU0ZTUEFUSAotIFJlbW92ZSBkZWFkIGlvY3RsIGNvZGUKLSBG
aXggVUFGIGluIHViaWZzX3RuY19lbmRfY29tbWl0KCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KQ29saW4gSWFuIEtpbmcg
KDIpOgogICAgICBtdGQ6IHViaTogcmVtb3ZlIHJlZHVuZGFudCBjaGVjayBvbiBieXRlc19sZWZ0
IGF0IGVuZCBvZiBmdW5jdGlvbgogICAgICBqZmZzMjogcmVtb3ZlIHJlZHVuZGFudCBjaGVjayBv
biBvdXRwb3MgPiBwb3MKCkhvbmdibyBMaSAoMik6CiAgICAgIHViaWZzOiByZW1vdmUgdW51c2Vk
IGlvY3RsIGZsYWdzIEdFVEZMQUdTL1NFVEZMQUdTCiAgICAgIHViaWZzOiBhZGQgc3VwcG9ydCBm
b3IgRlNfSU9DX0dFVEZTU1lTRlNQQVRICgpKYXZpZXIgQ2FycmFzY28gKDEpOgogICAgICBtdGQ6
IHViaTogZml4IHVucmVsZWFzZWQgZndub2RlX2hhbmRsZSBpbiBmaW5kX3ZvbHVtZV9md25vZGUo
KQoKS2luc2V5IE1vb3JlICgxKToKICAgICAgamZmczI6IFByZXZlbnQgcnRpbWUgZGVjb21wcmVz
cyBtZW1vcnkgY29ycnVwdGlvbgoKTGl1IE1pbmdydWkgKDEpOgogICAgICB1YmlmczogRGlzcGxh
eSB0aGUgaW5vZGUgbnVtYmVyIHdoZW4gb3JwaGFuIHR3aWNlIGhhcHBlbnMKCk1hcmt1cyBFbGZy
aW5nICgyKToKICAgICAgdWJpZnM6IENhbGwgaXB1dCh4aW5vKSBvbmx5IG9uY2UgaW4gdWJpZnNf
cHVyZ2VfeGF0dHJzKCkKICAgICAgdWJpZnM6IFJlZHVjZSBrZnJlZSgpIGNhbGxzIGluIHViaWZz
X3B1cmdlX3hhdHRycygpCgpNw6VydGVuIExpbmRhaGwgKDEpOgogICAgICB1Ymk6IHdsOiBDbG9z
ZSBkb3duIHdlYXItbGV2ZWxpbmcgYmVmb3JlIG5hbmQgaXMgc3VzcGVuZGVkCgpOYXRoYW4gQ2hh
bmNlbGxvciAoMSk6CiAgICAgIHViaWZzOiBGaXggdW5pbml0aWFsaXplZCB1c2Ugb2YgZXJyIGlu
IHViaWZzX2pubF93cml0ZV9pbm9kZSgpCgpQYXNjYWwgRWJlcmhhcmQgKDEpOgogICAgICB1Ymlm
czogeGF0dHI6IHJlbW92ZSB1bnVzZWQgYW5vbnltb3VzIGVudW0KClFpbmdmYW5nIERlbmcgKDEp
OgogICAgICBqZmZzMjogZml4IHVzZSBvZiB1bmluaXRpYWxpemVkIHZhcmlhYmxlCgpTaGVuIExp
Y2h1YW4gKDIpOgogICAgICB1YmlmczogQ29udmVydCB0byB1c2UgRVJSX0NBU1QoKQogICAgICBq
ZmZzMjogQ29ycmVjdCBzb21lIHR5cG9zIGluIGNvbW1lbnRzCgpTdXJhaiBTb25hd2FuZSAoMSk6
CiAgICAgIGZzOiBqZmZzMjogRml4IGluY29uc2lzdGVudCBpbmRlbnRhdGlvbiBpbiBqZmZzMl9t
YXJrX25vZGVfb2Jzb2xldGUKClRob3JzdGVuIEJsdW0gKDEpOgogICAgICBqZmZzMjogVXNlIHN0
cl95ZXNfbm8oKSBoZWxwZXIgZnVuY3Rpb24KCldhcWFyIEhhbWVlZCAoMSk6CiAgICAgIHViaWZz
OiBhdXRoZW50aWNhdGlvbjogRml4IHVzZS1hZnRlci1mcmVlIGluIHViaWZzX3RuY19lbmRfY29t
bWl0CgpaaGFuZyBaZWt1biAoMSk6CiAgICAgIG10ZDogdWJpOiBSbW92ZSB1bnVzZWQgZGVjbGFy
YXRpb24gaW4gaGVhZGVyIGZpbGUKClpoaWhhbyBDaGVuZyAoNik6CiAgICAgIHViaWZzOiB1Ymlm
c19qbmxfd3JpdGVfaW5vZGU6IE9ubHkgY2hlY2sgb25jZSBmb3IgdGhlIGxpbWl0YXRpb24gb2Yg
eGF0dHIgY291bnQKICAgICAgdWJpZnM6IFJlbW92ZSBpbmVmZmVjdGl2ZSBmdW5jdGlvbiB1Ymlm
c19ldmljdF94YXR0cl9pbm9kZSgpCiAgICAgIHViaTogd2w6IFB1dCBzb3VyY2UgUEVCIGludG8g
Y29ycmVjdCBsaXN0IGlmIHRyeWluZyBsb2NraW5nIExFQiBmYWlsZWQKICAgICAgdWJpOiBmYXN0
bWFwOiB3bDogU2NoZWR1bGUgZm1fd29yayBpZiB3ZWFyLWxldmVsaW5nIHBvb2wgaXMgZW1wdHkK
ICAgICAgdWJpZnM6IENvcnJlY3QgdGhlIHRvdGFsIGJsb2NrIGNvdW50IGJ5IGRlZHVjdGluZyBq
b3VybmFsIHJlc2VydmF0aW9uCiAgICAgIHViaTogZmFzdG1hcDogRml4IGR1cGxpY2F0ZSBzbGFi
IGNhY2hlIG5hbWVzIHdoaWxlIGF0dGFjaGluZwoKIGRyaXZlcnMvbXRkL3ViaS9hdHRhY2guYyAg
ICAgfCAxMiArKysrKystLS0tLS0KIGRyaXZlcnMvbXRkL3ViaS9mYXN0bWFwLXdsLmMgfCAxOSAr
KysrKysrKysrKysrKysrLS0tCiBkcml2ZXJzL210ZC91YmkvbnZtZW0uYyAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvbXRkL3ViaS91YmkuaCAgICAgICAgfCAgMyArKy0KIGRyaXZlcnMvbXRkL3ViaS92
bXQuYyAgICAgICAgfCAgMiArKwogZHJpdmVycy9tdGQvdWJpL3dsLmMgICAgICAgICB8IDMyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KIGRyaXZlcnMvbXRkL3ViaS93bC5oICAgICAg
ICAgfCAgMyArKy0KIGZzL2pmZnMyL2NvbXByX3J0aW1lLmMgICAgICAgfCAgMyArKysKIGZzL2pm
ZnMyL2NvbXByX3J1YmluLmMgICAgICAgfCAgNSAtLS0tLQogZnMvamZmczIvZXJhc2UuYyAgICAg
ICAgICAgICB8ICA3ICsrKy0tLS0KIGZzL2pmZnMyL2djLmMgICAgICAgICAgICAgICAgfCAgMiAr
LQogZnMvamZmczIvbm9kZW1nbXQuYyAgICAgICAgICB8IDE3ICsrKysrKysrKy0tLS0tLS0tCiBm
cy9qZmZzMi9yZWFkaW5vZGUuYyAgICAgICAgIHwgIDIgKy0KIGZzL3ViaWZzL2lvY3RsLmMgICAg
ICAgICAgICAgfCAgNiAtLS0tLS0KIGZzL3ViaWZzL2pvdXJuYWwuYyAgICAgICAgICAgfCAxMyAr
KysrKysrLS0tLS0tCiBmcy91Ymlmcy9scHRfY29tbWl0LmMgICAgICAgIHwgIDQgKystLQogZnMv
dWJpZnMvb3JwaGFuLmMgICAgICAgICAgICB8ICAyICstCiBmcy91Ymlmcy9zdXBlci5jICAgICAg
ICAgICAgIHwgIDggKysrKystLS0KIGZzL3ViaWZzL3RuYy5jICAgICAgICAgICAgICAgfCAgMiAt
LQogZnMvdWJpZnMvdG5jX2NvbW1pdC5jICAgICAgICB8ICAyICsrCiBmcy91Ymlmcy91Ymlmcy5o
ICAgICAgICAgICAgIHwgIDMgLS0tCiBmcy91Ymlmcy94YXR0ci5jICAgICAgICAgICAgIHwgNDUg
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIyIGZpbGVzIGNo
YW5nZWQsIDk2IGluc2VydGlvbnMoKyksIDk4IGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
