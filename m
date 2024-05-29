Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FC1C25B75
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=V54sNBsL59g0fz
	AsWelaStiAsgnP0/h7rRFcWcRrC8xpXrnw5cco30nhTvfGybSfhVKKjNUn01tQQqnjj12zGBHqiYb
	zl7w0ZKCzSWltE408jQxss8VSqVi/nP1GZRu8b+b2WyCQVMO1WTfb0Z0tWflm+7YWqCd33wLBXjj3
	wyJHyunjfV9+Xj5iUEdeGOcve8OJZzrrP1J74rINhUOKQX5WgKZebyl/Tii+p8/pbQ1ubencx+8+9
	uooxo3mT1JaC6HcyoJTxmPaos0bo2xZ5M+9EWm7atg7/KqAlDu0QfzQeIi9WfRMNB0umLIqmaBUWB
	3ThIhAaAorfxWzIuO8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE5P-00000003E2B-2qye;
	Wed, 29 May 2024 07:51:03 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCE5M-00000003E19-3usX
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 07:51:02 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id 4CDFC249C5; Wed, 29 May 2024 09:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1716969059;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=DygPUpOc8irkq/mcMudVEzpP4NHI5baqyQf8JPsFgagjWmckxMDEPdxqNxmVYeojW
	 hjoBd637/pbNbv0EaCV8xK28ZomGzINvfVT9S1Qr17mE0kNnGnb4kyCRRrT9pJOnZI
	 N5XsE6XpRkK4tudddrA44CasbcIy5TXfEiKpNHy3F2HoAaMcgxq33BqQZAZqkn2pUT
	 HSrlOBwWJurQJOo1CSIEGG2DDRiUOg2Z1PPsc8eqDD69Hwu/1HzSOt+4DxIlY6uaSZ
	 qiPqeYqHHN7IOHJ1b0KrLzrWu0G9cABKqrFOOVSoAdfYLcV7bh3GxhUApwrmOGHahu
	 ecfc9c/mGE6aA==
Received: by mail.explorepulse.pl for <linux-mtd@lists.infradead.org>; Wed, 29 May 2024 07:50:44 GMT
Message-ID: <20240529084500-0.1.bh.shi6.0.pa7q3qb7ou@explorepulse.pl>
Date: Wed, 29 May 2024 07:50:44 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_005101_132971_D1DF87C9 
X-CRM114-Status: UNSURE (   1.20  )
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
