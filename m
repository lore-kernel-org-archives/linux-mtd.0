Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CF8CF58E5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 08:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pJYlnw6WI/S+v3qVmtA03EWuyOMcyGYFkuAjDkG9Jbw=; b=PZ/UbcSZw6GMTW
	cire5yKoH2wpYVk6ya4Tsm3rW0Uxa72rzqdoFC2+vmiHm+oWls1dWUfT153nqals20r1Nv+/pfrWZ
	gsSTFvOhq0TpjiYD9b1i4tk4GpJAoFQ7oWUv2hHrfkbL8ixjzls1X2HVFq65/gaTh+3+S/qikApIC
	8p5XfkYXOAjhv4PZZtTEIHxX0PfjUrNGEWi9nKSu2RnG3xYk0wGO2gtuz08jDqPLTPGxFwqKfO403
	5Mh5+Ril4fp82jNxeIM07yMg8zg0UOZOVQEa59q2Uh5uj+tdfVBiyz0nWLC8qPZWRaGlytKHUDp7I
	E2gYgQiAL50o4JwM0gcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srYiF-0000000BhdR-0YsO;
	Fri, 20 Sep 2024 08:09:59 +0000
Received: from mail.firmexa.pl ([217.61.97.237])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srYft-0000000BhQU-0RD6
	for linux-mtd@lists.infradead.org;
	Fri, 20 Sep 2024 08:07:35 +0000
Received: by mail.firmexa.pl (Postfix, from userid 1002)
	id 87569839E8; Fri, 20 Sep 2024 10:06:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=firmexa.pl; s=mail;
	t=1726819574; bh=t64YQ6+Ul8jKtSnXdKDYpCigYTG2jPMqgmy0uGCEDW8=;
	h=Date:From:To:Subject:From;
	b=JziVLhm965Yuspz21aARUioVkSql5m6Enpqar2X/QMDetQeLr+3PMEgSm/2aOo9G9
	 2831q65AYaSiPQ2F3fXvd/VodqQVDLGZ7wvvWwoLNji8z21iI8WfFkLiEmMKYHrWYw
	 eaOIxA4b0tT4JjItaYRwCZfyTLNwnsVZRhKd5HCrBasA+JHSz2qdKyLibyRiNlYmfh
	 gpanmqHKlUgPQE4Kq2mm061TGOwfwYhgyR0JC4dFJSCPYhqvRLQyPx088NXVfTF94M
	 pcDvcYn48PUHfrWCQFqi+5al1D3wRy2vptMjzu2H4SKlZ2PffgWsv0L5QM2yR3aR1k
	 7900WNT1rRfQg==
Received: by mail.firmexa.pl for <linux-mtd@lists.infradead.org>; Fri, 20 Sep 2024 08:05:58 GMT
Message-ID: <20240920084500-0.1.1g.3zw4.0.kfwuigzmq2@firmexa.pl>
Date: Fri, 20 Sep 2024 08:05:58 GMT
From: "Marek Wejcht" <marek.wejcht@firmexa.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Termin_odbioru_przesy=C5=82ki___?=
X-Mailer: mail.firmexa.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_010733_839227_A1BFD1A8 
X-CRM114-Status: UNSURE (   1.09  )
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

U3phbm93bmkgUGHFhHN0d28sCgp6d3JhY2FtIHNpxJkgZG8gUGHFhHN0d2EgamFrbyBwcnplZHN0
YXdpY2llbCBkb3N0YXdjeSBzcHJ6xJl0dSBrb21wdXRlcm93ZWdvIGRsYSBmaXJtLiAKCk5hc3ph
IGJvZ2F0YSBvZmVydGEgb2Jlam11amUgc3plcm9raSB3eWLDs3IgbGFwdG9ww7N3LCBkZXNrdG9w
w7N3LCBzdGFjamkgcm9ib2N6eWNoIG9yYXogc2Vyd2Vyw7N3LiBQcmFnbsSZIHBvZGtyZcWbbGnE
hywgxbxlIG9ic8WCdWd1amVteSB3acSZa3N6ZSB6YW3Ds3dpZW5pYSwgbmllIHBvamVkeW5jemUg
c3p0dWtpLgoKQ28gd2HFvG5lLCBwb3NpYWRhbXkgbmFqd3nFvHN6ZSBjZXJ0eWZpa2F0eSBwYXJ0
bmVyYSBmaXJteSBEZWxsIHcgUG9sc2NlLCBhIHRha8W8ZSBqZXN0ZcWbbXkgcGFydG5lcmFtaSB0
YWtpY2ggcmVub21vd2FueWNoIG1hcmVrIGphayBMZW5vdm8sIEhQLCBDaXNjbywgTWljcm9zb2Z0
LCBWTXdhcmUgaSBTY2huZWlkZXIgRWxlY3RyaWMuIER6acSZa2kgdGVtdSB6YXBld25pYW15IFBh
xYRzdHd1IGF0cmFrY3lqbmUsIGtvbmt1cmVuY3lqbmUgY2VueS4KCkN6eSBpbnRlcmVzdWplIFBh
xYRzdHdhIGtvbmtyZXRueSBzcHJ6xJl0IGx1YiBtb2RlbD8KCgpQb3pkcmF3aWFtCk1hcmVrIFdl
amNodAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
