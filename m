Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F53C678DB
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FuI7gGVvj4cUi4TttuaDpYor7P5U6vWVIk0SLMCesI=; b=yEfw/aStnk1Rzp
	fE+UV5hHfRtq/nECxJxeDtG18MsBjXe0sZnShlgLAPDhdYayQcJCF0lqbjjZWW+HPokd3RJLYh59A
	+Ylj8syy1Y1OrnMw9qRdhuZlHfbl8p1nQBZhz65Ne9rP+B4HEQaNDaKnjeKwzeUNvQksiVJXp+VDM
	lfTo63LT5Lr55+y+iEQhCCn7vQfyYravt8AK9krHydKlVRaxWmfZfiQNrp3YzHxLoPpV2Jb2L3pIi
	gq+fqz1EPU2E/eMzGLecdx/duf/cd+PeY3R/Q8v47r3g/ZxpCrLGH9N4oG7m2EyWMCC5J2FJv/qZz
	FSt2DpoN5LYRiHD/9/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvg-002EYZ-0K; Tue, 07 Mar 2023 19:24:56 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcvc-002EVm-C8
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:24:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E72561BF204;
	Tue,  7 Mar 2023 19:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678217089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVqEnyPhmv/4u/K9tmRhmQoFGUUi52Q71HNMmgDhKXQ=;
	b=ZJzcfvq3bgVH5hzx0BgDASVWBn+j6cspAUYiPFvLXXutt+H5JNrjh+KBNVcdPKywIpL3Dj
	ikfszn8n9AaOdegzlgvrUHNKYSTkO9lEFv7KdQPLyBSYTeD7VWsqPCb8BpiKZD5eWMKxz2
	gevKKnCZzB+XyQUCNsww+JanU/ZJ31F52nPMz7fKJqpbxORf6ipgllzjotdeZy4SaxscnU
	BTLwYuXbAdFlr9J1A5iAhCnJ+nAyWWl88xy8+/3xPTP7CaCyz2x8gOzjV/uNK6NACLnnKn
	7cQ8t1pySr0JRXtqxHz1RHk2AoiiJuJkClqYPeT8jaqdRbjAqw+gMwNADceIng==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: quic_sjaganat@quicinc.com,
	quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [PATCH 5/5] mtd: rawnand: Fix spelling mistake waifunc() -> waitfunc()
Date: Tue,  7 Mar 2023 20:24:47 +0100
Message-Id: <20230307192447.432961-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306144810.22078-1-quic_mdalam@quicinc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'42bf4597b7da8d9e3bc6039260e5437902af925a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112452_598318_77AE212D 
X-CRM114-Status: UNSURE (   5.09  )
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

On Mon, 2023-03-06 at 14:48:10 UTC, Md Sadre Alam wrote:
> There is a spelling mistake in a chip->legacy.waifunc(). Fix it.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
