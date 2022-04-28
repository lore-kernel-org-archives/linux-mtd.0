Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B290C433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sjPc2lxTtFj9Kk1YM+58wR2I85sAflwYi3oVwHBtrGc=; b=N/1Eme4TO9wid8
	jK5PWC8WovXVAJSGVu3ICH7+FOS1TPX14n6L/w20I9TNg9edcfR4oL8eUN+vXPQPE3Lys6Bvd9lZZ
	WKvQZxIIzFVh29Yw/yzGiJgzMbbq4igYYlHOy/SwuZhzd+awlJX6s5o2wGcEyuFw8VY5nGu0fjS9G
	ZHixvhwAffn/I/J047uNOTs6kUubsScvLKS3I0rmraka1yWIQT/BgCAku2UDtY1t4tmO6tJGTQjK7
	uY0HM4BBQYjuLKKw8oR2FYxyKb90EQ4/e9rTuawAzsPbOlM7p1RghP6dVKGCEIYmAXq4k/H3R6Zws
	6OW2v/WDa6oOEKkP947Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njzMb-005Szp-K8; Thu, 28 Apr 2022 08:19:01 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njzMQ-005StW-6d
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2022 08:18:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6D05E60008;
 Thu, 28 Apr 2022 08:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651133928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1r9Gw8bxccInDnBs9TnvRjWw+P42AgdF7L9BUI3UsGs=;
 b=kDuTP9QnyvZav/4/uS7hUm/ffzzCLM9ACOx8ZaTpbKhEdVMf6QSSwpUzB4Pam6UNFbRFxW
 9TzO2wLNLa6gP5b+kPekYlI5xlhXP98Ta5EbJcq3T59E7Gj8EGcoTu+CuC3N4deDa1aGzC
 wwUonJZ6whugjip/AJcwjN8kDx+WBR8OGSo34ilMTXWvh3L5Ek89592/8JtdUZkLlHY3vC
 dUEG+ZIjrKWb/CY+rzcaj1jYLE2i/K/OgqGEeIlaPjcJ5gkzkyTAKeFJrQHD/Z1RzvzbyC
 W1a5gfd7YOF0FVRCTXA6BdgJM6GU3WBbAPtEdRxxzebVW52EcvKPayV0wBNFnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v7 1/4] mtd: cfi_cmdset_0002: Move and rename
 chip_check/chip_ready/chip_good_for_write
Date: Thu, 28 Apr 2022 10:18:46 +0200
Message-Id: <20220428081846.120148-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220323170458.5608-2-ikegami.t@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'083084df578a8bdb18334f69e7b32d690aaa3247'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_011850_432572_FEF16ED5 
X-CRM114-Status: UNSURE (   5.81  )
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

On Wed, 2022-03-23 at 17:04:55 UTC, Tokunori Ikegami wrote:
> This is a preparation patch for the S29GL064N buffer writes fix. There
> is no functional change.
> 
> Fixes: dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to check correct value")
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/b687c259-6413-26c9-d4c9-b3afa69ea124@pengutronix.de/

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
