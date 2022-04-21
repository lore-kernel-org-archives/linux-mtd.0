Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED702C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gwP+hcKYAL3FAy/gh/nisb3qNqP1VNjcvqH5ETOhS5E=; b=Ha305jPQ5znBtb
	KwxYr/g2lIM8jMAbJdXzfres5HYmqwhRDE8c8m3P8TTOB+Yda5JDNiz49rATNogbM4uFyENmGap+V
	TeLSFAA8jIy+G1Atp1ekMLxR8z7vXrpsk5IyKSfkwRfZhIm3+clMPQ/VU5OUKN99jC+a2WRNe5QEM
	FOSScMzxuqfb02Bx8hpLMBnX5322dXaA7uAF/ufkkM6OBgvY+5b3ZmbN2dnyTrX8xSuO/WMjrt2qz
	CafdQf/kl2bD/+KBneNhoAC+T9tObmPZOMkPganWKNp+tGfnD/2bCrwYwRl71Zk1ZErRVxq8D75KP
	I7fEGtLMaoYh2t+4V8xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRPr-00C5rq-ST; Thu, 21 Apr 2022 07:39:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRNK-00C446-91
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:37:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D527FF803;
 Thu, 21 Apr 2022 07:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+TPmAJ1mVVW9lYmA5/MB8OClGpnptxvqaO4AEuYHjrE=;
 b=GR2zM+zpCXxMvPlnQNkW17Q53NPSy0eGsqwRA1pceDl/ac69aYQtRUbzfWpCFQhurVR5Xd
 mTJVHFuf3ADqN/i+//MIbJj+s7Rygxg0rDYUL0Vru4wrxRQKrMW08yCFgiyF10P9KSFHXy
 g5AnXn+yqpny59tld/XWZD6SuS7qFKPwu9Ua0/QvrTRJV8aKfHtVS/kC+s50fWRckF37RC
 pOA3pge5/7S081NuFzCcd1XD3Id7+IOR/dOXS8/W5eoGe8hFC3GIIIIvllfVT0XMgDxLQI
 wT/mhun087r0C/vkWegW8pkjQjegG7hLzqNgDaAuLvllgnN6TZgQymLJUHeAIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, sean@geanix.com, frieder.schrempf@kontron.de,
 festevam@gmail.com
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, ye.li@nxp.com, peng.fan@nxp.com,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4 1/5] mtd: rawnand: gpmi: Refactor bch geometry settings
 function
Date: Thu, 21 Apr 2022 09:37:11 +0200
Message-Id: <20220421073711.72750-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412025246.24269-2-han.xu@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'15616c7cfb968d72e614b1ba669467dc373b2582'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003714_603099_8CCE891D 
X-CRM114-Status: GOOD (  12.42  )
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

On Tue, 2022-04-12 at 02:52:42 UTC, Han Xu wrote:
> The code change refactor the bch geometry setting function, which
> doesn't change the default behavior, while user may choose to use chips
> required minimum ecc strength by DT flag "fsl,use-minimum-ecc".
> 
> The default way to set bch geometry need to set the data chunk
> size(step_size) larger than oob size to make sure BBM locates in data
> chunk, then set the maximum ecc strength oob can hold. It always use
> unbalanced ECC layout, which ecc0 will cover both meta and data0 chunk.
> But the default bch setting is deprecated for large oobsize NAND
> (oobsize >1KB), so in the patch set, there is a split commit that
> introduces a new way to set bch geometry for large oob size NAND.
> 
> For all other cases,set the bch geometry by chip required strength and
> step size, which uses the minimum ecc strength chip required. It can be
> explicitly enabled by DT flag "fsl,use-minimum-ecc", but need to be
> en/disabled in both u-boot and kernel at the same time.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> Tested-by: Sean Nyekjaer <sean@geanix.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
