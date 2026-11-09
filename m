Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7688E606A322
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g8fMr09i;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Ar7LxA0n;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=u/sm3hVH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=eLC/Jqe+bOpUja8OVRdAPEUOMz7DzgzPSYEI18veEK4=; b=g8fMr09i8WdpOk46A8OjboecTb
	tk364hzA/ahHJhx1Y3Y0BsPJyN5s+7on71M6pmFF2X9+6pQxsZw/tsqcAFy8Wo1cgDJcw2wX8FmFP
	alsBA/pW5z46b9S46M9IOxis/7LoMlmy+oraxf+fhvuCgSmR9lkhV6XP8PFRqSJo9LSfwE0ZtmbPk
	qhLdMJRuuWGec5c5FlegmLuGRV+/qLWbLEpzLHmee4skSoiHUOrCfIsoknTarR40UfKzcpZFIym29
	qiupn5YYqGn4+IgTbplMW/1QzdsoAARHbe6BpkHajfigTPVsuRErnujRn0jmHl9Odt794YPe35gOP
	CSWk321A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHv4-0000000HPPz-10bx;
	Mon, 09 Nov 2026 05:27:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHv2-0000000HPPg-2j9R
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Nov 2026 05:27:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LG1zeG/FAVWOYlqtmLmw2tMQraUdVSd/sMBgbfFTC7c=; b=Ar7LxA0n6AHCJyB0PqkI3V2JB5
	05b1CTT39pO4qcAz98AiXWIM0kWr6LPExrN53tAj/3b92L/7gzUCFLkiRHU/33G9ozzcnqCVShGUo
	MCKhBnABp6Tg5NnWwqEIF5kuSjsaIOC2qcbHtMeD4NapeGPNmavwrB7cFTAi28JiZ73AQhT8wMCSp
	RDtglSkVnXTckVtK930lfHceMezfd39QKNBEkIj4g1Q4rIIwW0R88CZNvIxgMC2GJgiiNBmIIUZP8
	ONukxJ3TGJNpWZ3e2tBAlo0m31EX7bjxN+cCj36dLZju7NHkdQ/+Cjg8J2x/d5gzNLKjXnLI0Zcgt
	1kbxGyrw==;
Received: from cmccmta8.chinamobile.com ([111.22.67.151])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHuw-00000006KC8-09Ze
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 05:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=u/sm3hVHsIY7j7xtk4fqcT79pyDFhJzz1y7EduPO7aO5ujUVZlK5UFYgBIBrzFoOvqJLvUQfr0WTN
	 rO3hsu7pAXT89FYRzm7h1tqEqQZejZzBeSKX6KsQlL+m0H53iceFool/RIoNndMHXXBmVjJYqUALvN
	 wDvJSjamnSY8a/v0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af159bf1b5-fcf1a;
	Mon, 09 Nov 2026 13:27:27 +0800 (CST)
X-RM-TRANSID: 2ee26af159bf1b5-fcf1a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af159bcc11-82633;
	Mon, 09 Nov 2026 13:27:27 +0800 (CST)
X-RM-TRANSID: 2ee86af159bcc11-82633
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	michal.simek@amd.com,
	linux-kernel@vger.kernel.org,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>
Subject: [PATCH 0/2] mtd: rawnand: fix GPIO CS descriptor leaks
Date: Mon,  9 Nov 2026 13:27:22 +0800
Message-ID: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052742_769061_0E2BFC3B 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Two related fixes for GPIO chip-select descriptor leaks in the raw
NAND core helper and its in-tree user, the Arasan controller driver:

- patch 1 rolls back the already-acquired GPIO descriptors when
  rawnand_dt_parse_gpio_cs() fails midway through the cs-gpios array;
- patch 2 releases the parsed CS array on the arasan probe error
  paths (invalid DT layout and anfc_chips_init() failure), factoring
  the remove-time gpiod_put() loop into a shared helper.

Both issues date back to the gpio-cs support merged in 2021 and are
still present in current master.  Not runtime-tested (no hardware).

Zhao Feng (2):
  mtd: rawnand: fix GPIO descriptor leak in rawnand_dt_parse_gpio_cs()
  mtd: rawnand: arasan: fix GPIO CS leak on probe error paths

 drivers/mtd/nand/raw/arasan-nand-controller.c | 26 +++++++++++++++----
 drivers/mtd/nand/raw/nand_base.c              | 12 +++++++---
 2 files changed, 27 insertions(+), 11 deletions(-)

-- 
2.39.2




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
