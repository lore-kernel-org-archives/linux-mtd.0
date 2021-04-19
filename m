Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52892C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 16:12:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABF7861354
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 16:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABF7861354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T06UzMVurmzneOmYnJbb82ZwLHmFpeoStqzXDPrESbQ=; b=bJVpWM1ClT6PcSFdZdRNDMa3K
	s/Moqo6wwimwFrCQlZAHHkkzPFCY8EL+zPqpobAR8uMovn8H+R2/Qu8rm0XYOSfSawowjxYknvgOS
	cuET4LD2N6jIB6RxBL5jKi5MePopx7tjT7ZfMdCT6Qen/j/W2YzExK7jypu4LWA1fd9cpAj6yNtjd
	sgSnq2UFOtn+2msPduCTluD1+ZLkX5Jf1mkmXW+we0m3zQs2L1Q5ltbJY2TOOALhCTaASPMUTxxjE
	jqQrMIQF7R9kBmx6gYTkJPncwdAeiCyG0+rwbgj7+4hMuM85I1S7FDMQ79eYd+VAMjfb5cVt+U0RR
	CB3j+MQBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYWUa-00AFHi-Hk; Mon, 19 Apr 2021 16:11:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYWUY-00AFHV-CG
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 16:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=8S2PGruKxeXtOAqZQGSv8hi6Xv16+qSVNh4uGAuRpdw=; b=Bkv+bQoaaDaVei6lSgBFT196+n
 fIGwETzHMclOSl0vWgniH+ztKV0cezvzpEIbJzJ28M2OHWnczK7oHit+/2h2MVktyrUjmjMjGN9Bo
 JHc9vB6Sx+oUDTiiBNj3WCxGUthbThHxahkDKOVIV7r+jOQOOU0tlUqjq6DiyJnba8nE+5yS56EU1
 cirrLsDa7ESzC9YLGhgo83CUUk2S+UBP/VhOmbKPJS41yUtZ3PhtU+KXHscAHG4VXOfHmDvVJjWul
 hFLXRGTiuUUxyVOg49szpX7d8VxxM+KQ0Jj4Ko0WiluCoKSBsL/OSI0KCvE0u35wBNDoaCXD+yKBa
 SrNoCoyg==;
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYWUS-00BVwG-N1
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 16:11:17 +0000
X-Originating-IP: 92.184.110.210
Received: from xps13.stephanxp.local (pop.92-184-110-210.mobile.abo.orange.fr
 [92.184.110.210]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 1492940002;
 Mon, 19 Apr 2021 16:11:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Fabio Estevam <festevam@gmail.com>,
	miquel.raynal@bootlin.com
Cc: s.riedmueller@phytec.de, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH] Revert "mtd: rawnand: bbt: Skip bad blocks when searching
 for the BBT in NAND"
Date: Mon, 19 Apr 2021 18:11:07 +0200
Message-Id: <20210419161107.159111-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210419140350.809853-1-festevam@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a881537dfaf281bfcb94313d69dcf9ef8fc89afe'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_091112_899646_4AD5A530 
X-CRM114-Status: UNSURE (   7.06  )
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

On Mon, 2021-04-19 at 14:03:50 UTC, Fabio Estevam wrote:
> This reverts commit bd9c9fe2ad04546940f4a9979d679e62cae6aa51.
> 
> Since commit bd9c9fe2ad04 ("mtd: rawnand: bbt: Skip bad blocks when
> searching for  the BBT in NAND") the bad block table cannot be found
> on a imx27-phytec-phycard-s-rdk board:
> 
> Bad block table not found for chip 0
> Bad block table not found for chip 0
> 
> Revert it for now, until a better solution can be found.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
