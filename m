Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEC0C021B0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2025 09:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gGRrouJCW8hylaTdRjlp1U8wHthJmmKutO2AH1zIuIo=; b=vBqouS2FvU2L6S
	C5D9XkXRlLvHl1GfZIsigYtYbrmEho7XWTGjs4VPpPgU+ijjJimhZjKoQm7gnnzLOeEN9V6VbIi3B
	0z6MrXqZZ3Alx77O7GvN9jclEHbAlBe9eiJFBC4uH5vVZNyvt3xJBg1xATrQ2kKLpLuJiMgJN0ZJB
	mHGMAKL+s/LiBV+SZ4UW1ywFpWxfAf+sPk5ZYRSeG1mULlA5Lv0fHPl1kh2VUXhnm8SYmfRW298PQ
	7e2dEozvlo+kIIxJwEVv3RxcGDvvZDMD1aHhz3hhT9vf3OzbwdMgx2TpsK1krReDe9UDr1FlUfZFZ
	nHfpFdBlgiyDZZJ7u8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgKY-0000000Bpy2-3Rnr;
	Wed, 19 Feb 2025 09:25:22 +0000
Received: from mail.corporix.pl ([151.80.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkg83-0000000BlHj-0pJ8
	for linux-mtd@lists.infradead.org;
	Wed, 19 Feb 2025 09:12:28 +0000
Received: by mail.corporix.pl (Postfix, from userid 1002)
	id 1E107253A8; Wed, 19 Feb 2025 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporix.pl; s=mail;
	t=1739956009; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=XCZsu0GnwAKAAGSfkMvl4KKaQoiOQ6APRq9J/L1m+jpeh9C0ozHdJfQlmmD6HK9s7
	 gcyfcLGXuUVvhVnvW8uBKyE/rtqsaBTzgglCV6fr8AJmlDVOHCkMftnCaH5ZJK3SKp
	 4XkGSI1sOPl48miMuMYXvAbcoPZb0YbPjvTY/iLuDVw7qn7pnz6Z8UR68zjyOTiLfW
	 MNBMWzSNrQbFLhahBp24PSDucdI8aB2RC625S/CK4lJZouWmbxCFLUiyO7/htkDKiT
	 E6wNE3sMn7R4nXUMA1+hyrWyjCYSydvUHGCRvv5SZq+WJzjYLatSxQhV7UuJVmmrm+
	 Mi/rEJ+N5SQ9g==
Received: by mail.corporix.pl for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2025 09:06:02 GMT
Message-ID: <20250219074500-0.1.h.4dyd.0.f07j2g42xf@corporix.pl>
Date: Wed, 19 Feb 2025 09:06:02 GMT
From: "Patryk Wysocki" <patryk.wysocki@corporix.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.corporix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_011227_380180_02CB1793 
X-CRM114-Status: UNSURE (   2.08  )
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
