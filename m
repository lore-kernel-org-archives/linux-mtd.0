Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4273BC04A6A
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Aug 2023 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BEY/hlufA+IAqJ0c39l7Pz90pJqPTTgwitPzbE34lpM=; b=5A4y7KyaO12xiU
	4p2FyzNAhfZHG/JQHbF92Dty+iLF67jqOz7cRSH1yMJZLAPdbem3jvM7saI2RNLpeg+fjP771e21t
	xWGK/JKGK/gDGAw7DzlL3/p6I2F4POVFXNzAcj3hWrTC/ZKa7KNTNYI0woDEpptgpDw+YPChkDt51
	uj8KPGo7z+j26p6ZPKy9rFCpubEXvit4ZPW2d8cOEg9UMhkuPp0WkmcqYycjHBnBs6FG7kvgTieSx
	1/cHE5Gcj2zuoDYJbmiKdjT6wpobkvOAVczEcZLFy1+Mf3kKFvY74ZQ3ZRj3z2Oo3MujMN73JHkFD
	LkDOx5RlyATn1gcdzJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpAR-00Bm5V-22;
	Fri, 04 Aug 2023 07:24:11 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpAP-00Bm5B-1d
	for linux-mtd@lists.infradead.org;
	Fri, 04 Aug 2023 07:24:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 894E240007;
	Fri,  4 Aug 2023 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691133845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j342T9+w8AIX1vd6sGWYzMcKTCMg2Pp7WhT/NRZD0HI=;
	b=VQ/plgzca1J+scu3DbttC2hJ520sKbtmufEHGJYPtSxyfbwfkrt1qMEGjZf7O3PkGjfQrn
	A6E5TXCo1M9SzmBDOajA/pbFIHHGUc5BxAYlYay+ijyGSdFbHJLTH2KhdadwVSnwz5sbAp
	WN5HI5zd2dV6Gk2ID6sE0qIr3OAuM10hy8NIi6IQ9HzFL+6FZQesj9XKSbmqsvTa5qdeXb
	LNPnm7FN67qo7krxEFmeEYZGshmyryI8q1KjlmTK3EYv1llvp1zgduxx9lE5JVCt86I7JG
	xmAyTQwDBJpqqpfvopsowL6550UrI0UO1oXl9D/mITH5fA19VpC+UjvktkM4wQ==
Date: Fri, 4 Aug 2023 09:24:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@linaro.org>, Vignesh Raghavendra
 <vigneshr@ti.com>, Frieder Schrempf <frieder.schrempf@kontron.de>, Michael
 Walle <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] mtd: Fixes for v6.5-rc5
Message-ID: <20230804092401.18b19001@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_002409_838641_45B21D68 
X-CRM114-Status: UNSURE (   9.54  )
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

