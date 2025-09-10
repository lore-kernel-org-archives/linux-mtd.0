Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B3ACA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBQtAb03kPN+qXyKdveyCWnoEZWpLRqZm64c+tePDp0=; b=A5nFqgLUIuPf+Y
	1NolmWvjzxU6OHSOxOvUcZerg3TRp30Slj3lg6yMIy4ih8ppIZx6A7AAZvs3oGa+20xwoEonGnPcf
	nDs9atzPUQCC8gCTaNDRl1NzmKc9bl+865zpLXqo9oeqALXDS+KXA0R33ElSUxB+BcsgBQc73Ufn0
	1hIqZnWc5QjOB3OoULI9/AEKldMRwdeu839EPIP/nmk8Kzh/OKQglP//wiKhKRNJkFXSC/4Z44emd
	I2NWe5iLB/jwb/1PtOzbnmkVnwUOsOd73wCRycT3Ok0XAvkSOIurEDnzVYQe+86PbPzHJ4oo+j2Ii
	fC8PG2JZNv18iuRKZI2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJZS-0000000E00i-0Nek;
	Wed, 10 Sep 2025 12:05:06 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJZO-0000000DzyU-3gl9
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 12:05:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A20104E40C03;
	Wed, 10 Sep 2025 12:04:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E796606D4;
	Wed, 10 Sep 2025 12:04:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89A77102F1D2E;
	Wed, 10 Sep 2025 14:04:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757505898; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vr3VOmJC4zjZiu2C++UnVxjvsT2gKvQRcPB5UoP5VE4=;
	b=NKoHYBcuU/K81A8A13HgHCF31h7U5qObQ6OkcEbpyPVf5BZvbieoFv80xh1L2g8VyWBA8v
	KCRMssYqtL5J7/7IttbgPBsAmeJ31LcWfmSyj1YmovDAhg/41GVr1J+I/QlgSRXr1iEG/R
	AklLcdIEbBY30fCkrYuuoOxs4JYyB3hW/rnlzDAt8i16/Ym+vqEym3+sbO4nxlL7W8qEtc
	sG2XaKiYNKqs35tYYb2tZgHxHYz9JjiOAHKrwA2aR6quJtC0NyzHhvP3MB2hCgdUcmbjHj
	bHoaI7gB9eFUhvSLQccmQk6EfEIJlW1rX+7FDH9QsebpkKdd9IHMx2ddAwKkGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jakub Czapiga <czapiga@google.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Konrad
 Adamczyk <konrada@google.com>,  Adeel Arshad <adeel.arshad@intel.com>,
  Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Check read CR support
In-Reply-To: <20250910103355.629421-1-czapiga@google.com> (Jakub Czapiga's
	message of "Wed, 10 Sep 2025 10:33:55 +0000")
References: <20250910103355.629421-1-czapiga@google.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Wed, 10 Sep 2025 14:04:42 +0200
Message-ID: <87frcucy3p.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_050503_527627_B986859A 
X-CRM114-Status: UNSURE (   8.17  )
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

SGkgSmFrdWIsCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2Ry
aXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5kZXggYWM0Yjk2MDEwMWNjLi43OWRlZWUzYTUw
ZDMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2
ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+IEBAIC0yNjA4LDYgKzI2MDgsMTAgQEAgc3RhdGljIGlu
dCBzcGlfbm9yX3NldHVwKHN0cnVjdCBzcGlfbm9yICpub3IsCj4gIAkJfQo+ICAJfQo+ICAKPiAr
CS8qIFNvbWUgU1BJIGNvbnRyb2xsZXJzIG1pZ2h0IG5vdCBzdXBwb3J0IENSIHJlYWQgb3Bjb2Rl
LiAqLwo+ICsJaWYgKHNwaV9ub3JfcmVhZF9jcihub3IsIG5vci0+Ym91bmNlYnVmKSA9PSAtRU9Q
Tk9UU1VQUCkKClRoZXJlIGlzIGEgc3BpX25vcl9zcGltZW1fY2hlY2tfb3AoKSBoZWxwZXIgd2hp
Y2ggbWlnaHQgYmUgYmV0dGVyIHN1aXRlZApmb3IgdGhpcyBwdXJwb3NlPwoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
