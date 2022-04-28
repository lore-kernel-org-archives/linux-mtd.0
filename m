Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F0EC43217
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Apr 2022 08:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jR6h4pe09SmNET+tZQ7kkECJ1KjoVX9Ynq8nqJsZpHk=; b=V1ZmZDqAxADIoE
	+IA9YBlIRL4/JpMhuzTA0iMwZiTsSp2rQ6/yeYnWz/d/eh3NszX9xgQ07uKUuYG/5iAX3J5VfyeD1
	9kweg9v8CtIcqFq0Q286jHrKJx6246Kr9N6nnGqPlGxNQiaYr/QxNdylHMn+Dth3XixnedeLWggmg
	/oogEgg20QGXQx32vVFHPwKH3YrOysnK24vnHN7pVMuwNa9PFTvmprOn/zl9T165pmlwz5P8EdRwt
	/yXnFzig1jIu/cXKVvYXXsJxlULbRzhyK5/3UF/N+YDzZCWvamhVhiw0ziXVfkgi/kDi5W8428RXs
	zOaLhOEjQpuDvgtVRpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njzMY-005Sy5-Il; Thu, 28 Apr 2022 08:18:58 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njzML-005SrC-7s
 for linux-mtd@lists.infradead.org; Thu, 28 Apr 2022 08:18:46 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 43B9D20005;
 Thu, 28 Apr 2022 08:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651133922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KUGEgifrtB5bHjZNrG093fG5oSXYDn/9lTmer7vlEw=;
 b=hz2RKzsCvUr8MauvA0B5n3UJk54fw/36D9nqE4b9wEplt7/29/XKt8iK2iUyfWc9uM2vPg
 Nh/VH18E5owjWLeAa/xjUHbgE4cZ+mt90NLKbC/9PB4MT1V5QrMKnx8xbhBV0ncqLD12Lh
 wZsTj8cNbfUu9WZfpBovdVTrJBDCAEF1rJwpA+x8rk3tGhorVghvNCZFWVp3LDYcb/vNDh
 5t90ckmSvbPo85qpUecFZLGIY6T85buE2h9soljdZKbE6YOE+89QuIFfLFWxXEQZX2s+Qw
 AYa9NkWCNepkImZx5TOaZUMKt4UCkQXiHCm6+cPPjIIyNSvBPzIekhQ2QYvAjA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>,
	miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v7 2/4] mtd: cfi_cmdset_0002: Use chip_ready() for write
 on S29GL064N
Date: Thu, 28 Apr 2022 10:18:41 +0200
Message-Id: <20220428081841.120083-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220323170458.5608-3-ikegami.t@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0a8e98305f63deaf0a799d5cf5532cc83af035d1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_011845_491290_36D1068E 
X-CRM114-Status: UNSURE (   7.12  )
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

On Wed, 2022-03-23 at 17:04:56 UTC, Tokunori Ikegami wrote:
> Since commit dfeae1073583("mtd: cfi_cmdset_0002: Change write buffer to
> check correct value") buffered writes fail on S29GL064N. This is
> because, on S29GL064N, reads return 0xFF at the end of DQ polling for
> write completion, where as, chip_good() check expects actual data
> written to the last location to be returned post DQ polling completion.
> Fix is to revert to using chip_good() for S29GL064N which only checks
> for DQ lines to settle down to determine write completion.
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
