Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8780AC5AC67
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 22:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QilYhwRsKsDKHdjafXsOCrkpHnh6sR05Rfi3x0EIdxs=; b=EPqiNk3EKeGIYg
	OaCTOwMnCh242vf0rJu73zS/mgAHRd/WxUpr1L9T3s9jkUh3YmqwoyJl7vxpx0o9LIIMzPxD7z6CV
	d7PHpyTCytFxwbDFMLqKHlBbePpnAZY9hklR3qE66JdDWjLeEkBw4RW2An3Z8+2FAZt21ocokcyO2
	CKSEPGz6hETlaU1861FpxYdtmyzMorKdovePRepqzp8HuYXH4cfvMsUBwGttHDoCp8bURma9xW9o9
	PhCzu8Fp6xfG/qF4cBBxjlt/6AhEV/Moc+oF149bAov9S4Vw2VDEV46y8beyPuSHAaPPoN6dyU4Bs
	FGpxwEFn9T8+d9EfCCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtugN-0000000F1UF-3ggQ;
	Tue, 11 Aug 2026 22:10:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtugL-0000000F1Th-1vyA
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 22:10:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E02F140583;
	Tue, 11 Aug 2026 22:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3991F00A3A;
	Tue, 11 Aug 2026 22:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786486248;
	bh=m6iQydEYR4RrBCcmznCQ8wFUNaNb/6XclH9jN5Hz96A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=V8ZB+e6oJGlNB041d7jKm1YmDsBtLr2BXLgEtGCqUOlylsfNU3xjqlaa3WGTf1Aw/
	 j9WqjtjcWJDUbJvmEs4bbfdMehSsaLS1n45PdeqdR5E0z3Do/gePWldHEkqvAjikkv
	 /G9HTr6I93ZKTsIjGtKDOiDJMxqmMMEiXlYiphSTVtw3gue9rjddbhtPYyxuNBxqdA
	 JbuNZQrSKwTqNwhACkM97xgmFTVkxEL1uPHlZipB2eXPCKcvfTQG4JU/enM7+YcfDB
	 GnGH1BhGbpoSSgrMLYpuMd14iVri3tLm5CN4twoOoNaBBfC0Hz3u3xPUmDYb5S2+ze
	 qOY/k2f9gxwNQ==
From: Richard Weinberger <rw@kernel.org>
To: richard@nod.at, miquel.raynal@bootlin.com, vigneshr@ti.com, 
 vapier@gentoo.org, artem.bityutskiy@linux.intel.com, 
 Ran Hongyun <ranhongyun1@huawei.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chengzhihao1@huawei.com, yangerkun@huawei.com, yi.zhang@huawei.com
In-Reply-To: <20260723020233.3079997-1-ranhongyun1@huawei.com>
References: <20260723020233.3079997-1-ranhongyun1@huawei.com>
Subject: Re: [PATCH 0/2] UBI: fix ubi.mtd MODULE_PARM_DESC issues and add
 per-device wear-leveling threshold
Message-Id: <178648624539.3963792.13357340650428197657.b4-ty@b4>
Date: Wed, 12 Aug 2026 00:10:45 +0200
MIME-Version: 1.0
X-Mailer: b4 0.16.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2026 10:02:31 +0800, Ran Hongyun wrote:
> This series adds a per-device wear-leveling threshold for UBI devices,
> with a preparatory fix to the MODULE_PARM_DESC.
> 
> Patch 1 fixes two pre-existing issues in the ubi.mtd MODULE_PARM_DESC:
> the parameter format string was missing the enable_fm and need_resv_pool
> tokens, and the bad-block reservation note was misplaced after Example 5
> instead of after Example 3.
> 
> [...]

Applied, thanks!

[1/2] UBI: fix two issues in the ubi.mtd MODULE_PARM_DESC
      commit: ff7937d14f5333ec7e6fb50d00a152d7974f4105
[2/2] UBI: support per-device wear-leveling threshold
      commit: a5e0055eac837a1168c781653943d4a0d9920af3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
