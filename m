Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3A2CF6D24
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 13:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvuthzvDyo0N+hXFQSUaq/nXHl5NWR5VZC3VWKvTEf0=; b=VKzTXR7XeEWT/c
	I8SVwBQZNHnt24hRtKgYbLq8LRTP0MBMDS2DG+w05+ioQUCOFlBUUIgeYdBLuar0yh/e3bo5VDKuM
	ItOm0bO5ZDeqtqOZV6wI3PlaA37STY+UdIZkvXetoulyVwMP2gJLvOgCV6LL6vHzietuu+S6UEAdp
	3ams1TdSt4mhBCzKuGHoo243pgpzF1gVqbHpBbnUoyZ6x0O1C7Z6AC1nI7bPcNv1Zjba8SihIB0e7
	dKH+Ft7FVHtL/dif7s4S/XqDLb99aoYLLiiDcTgEptLvxBH8s6lVNrZ2DudFrsyueaXXypZTf0avD
	iaGFwjzknMcwM3Kq/mFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svzPc-0000000687j-1ln1;
	Wed, 02 Oct 2024 13:29:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svzOL-000000067jF-19nK
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 13:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5C64A43CE8;
	Wed,  2 Oct 2024 13:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E114C4CEC5;
	Wed,  2 Oct 2024 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1727875663;
	bh=Ke73fpBSTBcPwHgL8MZF5HU8ow/Y9/NPq939+UNevL4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yQ0TQbGvH8sviws5Xr6YGA/poaYfKXGsfYu9Eu6w8r6V8nWPDn2Odk9tcQmx835bv
	 NbPl3jon1q9DEHFfP5Qj+y+i6t+476uHmPnXBV2DTTtYE/Rp2I6LyaxbTEs5O+2U1n
	 OpzSzkDcCctUQVYbL6EOAL0Yu6sWw1fP2EvwCArU=
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
Subject: [PATCH 6.11 178/695] mtd: slram: insert break after errors in parsing the map
Date: Wed,  2 Oct 2024 14:52:56 +0200
Message-ID: <20241002125829.577375847@linuxfoundation.org>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241002125822.467776898@linuxfoundation.org>
References: <20241002125822.467776898@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_062745_398711_E4DD7C7C 
X-CRM114-Status: GOOD (  11.53  )
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

Ni4xMS1zdGFibGUgcmV2aWV3IHBhdGNoLiAgSWYgYW55b25lIGhhcyBhbnkgb2JqZWN0aW9ucywg
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
