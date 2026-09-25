Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB50C9830D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbiPGhzoj0sEemT7uEZzJUAGUJggG6fELIy+KvOYYCU=; b=zZEdnnVtH3TXNn
	m+5g6DMw55vn007rXDOb7z7HSvpF52dNEkL9fBRI/HW/Qj/wNAlgOLH0lX3jxLvzmgw2A7b3JZ4qm
	mgIHb8PkTDVWTCcRMpw7AB8bZDOUVblrRX11MpLFRVeoYikU79ywF2KGIPYu4ci7sKQzBfc7Ky2tZ
	HqddU9KyWgCnUS1kg81+kPuWcnNBX5tBYPRVoLUv1E0wmWQ/PsCAJz0rZ0UMRcVN1/K8y1GlvLKJJ
	HusBgdJnqQehjiY5ZVEs8dP7QUbQPN5+u8fFHksDpsuV8IX3MeqQT55/AQGsbXCDEgi0ZkA82kQ6N
	z7dmu5iwJow4unf8lJMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65z-0000000DSU9-2r57;
	Fri, 25 Sep 2026 13:36:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA65j-0000000DSHL-0jQp
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 13:35:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B696F1A101B;
	Fri, 25 Sep 2026 13:35:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A25A6073B;
	Fri, 25 Sep 2026 13:35:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D26AA10328856;
	Fri, 25 Sep 2026 15:35:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790343353; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BoExT3wMYMTBTdfD+8f471BMXyCUHpLSXmvrC16wwjg=;
	b=aaesvga7LKpmdbE7hg1CIA3w3a62rD7qhECgEcpbj1rTBAspSol6+7QvHK+hqiEgK7AHcA
	TrCF/8nKGg3Y3kRPO9EXE1NZQT6TjJ7Qe6ZO3Y45akXC0YLXBpHidyYEbnPCz87QIzw746
	KhNILil8KKxUk4OumSskxQEMKhKc116yZ27BTkQhM5zT5GrfGOcs23Pb7e8fPeJlYTPzff
	ZaeZBr1xk9Ogljx+XsCx0FdRwCsaaKoZ9Fra6XrGm+7CyNt7YQrRuCigysKAttcapVFfCZ
	CrlQ4dBRT/tX/H0XhYabFDZV3jCrV9cKOOoQMNgyWxu72FPclY1HWakYptmREQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Gabor Juhos <j4g8y7@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-qpic_common-drop-empty-line-v1-1-fd5f241e314a@gmail.com>
References: <20260920-qpic_common-drop-empty-line-v1-1-fd5f241e314a@gmail.com>
Subject: Re: [PATCH] mtd: nand: qpic_common: drop stray empty line from
 struct 'bam_transaction'
Message-Id: <179034335167.1124555.8908415916892946013.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 15:35:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_063555_384726_CE7893AA 
X-CRM114-Status: UNSURE (   5.30  )
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

T24gU3VuLCAyMCBTZXAgMjAyNiAyMjoxNjoxOCArMDIwMCwgR2Fib3IgSnVob3Mgd3JvdGU6Cj4g
RHJvcCBhIHN1cGVyZmx1b3VzIGVtcHR5IGxpbmUgZnJvbSB0aGUgZW5kIG9mIHRoZSAnYmFtX3Bv
c2l0aW9ucycKPiBzdHJ1Y3R1cmUgZ3JvdXAgd2l0aGluIHRoZSAnYmFtX3RyYW5zYWN0aW9uJyBz
dHJ1Y3R1cmUuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgo+IAo+IAoKQXBwbGllZCB0byBu
YW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogbmFuZDogcXBpY19jb21tb246IGRyb3Agc3Ry
YXkgZW1wdHkgbGluZSBmcm9tIHN0cnVjdCAnYmFtX3RyYW5zYWN0aW9uJwogICAgICBjb21taXQ6
IDU1YzViNmQ1ZjU5ZjU5YThjOThhN2VmZmMzMTk1MjI2Y2MyMDE3NWMKClBhdGNoZShzKSBzaG91
bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUg
bmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5k
IHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
