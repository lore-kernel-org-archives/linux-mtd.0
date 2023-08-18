Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B222EE4992
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 20:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/eZ26ZmuW+6OJP2ibyikwDo8GpRVor7MuX29obzJy7U=; b=dAaOC5i8wos4PR
	111oJCc2u//LnXRIu+VDYEyKjapRdIsILENvdNKAs4fNfst4DUvbtd5A5vXTGbgoNBdVJ+vu1wzk3
	ARWrfnGAi0updFzfY2nLg2BxVu0qoRvNdusbtwIpmeytQLBViRoBtioc7FcJl7qSaINVRQoAAmoXN
	1GFz5gHSXsQsIGL7XognjrVL9hJ/vjmDWRMN3kEMN1kIje2dlEVQ5oLzGVUVNKRl2cO7zn2fqU58H
	D6lvKSM70x2mRoKlstSI+4zlHMgyMeslJJudoZ5FhwLAWwidTY76xjegHsVgb719WhRjzxEE0DNeF
	uOfjBQOs/SdMoe4W/cUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5gD-009yXu-0C;
	Fri, 18 Aug 2023 20:02:45 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX5g8-009yXB-30
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 20:02:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8703D60003;
	Fri, 18 Aug 2023 20:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692388959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wqqEGbGR8a1vZLu2pKvVCNRkRVecAjsILyTXMbDwPVA=;
	b=XNF6bnuL+izKGwy9oyuxGRfqzetz+FnoB1mKsioCNgVLD943l8SY1GOK5zRm/KVkG8StiY
	1N7i5mL8Z4YuQe7QQmjZ1NkgMWotwJwueksvEwXhdm6gE2McpwRaiI/TR48Lic9xN/Ax1X
	5roO5D66kmzh7GGHZXweE4ipLOW67novuhXsarOvZEOUPW/gR08ETNdJ3ZlkKu6smCR0UP
	qOOz/IO1hT8ENE+9CIl5wxBc6SSJhEkMD9KHoGlsiMJXow5NK8tQBvv1kQOsa5HcGThy+n
	rmRY3P5iAJGe4ou5BH3D8mDkg0BBnSQc9cZqLtDG+HpcoHFkVeTIPqxGMYmP4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
	mani@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com
Subject: Re: [PATCH 2/3] mtd: rawnand: qcom: Clear buf_count and buf_start in raw read
Date: Fri, 18 Aug 2023 22:02:36 +0200
Message-Id: <20230818200236.149324-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230818145101.23825-3-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'318207ffe487bde07e0ef229a9a51c896d66341e'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_130241_107400_3C272F5F 
X-CRM114-Status: UNSURE (   6.30  )
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

On Fri, 2023-08-18 at 14:51:00 UTC, Md Sadre Alam wrote:
> Initialize buf_count and buf_start to 0 before starting the
> raw read. If we will not initialize then read staus will get
> updated with wrong value and we will see failure for even
> successful raw read transaction.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
