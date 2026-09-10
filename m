Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3C8C79FBF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2026 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6FDTICYwY93hczagFyN3HMp0xeKa/iqph2WnWuWxuA=; b=fGIZbr9AWYOBkH
	+zPYth8s4AlRRXbiQnKQW3NVPQ2FYQAEVMEKF9Kt9R1X3hHoq0mupUrlnw8YX134Lk0v0llmetehU
	JyDgpoqytbzeEGa/hjb/6V3m8H/qt/a0GnB/O7DOMLSasKtynJehOhGpv9ZQfvnbTVtqG0jdCbI3R
	ypWpdqd7o6qhSQrN7n2P5U64bUhgs2L3PPlOsm78wjpIDVKZdsfXKXm1BFqdHxq5SA3wX4Tr3JZfS
	ho1YYBHCS7zZBkZok9MCgU6LE0FbLwNrE6B9oYU88L5eOj+kJByq7XWPQr0F+FXMCcLSbWBZMwYSU
	TGtMTrwUXBu7TXLI0JTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i2T-0000000F0PJ-0Eyd;
	Thu, 10 Sep 2026 16:54:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4i2S-0000000F0P4-1EQo
	for linux-mtd@lists.infradead.org;
	Thu, 10 Sep 2026 16:54:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B1D860202;
	Thu, 10 Sep 2026 16:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7BCD1F000FF;
	Thu, 10 Sep 2026 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789059255;
	bh=5GI8suLmLX0X8AuwQVVSjbap4BDzNlVQVLu6TfgyQVI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OpzUPq5xMQ37fahQOcL/f/B0zfr9B+XXAJhvNTALr0u71KgQU8d5eDeJ2dD8B622Q
	 i0KSk8B3kRDugxaIreFbdwK8yEOVfEoxgb1sWeH1QE5iWfc85xSbvQh95GIwOJmW84
	 UZMxlerPD0V6d9cJA1to0uJkZm1Mtmv1yII1Vk+0CHX4F6eWTbqKADE53iNEitGij8
	 WzkkCdpTDGf2UtT5Pi1ymHOmwlnjJfL+yZdkyTz5JQBGOiyxazgwK5zAiFOTkiNU5g
	 j88U7KDwJ36na7qR3Af7ttRsEDe8lmp29Fuvn9uWPUineuzL/IbqMtjQRVYlBAvjZ8
	 nJOkwc38qJ3vA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spinand: Do not update the QE bit on devices
 without one
To: "Sagnik Sasmal" <sagnik@sagnik.me>, miquel.raynal@bootlin.com
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org, mikhail.kshevetskiy@iopsys.eu, linux-kernel@vger.kernel.org, tudor.ambarus@linaro.org
In-Reply-To: <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
References: <878q59s2iv.fsf@bootlin.com>
 <010701a08c36e962-eb595dbe-b80b-44eb-858d-c1033f8a86a1-000000@eu-central-1.amazonses.com>
