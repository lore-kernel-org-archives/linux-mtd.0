Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8404C44539
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2026 15:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iL6lT6+2kGWUCLA09q/LUabZgq35l+d1mRZi36SHWBU=; b=2yIFXVKCwrLiE6
	HrJIOSxGtHScyB9UwS4gKCK7tekvSMzCPJ8FrFctRgfGGL0HY4QWfloiAdgWR1yx2g+I9o7a6FDGV
	qLJKet67TBUqQOfXoZPbcy7aqxN5goDmzfSSdcQbJV53bqTqxtNy63npQqRdyGFJloXfb1cBxmBmc
	t0vHzp0xcOXXNENpnuaK+FkZR5nHtu/or3UdYNQS60jaAlwbjDqTnnOpGiLjHpEbFOrMsZvyFIQbD
	+XDhf1GgYD/Hx29h8rI3/v1RwSsg18dBJYp9vovz0mexS0EAKB8sRTW/FKcxMieUHmoOtN54NqhSN
	N873DKj74j7xLRpfdTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYZg-0000000C6py-0LDK;
	Wed, 22 Jul 2026 15:09:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmYZd-0000000C6oQ-3BrC
	for linux-mtd@lists.infradead.org;
	Wed, 22 Jul 2026 15:09:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5BE8B4E40ED5;
	Wed, 22 Jul 2026 15:09:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F4B460388;
	Wed, 22 Jul 2026 15:09:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8AEE11BD1E93;
	Wed, 22 Jul 2026 17:09:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784732966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QTqdIHw4yii0HgF++/TOTQXWUPfabjlUiCaQyZTz0bg=;
	b=Rfh1vk7Ia0DX6n2E/Ii59CdwfWIStmCd9BJP3aTTnxS8pr5/bfDA/KvcPJi9VIfIOPH48M
	qCZpVV1S9S5rYyv8G2h936IKqJ08o1JV2YU58jX0UNJMCjhbt++BP6CrrIibfw4TaePATO
	TEqu8I71Zqu+IjkxSSeHpMJ+xVU3osTe3WwuVjniHPK6PF+QT0wNL/WpjdJxtzxe0hkDDk
	UnreLF2R73M2JGpRYylOjd3ZIViOw6FsqzkiA1NQxGMp3F9Vaf6fUYP9YqabqdyYa13A1d
	ymWMNV4+fNIOl8l4ocoraZT8wxnQ+J4FvXT/JB/Fz1OfGtRwiMK38m9e5bN7kg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Steam Lin" <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 16/30] mtd: spi-nor: winbond: W25Q32JV-M: Drop redundant
 data
In-Reply-To: <DJRK19XOKGDQ.2PTH6LFRAOWZF@kernel.org> (Michael Walle's message
	of "Mon, 06 Jul 2026 16:23:21 +0200")
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
	<20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-16-87e5d3122244@bootlin.com>
	<DJRK19XOKGDQ.2PTH6LFRAOWZF@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Jul 2026 17:09:24 +0200
Message-ID: <87fr1bhxi3.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_080929_940729_7DF4AF34 
X-CRM114-Status: UNSURE (   5.26  )
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


>> This chip has correct SFDP support, all fields are correctly filled so
>> we can drop them from the table.
>
> I haven't checked, but there is probably an older chip with this id
> and without SFDP.

I will drop all the changes dropping support for the non-sfdp
chips. The only problem is with the CMP bit.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
