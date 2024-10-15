Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150B6D21690
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2024 12:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KBrKB9xm7h11jvdDUM7JTohqpGbYw8yKM+5mW081TjU=; b=LVMqaFvfk2M0p1
	RUxxBe6+SMf92pzNG3dnt5WAzWDv6z/xGY+gfr98jI+kNnD/PbsP7CBPJ1Xql/jXrMtpn/Rak1G1h
	4U7cONm9n9vVCO9BrthXn3e4ffW487RllXqFxJARCYE+QB3kNLt1AstOVcu6K4AnAAGNnx3TRLILs
	bvhqExffHvvXlE8xaV9Z7t4+ObeD8bZ9gyInVrJAnoEBaFq3GxcXeZYVaeX5JpuSSmQfTRcLJq8Hn
	idyhZLV+ldR3r7OU8ZqAL9ECLdKeeGB0OG9M3GUJVB1iEbCcNY0OacRbbg5JVMWynRienLZlEFQfC
	H7KnKt7STHxCsyh3OVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0h9C-00000008GM4-0kML;
	Tue, 15 Oct 2024 12:59:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0h99-00000008GLZ-0p1T
	for linux-mtd@lists.infradead.org;
	Tue, 15 Oct 2024 12:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 39AFA5C5C9F;
	Tue, 15 Oct 2024 12:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C44C4CEC6;
	Tue, 15 Oct 2024 12:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728997170;
	bh=vbA4FbriabIT+PkcPoc7rdCQMhFzvauAPINAAEWG6io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1mku6yJ8iq/IB4PKat8mHkneGMdP3onarvZxDShwH5Cs4lNwQHoVNSt4+3r9U5jwh
	 IWCFpsj9H8OYD6r+2A/oL7lDDcEfpQrF0N3Lw5Wata26h3bDzCHdit/z6EE2Ny7KYx
	 opYJeO+Xz0r73kBpN+ugiSiYNqnIvMZjuz1ZY5wI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Mirsad Todorovac <mtodorovac69@gmail.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10 107/518] mtd: slram: insert break after errors in parsing the map
Date: Tue, 15 Oct 2024 14:40:11 +0200
Message-ID: <20241015123921.130064942@linuxfoundation.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015123916.821186887@linuxfoundation.org>
References: <20241015123916.821186887@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_055931_299883_C7E0F1E7 
X-CRM114-Status: GOOD (  11.59  )
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

