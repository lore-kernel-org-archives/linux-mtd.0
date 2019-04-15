Return-Path: <SRS0=BkV4=SR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F7DC10F0E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:20:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 846D920674
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2019 08:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/qEXRqJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=schinagl.nl header.i=@schinagl.nl header.b="OJpM0H2u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 846D920674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=schinagl.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W/LTV7ER42RsKhY1OYh9cVUCDt3z+kHjhWkyNyOpXpk=; b=d/qEXRqJU168Hp
	sW/z/oy9xT/JW1x1yRKDE5r2iIVuSkYLFqKxnTRXBrruRs9ZsxgtuVHjnZ+xxWByj+gV9UEkKXGtH
	21RVvpISMOh6IBR4O6mZoxINkDC1Qa/PYst23yvMxeGSHDCBkq6c+LqEhHB5106KAovvxpdS2ZBKc
	vecwqcV+lwtN60pFi/g9np422+Wn8jjzDQhPE3YElrci2HklKl+L8Cs3j6AiZqHgize7cJjFcRe6c
	AWU/IXLNiWAkIcgEjq3xoeav3ZQU9ZFePV7/tcGfZHtHo/0J7WsLddRDLgcPSJ6j4H3m1PeeHysSn
	jwe1ElGdGIlfJM6THS3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFwr4-0000Zi-7B; Mon, 15 Apr 2019 08:20:42 +0000
Received: from 7of9.schinagl.nl ([62.251.20.244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFwr0-0000ZC-TH
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2019 08:20:40 +0000
Received: from 3of9.evbox.com (90-145-215-130.bbserv.nl [90.145.215.130])
 by 7of9.schinagl.nl (Postfix) with ESMTPA id 54421EE2610;
 Mon, 15 Apr 2019 10:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=schinagl.nl; s=7of9;
 t=1555316437; bh=NFlMi5loVZBmjxZGpvDKHQJzB7iUIVkrKqUzmK/Ci3k=;
 h=From:To:Cc:Subject:Date;
 b=OJpM0H2uMsntOhIkGPv4iEDmGWsxuUDYNl3fT8FRJOwm5ng7Vx3ix+6GkOvxorT/V
 rBaVxPeX9zOy2ZGKykXq53K693U2I4u2pF7EoQN7CjF8m9IUMq+I76awzkH26n8w6c
 bubVrBFoHDFFr5NUaElYVQyx+ePleF4VE6xzcKtw=
From: Olliver Schinagl <oliver@schinagl.nl>
To: linux-mtd@lists.infradead.org
Subject: Allow tests to work on more platforms
Date: Mon, 15 Apr 2019 10:20:28 +0200
Message-Id: <20190415082031.600-1-oliver@schinagl.nl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_012039_108362_CBD73515 
X-CRM114-Status: UNSURE (   3.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Olliver Schinagl <oliver@schinagl.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Trying to make tests work on Alpine Linux (busybox + musl based) I ran
into a very small omissions. This series contains a few micropatches
which fixes these omissions.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
