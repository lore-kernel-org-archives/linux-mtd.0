Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A55ED3C55F
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Oct 2024 07:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pL7r62yy3OP+19nbwhSEPTy0kENbcOjJScam1zhZUQ=; b=oWdWfxiHcDFW1t
	RBvFFfVvzCm7/5oxVZloH2lpEt9VDoaW2tQbhBC3codep8SSCUiuFf3eAJ0PNbM2zv+faUje6pGlS
	uxlyKGAk49/XLqsGs/TUY+YW12cgZDibDyolZBp8XlQDtX/Cp3JAJVMRRcBWZsCLjEXa87bY/rT1O
	vM5jW3nwfE/aHe1ldxf+M6UgZK2PYvyZkYY2Is6bJsghosZ11WbyfPtpFUMnG0cGChOFCDIsGN/D1
	d1oBaRTpIYyjWUP7yhDbpvXwzQTg1E3J+jvyEDPlvso0OGCox8n1fpGP6MeOOeirgNnaKuVFePlQl
	WuH2gXSpaPJawoWB7Qqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hX3-0000000HM23-0fzK;
	Fri, 18 Oct 2024 07:36:21 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1hUd-0000000HLS7-3UK9
	for linux-mtd@lists.infradead.org;
	Fri, 18 Oct 2024 07:33:54 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id 68544A47E5; Fri, 18 Oct 2024 09:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1729236708;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=KTv7lgRF1OL9ljiI8QElFzNcWaNEjb0ihkfMonZvWNKIWpFS1pmQtsxG9hgW7lJfT
	 O7VWxyoEYXPBpt4huZ7WbtbnFQ5daLpxoB6dR4CmJZaYrAidqvxQLv8aTWrH1mhIoJ
	 tgxlVYl2UPI2Ef3TUIYRyDsSBeg2PdB/+Vk8lFCVoDBh5b4eWDTsHr+sheajX+UXsw
	 qY7sGBMu6xbhPJ/dGXT7ARALEOFsLjbrXnbvYDqW8YEgP45MFTpKz8DK+O3VnSwWuu
	 9sekD3COppBEVkYJhg7F8IAz8czLWnsz9RCQ/LVevNhzrGlAN1AYAQ3raNmLA4/AQB
	 4V6LyuL1V+1rQ==
Received: by mail.createsavvy.pl for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2024 07:31:07 GMT
Message-ID: <20241018084500-0.1.hx.2wgfm.0.74cgkmp3ab@createsavvy.pl>
Date: Fri, 18 Oct 2024 07:31:07 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_003352_705412_58BB558C 
X-CRM114-Status: UNSURE (   0.38  )
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
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYWtzeW1pbGlhbiBDaXN6ZXdza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
