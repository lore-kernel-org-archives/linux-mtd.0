Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA70BC3DA7F
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2024 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3i0H4vS0ThOJrF1IotJdJbJDGiGW1kAcSFJjGY+WoLA=; b=unWorETzkyc2lw
	uJ1xbTrxgrLKfIUFZ8KMSVPvCaQFa/A1h62w4yBGib4bKcj71A14k1PD3QKcew2u5Hoz8al9CkZte
	q9WpkVdFvHFQ0/Rrf9CbMs7WOL294n/YtyzPplpGUZPTYEGLwtE491yZ9ccYT4fDPE418ZNjzMf84
	0iM+XJSa8PO5fjYD0gcgSjS8u3LZ580MEnlyTD8nAJW98L0LuvKDvq16Vrx0FVpjDr3XvExD/U5FU
	pce3oGmTgrVn/P7Vxz+o+7pEWJ0g4Wbv3TkcRgSFtZG2uVt/AuNP5nLfktv7rcQCvxSr3dUR56Frd
	/3iMm21zS4AY5K/tWwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQF7-0000000HFVZ-2d2e;
	Mon, 12 Aug 2024 08:17:29 +0000
Received: from mail.explorepulse.pl ([51.91.254.67])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQF4-0000000HFU1-1r9x
	for linux-mtd@lists.infradead.org;
	Mon, 12 Aug 2024 08:17:28 +0000
Received: by mail.explorepulse.pl (Postfix, from userid 1002)
	id 1FD0A24AD8; Mon, 12 Aug 2024 10:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=explorepulse.pl;
	s=mail; t=1723450641;
	bh=dqx6etWJTU7o7oR1uR2aRBCwaPXPl4dirwwzUCFBDcc=;
	h=Date:From:To:Subject:From;
	b=gEZyGjN2qlBptr4At5r7jYoM4RvlP33P9QKgyw1cQVTKUMcWho1olWcIxH0vj6MmS
	 NSULWsQuS0QgB5POWjSiuKMnuKr5XoqnhaJkiuLifJCG0LbC5War+TzOtS37loyF+H
	 lNI6lMQYBA3z3XBAASanQNkkea/RBkgi9fQj9Cp3+Xvlw9TdDwyuNN9bfV25YeQal/
	 5z7Kvn54bqOy01os41erpjbuGA0SaMRdk4o0MEXkfYHP8C9pl+abOcNVKurM+HxEVt
	 1En2+TOOW/B02zuYTdGFlRBHm0kc7sgD/7RaExuAXA6SxaZstJYSWz0HtP6sJpj2FC
	 KfjQRBJ2mYpzw==
Received: by mail.explorepulse.pl for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2024 08:15:48 GMT
Message-ID: <20240812084500-0.1.cx.zmwu.0.csc6r8d4xr@explorepulse.pl>
Date: Mon, 12 Aug 2024 08:15:48 GMT
From: "Marcin Gard" <marcin.grad@explorepulse.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.explorepulse.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_011727_180288_2863FF42 
X-CRM114-Status: UNSURE (   0.72  )
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
