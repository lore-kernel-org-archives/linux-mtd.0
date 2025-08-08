Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A36FC87FD3
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Aug 2025 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5OP6uYTGZuqiBptH+wg+Bt34kklfrHBV+k6CyTpAgXc=; b=Ol4ggc8V2MZ673
	qU8G/qXL4xvV7bApdnXuO00Ca1zipkF/toR4/BnAoWwNcBarjpJhtCXJEwoYMwCx1qwqbM37mVC6D
	lVqODOdh5VMzizvwjp7LKsGx7UqiEhsF7pTp60dr7iXn6KaV/hRIg6JUa/U5PGS1FPY1ll3sevwsm
	TgEozDeihp/C4w/Vw6tGoKEDGzgyz2KkyUCLs5AVnrgkr4O4vaCDTm4QzLGIoAqC88OXKEezDM/2N
	pIcYrVHZX1Rm27SbzEHL/S1xNYzRCV0bjC/5MbjEtGUsRRzHLWTqSsq2zpUp+s4LHCoZkcy0rBKj4
	rQrTY6x3y1T1zrpzmBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIj8-00000002Lsv-0XXk;
	Fri, 08 Aug 2025 08:45:26 +0000
Received: from mail.fintara.pl ([51.68.214.200])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukIFv-00000002JJF-1NYs
	for linux-mtd@lists.infradead.org;
	Fri, 08 Aug 2025 08:15:16 +0000
Received: by mail.fintara.pl (Postfix, from userid 1002)
	id DFE574EE5F; Fri,  8 Aug 2025 10:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fintara.pl; s=mail;
	t=1754640732; bh=0Yjr6NsrKkaYb/LNYm1mPKHuxqkR0iWhkNkzH9QSzrg=;
	h=Date:From:To:Subject:From;
	b=oDxGZhIYQcYfPYOS/0EL3VeCgH2YWxj/PTBwlmT55b5kS8PqqL7UcZ4ZgxYpu38Ls
	 XSA1exnKJKnHQGfuZ9/jQDwG++06ADnEGj9eXPbIOtWcWHF/sVvEIQZwjLC7c6JqyL
	 mnPhBn/GFS0RgJm+hcd/flQpbNBViU2JY+9sUNRfj0odANHyoqrsldFH9wdK/0Z2zU
	 czwJ4qO36nEdXB9+ZNAh8jsnzIhv2tIorzTXsW9oZW3rO10SjkSCfLGZ2qIbF4dCZ6
	 OJCLktjovdjUVLwXpcpGh6dhB/nSzLi5piWT+Bh4ApqP2pgydNxiKL68/Ie1d7gYKo
	 QUu896dtnD7Rg==
Received: by mail.fintara.pl for <linux-mtd@lists.infradead.org>; Fri,  8 Aug 2025 08:10:49 GMT
Message-ID: <20250808084500-0.1.b6.34kba.0.8gn8kodkv2@fintara.pl>
Date: Fri,  8 Aug 2025 08:10:49 GMT
From: "Dominik Lotka" <dominik.lotka@fintara.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.fintara.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_011515_625247_86D31600 
X-CRM114-Status: UNSURE (   0.49  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpEb21pbmlrIExvdGthCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
