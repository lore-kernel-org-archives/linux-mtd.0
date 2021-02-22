Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC6FC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 20:17:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49C864DFD
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 20:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A49C864DFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jrAwDo5MYHOdLnS5RSvfuAVtyfQvDw4FD9guWiuX8yI=; b=AENaNmBo6WHwePq7HQ6hb4XHtB
	CxlUeivf/U+kpektS4irDlOz3qK/7Knkmv38KqFq+ljPAqcSW0KzQbiepALhScVxk6DrBshbS4BHF
	bNGlw3zILJkXXrQV6wNQZgRDgMrh3+r3oMLQL3F+aMU9lMSExRGpzuZYXT0qNyjZnVbwi2AHRX+xq
	Tf8a9qePRzSHQ2koIKutfgSlcxIILwDXb8io6PeGp3AzUTmhQfktIzrLNnt4PNPU1Su+Z/NffOXcc
	Hm90EkKIhFFPbPlJ9n4kxNsIzo4fm2ZAnqrPGYdjwvtTjNWJF2SoIUzaiqy7jeMSxjNIh58IetRIX
	p0LYHLjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEHdd-0006ny-Uo; Mon, 22 Feb 2021 20:17:02 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEHdb-0006nB-L6
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 20:17:00 +0000
Received: by mail-wr1-x433.google.com with SMTP id d11so1037785wrj.7
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2021 12:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FNpf1WTmufOquSJigNdqP1VsRu9mN6RPbIuIKJ+aSyo=;
 b=ExmZ0llzHQFOJiIBf3pJwbKdOEK0ywmump7PiCpQF52HrrDVnm4gFtOodkyDtcSGI8
 VOjefbWgGwSrD4QJxoaPmdJtXQBx7FeCZo99xPdTFmg2yMyunoagor0maXQEZ89kfDyQ
 2oRvM0G/1WTfeaMNZtH32XFfmZMVbB3pN5alrfOMISYtFcZn61gMSi05Fk0bdocfOdvZ
 6xAkHEiDMpXGvXuDXTyMmLIbztL1wjgSVHCwusBiIZol0WOXKhcaLlr6V/u6q2v5etbn
 CBSdy4BZC/ZMuNpec+n0mLfVDU3ZTlqyNhAsLKYtqaN8LmNnWgkrIPyC3prxax8Hinps
 y90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FNpf1WTmufOquSJigNdqP1VsRu9mN6RPbIuIKJ+aSyo=;
 b=JYZaEIYNCZJh8lIZ4CvdPQAfM6APOMuhe0y4sIAMsgPf71teWlYydqfonJtBVk525H
 wfvx7mV8kjse9v/b/NyoLUl3e4muixpc0X12rOh1VOmPwAhl6p1J+MMFQ0w3innvAkFM
 cOhUXSDwffFW1kk4J328TkZpfU0xz34mQhNB3cXvKQrkAWcXy/mG9T1Yv82npukSI/ej
 1t0vrHwrlxZNhXd6pz++Ci/tnHXP3qQ/yZKJ5e03OhZ1PbyaHSFGK4ok5kP5bZOh7HgZ
 mSFpWKwNL7wK+RZ3dh7LQj1ndoT/9Kk20UqbIeVjLbLc9O7cTgl8XSCN2/8lkKknqXvO
 Em+w==
X-Gm-Message-State: AOAM530yTyt1W/MuuHR3afC1DmnN2RsLLW5t0NV8bQXT2KTWTmsczJcn
 kCSlPIzJklY+wLlovXjz4tM=
X-Google-Smtp-Source: ABdhPJx+c/A5IPTtbAYjZmVXoKRDL3SiFrBkLdy+0eTjLBNZwfx3qd/jYJkFn2P7q5twhRj+5Esynw==
X-Received: by 2002:adf:8bd2:: with SMTP id w18mr23261463wra.204.1614025018124; 
 Mon, 22 Feb 2021 12:16:58 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net.
 [88.1.105.170])
 by smtp.gmail.com with ESMTPSA id o14sm28489528wri.48.2021.02.22.12.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 12:16:57 -0800 (PST)
From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-kernel@vger.kernel.org
Subject: [PATCH] nand: brcmnand: fix OOB R/W with Hamming ECC
Date: Mon, 22 Feb 2021 21:16:55 +0100
Message-Id: <20210222201655.32361-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_151659_750478_28603ADE 
X-CRM114-Status: GOOD (  11.54  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGFtbWluZyBFQ0MgZG9lc24ndCBjb3ZlciB0aGUgT09CIGRhdGEsIHNvIHJlYWRpbmcgb3Igd3Jp
dGluZyBPT0Igc2hhbGwKYWx3YXlzIGJlIGRvbmUgd2l0aG91dCBFQ0MgZW5hYmxlZC4KVGhpcyBp
cyBhIHByb2JsZW0gd2hlbiBhZGRpbmcgSkZGUzIgY2xlYW5tYXJrZXJzIHRvIGVyYXNlZCBibG9j
a3MuIElmIEpGRlMyCmNsZW5tYXJrZXJzIGFyZSBhZGRlZCB0byB0aGUgT09CIHdpdGggRUNDIGVu
YWJsZWQsIE9PQiBieXRlcyB3aWxsIGJlIGNoYW5nZWQKZnJvbSBmZiBmZiBmZiB0byAwMCAwMCAw
MCwgcmVwb3J0aW5nIGluY29ycmVjdCBFQ0MgZXJyb3JzLgoKU2lnbmVkLW9mZi1ieTogw4FsdmFy
byBGZXJuw6FuZGV6IFJvamFzIDxub2x0YXJpQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFu
ZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYwpp
bmRleCA2NTllYWE2ZjA5ODAuLjVmZjQyOTEzODBjNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvYnJjbW5hbmQvYnJjbW5hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9i
cmNtbmFuZC9icmNtbmFuZC5jCkBAIC0yNjg4LDYgKzI2ODgsMTIgQEAgc3RhdGljIGludCBicmNt
bmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQogCiAJcmV0ID0gYnJjbXN0
Yl9jaG9vc2VfZWNjX2xheW91dChob3N0KTsKIAorCS8qIElmIE9PQiBpcyB3cml0dGVuIHdpdGgg
RUNDIGVuYWJsZWQgaXQgd2lsbCBjYXVzZSBFQ0MgZXJyb3JzICovCisJaWYgKGlzX2hhbW1pbmdf
ZWNjKGhvc3QtPmN0cmwsICZob3N0LT5od2NmZykpIHsKKwkJY2hpcC0+ZWNjLndyaXRlX29vYiA9
IGJyY21uYW5kX3dyaXRlX29vYl9yYXc7CisJCWNoaXAtPmVjYy5yZWFkX29vYiA9IGJyY21uYW5k
X3JlYWRfb29iX3JhdzsKKwl9CisKIAlyZXR1cm4gcmV0OwogfQogCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
