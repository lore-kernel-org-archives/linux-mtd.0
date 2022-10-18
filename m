Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63E6C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tf5d8agSlwSkSdD5CpEnScRje6zMb/oY0azvfzC/o1I=; b=IUJfbdLCtGiXwC
	hfrYrQ1nHTXkl6YQSx8X8fvk+FJl7C4V0uz2pqNvzE1rIi986fwJZV3ZLOjpDjwqR8m0rtr9emQRl
	5k7BBP7N+qq3eRSxABRPL0Yl+3WkuKMAGXz8ksbYXIKgIKvRlAd9TUDb0vMNiSzzu/8pTzAneDe+q
	f1PToWQwgw+FnYm3fPGjxIXNrBt8FfJUDc+l5Kzsa5SYJP5sMUYLVdpRNS6JcYjmOfntSaH/uSQnq
	nnAOtHxsUbwagJGzyJTRaQ5PTT35e4Ppp0Mwtul1YdqtHu8G51534Lo2ZogLzrqByvrLEdRE3ruve
	+dQqleFMIa/JPsGtJGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjM3-005Q07-Uq; Tue, 18 Oct 2022 09:57:48 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLR-005POq-Kp
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:57:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A2AB8240004;
	Tue, 18 Oct 2022 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666087027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yl1s0RPvRtmrMK1YN3M35CwBPif+bULSC0QuYjcxvB8=;
	b=IKaDl/1R9ZdVfPwKOe7kuPz4sXgYD7lHjYFNaR+bxS/2LbQeIPY+dAE6Q48d6y6PfJkPhe
	cfC6+WuMAz9bMeZW1aCnVw+VVcBvI/A0WJkkeQQ+ZnBNWDw350RFHiNueeRtkRHrJWTxMd
	rgLvi8LxfSBtW8RnNsInVVYDwulrMxyW1FETuq+86twj7bIkP4+tW/UFxJsil9Ed6xAPQp
	eBcuh9o+EvuWcLuFZym0uTdeDY24ECysEtMB8L4K3NHq7cwcA2zWKXBmDNgr7Fl+cVXAzO
	xGuteHXvQ2DtSEmoQmHWCjOe6PlbxD2VAoJSEL/Bu5pSgOeX91mMz0vUPj2SWQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Valentin Korenblit <vkorenblit@sequans.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	arnd@arndb.de,
	ye.xingchen@zte.com.cn
Subject: Re: [PATCH v5] mtd: rawnand: cadence: support 64-bit slave dma interface
Date: Tue, 18 Oct 2022 11:57:04 +0200
Message-Id: <20221018095704.543421-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018093000.12072-1-vkorenblit@sequans.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7c3fc99819fd812b00f1881537599e66b989e392'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025709_855301_C40411E9 
X-CRM114-Status: UNSURE (   5.44  )
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

On Tue, 2022-10-18 at 09:30:00 UTC, Valentin Korenblit wrote:
> 32-bit accesses on 64-bit sdma trigger sdma_err in intr_status register.
> 
> Check dma capabilities before reading/writing from/to sdma interface.
> 
> Link: https://lore.kernel.org/all/b7e5ebb4-0de8-4958-9bc4-fe06ec4c3635@www.fastmail.com/t/
> 
> Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
