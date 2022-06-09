Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B80C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3J4DaAniVweLucM79JfFE8OM0HvZbaYTPMUJ3jR/nyo=; b=tnBZy+mrYuXApA
	fkun6HagIDeEoOvn/b+eEcsbgwK+MXa7Htb1BButOHRYHW7oNtbVFFnZFskutyC5UoxTKSO0uGvdH
	LIwGwo2mIGSv/taa9UJYrAiPf/1O3hgfvrnjKSayQmZgwq9cJ/q6KLl8hLod1d3MPSjktb4GQWF8O
	oRWNzQX6t37nOI1ThnRVgdJE13Qmz6S1qFHcw7TWtNq4gb+f1qAQXeBB777U7xAHdL53mupRETrjR
	sMYI0FY70Wb8xYpx4ctaNx3NhXxZut/7leGcHWD7nuq7bIbjtVYo88weaW5+48zUiFVtZ/fFRqkDw
	TfwwI0ikZ5M+P/+zSusQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHV2-001pdI-Ng; Thu, 09 Jun 2022 12:42:56 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHUz-001pao-2m
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2022 12:42:54 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9F913FF80D;
	Thu,  9 Jun 2022 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1654778570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41nAwBo/IlfT2O9XMs4CbFOgqOjq0QItWoiDOln6yns=;
	b=YRAUdyRimoPp6Iz6OTTJGZz2A9L8gpCpe6LUFOvX9H5yzukblVVvotteqLPq3CFUE5SJ89
	B5uUJHQYKVdGCxxz2e9SqiMVNxbz5mac25aeOTLyG9bGvbMag/JVRgPx1Fgk44zcNbcDju
	U98eFXoBFt97Cgv295bUxkfZwSeyywkN5fBKoN6xme1DzIk0VqV1FCILpco7/oIFDqOtgI
	yGXcgr/Afb7ZLmDp7EF/IkPG4vlCZOx4m/S/CwB2vUchgRqsUKadDsNRlRG61NAcbQALfT
	qXz7eWu7Gu9kHSo86jUC418D/9I3nhDkBVfTT/6g7B1pwusPdYmDJobZsIGAdw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miaoqian Lin <linmq006@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: partitions: Fix refcount leak in parse_redboot_of
Date: Thu,  9 Jun 2022 14:42:49 +0200
Message-Id: <20220609124249.133008-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526110652.64849-1-linmq006@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'16460c01c0114422a39d6f38b885c9c7a533efcf'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_054253_305894_0722327F 
X-CRM114-Status: UNSURE (   8.18  )
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

On Thu, 2022-05-26 at 11:06:49 UTC, Miaoqian Lin wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: 237960880960 ("mtd: partitions: redboot: seek fis-index-block in the right node")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
