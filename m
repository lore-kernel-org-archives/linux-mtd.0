Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85304C04FFE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 May 2024 07:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=k1Yz4QAsRJ0JrF
	QG8O5I9Vy1NVIudUwqRgmQdGzJGkDENomqY5JqBCkw97YFfKYIkl5+oRZu4pui5/ERD/umhxLAeOC
	PuHN7jU7vND1zarAWbDDkyKZrPH1ZXD2yV5CdAPEfddgKN9qqPhbxuvMvuaPzK+y1eBJcVjzwy6Jb
	EmAEJXAKZaYEDaL8hiitZZX/yhWIHhYSY4UihA+Wf+50rJcRI4WmeHGA+pyL+VHd6Vb2M7WSIyoix
	F1vZTvtrlYFUQN1ekLeB2bJKnaWZRqSEbO/2g55I471ubPleeXHFxfBrFDPCKQnl5uzwZB2VuUzyR
	mIybExnR/0g3lOnj7IGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7sJb-000000076Pv-3oxt;
	Fri, 17 May 2024 07:47:43 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7sJX-000000076OE-3lRN
	for linux-mtd@lists.infradead.org;
	Fri, 17 May 2024 07:47:42 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id A5C4524BC4; Fri, 17 May 2024 09:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1715932046;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=gndlCNHpm1DHLYLmYgbr/r9GcuyYIRPBdlOp1b5nzzMfiPfTlQt6uVpoQNR/6WD5L
	 yO98eD3yi+iuLS3ri1CQnq0SFfd7FFLAXNMnZLsX5bjI2OhvpewXJNRh3y77nZH4WG
	 V4jT8k9JJk/K0qjhFJfrwrFOalCV0zdjDIOSdFuSkOVTalFCYeuIq+Pi6/Twa31DAx
	 loRNUH5gS+tuiHIpWQ67YWo1cVJxOFqy3sgG8fI4IidGtRwmciKgI5u9/h4GasCfpz
	 P6UOsxZLnyhZVenrhQGOnbvol4LvzBC+qulKCsCgBMN+YGgsqQyg4jXGz/n6lOTqyk
	 /TJS0lx08MEIQ==
Received: by mail.explorepulse.pl for <linux-mtd@lists.infradead.org>; Fri, 17 May 2024 07:46:18 GMT
Message-ID: <20240517084500-0.1.b9.r04z.0.zhxcjmu4x3@explorepulse.pl>
Date: Fri, 17 May 2024 07:46:18 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_004740_889565_9F43DB84 
X-CRM114-Status: UNSURE (   0.36  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbSBzZXJkZWN6bmllCk1hcmNpbiBHYXJkCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
