Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EE0C52D6D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Aug 2024 07:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ziTT3/9GtLf594676T+284r5vSvbfgSJLUNK6fIX6yA=; b=m8ObdpUWZFBY6x
	PGG1F0wz3UIwIA2RjKqK/M95ajfrHKxv4DkscshEXii/crx6tK2Z+YLLmC16yxADIAJdQHRxhdSs1
	C6klLie2aDAJbrwssg+LF1+BZ/pIPXqeoxMH9MOXlxzhB4GiGA0OR1+VvvRCvYMFFEJFEAzwxCxUg
	vaTChb43UDZf6erZU67Os+w8oRbY/6Y1gv/mhEZQgeJGD6OeXiJKL6ieadtT/XrTiq+TXY37jz496
	lbNi5e9h7ukC2xW1ODIb2RMxVlACAwkjGSnuabGf7h1aPqE+3cfuBXaFbVvAU0hIVIQ/oTIcGeQRm
	wCG7WcZrNRTq0PCv2YRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmpz-00000007ydg-0NaL;
	Fri, 02 Aug 2024 07:36:31 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZmpw-00000007yco-2c7h
	for linux-mtd@lists.infradead.org;
	Fri, 02 Aug 2024 07:36:29 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 388A125AE9; Fri,  2 Aug 2024 09:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1722584187;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=dStjhOeGDwXW1BL9Y7hrF2U0Rfn/YnekrrlCEcwLC1qejeHYy0JKj6FJefrAJRf5/
	 sGTZ0sN0YJWh8+j8IU4bBiED7uSFtlPnHMW0SL6P0bCDWoza+NkKMz69f4uIyw60+X
	 vLEyrvA7AZtYSHuD3XHzwkrFbItDC1kmNWmiaz3bQji6EU2np0NXHghqNE7Y3ZDfbP
	 /npZOWHlpETlBBtEPu9/e9Cqobgfc8k4H3kMFahQsa6S1Ps0G1VJp26RscFEH6tbWL
	 i8bzshNpAMAI89s9flEjR5hm9OOFASk2XoOnakj5S4yTHwbUDGnx2upIAnsg6ySeK5
	 Ww+wfq1ajRFZg==
Received: by mail.synergyflux.pl for <linux-mtd@lists.infradead.org>; Fri,  2 Aug 2024 07:36:02 GMT
Message-ID: <20240802084500-0.1.d4.39hvr.0.r84jqj5f84@synergyflux.pl>
Date: Fri,  2 Aug 2024 07:36:02 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_003628_831195_9BCDEA76 
X-CRM114-Status: UNSURE (   0.52  )
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
IG9kIFBhxYRzdHdhIGN6eSBtb8W8ZW15IHBvcm96bWF3aWHEhy4KCgpQb3pkcmF3aWFtCktvbnJh
ZCBaaWVsacWEc2tpIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
