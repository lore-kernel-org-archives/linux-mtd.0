Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC94606A31F
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RhyvrNTV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zanders.be header.i=@zanders.be header.a=rsa-sha256 header.s=202002 header.b=RuJ9kj5Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mndlA6KZAIj43mPqIPnbVvRnxEZlKu0BLWBvU9kRqwI=; b=RhyvrNTVd1t/fgEUcWJzyz1UhS
	psE6+y/zOlvwYbiS98iHazzfcrGrHqeEzhGisz/0CCrecgb5CplGVSsFKgwKkg90G6pIsJQGIOu21
	5hTeINC7H6O9fU8AYqxs22fjwz3gIfJM2KEfzGHU7UsBtEsTU1guWCA80qim47vK8tzcdxe7swjae
	OBUuElHOpzQoO731RrScUB016M9bnRbgSIhqq7Q0K/atwCzUJEhdGffD2pWAVNu8o2CEa0RlycGLv
	DQItJ5pESzHyNltwnHPvf2krjuQeGOsdF7w0V9c07Sn161WgiCSQ+nSU7hvL80hvpmPeIDFdh4gg5
	dLTrGJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvYm-0000000GDD4-2uiZ;
	Fri, 27 Nov 2026 13:00:16 +0000
Received: from smtp28.bhosted.nl ([2a02:9e0:8000::40])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWvYj-0000000GDCe-2oiI
	for linux-mtd@lists.infradead.org;
	Fri, 27 Nov 2026 13:00:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=zanders.be; s=202002;
	h=message-id:date:references:in-reply-to:cc:to:from:subject:
	 content-transfer-encoding:content-type:mime-version:from;
	bh=osCZa1wC+Zvu9D8Dq/xApsZMIP//8BE/s4RirJrsI2Q=;
	b=RuJ9kj5Y2L6gy8CzNDv5KC21f0vdqzHAs+tLCQ9bvNOA7E7s+P3WKWTAJxKgVM5IWT/C1q2tXB16F
	 wxSScPDQxhX9eTDfH8OPDLJbnidzJ+Ys7SUmyG4HG03hz4FLo2yTVG6Qjo0IY2YPJDPlxGd1qY+wNf
	 A5VOBgIwPp2Ho9czxEv4fYxzCOxlzrx09r8OrlQ9+07oyMgqNSwykbAw+ZpS8Gi0K4/A4B6OKvpFx8
	 nMGJGHR8N31/B/ipx6NcOOfDQmo9RuChqPOLiQRLRe35MV8GgIrkGRvqElRUUILuWPsu3vB7oSEBb7
	 +gsDhClb3t4qAi/Dzd6drO1NpoYahFg==
X-MSG-ID: 665eb1ad-ea62-11f1-be32-0050568164d1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: rawnand: gpmi: fix probe error path when
 CONFIG_PM=N
From: Maarten Zanders <maarten@zanders.be>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: Han Xu <han.xu@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, 
 Maarten Zanders <maarten@zanders.be>, imx@lists.linux.dev, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <rc-b1-20261110-vc-170-6561daaaf6bd@gmail.com>
References: <rc-b1-20261110-vc-170-6561daaaf6bd@gmail.com>
Date: Fri, 27 Nov 2026 13:59:30 +0100
Message-Id: <179578437089.42564.6953197767312597216.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795784406; l=238;
 i=maarten@zanders.be; s=20261117; h=from:subject:message-id;
 bh=59DQD1G1iSgtJQdIAgk4d9+k79+O6x9lxm3IYgwvoOo=;
 b=e3D19xOOtoV2U718Mz3lwuPTVFovPhvY4KEDtNZeLW3iio1fbftSSU1cuK6NptmQs54s5MxUU
 z9GsWJ5AbhVB35PSMvVvKXGDoeAYyKrtynrwXKswgN0UH5OVRyVc7XF
X-Developer-Key: i=maarten@zanders.be; a=ed25519;
 pk=9vkWF6gtn9DS+97n+W487XUEhrI3+9cvA7Fdon8T1uI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_050014_122834_C5819BE6 
X-CRM114-Status: UNSURE (   3.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026 21:32:39 +0800, Yige Jiang <yigejiang86@gmail.com> wrote:
> mtd: rawnand: gpmi: fix probe error path when CONFIG_PM=N

Reviewed-by: Maarten Zanders <maarten@zanders.be>

-- 
Maarten Zanders <maarten@zanders.be>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
