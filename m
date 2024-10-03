Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 015A4CF856D
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2024 08:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=WBTrFxi9OmeLCR
	Z+KItu+cly4ElqycKSh7t4rC/lTxOhKXL4TqOE5O2QbD0rt/Quv5misyzQNmVvYUN3iOR2f1KN+BS
	QPU5Pt9VijLlDWJNGn87BOqOc4gUn4JCnawnk3EkqAdYZTM8gIvpf0E4MRqN9oVhw/WS2QPWEII/M
	fqe8y7J+F/MMCwkM7H2fFFMcP8QcfLBuG2Yvcj7xOmI9oepHksrkJcF3FAulzLWIZvBI1oCiHSPDH
	r9TbnLEk42J8wIt/DwsYkxNhD6KJ+uE89fimi71UJNIkZgfTg3h72dVq5Z/mF6Z+5G9snYIBzyuPc
	ivrofA0zhLUGyNrjEjAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swH0W-00000008Wkn-46lk;
	Thu, 03 Oct 2024 08:16:20 +0000
Received: from mail.completesolutions.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swH0U-00000008WjI-1ueh
	for linux-mtd@lists.infradead.org;
	Thu, 03 Oct 2024 08:16:19 +0000
Received: by mail.completesolutions.pl (Postfix, from userid 1002)
	id D8832262E7; Thu,  3 Oct 2024 10:16:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=completesolutions.pl;
	s=mail; t=1727943376;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=a1y8jtEOK30Gbr8nq57Wr2r1q3zSM+lQ4FzKXYhnsLpFFSZFOlyPlpN/qVfFkPo21
	 0OpoVwjDJlZu9kLO8auj/4YNGzaoJ20+sW6h5mCeZ0fHO8PGwve1oAkSNj3vT1oEYJ
	 kA98+mYUNtcar09Ln1JSQF+oxUXX1zDnwqQzE4axiWXWIf6tKBvixUbFb/l7yW4u4y
	 ZxnX/jPlJFezKdvRmWzAi7stVaBHKell/bCOvPprGKhpccfnhsLpMW/rHBNiruM5Re
	 TJslb+AtuGkYuhcnYoGM0t8A83N3HteFjRWDljVCx3kfsL6APcFNmb4As18WPnLLL0
	 wl885K961q1uw==
Received: by mail.completesolutions.pl for <linux-mtd@lists.infradead.org>; Thu,  3 Oct 2024 08:15:48 GMT
Message-ID: <20241003084500-0.1.dz.1ebfq.0.qebkal2mu2@completesolutions.pl>
Date: Thu,  3 Oct 2024 08:15:48 GMT
From: "Marcin Gard" <marcin.grad@completesolutions.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.completesolutions.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_011618_640749_72C5DC70 
X-CRM114-Status: UNSURE (   1.00  )
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
