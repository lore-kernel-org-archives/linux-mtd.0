Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D54AE7718D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 12:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DosPX779qkugNFcAb84JC4AkCIaqlTXGT6CD0DJIdxE=; b=ysfR/1mjNFPuHv
	pYQlM5SNSsX4bsiJvyq6voTCRFWbfxuDdlT3cG5/CTJgjk4298w6bkyR/h8/KZe/7rw5/Yxtjal1x
	CFqiRf7BhtpMAQgHzN5ZqE4gFpM5i+GY+e2jXFYbzXTX/lXIWhUiIKJOtRZguqwLQn1m1CEKCalVg
	4e+p3RVnM7eDg1hmfoK2NTFjYQ4cp7ItB5VPx+fwGT37MsKj58pRJHU0fvHrVDc1/31oZkKJSVI6z
	1+GkSkSHv2+V61n7+vJp6KPmbSesV0k6RZBBIMwGy0OosD2t+bs+GYD9gCy4feHuwxFp06VEAXa5/
	Yo3SfD5Gts1ABm/YWHKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4IC-0000000Byvn-0XD2;
	Tue, 24 Dec 2024 12:45:44 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ4I9-0000000ByuW-1f2c
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 12:45:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D269D1BF204;
	Tue, 24 Dec 2024 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735044338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zus4zptNBzjYgqLZFYK2Y4sISdn+rrZt68GUUXweEeY=;
	b=TWneVEZx709FwXNmpCtP9V1wzKs0Yv9zrvoNM1pivq7SHaOmjvf6aKKlxVMHnnYtfcarqN
	a5v06scOl1NO201pfPFndaD3bPDPTCV7yumy9550rBxEVDfYEBEv2yenTVddvCTbBV0puU
	EctmcldBwOOgQgsZuWTkzQefWZ37zTFpLFu6/q8xow5BfVFqXWwsefiuHM00itLk3vT5YP
	kgHTqVpLTnOQHPUWREXTlk+m7vUwZQ4NXqTr1odTXi5ApID47dlXGViwQiLKW6u3mtJCgA
	giEQCjukKAJi6KJlj1Gj/lz7cQJhpN2sBBVBkVmavK+WiKM8b+ysm0kIj6PnsA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-mtd@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	William Zhang <william.zhang@broadcom.com>,
	dregan@mail.com,
	david regan <dregan@broadcom.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: brcmnand: fix status read of brcmnand_waitfunc
Date: Tue, 24 Dec 2024 13:40:58 +0100
Message-ID: <173504401423.1625053.9790651758357552655.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241126023916.197635-1-dregan@broadcom.com>
References: <20241126023916.197635-1-dregan@broadcom.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_044541_571942_601BC6D5 
X-CRM114-Status: UNSURE (   6.78  )
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

T24gTW9uLCAyNSBOb3YgMjAyNCAxODozOToxNiAtMDgwMCwgZGF2aWQgcmVnYW4gd3JvdGU6Cj4g
VGhpcyBjaGFuZ2UgZml4ZXMgYW4gaXNzdWUgd2hlcmUgYW4gZXJyb3IgcmV0dXJuIHZhbHVlIG1h
eSBiZSBtaXN0YWtlbmx5Cj4gdXNlZCBhcyBOQU5EIHN0YXR1cy4KPiAKPiAKCkFwcGxpZWQgdG8g
bmFuZC9uZXh0LCB0aGFua3MhCgpbMS8xXSBtdGQ6IHJhd25hbmQ6IGJyY21uYW5kOiBmaXggc3Rh
dHVzIHJlYWQgb2YgYnJjbW5hbmRfd2FpdGZ1bmMKICAgICAgY29tbWl0OiAwMzI3MWVhMzZlYTdh
NThkMzBhNGJkZTE4MmViMmEwZDQ2MjIwNDY3CgpQYXRjaGUocykgd2lsbCBiZSBhdmFpbGFibGUg
d2l0aGluIGhvdXJzIG9uOgptdGQvbGludXguZ2l0CgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
