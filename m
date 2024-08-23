Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CF1C5472C
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2024 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E02WCwFapA5k+E5O6vpD5YwxgLjJY0n2KBf72vKaJNc=; b=oEWeAnAIVt1Cub
	f62VlfQTED7aWzMG4TEeKAKEF5rRcY9wEu9KRfZl8vvUjc1jFyRSJSFTrAMy0b9y/N6ZglQKY9YuJ
	LXHk5SUHZ219RrBD8Dz7IG4G4BlDdoRm7GaeTMokdNjV6Jl8pFwa2aT2iPJDKuIgkclPkP8keiMXz
	ZNy2TY+Yn0KUngdTPv0lZiqw95Olm5u1R3LBbwjl13tJJpbhgEDKpXPQWo9CDfw7bAzGvvHqVq1IU
	FyV3/QeiEJtKlfpSebdNLjvUiwtGnKyn737+F/tRMJ7hidCELSIpI+vYfOvJBjCWblraSp8ACSZ7i
	Nrbvf0OOCXujbJp0Brzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPQl-0000000FoS6-3SUu;
	Fri, 23 Aug 2024 08:13:59 +0000
Received: from mail.bizzyinnovate.com ([54.38.214.27])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shPK1-0000000Flf2-3sRB
	for linux-mtd@lists.infradead.org;
	Fri, 23 Aug 2024 08:07:04 +0000
Received: by mail.bizzyinnovate.com (Postfix, from userid 1002)
	id 14CAD48C02; Fri, 23 Aug 2024 10:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizzyinnovate.com;
	s=mail; t=1724400363;
	bh=d1DcYqpzi7zPpZxtacQoU7SaXZhL4d6PC0gTxjlVIUM=;
	h=Date:From:To:Subject:From;
	b=fw2ECQJOgo1aV0JYhwsJ12yEpZI0bWJ+wAsGOwkpMCFr9z0WjBPGwhgkv+Irbitnt
	 tZVVmN9HWHX55kzVPNzHnJmmNILb2YNiJ3por5Pwl1gYUAh6+qICACxtWB2RH920AE
	 mpM+p/IChc8nol4l6uwwCPypNwu/PCdF+IczcGk5awtw+JOOGWjGMiqLzotuZEFkDy
	 3YAfu6U2vAmDg0Z1tJ5xdInbQnSUhkPyl7baD9zwoveMzIMdPbrJBq58pHDJ9AlDBa
	 tEcEFX4D5Pj7WGNOFLRrbohlrG3LcXbRygFHOS8DJg3MSIFbrUiAF2160ioKEc8wf0
	 yDzQGQeMC1Vvw==
Received: by mail.bizzyinnovate.com for <linux-mtd@lists.infradead.org>; Fri, 23 Aug 2024 08:05:41 GMT
Message-ID: <20240823084500-0.1.4c.7i71.0.1aqmopgah5@bizzyinnovate.com>
Date: Fri, 23 Aug 2024 08:05:41 GMT
From: "Ludwik Flis" <ludwig.flis@bizzyinnovate.com>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.bizzyinnovate.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_010702_687070_654F79FE 
X-CRM114-Status: UNSURE (   0.77  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8KCgpQb3pkcmF3aWFtCkx1ZHdp
ayBGbGlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
