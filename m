Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56AECD342E
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Sep 2024 08:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ziTT3/9GtLf594676T+284r5vSvbfgSJLUNK6fIX6yA=; b=MU3iFoQbkUKuYK
	4It5cXUyQzyjOmElT51IUiEcEOnOcQTiikk/9tpzgocE0/UFhUEztVnLOYsIRVP53DQXSCd7zu5wj
	kYwMXRr+QSrug0ftj4FuqPG/AaM35tApfr696t0jnhhRu1OW/sgkGqoUs0Sh/FOeBDh7X2XQEujK1
	OXCyJV/pxzaK/t8Pl7ojHfi2z9qxU6W7mRLTc89hWePmAbhFE9DpqwufxWv+kLAfno4pF6pNGnx5L
	KVoKBSvXeL8YjbsV9F1C0TjkfJM4KhCQmJXTWp9UrqpY24OqaHkPIvWqL8LLbnnpYFtQGk9WPIc2p
	lvkTYedFeRM4cGPYr2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOUd-0000000GoYh-1UOA;
	Tue, 03 Sep 2024 08:02:27 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOUa-0000000GoWY-3jeC
	for linux-mtd@lists.infradead.org;
	Tue, 03 Sep 2024 08:02:26 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id 60B2B24D2A; Tue,  3 Sep 2024 10:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1725350443;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=c/0ZZc2n3YKAcIJAZyOGkTogWehaLA6j7UTJBthwGiRWoqE66DcDMhGA+SDGVt+qh
	 83efK21ETsYUIaoC5uy2yBs5ENAalub7+qv0EWrutzz0bvOt6fpwJdDct/vCjthDjb
	 Uqhkt2ow3Qf7oYoir8jaILw0EHDmtXdl8ZRYYWlr2/t9rzfOntI+RTNCqZzSO8d2jm
	 jZCpS5VjIj7GJ8fNSl23fwH+LwTHcNR0FiKdZ5lIz7zVrLaPj18PRA8KcHB8uL5FBm
	 lTaC0YCz/zoszJvjG9xEv3CWnYz+ZCRYuTrgDG2rawsHmtGQQ0J8ycECdwq4xcTR1E
	 xypG9IHO4yrdg==
Received: by mail.synergyflux.pl for <linux-mtd@lists.infradead.org>; Tue,  3 Sep 2024 08:00:42 GMT
Message-ID: <20240903084500-0.1.dp.3gcr8.0.940hjpeocv@synergyflux.pl>
Date: Tue,  3 Sep 2024 08:00:42 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_010225_100092_C56DE522 
X-CRM114-Status: UNSURE (   1.54  )
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