SGVsbG8gTGludXMsCgpUaGlzIGlzIGEgZml4ZXMgTVREIFBSIGZvciB0aGUgbmV4dCAtcmMuCgpU
aGFua3MsCk1pcXXDqGwKClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMDZjMmFm
Yjg2MmY5ZGE4ZGM1ZWZhNGI2MDc2YTBlNDhjM2ZiYWFhNToKCiAgTGludXggNi41LXJjMSAoMjAy
My0wNy0wOSAxMzo1MzoxMyAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0OgoKICBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bXRkL2xpbnV4LmdpdCB0YWdzL210ZC9maXhlcy1mb3ItNi41LXJjNQoKZm9yIHlvdSB0byBmZXRj
aCBjaGFuZ2VzIHVwIHRvIGM2YWJjZTYwMzM4YWEyMDgwOTczY2Q5NWJlMGFlZGFkNTI4YmI0MWY6
CgogIG10ZDogcmF3bmFuZDogZnNsX3VwbTogRml4IGFuIG9mZi1ieSBvbmUgdGVzdCBpbiBmdW5f
ZXhlY19vcCgpICgyMDIzLTA3LTI3IDE2OjU0OjIzICswMjAwKQoKLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpSYXcgTkFORCBm
aXhlczoKKiBmc2xfdXBtOiBGaXggYW4gb2ZmLWJ5IG9uZSB0ZXN0IGluIGZ1bl9leGVjX29wKCkK
KiBSb2NrY2hpcDoKICAtIEFsaWduIGh3ZWNjIHZzLiByYXcgcGFnZSBoZWxwZXIgbGF5b3V0cwog
IC0gRml4IG9vYmZyZWUgb2Zmc2V0IGFuZCBkZXNjcmlwdGlvbgoqIE1lc29uOiBGaXggT09CIGF2
YWlsYWJsZSBieXRlcyBmb3IgRUNDCiogT21hcCBFTE06IEZpeCBpbmNvcnJlY3QgdHlwZSBpbiBh
c3NpZ25tZW50CgpTUEktTk9SIGZpeGVzOgoqIEF2b2lkIGhvbGVzIGluIHN0cnVjdCBzcGlfbWVt
X29wCgpIeXBlcmJ1cyBmaXhlczoKKiBBZGQgVHVkb3IgYXMgcmV2aWV3ZXIgaW4gTUFJTlRBSU5F
UlMKClNQSS1OQU5EIGZpeGVzOgoqIFdpbmJvbmQgYW5kIFRvc2hpYmE6IEZpeCBlY2NfZ2V0X3N0
YXR1cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQpBcm5kIEJlcmdtYW5uICgxKToKICAgICAgbXRkOiBzcGktbm9yOiBhdm9p
ZCBob2xlcyBpbiBzdHJ1Y3Qgc3BpX21lbV9vcAoKQXJzZW5peSBLcmFzbm92ICgxKToKICAgICAg
bXRkOiByYXduYW5kOiBtZXNvbjogZml4IE9PQiBhdmFpbGFibGUgYnl0ZXMgZm9yIEVDQwoKQ2hy
aXN0b3BoZSBKQUlMTEVUICgxKToKICAgICAgbXRkOiByYXduYW5kOiBmc2xfdXBtOiBGaXggYW4g
b2ZmLWJ5IG9uZSB0ZXN0IGluIGZ1bl9leGVjX29wKCkKCkpvaGFuIEpvbmtlciAoMik6CiAgICAg
IG10ZDogcmF3bmFuZDogcm9ja2NoaXA6IGZpeCBvb2JmcmVlIG9mZnNldCBhbmQgZGVzY3JpcHRp
b24KICAgICAgbXRkOiByYXduYW5kOiByb2NrY2hpcDogQWxpZ24gaHdlY2MgdnMuIHJhdyBwYWdl
IGhlbHBlciBsYXlvdXRzCgpPbGl2aWVyIE1haWduaWFsICgyKToKICAgICAgbXRkOiBzcGluYW5k
OiB0b3NoaWJhOiBGaXggZWNjX2dldF9zdGF0dXMKICAgICAgbXRkOiBzcGluYW5kOiB3aW5ib25k
OiBGaXggZWNjX2dldF9zdGF0dXMKClJvZ2VyIFF1YWRyb3MgKDEpOgogICAgICBtdGQ6IHJhd25h
bmQ6IG9tYXBfZWxtOiBGaXggaW5jb3JyZWN0IHR5cGUgaW4gYXNzaWdubWVudAoKVHVkb3IgQW1i
YXJ1cyAoMSk6CiAgICAgIE1BSU5UQUlORVJTOiBBZGQgbXlzZWxmIGFzIHJldmlld2VyIGZvciBI
WVBFUkJVUwoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX3VwbS5jICAgICAgICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jICAgICAgICAgICAgICAg
fCAgMyArLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L29tYXBfZWxtLmMgICAgICAgICAgICAgICAg
IHwgMjQgKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9yb2Nr
Y2hpcC1uYW5kLWNvbnRyb2xsZXIuYyB8IDQ1ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLQogZHJpdmVycy9tdGQvbmFuZC9zcGkvdG9zaGliYS5jICAgICAgICAg
ICAgICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL210ZC9uYW5kL3NwaS93aW5ib25kLmMgICAgICAg
ICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvbXRkL3NwaS1ub3Ivc3BhbnNpb24uYyAgICAg
ICAgICAgICAgICAgIHwgIDQgKystLQogaW5jbHVkZS9saW51eC9zcGkvc3BpLW1lbS5oICAgICAg
ICAgICAgICAgICAgICAgfCAgNCArKysrCiA5IGZpbGVzIGNoYW5nZWQsIDUwIGluc2VydGlvbnMo
KyksIDQxIGRlbGV0aW9ucygtKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
