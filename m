Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17745606A885
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CzK+NXv8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=WDICBJN3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aOFDDdntFQ2GhPOCKnANDtJ8aiqMGPSGPkk4vwOdUl4=; b=CzK+NXv86C9hi9t0I4EGuPDEAa
	JgvMpY1TYfcw30ZhChjs8OS/IeSM8kOlOEkUVSkjrOK5rzAUBigyMKhoUKcFFFWSE9l+bflE7dOow
	XiqODBJDqLnvdxE9cQ+am0ynB7yldGJAyFGUT7PMY8UQRebs6XrCVZ70EbuNqHme/HPlnpjF1IBQE
	RfK+ca+dAcVRcfTDR+8nQ+yz2G240l5yiYfXinSH7+QwGjngljANSfTKWB+CokXY+sO5DO98+4Q0n
	QqFdEhOkSMEBvvTlGUkUxE3GkRyeCsD7MWjpbsRENox2W/BoJqJLY2fEA0pdzUanm5Bx+jRylZi1U
	BQ+5Mcfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJN8-00000005xv1-3Lh3;
	Tue, 17 Nov 2026 13:37:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJN6-00000005xtW-2skW
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 13:37:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 46BBAC79A97;
	Tue, 17 Nov 2026 13:37:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D97505FC81;
	Tue, 17 Nov 2026 13:37:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65FF911BC0024;
	Tue, 17 Nov 2026 14:37:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794922629; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xEFuU2qKV+v5WtO97lVqT1rvBSUmDGK6lfnCTwEgqX8=;
	b=WDICBJN3kRw4+uumCgAT0kHX5Ps8gFDMmX4/WlFuqgKgNrKYw7plz2du8wU1V02YlcUtKX
	z5efsHsoPvaevgEJmw9ICVgyguG2AM6BHF88/nbuCIQl8r92d8UtM5QBxeeyWbC+sNMfqV
	t/M7QmsnT9/I1c5GNkeGD/3teAzJyxDKBcAhgoGuPNCGdUoKE7tO3Incj+zrgn4vVFBteP
	pHXNfQUOXh8HAHZ7n/Av2eNJrQKDIU30wXsoIMije55ovhn8TpQkI2L0obohKYKuA3PK0o
	TNxGJ8nfsXZQr/2zswVUsbl81LvX26k7sTVKFCteVuZuKzJZ+Y8Ra3wHw9YAWw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: joern@lazybastard.org, richard@nod.at, vigneshr@ti.com, 
 Palla Raghunath <raghunathpalla.0209@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 shuah@kernel.org, me@brighamcampbell.com, 
 linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org, 
 syzbot+c9d8bc9f8ccc03799e1f@syzkaller.appspotmail.com
In-Reply-To: <20261017235733.14667-1-raghunathpalla.0209@gmail.com>
References: <20261017235733.14667-1-raghunathpalla.0209@gmail.com>
Subject: Re: [PATCH] mtd: phram: fix name leak when phram_setup() fails
Message-Id: <179492262721.2237190.13662832198672004023.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 14:37:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_053716_885906_643E8035 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU3VuLCAxOCBPY3QgMjAyNiAwMDo1NzozMyArMDEwMCwgUGFsbGEgUmFnaHVuYXRoIHdyb3Rl
Ogo+IHBhcnNlX2VycigpIGlzIGEgbWFjcm8gdGhhdCBwcmludHMgdGhlIG1lc3NhZ2UgYW5kIHRo
ZW4gZG9lcyAicmV0dXJuIDEiLgo+IHBocmFtX3NldHVwKCkgc3RpbGwgdXNlcyBpdCBhZnRlciBw
YXJzZV9uYW1lKCkgaGFzIGFsbG9jYXRlZCB0aGUgZGV2aWNlCj4gbmFtZSwgd2l0aCBhICJnb3Rv
IGVycm9yIiByaWdodCBhZnRlciBlYWNoIGNhbGwuIFRoYXQgZ290byBpcyBuZXZlcgo+IHJlYWNo
ZWQsIHNvIHRoZSBrZnJlZShuYW1lKSB1bmRlciB0aGUgZXJyb3IgbGFiZWwgbmV2ZXIgcnVucyBh
bmQgdGhlCj4gbmFtZSBsZWFrcyBldmVyeSB0aW1lIG9uZSBvZiB0aGVzZSBjaGVja3MgZmFpbHMu
Cj4gCj4gc3l6Ym90IGhpdCB0aGlzIGJ5IHdyaXRpbmcgInAwLDB4ODAwMDAwMDAwMDAwMDAwMCww
IiB0bwo+IC9zeXMvbW9kdWxlL3BocmFtL3BhcmFtZXRlcnMvcGhyYW0uIFRoZSB6ZXJvIGxlbmd0
aCBmYWlscyB0aGUKPiBlcmFzZXNpemUvbGVuIGNoZWNrIGFuZCB0aGUgInAwIiBzdHJpbmcgaXMg
bGVha2VkLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBt
dGQ6IHBocmFtOiBmaXggbmFtZSBsZWFrIHdoZW4gcGhyYW1fc2V0dXAoKSBmYWlscwogICAgICBj
b21taXQ6IDcwNWE3ZWQ0Y2M5MjEwNjA4NTRkYTQwNmE4MDNkNjg4YzhhYWE1MmMKClBhdGNoZShz
KSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBv
ZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbiku
CgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
