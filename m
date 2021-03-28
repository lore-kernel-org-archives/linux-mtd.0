Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354AAC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:55:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7127761934
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7127761934
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=COCQ014LkiB59L+C3gqYoNMzHskIhwEypZzKIEV6Omk=; b=bwKqIZC+SjOLl+SGdz/9WWB6r
	5TuzWudFjnJ59CcmCWv+hsRjJH67lJSkZ1maHEq6NBreKpaLftXkNmrCPTS62+UIYtmqfbiXTaYDK
	PwAua8WeIpJGQE4yzOHjoG2x+5+0o4Lwf5UL8rLqwkgh98dafgH+k9zlrYpibsZYwggmVP7lEOVnv
	5xBPWY7gaddb7bwnBqDpUehtxw3U6eZta4pz1YczWTHhO26ylY+JjfJGG2r0UIovDAKU0ei2J9V9d
	3BJ4SJ0d4uMQT/K4//HUZpItf1uO56vIa6o4aYisxDcW0gv+kZBNidUFCe4kacjXE1qHZTf64YDu1
	dfoxfxNsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw6B-000x9n-9T; Mon, 29 Mar 2021 17:54:47 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoxx-000Zgi-Ru
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=HhFJeCqM1kyv90UrGs9psQ0F+S2FJ9xQRoXVIErqRYs=; b=IA1X2YaPAp2xfJ85pECQfFmk6u
 zEQ7yLcG+tQWjhcGemu3mwnN0CTiHdfzlHDdQdP+WltiAMaFeagklDkvN8lPgbdrqBxITNp4IMgCv
 Gs/5ZlvhyitJszvuGYC6C9epllrRbEFGD0EWEiACRpsRclES0i5BN4esS2S6ChLwqXeKVlsZsA267
 Jup4R4g1ijlpbx2CnntCLeS/bTADtFyot1y6sjqZmpNR3GGvRLJhKfUfwf9ItI1nGYMeiDZ3ACKPC
 EilTg2sXn2HKoJZJ9UINLupFqDOR/aeIQXcBJG9mU5lbuND0PiKCM0C4fdXLhgMaY45j+JsHgO97D
 bI2HWuJA==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZCP-000KZ5-5z
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:27:45 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 919F8C0006;
 Sun, 28 Mar 2021 17:27:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wan Jiabing <wanjiabing@vivo.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net
Subject: Re: [PATCH] include: linux: mtd: Remove duplicate include of nand.h
Date: Sun, 28 Mar 2021 19:27:15 +0200
Message-Id: <20210328172715.9631-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323031737.259365-1-wanjiabing@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'28f0be44b263ca4b59ea63c801db3830e65fbe99'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_182742_455806_D8030D12 
X-CRM114-Status: UNSURE (   5.33  )
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

On Tue, 2021-03-23 at 03:17:37 UTC, Wan Jiabing wrote:
> linux/mtd/nand.h has been included at line 17.
> So we remove the duplicate one at line 21.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
