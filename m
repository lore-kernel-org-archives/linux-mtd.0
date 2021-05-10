Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F40EC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:17:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2932613CA
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2932613CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R8pEevYnw/RN+G4l612PlNCDo3j/cOOnuhO2k3SGlNs=; b=Zr2XehaxXfvfuAYzArHJAayvE
	vg+tL+mGwzlsB6k8K21HXnd8t6299vnJ5NaEaFe79RtFHRbGWWFWq1l7BPBQCdUZgM2CSI6CxpZ4R
	u1hrrgSH8RrNac+nzELuSfjtbbIpTB1u2YyLxGNOrK32EYjfQBnOlDZNZ2YUpxmYe90ukX+rOYa1A
	Nm9+RhToNQdAE70U5/Yp25m/4IhNTL0ow1cNY3djWFdxAym5wlcVEC8/vLdbz0GThJjH1VxkArL0O
	hHClBOY6Nn0KcqgMw/8L+i1w5o31ltLXekPo926p31xrkw5WL8OLG+5YIN9paoGW1yBuq6v4Fgc+Q
	ee/ll1WRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg222-00DjdQ-3R; Mon, 10 May 2021 09:16:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vM-00DiQI-NT
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Type:Content-ID:Content-Description;
 bh=sCDS5SDzYU3xi/yXNKxGjIOyWxNH66TT6isfPsqS69A=; b=XKkwdrQzKZUE0RogMI/TSgSyDo
 mzntzCR1U8EWek8tI0cjmD1jqXN8OytzjSNxhs+hcBFfH0BtU5wIjiB+bFczc95TrhKBvKFFZ6l7O
 JVtJwffMmmFs/Q/mBiEfCpyVkByoyh/1yNY3bIli48oXce+tv8n5gPHSw6/l3nZGwGqxZVOYsgkpR
 7CSCRVzjMOkVf/QllioONn2TItF5b4dqhMdB95WQZlUtEZ2xZigplOm6vV4/Rg3WRZUvZFvpZ5hF0
 bHCpklko5iZl0QSCf6tr8Q5KJ4zd4m2mVy1ThkBRn0QJLEhZ3fTHt8hUDZ82ve2jU8ybOtLBwSQoq
 LXMdH66Q==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vK-008RVI-2W
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:09:59 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 1282A20018;
 Mon, 10 May 2021 09:09:55 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>, yukuai3@huawei.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org
Subject: Re: [v2] mtd: mtd_oobtest: fix error return code in mtd_oobtest_init()
Date: Mon, 10 May 2021 11:09:55 +0200
Message-Id: <20210510090955.3972-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210409010739.1021001-1-zhangxiaoxu5@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e4f3c9118f27b3b400db9993dd8bfd028d3b86ca'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_020958_280606_47DEEFA7 
X-CRM114-Status: UNSURE (   5.36  )
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

On Fri, 2021-04-09 at 01:07:39 UTC, Zhang Xiaoxu wrote:
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
