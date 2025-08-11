Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A4C87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 08:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pC7uGzyAi91/uMa6N9srz/KlNYY5zsFAFV8DG6S0xIE=; b=1bhM9Bbn7h2h3O
	8JpMjYiFriVzDzt5ejH+3ZfPAuNlMxLsAvlJudIEO5427Z8sVD7CFOMA9DiCQ13jVk9oNDT3BUvYX
	NyddkrUc+UmXT6WhX9zoZdOgRjkznTWcmbuToj5yfTP8aKpkoFiwvFvzqB4FrF6LesPRGTXbvEiow
	v/c451m2GYCA4IE/QKwLfd4SFvBIVVRiZOvdCgN/Bk7E5wCf9JbbvtYBhjviURnwW7TPOF5nONjYu
	yUQuitKS8/dqAj1Ndp0c2EmPc32+M/NjQ67sEMKVinseNfHL9KPd2oWac2CyV7sg7Awh6EidUaXZP
	CcANGS1zy6Z4B+Lq53kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNrl-00000006qjw-1mgk;
	Mon, 11 Aug 2025 08:26:49 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNRq-00000006mSy-2yp7
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 08:00:04 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 16EAF26B28; Mon, 11 Aug 2025 09:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1754899007; bh=h3k5zkAZf6tEpPtEQC0QHe2u0TTQ7ZFRjUanCKLrdLo=;
	h=Date:From:To:Subject:From;
	b=rjXw5fJbcYiPh6CTmTdleKUsxN34Mz2MpTmqhz0EJuz0owxWEIgsedgIjFZycM08p
	 4//V30f2yBTIP/NNPcdiP3NEDSzS/rQM0zRujQkC/w1u6uLxhK8IXes3l9pSp+wQve
	 3CUGFB7NWoQvzTBI3c4cXiiDOdsg+uoAuVTyvAfXyiFLnauJnRg8X+Qx6mlylhZ14u
	 idWWFggvXd0d5mbOfeJkutESkM824SBN1d9lkkljslmHEqU/Rszv3C7GWA+DiIkkMe
	 wWCeSzYm1sk3Jy2Xc9JnXjkFLP+gX3yXqSsrj+8JztgvVCooT5MQ0gtp1ZOzl8Asul
	 WF91ufXZa/zTg==
Received: by mail.biznator.pl for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 07:56:07 GMT
Message-ID: <20250811084501-0.1.iz.1h31d.0.v8jhq0frka@biznator.pl>
Date: Mon, 11 Aug 2025 07:56:07 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_010002_901982_1DE8D6F8 
X-CRM114-Status: UNSURE (   1.16  )
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

RHppZcWEIGRvYnJ5LAoKcG9tYWdhbXkgbWlrcm8sIG1hxYJ5bSBpIMWbcmVkbmltIHByemVkc2nE
mWJpb3JzdHdvbSBvYm5pxbx5xIcga29zenR5IGVuZXJnaWkgZWxla3RyeWN6bmVqIGR6acSZa2kg
bW9udGHFvG93aSBpbnN0YWxhY2ppIGZvdG93b2x0YWljem5lai4gCgpBa3R1YWxuaWUgcHJvcG9u
dWplbXkgYmV6a29ua3VyZW5jeWpuZSB3YXJ1bmtpIHdzcMOzxYJwcmFjeSwgb2QgcGxhbnUgcG9w
cnpleiByZWFsaXphY2rEmSBhxbwgcG8gc2Vyd2lzLgoKUHJvc3rEmSBvIGluZm9ybWFjasSZIGN6
eSBtb8W8ZW15IHByemVkc3Rhd2nEhyBwcm9wb3p5Y2plIGRsYSBQYcWEc3R3YSBmaXJteT8KCgpQ
b3pkcmF3aWFtLApXb2pjaWVjaCBNcm9jemthCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
