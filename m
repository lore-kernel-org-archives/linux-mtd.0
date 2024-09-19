Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E6ACE8D52
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2024 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBcPEDEjBOnplsncMo2fkg/rXbt7nTCnX1fN2Wqsf1k=; b=cvBrnhU9XTC1mB
	FfBDPdIyxhKVSmc9TABJZTrTCrvpgil2OlxkW5EvZsehi5ewRStZrrdA2Bl1J/gylxGb1uepdykSQ
	EUld29NwEihqFv05/eiguRRqW3zVr4CNY5j5QWOuLwB4wu8f2P3WTm8l+3vTVUMmdoXzXxWSn1hUZ
	GlZUUg+TWQfl6oPip7TUECjoQkCj9DqpFuXqwUElfzFWvprrq9KGKWQhgk+q9XQSwnhBwvcT6aB9D
	mhSCT++csErZpfrWevf7w83ZP2mVuj8ndx8MZ1Vt70VP6YtmPXNsIofC1ZUDwVvNIN+wf/n8x/9L1
	z52Supe8clav43kaqkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srBf7-00000009esw-31dn;
	Thu, 19 Sep 2024 07:33:13 +0000
Received: from mail.geniusthrive.pl ([217.61.112.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBf3-00000009epc-1LAZ
	for linux-mtd@lists.infradead.org;
	Thu, 19 Sep 2024 07:33:11 +0000
Received: by mail.geniusthrive.pl (Postfix, from userid 1002)
	id E6E418442E; Thu, 19 Sep 2024 09:32:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusthrive.pl;
	s=mail; t=1726731150;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=BmL6it/woPTqvqDCIrziIPz8rAw8wjK+pYSl8xTDxlz02dMnviWpujN2nSg1ivfnx
	 gFJFil7JdiXuVVCz4qOOSFqtrYK2QhGzxCmoeivGevXBgKWLJaFb4WEJK2gm6g+rot
	 bQhiKz9oUroeDpBjyKqyDfGAV/9Gd/zUimNCtPndqIW6JHeAruethGIvkVPqm0belR
	 rip1y8+NHhp1mHDenoZQi7jxqb84b2/2XnHO4WHzAv6VHp5uKsRrP1LmpV8roLc7H9
	 AqqbPAuR8QD+knKxjiZuCHQEKvHvLtVlnC/LeZkc9AIXkDnK95jEijXgoRujyJDpMs
	 +7w8lfSiH2/vw==
Received: by mail.geniusthrive.pl for <linux-mtd@lists.infradead.org>; Thu, 19 Sep 2024 07:31:05 GMT
Message-ID: <20240919084500-0.1.9r.16bjn.0.ikol7eg03h@geniusthrive.pl>
Date: Thu, 19 Sep 2024 07:31:05 GMT
From: "Patryk Wysocki" <patryk.wysocki@geniusthrive.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.geniusthrive.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_003310_100232_E0A89775 
X-CRM114-Status: UNSURE (   1.73  )
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
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8KCgpQb3pkcmF3aWFtClBhdHJ5
ayBXeXNvY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
