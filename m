Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 604D0CA0EF8
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Aug 2025 10:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MKeQbiPEnNA7j0cIzGkmH9t7AuZe+Cti6zzGSx0Ay4Q=; b=JkHy8E0rC9RKcT
	FSJ/S7jz/hcdBBgZDVsJLGOkefS/ycqJRzGTs0kGqYkPkWaKLu54WK+WYOtQEq0Kj9Qur4vsuHtcr
	2kjocRcYtiIqFd5j6hHfDWgtGgn3yZ/b9zdzr0IgJ2qPfFFjNBnai+Hu1eTzxk5IBgxO1yQteqISW
	RX4L8kh0CSPWe7oyHwQy6ih0GhxyHRzW4QGO6tRCv/BII8r2Q3pmPy2ddXeNKewiEcvrUqeUM5iVY
	LmCAqXV6PCUhNXwq7EHEhtWYn4HVZGC7gMt2m7zv/RB1M7w9mNYGurptESo2Shs96kl1dT/n0Um/R
	uH5rrlUDOH/6xJ/GV3MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2qq-0000000GexW-27pY;
	Thu, 21 Aug 2025 10:49:00 +0000
Received: from mail.commalix.pl ([141.95.18.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0As-0000000GASd-33pa
	for linux-mtd@lists.infradead.org;
	Thu, 21 Aug 2025 07:57:32 +0000
Received: by mail.commalix.pl (Postfix, from userid 1002)
	id C8BB6A6373; Thu, 21 Aug 2025 09:55:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commalix.pl; s=mail;
	t=1755763002; bh=CJaxe0/Oss+uuu+rAIpDCRNP1r/1Sj5XETuqIxCAGFI=;
	h=Date:From:To:Subject:From;
	b=sg/y3pm2u2b3yX2kcCBQmLmV9HR+iRbfEBh21b0hRLtiVeFyRauF4kWHetMaRXshm
	 GGNjQVZWofXbb2RTRhUF9uNnPjogoBf810QkWEgW7PG481ShzmDdHCnsyCKvL8d+L9
	 DcRgQFbN2kt54OtAoWWc+vGJRJxSBhlSDhbNd4Bj2/zYvAelvngsRrSj9l1hmMy00B
	 pW4Kb0ssA1NwnbPUo8rYl6FxydsPlWeC1TeTkSVNFrRq+MC7+8yW7MlFVQIp+jqlfP
	 12nMsy7eovMLeWQ0Av/mhxRf3up790zKpgYgyJlqCTBFrl4xYUXdgJZbpBVrmBg0JM
	 gETfgeDbeVLSg==
Received: by mail.commalix.pl for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2025 07:55:41 GMT
Message-ID: <20250821084500-0.1.lq.31c4c.0.1i7pmqron6@commalix.pl>
Date: Thu, 21 Aug 2025 07:55:41 GMT
From: "Piotr Toczek" <piotr.toczek@commalix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.commalix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_005731_047255_A725B875 
X-CRM114-Status: UNSURE (   1.15  )
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

V2l0YW0sCgpDenkgbWFqxIUgUGHFhHN0d2EgYWt0dWFsbmllIHBvdHJ6ZWJ5IHogemFrcmVzdSBy
ZWtydXRhY2ppIG9zw7NiIGRvIGR6aWHFgnUgaGFuZGxvd2Vnbz8gCgpQb21hZ2FteSBza3V0ZWN6
bmllIHJla3J1dG93YcSHIG9zb2J5IG5hIHN0YW5vd2lza2EgUHJ6ZWRzdGF3aWNpZWxhIEhhbmRs
b3dlZ28sIFNhbGVzIE1hbmFnZXJhLCBhIHRha8W8ZSBLYWRyeSBNYW5hZ2Vyc2tpZWogdyBvYnN6
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPwoKClBvemRyYXdpYW0K
UGlvdHIgVG9jemVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
