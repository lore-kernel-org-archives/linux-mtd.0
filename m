Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E2CC46CD4
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Dec 2023 08:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pL7r62yy3OP+19nbwhSEPTy0kENbcOjJScam1zhZUQ=; b=bSD9tN+QaWaBDC
	/KlSkB99Fu3iv61ezT3/iJXFAr2nYqJUhwfTVaedvS4yeIaRvXFrcJg8HpWl+ylMOMK4d4Yhd6AZu
	nRwca2ie+fbvVSk0YlJWHw6tWhy3LXuEzw34yYkPc0RBsReNaNjMzVmccpqHCo5+x4xOoXgqB3ANZ
	6NBXCKRgIN3IiHIFReSqDzOYdy2CtUvRBtrMqJY6H140eBDjp6tjZecLFxbK1XGx/sDF1jFWPN7me
	adMTg/ZzNJ1f55Qr+/SkHGWM9MZYYQ5rbm4NjbKDiDuD59bTE122zEbHZLJSMaViDw5ifaH3AuNQA
	X0a1Xa9BVHJudWBe9XNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGb6B-005KxP-1W;
	Fri, 22 Dec 2023 08:41:39 +0000
Received: from mail.raportygospodarcze.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGb66-005KwR-2p
	for linux-mtd@lists.infradead.org;
	Fri, 22 Dec 2023 08:41:38 +0000
Received: by mail.raportygospodarcze.pl (Postfix, from userid 1002)
	id 7E103A3BCF; Fri, 22 Dec 2023 08:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=raportygospodarcze.pl; s=mail; t=1703234484;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=glpgoIPReraz48Zk1NUFSQGVakCeGE5AHgy34TFZQi9NV4zddanIdRyXzAK/jzxfb
	 mXrxuHsfxg4GKcGTxBV+br1LUooagOMUplenRAjEWPaZSp9qZVT8A9jVfjwVzn4OrC
	 sCaSlJ26gNQYwI2tk7Hi2ran0cjWjo+Jvw2fzvXJZD9VaBQd4jtTLqaLaq6sug2FoX
	 N6XUam1hp/TSV0JhrT0890ofb5RsZLHwk/ZY9FWUJLXthYK3FxgPBTR1RPKkwt0zgf
	 FTuVeTVMc0abENKJFwhQQCkIpkfx/Xw7BoEoGEXh+TBmpD8lodpw6d69/hRlWW2ZF9
	 QqFEc9f966w8Q==
Received: by mail.raportygospodarcze.pl for <linux-mtd@lists.infradead.org>; Fri, 22 Dec 2023 08:40:37 GMT
Message-ID: <20231222074500-0.1.cc.1od0j.0.hpjio2e2d5@raportygospodarcze.pl>
Date: Fri, 22 Dec 2023 08:40:37 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@raportygospodarcze.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.raportygospodarcze.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_004136_431763_81CCC14C 
X-CRM114-Status: UNSURE (   1.12  )
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
