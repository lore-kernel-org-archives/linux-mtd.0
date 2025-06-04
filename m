Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0715C5B552
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Jun 2025 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6PvaUQy74vSzvsRZUrJNBQ94rzgeDa1aZPx1L6gaEUE=; b=tEyRS079//RzF3
	m2jFIbtgs+0YZOzwHrjBwBo/BaoBCNh913Z78n7WZDl83sKW+hCRFvHjhQ5fZBV4yGBF4uzwdelTw
	iMC6935DJT0w5TOkhWJoF0nkRCyRXeqXmUitOBVrqTpn3j5qPACvwXlEvcpj2Wc5yhFqVYSEgHlWt
	xtOi0X//HO5KIOwZw8Uii5FUQV/KS6Dt9iJapERm6kxO38fpwWC0JXi6Oz9dCnaCF37nnjckpXf1P
	dhAYyxWree06X6OkMefZmROqGZ5S35OoDU8ut3289knos3YGHvUcvc3x8QtkqofVPH3V5cbTsIths
	8WMAyWnVFSO54KHyKfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjKw-0000000CsF7-3qOX;
	Wed, 04 Jun 2025 08:19:02 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj3r-0000000CpSN-2vF1
	for linux-mtd@lists.infradead.org;
	Wed, 04 Jun 2025 08:01:24 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 0ECF726300; Wed,  4 Jun 2025 10:00:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1749024054; bh=DjNALEe96gRlzA4ffLINmOD2oI1cqzpVK/E4I+uckvQ=;
	h=Date:From:To:Subject:From;
	b=ojZSHWUEBIElOcKOgKcLZqvJAUUQqIunbuukYdbczZPtczmyVeCpszSBdM7zePoWw
	 BcoLSfpSPYi5fS727uC+b0MBOWy7T8wgEI7aRdTrTfGgqpO105sU2aL5Psq1xZVdVX
	 ft8Gn2yL7LoNWTG4Nj340iFY39MeYQsdBUf32fVNURny2zD6iQ8i5txkgF8L7UnHcb
	 MVDtXhDGd373oV4iCbnCxUpaGliVdpY9JAdFKMNc1pw87GxvGrSy6mEAmjeaPhDaBH
	 uu3BgHFn6H19sTts+3m9KH21SK8p8YzFfh6J0y2dzZnpumtNtr1xSjVKPd3r6H/yf/
	 /I7tPUljtnvAQ==
Received: by mail.biznator.pl for <linux-mtd@lists.infradead.org>; Wed,  4 Jun 2025 08:00:53 GMT
Message-ID: <20250604084500-0.1.ho.v7f9.0.djxrqp1j0g@biznator.pl>
Date: Wed,  4 Jun 2025 08:00:53 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_010123_885663_49E4668D 
X-CRM114-Status: UNSURE (   1.21  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IHPEhSBQYcWEc3R3byBvdHdhcmNpIG5hIG5pZXpvYm93acSFenVq
xIVjxIUgcm96bW93xJkgbmEgdGVtYXQgZm90b3dvbHRhaWtpPwoKSmFrbyBmaXJtYSBzcGVjamFs
aXp1asSFY2Egc2nEmSB3IGluc3RhbGFjamkgaSBzZXJ3aXNpZSBuYWpsZXBzenljaCBqYWtvxZtj
aW93byBwYW5lbGkgc8WCb25lY3pueWNoIG5hIHJ5bmt1IGNoY2lhxYJieW0gcHJ6ZWRzdGF3acSH
IHByb3BvenljasSZLCBqYWvEhSB3c3DDs2xuaWUgeiB6ZXNwb8WCZW0gcHJ6eWdvdG93YWxpxZtt
eSBkbGEgUGHFhHN0d2Egb2JpZWt0dS4KCkLEmWTEmSB3ZHppxJljem55IHphIHdpYWRvbW/Fm8SH
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhwoKClBvemRyYXdpYW0KV29qY2ll
Y2ggTXJvY3prYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
