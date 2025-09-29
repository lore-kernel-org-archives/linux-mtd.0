Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DA1CAC5B0
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Sep 2025 16:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lk0cBsXvcyon8MMKJfixnKLITW1xUlEk+JwQtPBg44E=; b=O+IIZ3oNWbAtm9
	gBlVFC02+9sPLvDwuFxH68oGrkutcQSIl//rd5kGkGb1S3NgI605z0CXcjl2Ug4PN757iW1orUhzT
	zeC6xGQkUU6TX6oN38YYYzc9UUIZj/XU3J5+72ZbqzBXe8J5dv+qhgbgYn+HXMFUcrlqYWM17Dgu5
	RZ77/co8XjTNr7BoOaVBkudQD7qxOlxvolzg71//ljAYvbNPj+7f87LT2RB19/l0EowkKxtFhSuRt
	i1JsNVQPtxhalSvtF53scVHSW4iNGLCm5RmWlEN88nkTyIsw2QHoWUrYq6HCLuqPUyKZSMsb3LwEG
	QN99JfblNj76VNTiKgXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GLN-00000002t91-2saw;
	Mon, 29 Sep 2025 16:03:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3GLK-00000002t80-43K8
	for linux-mtd@lists.infradead.org;
	Mon, 29 Sep 2025 16:03:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4C1C81A0F7A;
	Mon, 29 Sep 2025 16:03:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22860606AE;
	Mon, 29 Sep 2025 16:03:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E9D102F198F;
	Mon, 29 Sep 2025 18:03:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759161792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sQfl2NHN0WXhah4rCT/bpWcrE66H3N6ruqjxAFkBiiM=;
	b=B0xSdimB4aS63FiBHbCdqTuzpFs+u082wH0WE3X/z8bURTWNDzgv/lhDWnkOs8dr5BfFSo
	xnPsTiBfUJxavTckGLzv6rXPqtSPIFvnPVaM2QLZnj0x3knweqOBQRCtgAL16/a1nJe3j4
	7aMS+woaXmRGv42J/JRvznFDXAxPm0Z0S7T1y/lu21kLzprjiwQjVn+4pd62aQPOUdzac8
	YTSQDUxDgkVR8nnRNpdvE0F4EbbCjziB0GjfHA9Cn4kYQAKHHePLpO6nCfPDQ1fMM48tfS
	9mIzganwJLr2Y8WiCmdO6Sz1yAOAaGAmQU9Xly3v0VQJbNrwJUkSuQJspwN+1w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: richard@nod.at, vigneshr@ti.com, 
 Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, 
 linux-kernel-mentees@lists.linux.dev
In-Reply-To: <20250918184420.76047-1-krishnagopi487@gmail.com>
References: <20250918184420.76047-1-krishnagopi487@gmail.com>
Subject: Re: [PATCH] mtd: cfi: use struct_size() helper for cfiq allocation
Message-Id: <175916178765.52129.18095278414992754665.b4-ty@bootlin.com>
Date: Mon, 29 Sep 2025 18:03:07 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_090315_136147_3E07832A 
X-CRM114-Status: UNSURE (   6.32  )
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

T24gRnJpLCAxOSBTZXAgMjAyNSAwMDoxNDoxNCArMDUzMCwgR29waSBLcmlzaG5hIE1lbm9uIHdy
b3RlOgo+IERvY3VtZW50YXRpb24vcHJvY2Vzcy9kZXByZWNhdGVkLnJzdCByZWNvbW1lbmRzIGFn
YWluc3QgcGVyZm9ybWluZwo+IGR5bmFtaWMgc2l6ZSBjYWxjdWxhdGlvbnMgaW4gdGhlIGFyZ3Vt
ZW50cyBvZiBtZW1vcnkgYWxsb2NhdG9yCj4gZnVuY3Rpb24gZHVlIHRvIHRoZSByaXNrIG9mIG92
ZXJmbG93LiBTdWNoIGNhbGN1bGF0aW9ucyBjYW4KPiB3cmFwIGFyb3VuZCBhbmQgcmVzdWx0IGlu
IGEgc21hbGxlciBhbGxvY2F0aW9uIHRoYW4gd2hhdCB0aGUgY2FsbGVyCj4gd2FzIGV4cGVjdGlu
Zy4KPiAKPiBSZXBsYWNlIHRoZSBzaXplIGNhbGN1bGF0aW9uIGluIGNmaXEgYWxsb2NhdGlvbiB3
aXRoIHN0cnVjdF9zaXplKCkKPiBoZWxwZXIgdG8gbWFrZSB0aGUgY29kZSBjbGVhcmVyIGFuZCBo
YW5kbGUgdGhlIG92ZXJmbG93cyBjb3JyZWN0bHkuCj4gCj4gWy4uLl0KCkFwcGxpZWQgdG8gbXRk
L25leHQsIHRoYW5rcyEKClsxLzFdIG10ZDogY2ZpOiB1c2Ugc3RydWN0X3NpemUoKSBoZWxwZXIg
Zm9yIGNmaXEgYWxsb2NhdGlvbgogICAgICBjb21taXQ6IGQ0OTZiNmY0MmViMDQ1NWNhZjVkOGNi
MzBjZjFmMDFiN2ZjMmE3NDcKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9s
aW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBu
byByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
