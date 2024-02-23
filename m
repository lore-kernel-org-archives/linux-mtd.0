Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA857C54798
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Feb 2024 11:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=93NFVXIL1Jzyw2xSmn7T2Ef93cb+4ue7xDNGUXGX4IU=; b=T8N4WNJyyHKZGk
	RuUACUl1p7LhcMxqYFAK/HH2jfYazAJalKvtfQj3cIVAP0nuZOcYKYcIgWtBEIeuw63mhjMvq30G+
	1EddmBKIIZf8VhHFK2byfGfPXB2QoA/HPU8Dpm2bHHDlNIYBLe+o2CNsiAV1ITOkISQZwou0Mylt9
	gFFNmpaPPgN7wbkZGopJrK3piOEw260vUvV1/o14LnqM1BB5fMcUuqPa4Z8GafcFmAdiaF4K7AILc
	Ka/pFxVbspLRdUGGTLsWxrUh7YmEyBdTOmiHO1K8G2+GeSGTWJYCEmIMBQCt2//Qr1lW31qQvd287
	44hru2QSEiWPLpV5eT6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdU9o-00000009EdB-3R71;
	Fri, 23 Feb 2024 11:56:00 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdU9i-00000009Eb3-2HeE
	for linux-mtd@lists.infradead.org;
	Fri, 23 Feb 2024 11:55:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4CA12C0004;
	Fri, 23 Feb 2024 11:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708689349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uqPqRsroU2HM/uhxZbflZOFz5dy1nibvmQlzJ0Wiyg8=;
	b=haGrWRU851oapURs97ehMMkvDhF+beDfP0dmLsRcaFxuG0eQhBkXrIzZRryxny1MJ4/Vjq
	5ZXhmz1JH13s0xjDy6S4XX7sl7GhvBhaKr9waUzHQjk8lhPUOwX+wtOE8h1HbMVo9peSMZ
	VaDBp41OlgVIEg7inDr121dYLQAhU4cIc+XNlacZ085vYnwktKBW0jQLvB6vuMP/LhFeWF
	U1p/Updx8nrti84FqEzCv0BCnYxjNE44ch0jlQbQg9HFunZJxBY9TjW0EgWmOjlkDzRySO
	FvcrgdnQCr4hM9dEK38D0Frd/W81lpZiAHHe7V6cts86EoCBBjrjUy0BE4F0JA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?UTF-8?q?Sean=20Nyekj=C3=A6r?= <sean@geanix.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/3] mtd: rawnand: More continuous read fixes
Date: Fri, 23 Feb 2024 12:55:42 +0100
Message-Id: <20240223115545.354541-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_035554_971272_68CA33BF 
X-CRM114-Status: UNSURE (   8.98  )
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

SGVsbG8sCgpGb2xsb3dpbmcgQ2hyaXN0b3BoZSByZXBvcnQgSSBtYW51YWxseSBpbnNlcnRlZCBt
YW55IGRpZmZlcmVudApjb25kaXRpb25zIHRvIHRlc3QgdGhlIGxvZ2ljIGVuYWJsaW5nYW5kIGNv
bmZpZ3VyaW5nIGNvbnRpbnVvdXMgcmVhZHMgaW4KdGhlIGNvcmUsIHRyeWluZyB0byBjbGFyaWZ5
IHRoZSBjb3JlIGFuZCBob3BlZnVsbHkgZml4IGl0IGZvciByZWFsLiBJIGFtCnByZXR0eSBjb25m
aWRlbnQgcmVnYXJkaW5nIHRoZSBmaXJzdCBwYXRjaCBidXQgYSBiaXQgbW9yZSBpbiB0aGUgZm9n
IGZvcgp0aGUgc2Vjb25kL3RoaXJkLiBFdmVuIHRob3VnaCBJJ20gcHJldHR5IHN1cmUgdGhleSBp
bXByb3ZlIHRoZSBzaXR1YXRpb24KdGhlcmUgbWlnaHQgc3RpbGwgYmUgY29ybmVyIGNhc2VzIEkg
ZG9uJ3QgaGF2ZSBpbiBtaW5kLgoKTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
bXRkLzIwMjQwMjIxMTc1MzI3LjQyZjcwNzZkQHhwcy0xMy9ULyNtMzk5YmFjYjEwZGI4ZjU4ZjZi
MWYwMTQ5YTFkZjg2N2VjMDg2YmIwYQoKQ2hlZXJzLApNaXF1w6hsCgpNaXF1ZWwgUmF5bmFsICgz
KToKICBtdGQ6IHJhd25hbmQ6IEZpeCBhbmQgc2ltcGxpZnkgYWdhaW4gdGhlIGNvbnRpbnVvdXMg
cmVhZCBkZXJpdmF0aW9ucwogIG10ZDogcmF3bmFuZDogQWRkIGEgaGVscGVyIGZvciBjYWxjdWxh
dGluZyBhIHBhZ2UgaW5kZXgKICBtdGQ6IHJhd25hbmQ6IEVuc3VyZSBhbGwgY29udGludW91cyB0
ZXJtcyBhcmUgYWx3YXlzIGluIHN5bmMKCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5kX2Jhc2Uu
YyB8IDc3ICsrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
NDcgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
