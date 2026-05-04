Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C5CCD3430
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2026 13:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=162pliSlBxxkaS7m7aGmBtBTGSzRYOVNlmm0NKcIDkE=; b=Df4Vmeu20B4i05
	WqF4XEARN1pUjF3UURCSOOTYvj6xi87sngdcQAX/5ckCxz6Aut/Cl4FKPQRtCxFWK3AlzqtOSj3ad
	44k1WjVy/K+SaMcNVxVilIC7RWlFzM1D/w3w5Uh8dxKUB16ROeKYwyemqehs6NoiPaVxAoVNGuDsd
	KJsQpk1s8LF30bn+CINAZgzpoB5Z6cQ4aD+CF+Wi89pf9p9B82iUkqZRoBbL56Bqwkz9tvLJLuEzV
	WuvEAj1lvDtYF7nG+hVZsWckfqHgCAJTtpMqO7neV+5sVpX/ZezTnfYXoTXXhI5aSPZT5pznMGZJQ
	hDHlrPiNSqD09VpjSi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtj3-0000000DM8X-1i7T;
	Mon, 04 May 2026 13:52:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtiz-0000000DM7R-3s6j
	for linux-mtd@lists.infradead.org;
	Mon, 04 May 2026 13:52:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 44B541A3509;
	Mon,  4 May 2026 13:52:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19F085FD5F;
	Mon,  4 May 2026 13:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1157611AD20F1;
	Mon,  4 May 2026 15:52:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777902756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MBj/2uG57+R1fcbFm+6ZidxCYhABy6/+hus7wzCoQjI=;
	b=yCYhbL0/TxTUkS57YqCkGZ3T2deKL3tsxOR7Mo5h6Gwx+NK8Dd38qEWSw9qHs8opz78d6M
	ai05hWx6xefzHhNObmbD5kqqUFUxwtvNSeSmNjaO8/yK0PBVepZEkn45m17a2/1uzndUVD
	2J6ryKKu4D1mdc6Os9NWNlMqIIy21dH/4l+xmyinBWx3Osi0o2f92wW3RJSZxko9US3IRO
	vVvHVHGLhxe9vze9KRqOkN8sPyQ/Qm+XBBvuv7up9K2e3KNRTKeUUtbbCbttRcCdC02DH0
	fUrPLhsGI5qF2KUUG8MN0UeYLllZaKE5S5BZ5sU5vIjI+slXlWbGSZLHtay+rg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: linux-mtd@lists.infradead.org, Rosen Penev <rosenp@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20260430220719.77223-1-rosenp@gmail.com>
References: <20260430220719.77223-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: sm_ftl: allocate cis_buffer with main struct
Message-Id: <177790275402.156214.9535879731025504662.b4-ty@bootlin.com>
Date: Mon, 04 May 2026 15:52:34 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_065242_401498_FE487066 
X-CRM114-Status: UNSURE (   4.70  )
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

T24gVGh1LCAzMCBBcHIgMjAyNiAxNTowNzoxOSAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4g
VXNlIGEgZmxleGlibGUgYXJyYXkgbWVtYmVyIGFuZCBremFsbG9jX2ZsZXgoKSB0byBkbyBzby4g
U2ltcGxpZmllcwo+IG1lbW9yeSBhbGxvY2F0aW9uIHNsaWdodGx5Lgo+IAo+IAoKQXBwbGllZCB0
byBtdGQvbmV4dCwgdGhhbmtzIQoKWzEvMV0gbXRkOiBzbV9mdGw6IGFsbG9jYXRlIGNpc19idWZm
ZXIgd2l0aCBtYWluIHN0cnVjdAogICAgICBjb21taXQ6IDg3ZWVlMThmMjk3NGMwYjFkODU0YjYy
Mjg0MDhiOTNjNmJjOTE3NDQKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9s
aW51eC5naXQgYW5kIHdpbGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBu
byByb2JvdCBjb21wbGFpbnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
