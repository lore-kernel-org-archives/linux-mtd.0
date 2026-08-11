Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B676C5CFDB
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 22:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZduZpCllX7ItBWL9qDHHhNMfEpJoKr90afXIyHRIm3U=; b=BvjcCBFayn2qsW
	Yunj+rk7mEaszb241hPMfoI51n2vwS3d36mohG9OKSI79yrv3lOa01vSqyN12+EAiEVtSEhY2hdjV
	NhEYQdBQHTQJUPwERL5iWaPLENxAGZHr8EiIiYGtXnpF9sIkcSKZ2mRY5/DyZPBTjQT0PH+TZ0UCe
	Vt3RmmNnK07pKwHpKYpG46u811YJsHmlmaFPlWytNsr2DLk5VIEyUrcF/hAvqzihpYxrz7iTtplVc
	IB3B29HmHnXoY6lGw2vLMXEaQtNrhDKwIh/xaVLUcoGx//DcL0XguSaLECWbCvcippiIfm2jnuW3R
	P/OugWw3PON34g+Fpmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtugK-0000000F1Tb-0roB;
	Tue, 11 Aug 2026 22:10:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtugI-0000000F1TP-2shY
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 22:10:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 88B94600AE;
	Tue, 11 Aug 2026 22:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197A21F000E9;
	Tue, 11 Aug 2026 22:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786486245;
	bh=xlQNVAlg6JuTskJMR4ppOYxXWK1tbsX4u5KBSDoC+Dw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=LdPOKVwy64zVrbnpbmVPlXyX/Pka57i56bgNuK6rmfXHIZn/yH6oqWApMeZjaMqCr
	 H0d46Ba3U9FUcrgnUm2Juh3tDf22XYNm6TZug1LFr7ucBUlZudNtSZACP5N1BEtTxw
	 PVtKoK+k6Dq1dyBotvaEK4WocL7wmewEaXN1ZPOd+8IRjaANICmPdLrgGn4xKh1Lsj
	 aW/8FyVTvT10Rmb2PlPTSauLVzCn+B/BQ+bmDKwOdLFfKgs4wpCRQYA7nJrHxQR0+t
	 AxGn6RkwE+ka11EH6aRb/xynxllpuA8X4Vo4O5sbBcd2pF0Ig7/Ikgh8/YC9m5ZAoq
	 SuRvAguwnYtBw==
From: Richard Weinberger <rw@kernel.org>
To: richard@nod.at, Yuho Choi <dbgh9129@gmail.com>
Cc: chengzhihao1@huawei.com, miquel.raynal@bootlin.com, vigneshr@ti.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260807204550.1016755-1-dbgh9129@gmail.com>
References: <20260807204550.1016755-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] mtd: ubi: Release device reference on busy detach
Message-Id: <178648624274.3963792.14878212710032601553.b4-ty@b4>
Date: Wed, 12 Aug 2026 00:10:42 +0200
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

On Fri, 07 Aug 2026 16:45:50 -0400, Yuho Choi wrote:
> ubi_detach_mtd_dev() obtains a device reference through ubi_get_device()
> before checking whether the UBI device is busy. The busy return path drops
> ubi->ref_count but leaves the device reference held, so the device object
> cannot be released after a later detach.
> 
> Drop the device reference before returning -EBUSY.
> 
> [...]

Applied, thanks!

[1/1] mtd: ubi: Release device reference on busy detach
      commit: 31dd710cd84d5dd63c49f640d3a9f36c9699ca95


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
