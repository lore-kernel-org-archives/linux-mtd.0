Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DECECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwvQvzgOZ7KXOX2iWmXgz3Rok3IizVHoHZGIyPPfNdM=; b=QQmEK7seThqDQv
	IpUMH8FbjHEv3FqY2tJS8wLWFbiRZvG5Tmew0DTj35nReMF99Sbslh+gQRlc/4gZXWJGD6h0H3j4U
	fWzmDnQd/+36UPIHXmT/5O+trXCb4xLmHMETZ/NsoaGl0nyj61NUz7UQbvQks3x231r4JRC4IjGFW
	A83N/+6ZQ6TaB/Tb3wIExpM/HW3J7Mxy2RO5vYuOAIPQBPOBjwfCBBfHtQTPqbPwBKM9CgpyyfYG4
	bKSNv3dqKzyApDbK+kEa4r/Po8+3RGz7mwqWt4hfSTHDR79l9dHmbJkxENHkV7JOyQCaKIKatYn+I
	NpXN2fx/AydSTkFlQGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYj6-001sfb-90; Tue, 20 Sep 2022 08:35:32 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhK-001r7Y-FR
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:33:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A7CFB200008;
	Tue, 20 Sep 2022 08:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=esexip1yFJnRestUe93rAsRCI36okFNMJSeo5XdMS5s=;
	b=TOQ+glxV1YFdbvNxUx57JoLB+6WXo2fJDnvrsnjBbx+btOt6FQi5sd8UqmT3/10+fNUnsK
	JfoGmmEtj4PtkmcU7kpTcDdmCe4l2xFz+A/+0yzEYXYXxOFP/PVHm96lfi8UQ3ha6HQcPD
	pq+OWNjoKTRtr7INOi6un+FZ8FBxpV11LC2v6KwPUs+Z+i4KZPOIAphCP+KEM0jU/KONOR
	OSx/NGO2A+W9ipkt6sVUXUCOmj1UWLyMJlbrYfN/hV9IwLeAgk/rH1SUBxLHFFp758d5oA
	PPlBmFA8BXcgtxG9SJIdnRY5wB51vRQcm3RBpHw65pDDbAFeHHuoN94/bFXiqw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jiangshan Yi <13667453960@163.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiangshan Yi <yijiangshan@kylinos.cn>,
	k2ci <kernel-bot@kylinos.cn>
Subject: Re: [PATCH] mtd: rawnand: fix spelling typo in comment
Date: Tue, 20 Sep 2022 10:33:38 +0200
Message-Id: <20220920083338.601010-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220905063232.1830197-1-13667453960@163.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9146e732a2dee289d0988f6ad23a74f2ae8181a1'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013350_201520_99E66A7B 
X-CRM114-Status: UNSURE (   5.38  )
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

On Mon, 2022-09-05 at 06:32:32 UTC, Jiangshan Yi wrote:
> From: Jiangshan Yi <yijiangshan@kylinos.cn>
> 
> Fix spelling typo in comment.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
