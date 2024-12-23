Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658D3E7718B
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Dec 2024 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aZhN7x/kZepY3ZE4rtt/8AsS1mtOfR/WifSFMGufzk=; b=SGTtHVcNAuib0+
	ow+1wgIA0MTexbG3mjiss3cSfxMnXtjbWivGHE7XCq0zgBUn8bY5JTIqvBb3/Ak+Bq0oR30ZyNEm0
	8/I6c7mYjHg3JRy05Tf3VT4M+zD/OWfgHpLDa06EmGoWo9T0uiIPqcwnk5cs4Vz/6T51HRU56/32O
	WffICcukj4HVqwprcHZLs3WN1L10RSYpDluotOA16SB0e6P7tP3p05EODIsLqjU9//KD8mKSCSTAb
	doXt/vkJECPkF/4ItA82jCpeHa2B/1eGGqWOQvdCzaSTI6jxj3PYG5kMaVJ0ar5MNEmepdrTiJHEx
	YlmyxU1ggIefjuOBavhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdp2-00000009aXB-2EF9;
	Mon, 23 Dec 2024 08:29:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdp0-00000009aWq-23yY
	for linux-mtd@lists.infradead.org;
	Mon, 23 Dec 2024 08:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EF913A40B5E;
	Mon, 23 Dec 2024 08:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80297C4CED3;
	Mon, 23 Dec 2024 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734942588;
	bh=pNhbfBdry62rJar522Vvd4uUBvmdkBXPqS3OA/Dde5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iFFh+xqAxe220XQm17JBMFUVoMt+tn1awSfyMJ0SBaILPqt+MUKAPgzomaqOLqa5X
	 WOuqr6MkofVE2ay3mSJ8+qmnXEL2+e0mLo1a9PIUtLD77r3J+AJehv5WyqWTPm9Lve
	 bgr6is6yZSUMrHEm1otLNAzipjhetrJ3NvTKxJ2slwCzMysKAmxwvLhyxp+Qif+mRn
	 bcUY79tJa89sImJyq9PFghufkcTT8vvLLRWyYbLYLMEUWzcCdQfVC25CkDrpnmwPwm
	 qsdi2LjuHFMk4YisJxUGVXtzvBSSk8xcLWCD3H0CnI2J0KQeTDG7pfuZyxBgEWVcmi
	 vZAdQLf8b6f0Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: sysfs: constify 'struct bin_attribute'
In-Reply-To: <20241222-sysfs-const-bin_attr-mtd-v1-1-ee13140a4e9b@weissschuh.net>
	("Thomas =?utf-8?Q?Wei=C3=9Fschuh=22's?= message of "Sun, 22 Dec 2024
 21:15:55 +0100")
References: <20241222-sysfs-const-bin_attr-mtd-v1-1-ee13140a4e9b@weissschuh.net>
Date: Mon, 23 Dec 2024 08:29:46 +0000
Message-ID: <mafs0bjx294zp.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_002950_614344_75C495D4 
X-CRM114-Status: UNSURE (   7.57  )
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

T24gU3VuLCBEZWMgMjIgMjAyNCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cgo+IFRoZSBzeXNm
cyBjb3JlIG5vdyBhbGxvd3MgaW5zdGFuY2VzIG9mICdzdHJ1Y3QgYmluX2F0dHJpYnV0ZScgdG8g
YmUKPiBtb3ZlZCBpbnRvIHJlYWQtb25seSBtZW1vcnkuIE1ha2UgdXNlIG9mIHRoYXQgdG8gcHJv
dGVjdCB0aGVtIGFnYWluc3QKPiBhY2NpZGVudGFsIG9yIG1hbGljaW91cyBtb2RpZmljYXRpb25z
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgu
bmV0PgoKQWNrZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPgoKLS0g
ClJlZ2FyZHMsClByYXR5dXNoIFlhZGF2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
