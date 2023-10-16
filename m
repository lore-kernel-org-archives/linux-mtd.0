Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E51CDB482
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7pi69Ur3wLbdUs8jRYpJ/1t95VaqAkxnESRrRaTWAc=; b=xsHTgt8EGe9iHR
	9gDxlXlHbGpheLK+EbMP6VGb/r8atAanI/rJ4pxH8WcBzUh41Y0n2j+4uiyqDtat3U8nZspTSE3EX
	EKzNshe+eQai8i0Z/zhyCPMXQ5nqPxdM2stO5Dt4q/25JbaVLVl6dMD69hL8/l8V5Wq4YV1Q+JF76
	DLQ1tSlJ+t/8Fay9B55k4aCxIZ0jEC8/W8JqPU+yRgYlOeJRIMiFHdepzzpNuR6gqn3lhkjUgM9Fs
	W96/u4R2x0BaSaN3AWO0pMblvHkdnCw7RzFAeWL4X1D1hQnANrY7deU0Fzc7BcEBN31cvC58fZet1
	J/hZWO4mZYkGc6Uuml0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsK0y-0092JU-1w;
	Mon, 16 Oct 2023 09:35:56 +0000
Received: from mslow1.mail.gandi.net ([217.70.178.240])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsK0v-0092IM-2j
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:35:55 +0000
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id CF909CDB06
	for <linux-mtd@lists.infradead.org>; Mon, 16 Oct 2023 09:28:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C306EFF803;
	Mon, 16 Oct 2023 09:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D/ny36PTyIOVrCHodnezxrX1n8CcGDnBOfmpYzvGvo4=;
	b=Vc+bNg4BLGnHTjzRzZDuWxsTnOh8QHkBO+O98swQCqKGQ+H2bE+mS3cRYx/yleQHf6yLFC
	YDJf6YqIe1IyC8gExtkQZZfw3Fk0m0hE7KAuy3ACmCL3B/UVFRqPAyWW3+cz/9zPDt2Xd2
	aBJDckGvUzsRi7qzSEWUUMrEnI/zBMDh7Q/L2fIx2X/PflI6neRjEQyxKVs2lhO0JiVKvn
	NSTL50FZw/iyxiAKn6AbLZL1CMTEJHF3+n7NF1jKYYBS9fx1+/Zs9jrxIvLpLmZ3yLliP8
	TxzD4IkPtyhsPTHz9Z126T5qgoykKrr1amEnMPt0kJyzNFUP7yEWS/1031Kiqg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ZhaoLong Wang <wangzhaolong1@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: Re: [PATCH -next] mtd: Add WARN_ON_ONCE() to mtd_read() to check the return value
Date: Mon, 16 Oct 2023 11:28:44 +0200
Message-Id: <20231016092844.288967-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230926065733.3240322-1-wangzhaolong1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0339f62a9a778bb7cd4f764cd4640cc89155177e'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_023554_024434_C36378F2 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, 2023-09-26 at 06:57:33 UTC, ZhaoLong Wang wrote:
> If the driver cannot read all the requested data, -EBADMSG or
> -EUCLEAN should never be returned.
> 
> Add a WARN_ON_ONCE() to help driver developers detect this error.
> 
> Signed-off-by: ZhaoLong Wang <wangzhaolong1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
