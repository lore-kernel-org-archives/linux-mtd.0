Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BDACFC275
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Oct 2024 08:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBcPEDEjBOnplsncMo2fkg/rXbt7nTCnX1fN2Wqsf1k=; b=pmi0kI/LVZ2kdK
	FwK1x1BiFDOictvqtj9PL+RKfHCFfK7PckcyFioEimpC3DAIHBvEiBz3XUGUwRqBuv9hODZI+n+T6
	Ym8tLopy0qkLjLkv74rafTYwgVQknOUB42rKRoRRoIC6cx/CeGR3ygmxlI9ipPcHhfukyr951o13x
	gCn+IanRqaWEkEMis4d1U3lpsXgGzyrd9mVpscgqknynVxxVhAQNoXmgOperlmdb/Q3sfHYkjA7HG
	GGrWAg8etxqTgygNvaKyCn5ISC1YX7H4OoHrMm7GfMyZoNeNwkneoNvi8JfDmKevMOVxsLkUOjYDH
	7RxuMs/0wBgun05ujF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0caM-00000007RNQ-1sCv;
	Tue, 15 Oct 2024 08:07:18 +0000
Received: from mail.geniusthrive.pl ([217.61.112.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cTs-00000007QHA-3efR
	for linux-mtd@lists.infradead.org;
	Tue, 15 Oct 2024 08:01:46 +0000
Received: by mail.geniusthrive.pl (Postfix, from userid 1002)
	id 95D63858D8; Tue, 15 Oct 2024 09:56:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusthrive.pl;
	s=mail; t=1728979029;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=LhiqoOUYEptjNzywgcXshg+7FpJwQ5DTpgwxz95t7iRyMOYdz8FuxHYTEWcDR5ts5
	 x3xPw72QFh1x4fQqSUytnHjfCn4GnJl/GAOh6uPYovPlUWRhBr8N1c8xgt1hJ7YZCF
	 51Cv2o2wznzv5fg9y3a0q0Qs4qRc+54JfSIsEpKlAYrR3qADzFJBa3kGbH2vrTp0zM
	 yzU4XQAFhtiYnjEwyzMdVOycERXqnFS1dd10UzfpHP92PSnYNMp0V0zgw6CtGF4hxF
	 SKzIEWgmvZNhEEolR7w6IVp6SdIfjFmhLwWug76A565qlMVKa3YJqxEvQsZGX25YnY
	 +CiCdajLfLIIA==
Received: by mail.geniusthrive.pl for <linux-mtd@lists.infradead.org>; Tue, 15 Oct 2024 07:55:30 GMT
Message-ID: <20241015084500-0.1.aa.1gs50.0.8guv6n2oa8@geniusthrive.pl>
Date: Tue, 15 Oct 2024 07:55:30 GMT
From: "Patryk Wysocki" <patryk.wysocki@geniusthrive.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.geniusthrive.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_010037_053688_E6CDABA5 
X-CRM114-Status: UNSURE (   1.42  )
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
