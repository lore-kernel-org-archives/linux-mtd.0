Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668FEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERAVGGYuqcBbWsODT7E8eOlbCz5yhwYzl13/CoRMH9c=; b=AK4PWstR1P9vTz
	8UbwIOWh8vFx8kFQbPcttDQRd1HTjb31Mss+/r2haIx7bIbtXbfi4Nd436IlFeUDU0YtG3m0Nwo0B
	UUeGvCfqWnGfUt963snb1p+5q4wuxN0aVQPgXJAMZ9CnpVRwDJO4jeg4xvjtgz4WPt3rBl1JQj4Cf
	8ElaaGKV2vumoLxhxAX9DPzU0zYVzRFta9KubhPbLvchaYEXrgehfXMkgv6PCb3DkS1W1qWcC2whK
	Yga/qKKFO6bl7FVJCYV4q4DhqkceP4AvqqRcIAvWPF+aAloD8PEAy2eZts2wWvGMTWufSlmDwTsmA
	UJCEcVhPEJ4K5yjMUvVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRMd-00C3UG-Qc; Thu, 21 Apr 2022 07:36:31 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRME-00C39e-Ol
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:36:08 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 048121BF20A;
 Thu, 21 Apr 2022 07:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QwbuwKVBOef3FVZDFj8PDSdkA6YXrwYauV0H1YXv1+4=;
 b=ThdalBss+7bFsH6ZCSivg0aPGe4tb0Nur0cjeUbhNYr4Aqof2cnb+2ilfRDnhrD4SfaD9S
 mf67j5HCJcXNn6DfP1Dj2qtadbnNd+cAoxr7MMD0OXF4aucdJdIz3fcNCepQmYPtXShlAF
 aOKfoal3AOY8l9OoycGf9OQHUL3nIFj3Nb+YW6JCQLz7iGObNIW/591ndHOYcF/JHPgIL9
 lkVpL3TEV0nrbIuVRtLUC6C/NOoMcACA+V7arp73apfALDOU8xrSqba2vR6z9P8MdbCSTh
 cAYQvQlaQ94OZyxoUVmiJx3DzDmuqzUMDwO5fg+rGN9ewnHXJh4OHZVX8QCm5A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>, vigneshr@ti.com,
 richard@nod.at, miquel.raynal@bootlin.com, joern@lazybastard.org
Cc: kernel@axis.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, frowand.list@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/4] mtd: phram: Allow probing via reserved-memory
Date: Thu, 21 Apr 2022 09:36:03 +0200
Message-Id: <20220421073603.72148-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412135302.1682890-4-vincent.whitchurch@axis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd55e5d8931a8b7a3ae11e6c8b031e1900bbbe90d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003607_003029_99EB264B 
X-CRM114-Status: UNSURE (   6.82  )
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

On Tue, 2022-04-12 at 13:53:01 UTC, Vincent Whitchurch wrote:
> Allow phram to be probed from the devicetree.  It expects to be in a
> reserved-memory node as documented by the bindings.  This allows things
> like partitioning to be specified via the devicetree.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
