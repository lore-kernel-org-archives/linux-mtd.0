Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48FAC98324
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLavplsxsTouJgYt92fV8bfk+OhaHwBxXSgMKFiE+I0=; b=afeMf5Yy1Lu8Rf
	fmskv46ZW9vzn3MA4KVlpnfiC5CITrSdERtbvbWDkzxsqR15bVu2/8WMmpbftcxCnx1xOzNdJqHG3
	MYAOmEdG9M+NTW/t+Fx+rfFyeX1z1IM7NdyX77qBXNQmMZmRk5qi3fQj+k9D4T+qvsgJZdVyCGKVL
	n+kj5IC4rWYusYWFNalyM11VqMaI1UBzD/3a05EpACIr36QneQVokDJV5KER269yfXVhVGai5yDdN
	yvPq3HK7ubv6d43KeeYPdZkwUZ5TcZJTRZIXHhXBQuWmo0IS1PVs5dZJbuaz11TTgIQSSvHMu6914
	wdpGmMi0A3gKT+Jw4LPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6vk-0000000DaYL-10uZ;
	Fri, 25 Sep 2026 14:29:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6va-0000000DaQ6-2Afe
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 14:29:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F1E7C1A1026;
	Fri, 25 Sep 2026 14:29:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6C0E6073B;
	Fri, 25 Sep 2026 14:29:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45606102F08C8;
	Fri, 25 Sep 2026 16:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346567; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/zsMfQoDD/lZKMF7U8S8qDEqm4yspSHi8mABifI/pZQ=;
	b=ruNyRvz6YmK91zDExwSnTvG8CpzsmG+ZpSG7XVnGQsEhFUCY4hhwUxqnS51FBAXtHUFqjc
	MLfb2mNczQkcenegsVz8TtCBw+nnjBebUh3UuZ7xAP9h7yk3KB3WtIOAKYJU9XBOlTV4Ev
	EwI86UxVBNb6FI5WZF3IubsyhR/zO6CRXpf8MVZtZx4Rx1WsEcRcraRQ/4KCEzEd/ZywFe
	wqyrq9vUZc7AJjcJdnsJtsyN3X/sk4By5LvxToKk5e6lLIhaNWWQB6HueNm/yMniNLyEwD
	4OgIZAOm8REOREHK7uSMJgdO69te7tgR0rv1yfepecECFDjzZudaJluA/Jycqw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com, 
 stable@vger.kernel.org
In-Reply-To: <20260925125546.1020149-1-harshit.m.mogalapalli@oracle.com>
References: <20260925125546.1020149-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH 1/2] mtd: virt-concat: unlink concat node before
 freeing it
Message-Id: <179034656614.1166139.3939385190248779696.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:26 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_072934_711030_C921F56E 
X-CRM114-Status: UNSURE (   5.41  )
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

T24gRnJpLCAyNSBTZXAgMjAyNiAwNTo1NTo0NCAtMDcwMCwgSGFyc2hpdCBNb2dhbGFwYWxsaSB3
cm90ZToKPiBtdGRfdmlydF9jb25jYXRfY3JlYXRlX2l0ZW0oKSBsaW5rcyBlYWNoIG5ldyBtdGRf
dmlydF9jb25jYXRfbm9kZSB0bwo+IGNvbmNhdF9ub2RlX2xpc3QuIG10ZF92aXJ0X2NvbmNhdF9k
ZXN0cm95KCkgbGF0ZXIgZnJlZXMgdGhlIG5vZGUgYWZ0ZXIKPiBkZXN0cm95aW5nIGl0cyBjb25j
YXRlbmF0ZWQgTVREIGRldmljZSwgYnV0IGZhaWxzIHRvIHVubGluayBpdC4gQSBsYXRlcgo+IGxp
c3QgdHJhdmVyc2FsIGRlcmVmZXJlbmNlcyB0aGUgZnJlZWQgbm9kZSwgY2F1c2luZyBhIHVzZS1h
ZnRlci1mcmVlLgo+IAo+IFJlbW92ZSB0aGUgbm9kZSBmcm9tIGNvbmNhdF9ub2RlX2xpc3QgYmVm
b3JlIGZyZWVpbmcgaXQuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRkL25leHQsIHRoYW5rcyEK
ClsxLzJdIG10ZDogdmlydC1jb25jYXQ6IHVubGluayBjb25jYXQgbm9kZSBiZWZvcmUgZnJlZWlu
ZyBpdAogICAgICBjb21taXQ6IDUzMmNhYWEyZjQ0NWIyMmI3NGI4OGI0MDIzYTgxMDQyNjc3MmRi
NTQKWzIvMl0gbXRkOiB2aXJ0LWNvbmNhdDogdW5saW5rIGRpc2NhcmRlZCBpdGVtcyBiZWZvcmUg
ZnJlZWluZwogICAgICBjb21taXQ6IDExMmE2NjZiZDgyZTk2ZTRhMDFlMGNkOGEwZmI5Yzg4ZGQw
YmNlMzgKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5k
IHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21w
bGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
