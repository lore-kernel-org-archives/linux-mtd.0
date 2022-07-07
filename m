Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D7AC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 16:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Message-ID:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1TXLoPRiga0FtLiJ77Bv4ioubTPMQdb3asH/kqQ1i8=; b=2RSmVLgjIw2Hrs
	E0lo2Yj85Qq8jaW3Mcd4EIjGMf3YDNFpADDnZG6O3kRfiZ2oeS0r6f4sMOMZWsZ8dhB1FUk4pAtB2
	PnOwpMalZ7oMb15yx/dgb/yIj8jyUYCpJ/J1vXX5vuI8k/QSzTzj9HwWlP2qu7AJjezkYwev60LDs
	HJhEXmEJNp3HII7euqIfrpRfTP7x8Fwnxcbap8W2KDjdTKpv7N80vZ9kDiSOyOYyyBFM6cF7IsRNy
	BZ9rgGpTcnBbacwbXxI+INOtntGbIesFBfF1FTchdVdqd8oAJEB3+cyu9aSbOJnXudArrHtXBXxYA
	2uzUsVXTsLK+E+Kw2Wgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9U1H-00Gs7g-T1; Thu, 07 Jul 2022 16:06:23 +0000
Received: from sender-of-o53.zoho.in ([103.117.158.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9U1E-00Gs68-PJ
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 16:06:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1657209967; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=ajmrtNb+aAAH0PerbDvalHj+zAqt6OQ7qHTE5aoNT180K/9GCYjFuyBT3qNgL3PtlSL5UCnOEWOsnfU5ZgVWFND9BLC/LoZRhe3Spxrx40FmmAxsvNTcUsrUm2B/0onZfcTr84YD7SiPFNYY0Jm/zNEFUR/TxdlOJq/AuKKcYkw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1657209967; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+eQqgz8qWKtIP9TBIA7Um8SNanpPTx4XyuYdwKxD60M=; 
	b=GIRCrebO+4YsJCYuIrJJKUIEIEYSvfTpg4YdV0O80ZziaijSSrnCiI+hjGm/K2T/l9dEaurcNnTjByBBVCU9AlxGiO2/wKscyANUbFfnGsIFGPMG5GoDh0pwh+Xa2gyBi+Lurgd9IfE+gMYw1DuNCvJlQKILt5R+pkNqKb+jsWw=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=siddh.me;
	spf=pass  smtp.mailfrom=code@siddh.me;
	dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657209967;
	s=zmail; d=siddh.me; i=code@siddh.me;
	h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=+eQqgz8qWKtIP9TBIA7Um8SNanpPTx4XyuYdwKxD60M=;
	b=YlRccmHs/gYXMcKcuHKxkZSL+by/K19C6xMNfjaWGjXVKvU6Kbll84LvysTm40Xf
	F3ZfW1AbhTQjXmF+tehwYTLB+SSijmTR0Indt2zhsvDW0+BwGQ0jAKuysge779WhwEX
	HYvt5LgENVZp4ooMvRucOlJo5maIhlbwesFNZgCM=
Received: from localhost.localdomain (103.249.233.159 [103.249.233.159]) by mx.zoho.in
	with SMTPS id 1657209966196325.0145447766257; Thu, 7 Jul 2022 21:36:06 +0530 (IST)
From: Siddh Raman Pant <code@siddh.me>
To: syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-next@vger.kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sfr@canb.auug.org.au,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Message-ID: <20220707160545.7731-1-code@siddh.me>
Subject: Re: [syzbot] linux-next boot error: general protection fault in add_mtd_device
Date: Thu,  7 Jul 2022 21:35:45 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <00000000000040624a05e2a6f2db@google.com>
References: <00000000000040624a05e2a6f2db@google.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_090621_336627_7CECA68A 
X-CRM114-Status: UNSURE (   2.52  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

#syz test linux-next master


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
