Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F8DC33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:06:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A1024656
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 17:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i24C4RLL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A1024656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1M5ConzHtyZyVI9qxZRjBZs1uKi7+Lcy7irmS30WiU=; b=i24C4RLLbF/V1i
	5cLaaLPkXerhtnSetPfc2jISkRXfAlY+8ma6ud6H5NVelBkWqi1w9BKjsx+Mt5VsfLsiHy64nGrhM
	a73NdPkc3iQammifbpVivkI7qklyW1fe63navWMujRxfzwS0J8RUeXSVYcd/fH7wn38jvM8763yIU
	LxAdjEbRlCywB35ZwTxybs2NcN4i06FP+ly7pedRhcJ0fYyor4jtXd9MAbd/IUnYPflyhCYi7sRRK
	pP7slwnL5CSNhbA1oi8gnHj3VtkbC7DADBx+oRhfC5ZO0RVAIo2ctb6kHuQ2JC0Ffi/AJWv1WaJe5
	hVjHlqWhYtV6p3lfxw/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irPeA-0000xj-Aw; Tue, 14 Jan 2020 17:06:30 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irPcp-0007LO-Tc
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 17:05:13 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 76439100004;
 Tue, 14 Jan 2020 17:04:53 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: YueHaibing <yuehaibing@huawei.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, frieder.schrempf@kontron.de,
 masonccyang@mxic.com.tw, allison@lohutok.net, tglx@linutronix.de
Subject: Re: [PATCH v2 -next] mtd: rawnand: macronix: Use match_string()
 helper to simplify the code
Date: Tue, 14 Jan 2020 18:04:51 +0100
Message-Id: <20200114170451.1291-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191231013648.19124-1-yuehaibing@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 2bdb182c68b89635063b010376ecba97eaf48212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_090508_174034_D8ACCF71 
X-CRM114-Status: UNSURE (   5.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-12-31 at 01:36:48 UTC, YueHaibing wrote:
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
