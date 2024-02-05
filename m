Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3230C48292
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 09:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ziTT3/9GtLf594676T+284r5vSvbfgSJLUNK6fIX6yA=; b=wl76q53ETyq2Wx
	YhXD6gEbyWHK94xDXJQHkiGkQK9Bnu9f1yjRVo+cMuXvbqrcCj7HeJve3SVcoLpgMT5ONXsSx8IyD
	pcUpvcVLbCC5x06+lLMr9rrjrzGS9ZEyJ0sTgObjw8XgKg7vkUmkyp5sNuskuec3+Z+BDHKZWrZ1B
	tyNpDwPq5JWoNzw9lptViIy8ToeQSoxXaUCKEzA0VYNcsWM/XYUz1g749O1Ak187v05Xj9z3OfsH9
	7WFPHbazl1cATuWlWIJUprhyCNg1Yc1BO3rhnIl7hJVOps7Yge7ZHkQrXPHh8Y+qx3r9lH7/6Gqej
	PfKAnsdxnIJjI95YaykA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuw7-00000002X1p-2TK7;
	Mon, 05 Feb 2024 09:06:43 +0000
Received: from mail.synergyflux.pl ([51.38.99.212])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWuw3-00000002WzE-21vQ
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 09:06:41 +0000
Received: by mail.synergyflux.pl (Postfix, from userid 1002)
	id D5E9925E5E; Mon,  5 Feb 2024 09:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synergyflux.pl;
	s=mail; t=1707123995;
	bh=n9RRp8MlabRDJBtJNro49Rmci90RtotaZYZ8+xo6WI4=;
	h=Date:From:To:Subject:From;
	b=s/RLKjVSXZnVyD00gn69p0pqia6LGh2dBQZTG9vLlaCx5+LmJx1QY4JUrzawxxkOI
	 bz/o24y7ASGTFGwJ+kgy3LKNKa7Yeh8ZdS/hCy518NhYYUbxmDdSesS35/eJktCpTJ
	 3oe3rBEZVdzrAD9uYBp37a9al0gCgUoZHpbxfoiYraw/R+B1h++IAAAj2lGqeCp9/n
	 4iA0Y17KBE73MTFcGH3Uft/6PH0MrcME/xpHFjXrTFfCAQdpFjS8IOIhBy89sSYD2p
	 0mp6jXCRAvUMwDPupwlkmugS/e4T7xeHlTzrcjIjSYEsTkM6fjkes+gDMI2mXU+tIK
	 d39qK88Wi51mw==
Received: by mail.synergyflux.pl for <linux-mtd@lists.infradead.org>; Mon,  5 Feb 2024 09:05:33 GMT
Message-ID: <20240205074500-0.1.9m.1w5yt.0.3lgl4cx6sf@synergyflux.pl>
Date: Mon,  5 Feb 2024 09:05:33 GMT
From: =?UTF-8?Q?"Konrad_Zieli=C5=84ski_"?= <konrad.zielinski@synergyflux.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Instalacja pv
X-Mailer: mail.synergyflux.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_010639_692752_F194029E 
X-CRM114-Status: UNSURE (   1.38  )
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
