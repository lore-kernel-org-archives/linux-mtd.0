Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B5AE8FDD9
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Oct 2023 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QXE96peApSGMoC6ZZwpQiiGc7IWcEimK40Io3if0yrI=; b=ZYNDuum2WH+aa2
	yTdnBEa3QWUXIL7N7/Zig6/vGtpEw2o1iUNoBc7PysfRz5ksb4DKLnOQQ5Ldm8Q57TdRiVoli7LPS
	Rfe5zDJDfB18th+zewAGqwBxwLPz5f/FOsDZYbx9V1hPr8dIhxE0ZUTcH3tEurPzE1lX0jyxQC/F2
	yP7aPc2GvZDP2dYHdfHpHqMPTlnS7C8298GompllCVtqdFv8X8Pf6yaI21kbYQ1qxM5R0QNN3zQYp
	dPXOO+GXs+9SX23VQSxpjjC18aTi9XfZRgCH3SX9xO7X4UDGIsnE+KLB/BW2QjjfjZriCbtNUZ6/u
	4+iusD8zQMtFKh8i4c6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwem-00Ggf8-04;
	Wed, 04 Oct 2023 07:50:56 +0000
Received: from mail.citycodes.pl ([158.255.215.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnwei-00Gge4-2p
	for linux-mtd@lists.infradead.org;
	Wed, 04 Oct 2023 07:50:54 +0000
Received: by mail.citycodes.pl (Postfix, from userid 1001)
	id A2BE11F3ED; Wed,  4 Oct 2023 09:50:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=citycodes.pl; s=mail;
	t=1696405851; bh=mMhfBvhM53FtUQl1P3lyeSY5aDBQYiR8qQBy6YFQHi0=;
	h=Date:From:To:Subject:From;
	b=Fu/ZM7Q7SsZwuaXro+nbiXXaoGykHHgH98gxfi9ctthjrbqRSVXqD08kS/mIa1vml
	 ZswegO+AvgRYZia7oqqrElG6tdhBS+AFxrTSNCZ5nM80zEtf6vCKFd+8lKAGDNodNm
	 npRsR7voyIoimLBIN02vypMdMmhKW/8yKnmzGPtck+yxdJnzNeGJb49C1oau1/e4TC
	 ++eyvadEUuYO0WYXT6Wpaq7F5s89tRdntBDVKtuxCog1HEXuhZaheFIZ+rtEyaaTFP
	 3zQgr1TqUIiJ3waGRi1C5mTJkn3C8H3OLJKM4tLOG2PCkZVESjxorJ38S8wRiom/FW
	 Ywpk+RJwEAH8w==
Received: by mail.citycodes.pl for <linux-mtd@lists.infradead.org>; Wed,  4 Oct 2023 07:50:33 GMT
Message-ID: <20231004084500-0.1.7v.j1g7.0.q2ef7g6cme@citycodes.pl>
Date: Wed,  4 Oct 2023 07:50:33 GMT
From: "Kamil Lasek" <kamil.lasek@citycodes.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Rozszerzenie_Programu_M=C3=B3j_Pr=C4=85d_5.0?=
X-Mailer: mail.citycodes.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_005053_045049_309DD4BF 
X-CRM114-Status: UNSURE (   1.86  )
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

U3phbm93bmkgUGHFhHN0d28hCgpXIHJhbWFjaCBub3dlaiBlZHljamkgcHJvZ3JhbXUgTcOzaiBQ
csSFZCBtb2fEhSBvdHJ6eW1hxIcgUGHFhHN0d28gZG9maW5hbnNvd2FuaWUgbmEgemFrdXAgaSBt
b250YcW8IGZvdG93b2x0YWlraSBpL2x1YiBtYWdhenludSBlbmVyZ2lpLiBNYWtzeW1hbG5hIGt3
b3RhIGRvZmluYW5zb3dhbmlhIHd5bm9zaSA1OCB0eXMuIHrFgi4gCgpKYWtvIGZpcm1hIHd5c3Bl
Y2phbGl6b3dhbmEgdyB0eW0gemFrcmVzaWUgemFqbWllbXkgc2nEmSBQYcWEc3R3YSB3bmlvc2tp
ZW0gbyBkb2ZpbmFuc293YW5pZSBvcmF6IGluc3RhbGFjasSFIGkgc2Vyd2lzZW0gZG9wYXNvd2Fu
eWNoIGRvIFBhxYRzdHdhIGJ1ZHlua3UgcGFuZWxpIHPFgm9uZWN6bnljaC4KCkLEmWTEmSB3ZHpp
xJljem55IHphIGluZm9ybWFjasSZIGN6eSBzxIUgUGHFhHN0d28gemFpbnRlcmVzb3dhbmkuCgoK
UG96ZHJhd2lhbSwKS2FtaWwgTGFzZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
