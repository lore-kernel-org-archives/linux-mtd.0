Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4333C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 21:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vYFTk0SZJyuzAJ+mjJ66fzYA9wzawavZL+o+yOu9BFk=; b=Ykv8Pl4y7WVZrE
	DnYNZhOxravbUwU+ps/t0Z3fzBlLrG6/n8WMRZeJM/r5YPMlYRHORbUahpm6cEVP2T1A2sEZXrZSc
	xxx1DSFOMinfLmhrXUwlsNdw+f8QX1CloannyHklShiHdKdpu+f3OgKeDYlLXrxojX2aAiqL2U3Ej
	j7KR5T6yEX2kGjt5I+F5Wq7D9rKTZz2Mx5q5+bkL4auaPv2uWz8dTCjUKaS5zyvkMdqNa6hswWFow
	R5lvHgkcqZ7n54+I2U/WIZPU7SOt3D0SGTsMfpUk9NJk3ghI48gWYeEejv5BrNqn1/giTieN9On5P
	IVO4avjuwruFAqGQlzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmGW-00Ha63-At; Thu, 17 Nov 2022 21:17:44 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmFR-00HZAj-6Z
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 21:16:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 31AD420005;
	Thu, 17 Nov 2022 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668719795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2cwSDhmKhGB4TboptHUOlK62HhhK9Bmkg6FgEj+P/bQ=;
	b=X+L5le7AfovUztN631/qe+Z558YwUXV2uhwouiBlfiIL97YH98tSz3IMtYThDrPqsbE96Y
	nxzUJQWrhtEdCiI+VHB1S0VpJraZrWfpf9S6JWuB61octw0pyOS9pah6CQOVuOc+PoUgHI
	soTfquU6bRrdgu5RSwdzHu0OFWk3Tj+4O+/Au1OYVeScYT0xrpn4Tqwn8zjZ0DxcZArK8i
	HOtZMHURO8wTojzOWkNcOkiSuE8mBblIQ++Bs0h7YnY9rZiyQaijkgxC+YfnfOL4StCJcc
	ni5zcjtMKlJWiBaiMvGputNLaH8mSJIIhDq6GwFg/0bI3vwEo20uPCvRTaIzhg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hui Tang <tanghui20@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	u.kleine-koenig@pengutronix.de
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	weiyongjun1@huawei.com,
	yusongping@huawei.com
Subject: Re: [PATCH v2] mtd: lpddr2_nvm: Fix possible null-ptr-deref
Date: Thu, 17 Nov 2022 22:16:33 +0100
Message-Id: <20221117211633.1273693-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090240.244172-1-tanghui20@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6bdd45d795adf9e73b38ced5e7f750cd199499ff'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_131637_428997_3DEF2847 
X-CRM114-Status: UNSURE (   6.21  )
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

T24gTW9uLCAyMDIyLTExLTE0IGF0IDA5OjAyOjQwIFVUQywgSHVpIFRhbmcgd3JvdGU6Cj4gSXQg
d2lsbCBjYXVzZSBudWxsLXB0ci1kZXJlZiB3aGVuIHJlc291cmNlX3NpemUoYWRkX3JhbmdlKSBp
bnZva2VkLAo+IGlmIHBsYXRmb3JtX2dldF9yZXNvdXJjZSgpIHJldHVybnMgTlVMTC4KPiAKPiBG
aXhlczogOTZiYTlkZDY1Nzg4ICgibXRkOiBscGRkcjogYWRkIGRyaXZlciBmb3IgTFBERFIyLU5W
TSBQQ00gbWVtb3JpZXMiKQo+IFNpZ25lZC1vZmYtYnk6IEh1aSBUYW5nIDx0YW5naHVpMjBAaHVh
d2VpLmNvbT4KPiBBY2tlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT4KCkFwcGxpZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2Nt
L2xpbnV4L2tlcm5lbC9naXQvbXRkL2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKTWlxdWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
