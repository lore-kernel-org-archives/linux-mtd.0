Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BF4C67861
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 08:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGRrouJCW8hylaTdRjlp1U8wHthJmmKutO2AH1zIuIo=; b=kH/p9IUE90XjK2
	5MLKcSrQclQ4lB3fI9w0nxbrN0wWLuVJYE4+AHUQx2Ju3+9oJsP+F+655sjpWPGQ6TS89WhkhvHFz
	ps+9TgKnAtcScin38r2AesfbNR33V4G1SDbRF5azvDML9ChMGRvzukrlS3qSoT2Uv4XDAZiMvo4YO
	lfozJN3HII0bXmr+wEnYa5Z8kkA+wZDmHZlXfPcY3rtSmA+RFs3TWmMptvK2Xak4mTqVAY21Wfvc4
	5DcOJjwWSGU7HEMwJxX+C8gSakV0HsOy0xMxHb77yM6xs4sF1clIfwp8+Nw03qlw3CMd+IiuzWb1u
	eHK6EsQr9O/4YB8lDOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6vw-000000010Jq-0box;
	Tue, 09 Apr 2024 08:34:24 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6vq-000000010Ii-39rL
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 08:34:19 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id 9D061828C8; Tue,  9 Apr 2024 09:32:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1712647966; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=mMtFNFls4oXcZlCpzWMqz4ZT9uZsMXHq1br/G70mzIJQGhiDAsno6Bebh8wALZAR1
	 JP7iqZZw1g53IwWvB9BQYm8witKA68aidkrozqCgxDqz3XNwW0RfkXhmRsdyGLLhuu
	 PHF2ApY1/lCJo5Mw5pDqgbu7+UDYdkXF7+6uSZoZqvMd4F6S83FH7kC5wrkgihNmlF
	 AJ1zPzYjDmNC+TvSSmFUJaHQoVgj44QdjyvcpxMK1XB8mk9hpvOFsnRQLdw5WKyAFF
	 EV3XNGBMD/Io0LrxpoBeSz9VpmD/xCJh3v0HPK1UEzqGBCeNGhyobZKFZ0iGbSQ36D
	 bItFS4fKCtJdA==
Received: by mail.haughton.pl for <linux-mtd@lists.infradead.org>; Tue,  9 Apr 2024 07:30:41 GMT
Message-ID: <20240409084500-0.1.1i.iwpw.0.km6js3jnil@haughton.pl>
Date: Tue,  9 Apr 2024 07:30:41 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_013418_948303_232C54F0 
X-CRM114-Status: UNSURE (   0.90  )
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
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