NS4xMC1zdGFibGUgcmV2aWV3IHBhdGNoLiAgSWYgYW55b25lIGhhcyBhbnkgb2JqZWN0aW9ucywg
cGxlYXNlIGxldCBtZSBrbm93LgoKLS0tLS0tLS0tLS0tLS0tLS0tCgpGcm9tOiBNaXJzYWQgVG9k
b3JvdmFjIDxtdG9kb3JvdmFjNjlAZ21haWwuY29tPgoKWyBVcHN0cmVhbSBjb21taXQgMzM2YzIx
OGRkN2YwNTg4ZWQ4YTczNDVmMzY3OTc1YTAwYTRmMDAzZiBdCgpHQ0MgMTIuMy4wIGNvbXBpbGVy
IG9uIGxpbnV4LW5leHQgbmV4dC0yMDI0MDcwOSB0cmVlIGZvdW5kIHRoZSBleGVjdXRpb24KcGF0
aCBpbiB3aGljaCwgZHVlIHRvIGxhenkgZXZhbHVhdGlvbiwgZGV2bGVuZ3RoIGlzbid0IGluaXRp
YWxpc2VkIHdpdGggdGhlCnBhcnNlZCBzdHJpbmc6CgogICAyODkJCXdoaWxlIChtYXApIHsKICAg
MjkwCQkJZGV2bmFtZSA9IGRldnN0YXJ0ID0gZGV2bGVuZ3RoID0gTlVMTDsKICAgMjkxCiAgIDI5
MgkJCWlmICghKGRldm5hbWUgPSBzdHJzZXAoJm1hcCwgIiwiKSkpIHsKICAgMjkzCQkJCUUoInNs
cmFtOiBObyBkZXZpY2VuYW1lIHNwZWNpZmllZC5cbiIpOwogICAyOTQJCQkJYnJlYWs7CiAgIDI5
NQkJCX0KICAgMjk2CQkJVCgic2xyYW06IGRldm5hbWUgPSAlc1xuIiwgZGV2bmFtZSk7CiAgIDI5
NwkJCWlmICgoIW1hcCkgfHwgKCEoZGV2c3RhcnQgPSBzdHJzZXAoJm1hcCwgIiwiKSkpKSB7CiAg
IDI5OAkJCQlFKCJzbHJhbTogTm8gZGV2aWNlc3RhcnQgc3BlY2lmaWVkLlxuIik7CiAgIDI5OQkJ
CX0KICAgMzAwCQkJVCgic2xyYW06IGRldnN0YXJ0ID0gJXNcbiIsIGRldnN0YXJ0KTsKIOKGkiAz
MDEJCQlpZiAoKCFtYXApIHx8ICghKGRldmxlbmd0aCA9IHN0cnNlcCgmbWFwLCAiLCIpKSkpIHsK
ICAgMzAyCQkJCUUoInNscmFtOiBObyBkZXZpY2VsZW5ndGggLyAtZW5kIHNwZWNpZmllZC5cbiIp
OwogICAzMDMJCQl9CiDihpIgMzA0CQkJVCgic2xyYW06IGRldmxlbmd0aCA9ICVzXG4iLCBkZXZs
ZW5ndGgpOwogICAzMDUJCQlpZiAocGFyc2VfY21kbGluZShkZXZuYW1lLCBkZXZzdGFydCwgZGV2
bGVuZ3RoKSAhPSAwKSB7CiAgIDMwNgkJCQlyZXR1cm4oLUVJTlZBTCk7CiAgIDMwNwkJCX0KClBh
cnNpbmcgc2hvdWxkIGJlIGZpbmlzaGVkIGFmdGVyIG1hcCA9PSBOVUxMLCBzbyBhIGJyZWFrIGlz
IGJlc3QgaW5zZXJ0ZWQgYWZ0ZXIKZWFjaCBFKCJzbHJhbTogLi4uIFxuIikgZXJyb3IgbWVzc2Fn
ZS4KCkZpeGVzOiAxZGExNzdlNGMzZjQgKCJMaW51eC0yLjYuMTItcmMyIikKQ2M6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CkNjOiBSaWNoYXJkIFdlaW5iZXJnZXIg
PHJpY2hhcmRAbm9kLmF0PgpDYzogVmlnbmVzaCBSYWdoYXZlbmRyYSA8dmlnbmVzaHJAdGkuY29t
PgpDYzogbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogTWlyc2Fk
IFRvZG9yb3ZhYyA8bXRvZG9yb3ZhYzY5QGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KTGluazogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtbXRkLzIwMjQwNzExMjM0MzE5LjYzNzgyNC0xLW10b2Rvcm92YWM2OUBn
bWFpbC5jb20KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3NscmFtLmMg
Yi9kcml2ZXJzL210ZC9kZXZpY2VzL3NscmFtLmMKaW5kZXggMjgxMzFhMTI3ZDA2NS4uODI5N2Iz
NjZhMDY2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9zbHJhbS5jCisrKyBiL2Ry
aXZlcnMvbXRkL2RldmljZXMvc2xyYW0uYwpAQCAtMjk2LDEwICsyOTYsMTIgQEAgc3RhdGljIGlu
dCBfX2luaXQgaW5pdF9zbHJhbSh2b2lkKQogCQlUKCJzbHJhbTogZGV2bmFtZSA9ICVzXG4iLCBk
ZXZuYW1lKTsKIAkJaWYgKCghbWFwKSB8fCAoIShkZXZzdGFydCA9IHN0cnNlcCgmbWFwLCAiLCIp
KSkpIHsKIAkJCUUoInNscmFtOiBObyBkZXZpY2VzdGFydCBzcGVjaWZpZWQuXG4iKTsKKwkJCWJy
ZWFrOwogCQl9CiAJCVQoInNscmFtOiBkZXZzdGFydCA9ICVzXG4iLCBkZXZzdGFydCk7CiAJCWlm
ICgoIW1hcCkgfHwgKCEoZGV2bGVuZ3RoID0gc3Ryc2VwKCZtYXAsICIsIikpKSkgewogCQkJRSgi
c2xyYW06IE5vIGRldmljZWxlbmd0aCAvIC1lbmQgc3BlY2lmaWVkLlxuIik7CisJCQlicmVhazsK
IAkJfQogCQlUKCJzbHJhbTogZGV2bGVuZ3RoID0gJXNcbiIsIGRldmxlbmd0aCk7CiAJCWlmIChw
YXJzZV9jbWRsaW5lKGRldm5hbWUsIGRldnN0YXJ0LCBkZXZsZW5ndGgpICE9IDApIHsKLS0gCjIu
NDMuMAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
