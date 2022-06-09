Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D97C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrlBbj8qBgPDTKvbSSgqAtBTS2UT6rHxTGK137kRovs=; b=E/Hb5hMdrkaC9a
	wmMLsLVX02ioBEiLr6gMFD79F8JRxnJVU4ycmZ1bLAMsm/lrJXHUiTBFpR4jSb1XXz0XLf1ZsaS/A
	UgHBBOFqmlgXOBMBDW2v2NClcL2Mb3Dc9lEzKWJhDHTpqF7NPvueLtascA9CiH5dU9tSQvxGZX6x5
	DztgK3JuGoalXGThPC/Eag6sMBJvrRTgRyFqNN7CCbkTQEh5sfGu/wTBvpFL1yXz4EhsJwjg+q54H
	waMD+GTtNdaEYSeHl4VY+ln+nV82iTwIw5IPblwAxxgPsMrRpnni9jQV2IRCWxKEa9UNGs/C8HV9H
	hgoospYKt25gyOH8rYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHV0-001pcS-NE; Thu, 09 Jun 2022 12:42:54 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHUw-001pZi-RO
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:42:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5B50CFF808;
	Thu,  9 Jun 2022 12:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKZwr8n3vIHpLZgFH7boPDmbMJP8Hhddlyg9pXWYK4I=;
	b=QsD4VXwo9Dzpd4/zRBANUlUIWkpvTMtIljLZw3UqFo1B09ePQfTQE3UPqY0BJdbvaFr1lb
	FlMp9azxu17IlWU3b5FSD8icCmKR/aBRho5s+Uh54Ezj4srNBGk7dnBXtZ/o6sa+YKla6s
	scH4HwwI/0wwPfym+o7IxlQLTNsc84P/s3b9PNYYCrBijNzusuCnBVDanvhB+59u6YkfVu
	RwpxQM+q8TzKBDrdf9cIdr20JrOjerpaYI9KNzNEi16nuk6wWhAwPU2M1lNnQf/I4gR3/A
	6Aw13QetJFv5ZkcbSNaRjnUKqfD6EUsVV4af+ONJZqK9KqYQUueIkWUKdI+7UA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mikhail Zhilkin <csharper2005@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
	NOGUCHI Hiroshi <drvlabo@gmail.com>,
	INAGAKI Hiroshi <musashino.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Karim <Karimdplay@gmail.com>,
	M <x1@disroot.org>
Subject: Re: [PATCH v6] mtd: parsers: add support for Sercomm partitions
Date: Thu,  9 Jun 2022 14:42:44 +0200
Message-Id: <20220609124244.132975-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220529110714.189732-1-csharper2005@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9998ee42f9c0d3a30d6936eb84ee7ff04d5f027b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054251_080277_E7A0FFEE 
X-CRM114-Status: UNSURE (   8.13  )
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

On Sun, 2022-05-29 at 11:07:14 UTC, Mikhail Zhilkin wrote:
> This adds an MTD partition parser for the Sercomm partition table that
> is used in some Beeline, Netgear and Sercomm routers.
> 
> The Sercomm partition map table contains real partition offsets, which
> may differ from device to device depending on the number and location of
> bad blocks on NAND.
> 
> Original patch (proposed by NOGUCHI Hiroshi):
> Link: https://github.com/openwrt/openwrt/pull/1318#issuecomment-420607394
> 
> Signed-off-by: NOGUCHI Hiroshi <drvlabo@gmail.com>
> Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
