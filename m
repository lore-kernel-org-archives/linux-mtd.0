Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D8F2CCA470
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Oct 2025 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5PbZ36ZpxjeWOhqUaNNwxq6F4G1C05sVkEl9i9iGY8Q=; b=12HaY5xPX44XPL
	wJ5z3N6jH3HtgGg6uTf6p34++M14aPPg4hHXnplba15tqcC1LAbfSuN/S9Xc9h5zL1+YKt7emiLss
	c+EeNjJbzlM3k/og22kMsy9N9I6qj9OTWXoic/xc0bm0GSBJRb2CcI/TjWDwBtn+3b0G+ZD1JItEW
	aNFFKUvP4LnhVlvjoAbknnWOLPjIUKPOoJceXVcbPk7CZeWuWcgXaXL91hvVVLIBSqZR/AH3Sg+uf
	TicrMGWEfIBVKuL5OBI67jnSnhE2DS7gX8Dwh6BhqHfbe7U/Zmpbi+EIWWunmiBpoHeoEYBcMuAQ3
	XsHlkQfKAYhO+iPuCuqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PLE-00000003QYT-2Qr4;
	Wed, 08 Oct 2025 08:16:08 +0000
Received: from mail.bizneka.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PL9-00000003QXg-2Jz6
	for linux-mtd@lists.infradead.org;
	Wed, 08 Oct 2025 08:16:07 +0000
Received: by mail.bizneka.pl (Postfix, from userid 1002)
	id F2459AF0AF; Wed,  8 Oct 2025 10:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizneka.pl; s=mail;
	t=1759911358; bh=yG3h65zQONp0BG7voFVqypH2B2cxmwvPBgIw+EyRk6E=;
	h=Date:From:To:Subject:From;
	b=eL+4oL7T1Mf8gT98wKlOkxd3/bhuksJkPu0jKxI3l0o07/x0w1veHIBTIvQOrKEJj
	 k21Ztllbqylv+mghj3+gqHI87qOmzmztlog/65ODcH7T5MAdAyIiSfvrB1IMYEjAZt
	 wFIC7C87/Bpci3G54oloq0VQitPXZdUm7/uLhCFvOOKIAa2f9Cg95yQ3v6VHTrAZ05
	 JLAk6HpReQuF0gW0/lw4YGq404u8PoNflSwbjzLuI7BW4LqTSfr/OUbEmkGU+KPeNi
	 4Vs1jLr5KuY1hjoGDeXCIu/C8xpGHrMXk10r6aYetE8XRpL1NUFyIpT8ADFnR5xa7F
	 cGytmVtES1AAw==
Received: by mail.bizneka.pl for <linux-mtd@lists.infradead.org>; Wed,  8 Oct 2025 08:15:42 GMT
Message-ID: <20251008084500-0.1.oo.4sudx.0.w3kg2ha164@bizneka.pl>
Date: Wed,  8 Oct 2025 08:15:42 GMT
From: "Sebastian Sikora" <sebastian.sikora@bizneka.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Rekrutacja handlowca 
X-Mailer: mail.bizneka.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_011603_884007_F80EC149 
X-CRM114-Status: UNSURE (   1.26  )
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
YXJ6ZSBzcHJ6ZWRhxbx5LgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHPyAKCgpQb3pkcmF3aWFt
ClNlYmFzdGlhbiBTaWtvcmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
