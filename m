Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3E5C83F18
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 15:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e4eI5hsFIgpnPKUe1oPY6f40yjs+xdHAgPjIYr7LkFs=; b=gAzuIanT9EZJkc
	wZSfFeek8NkvnWMkRMJsKmZNQIa+lBFM4cU3bz46DtLD9klE8XueY/+HH4tjz09dcoU2rZ+3/4fZ1
	h0q5GPJ4mIv4suhvTfz0FGNjRescWCZQ3pIXLlQ6tWHVqJqh0wAyeqNzTFVOp5o6uQqdpAHXdnzJn
	ypG9ARURmqNKdX0vtKF5r8cvRGAo7LPPnw4UGlro9lVaqHeumUtK+CM7ym8vkrDjoHfqSBP3U+BaR
	jd4x5Q5iH4WVt900minC971bsx+8yk+UE6MVKPerNEw28Igx1QFt75UUqw4qIsl4ekhY5uop/Z7y5
	KgwdyHCzwbD1Knn3HQFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0aD-00BmSW-2U;
	Tue, 29 Aug 2023 15:24:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb0a9-00BmRi-0B
	for linux-mtd@lists.infradead.org;
	Tue, 29 Aug 2023 15:24:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 07C9D62891;
	Tue, 29 Aug 2023 15:24:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5578C433C7;
	Tue, 29 Aug 2023 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693322679;
	bh=0J79MYwesloO87sHfsfNb5UbrDUMiHStKUKZT2Ru3lQ=;
	h=From:Subject:Date:To:Cc:From;
	b=Y7ULLt89pFjGe5JxsXlkeZuxtv84J/BSU03pnGbYw0XJuEWff5UYJFQPobVDvMdWm
	 djR4sZ6warxJIiNAtrKmSNSV87Rxfmc7mGQEutIwDAnH0YlSDCWxUE9RbBSZnE7ZA8
	 2IrsDm22cjbHS9UZcq2crt7VbEEP5FcI8cJAttHXcbMLc0imD9JXwUrnf6CQKXePv5
	 4TgJvgSLy5aVrmfGjfSgqtbD6by2Rk+3yGqltNCSl1W1r5um5rZfz7uDqUbt5bodr7
	 7JbtmPROmA6ctJpluHTAdYK9g9BrPQ43jzQIzPmLGM6KQ3c5XsQYkNB0x3/DngMmlw
	 NFy6CzwdWBz1w==
From: Christian Brauner <brauner@kernel.org>
Subject: [PATCH 0/2] mtd: switch to keying by dev_t
Date: Tue, 29 Aug 2023 17:23:55 +0200
Message-Id: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIsN7mQC/x3MQQrCQAxA0auUrI2kI4h6FXExmWZsFo4lsUUov
 buxy794fwUXU3G4dSuYLOr6bhH9oYMy5vYU1CEaEqUTXdIVl+ro8ySGr8+APfOZUuZaiCDMZFL
 1u//uj2jOLsiWWxn/l8DHHcO2/QDwnRz4ewAAAA==
To: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>, 
 Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, Christian Brauner <brauner@kernel.org>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=openpgp-sha256; l=763; i=brauner@kernel.org;
 h=from:subject:message-id; bh=0J79MYwesloO87sHfsfNb5UbrDUMiHStKUKZT2Ru3lQ=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaS8493Kc/38g5BM3gmb9L9tXbD9Rt4by4tWk68JJs24eEdB
 fefh5o5SFgYxLgZZMUUWh3aTcLnlPBWbjTI1YOawMoEMYeDiFICJzPRg+O/OvmtOe6/45a73IpeKQ1
 Jn5Jo66G7eHm6v1C521pfPTpaR4eBM32Nbfk7bzJL5KefyL5nFRk9dOZZ6cFe/Kqi+PPnuXSYA
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_082441_157329_E2C2492E 
X-CRM114-Status: UNSURE (   8.33  )
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

Hey,

For this cycle Jan, Christoph, and myself switched the generic super
code to key superblocks for block devices by device number (sb->s_dev)
instead of block device pointers (sb->s_bdev).

Not just does this allow us to defer opening block devices after we
allocated a superblock it also allows us to move closing block devices
to a later point to avoid various deadlocks.

Similar to the generic code for block devices we need to switch mtd
devices to rely on sb->s_dev instead of sb->s_mtd to avoid potential
use-after-free issues.

I plan on taking this upstream as a fix during the merge window.

Thanks!
Christian

---



---
base-commit: dc3216b1416056b04712e53431f6e9aefdc83177
change-id: 20230829-vfs-super-mtd-1bb602abfc00


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