Date: Thu, 10 Sep 2026 16:54:14 +0000
Message-Id: <20260910165414.A7BCD1F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIFVuaW5pdGlhbGl6ZWQg
cmV0dXJuIHZhbHVlIGluIGBzcGluYW5kX2NvbmZpZ3VyZV9jaGlwKClgIGNhbiBjYXVzZSBkZXZp
Y2UgcHJvYmUgZmFpbHVyZS4KLS0KCmNvbW1pdCAyNWFmZWFmMjA4NjRkNGY3OWZlOWEzMTRjMTI1
MTkwMTE5OTMwOTY1CkF1dGhvcjogU2FnbmlrIFNhc21hbCA8c2FnbmlrQHNhZ25pay5tZT4KCm10
ZDogc3BpbmFuZDogRG8gbm90IHVwZGF0ZSB0aGUgUUUgYml0IG9uIGRldmljZXMgd2l0aG91dCBv
bmUKClRoaXMgcGF0Y2ggbW92ZXMgdGhlIGNhbGwgdG8gc3BpbmFuZF9pbml0X3F1YWRfZW5hYmxl
KCkgaW5zaWRlIHRoZQpTUElOQU5EX0hBU19RRV9CSVQgY29uZGl0aW9uIHRvIGF2b2lkIGNsZWFy
aW5nIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgYml0IDAKb24gZGV2aWNlcyB3aXRob3V0IGEgUUUg
Yml0LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gaW5kZXggNDNiYmUyNjI5Yjg1Yi4uZTU5NTgxZDM1OTZi
NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiArKysgYi9kcml2
ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiBAQCAtMTgxMywxMSArMTgxMywxMSBAQCBzdGF0aWMg
aW50IHNwaW5hbmRfY29uZmlndXJlX2NoaXAoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGluYW5k
KQo+ICAJCSAgICBzcGluYW5kLT5zc2RyX29wX3RlbXBsYXRlcy53cml0ZV9jYWNoZS0+ZGF0YS5i
dXN3aWR0aCA9PSA0IHx8Cj4gIAkJICAgIHNwaW5hbmQtPnNzZHJfb3BfdGVtcGxhdGVzLnVwZGF0
ZV9jYWNoZS0+ZGF0YS5idXN3aWR0aCA9PSA0KQo+ICAJCQlxdWFkX2VuYWJsZSA9IHRydWU7Cj4g
LQl9Cj4gIAo+IC0JcmV0ID0gc3BpbmFuZF9pbml0X3F1YWRfZW5hYmxlKHNwaW5hbmQsIHF1YWRf
ZW5hYmxlKTsKPiAtCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiArCQlyZXQgPSBzcGluYW5k
X2luaXRfcXVhZF9lbmFibGUoc3BpbmFuZCwgcXVhZF9lbmFibGUpOwo+ICsJCWlmIChyZXQpCj4g
KwkJCXJldHVybiByZXQ7Cj4gKwl9Cj4gIAo+ICAJaWYgKHNwaW5hbmQtPmNvbmZpZ3VyZV9jaGlw
KSB7Cj4gIAkJcmV0ID0gc3BpbmFuZC0+Y29uZmlndXJlX2NoaXAoc3BpbmFuZCwgU1NEUik7Cgpb
U2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyBjb2RlIGxlYXZlICdyZXQnIHVuaW5pdGlhbGl6ZWQg
aWYgdGhlIGRldmljZSBsYWNrcyBib3RoIHRoZQpTUElOQU5EX0hBU19RRV9CSVQgZmxhZyBhbmQg
YSBjb25maWd1cmVfY2hpcCBjYWxsYmFjaz8KCkxvb2tpbmcgYXQgdGhlIHJlc3Qgb2Ygc3BpbmFu
ZF9jb25maWd1cmVfY2hpcCgpIGluIGRyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYzoKCnN0YXRp
YyBpbnQgc3BpbmFuZF9jb25maWd1cmVfY2hpcChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5h
bmQpCnsKCWJvb2wgb2R0ciA9IGZhbHNlLCBxdWFkX2VuYWJsZSA9IGZhbHNlOwoJaW50IHJldDsK
CgkuLi4KCnRyeV9zc2RyOgoJaWYgKHNwaW5hbmQtPmZsYWdzICYgU1BJTkFORF9IQVNfUUVfQklU
KSB7CgkJLi4uCgkJcmV0ID0gc3BpbmFuZF9pbml0X3F1YWRfZW5hYmxlKHNwaW5hbmQsIHF1YWRf
ZW5hYmxlKTsKCQlpZiAocmV0KQoJCQlyZXR1cm4gcmV0OwoJfQoKCWlmIChzcGluYW5kLT5jb25m
aWd1cmVfY2hpcCkgewoJCXJldCA9IHNwaW5hbmQtPmNvbmZpZ3VyZV9jaGlwKHNwaW5hbmQsIFNT
RFIpOwoJCWlmIChyZXQpCgkJCXJldHVybiByZXQ7Cgl9CgoJcmV0dXJuIHJldDsKfQoKSWYgbmVp
dGhlciBjb25kaXRpb24gaXMgbWV0LCBpdCBhcHBlYXJzIHRoZSBmdW5jdGlvbiB3aWxsIHJldHVy
biBhbgp1bmluaXRpYWxpemVkIHN0YWNrIHZhcmlhYmxlLiBJZiB0aGlzIHN0YWNrIG1lbW9yeSBo
b2xkcyBhIG5vbi16ZXJvIHZhbHVlLAp0aGUgY2FsbGVyIHNwaW5hbmRfaW5pdF9mbGFzaCgpIG1h
eSB0cmVhdCBpdCBhcyBhIGZhaWx1cmUgYW5kIGFib3J0IGRldmljZQppbml0aWFsaXphdGlvbi4K
Ci0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQv
MDEwNzAxYTA4YzM2ZTk2Mi1lYjU5NWRiZS1iODBiLTQ0ZWItODU4ZC1jMTAzM2Y4YTg2YTEtMDAw
MDAwQGV1LWNlbnRyYWwtMS5hbWF6b25zZXMuY29tP3BhcnQ9MQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
