Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91260C761AF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxVVvljlM9EMbp1cHuSXZgG3wBQebS5B1svKNIw/11U=; b=FpHKr9iqGZQMIF
	EBaXaMDg5Fn7ENREDIl4tYZusbGBJl59s5oEIj/OG1qrE55Z+zdAHFgRRKlFw/yngN2QeAv7I7pMj
	qbYyZf9hMLZKyyIqMymsFjfdFt6gveGDXgqNPwgrF9p1TSsVk3UBuzTUHoCB1TMa14v0xnXJU7fbf
	2DlZMOeakGoxppYzsID9M9tGdtWbPCSg8++xUuAA//a2i6oUoh1Q1CCYncMUzGBQ0WsCh89r4zwPl
	T41TNTGzUl6STHil27YjhWJEUolQdMy7D+z0qtz3vZXYKHUga53bvdW/LSW0LLxx75TuZi9GmNLkR
	BuRHlo4wiCk6ysHrDgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phAMq-00Emap-1J;
	Tue, 28 Mar 2023 14:32:08 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phAMm-00EmY1-0f
	for linux-mtd@lists.infradead.org;
	Tue, 28 Mar 2023 14:32:06 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AD9C91BF20A;
	Tue, 28 Mar 2023 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680013913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cS6PPoncge7WxV8QMPkorPfEpwyvKDYsj5quzqSchVg=;
	b=gFe5uypXFKGvQoREQ8B7JuD5S7+QZofkTTf75Ht985XN7h+ahqDyeo/BNrgqhpaTuFBh+0
	WhfE+GxAKHMxYktc62eJgZjVuX9NiOLaGWE1zVehPFsxtAlgNRoIbVvbz6RlQHStaxzLW9
	vdjv/k6Q24sLi/ButfuVS/JabW3eNLmOIaen0C64ojmurTW4N6WaKgeD9lDu5/2ioRIgIH
	vjFZl2hLtN9G79o/+UY9T32s/XoZoTa3tBcwjiHdxI4AJKISNGSAYN2hHiQiCwGoidGass
	kcW3Fllye4LbwltYisibfBIqfpt4mIAAq0TqlVQB7fsJnw6CBQ1iOY770zQO5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tom Rix <trix@redhat.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] mtd: lpddr_cmds: remove unused words variable
Date: Tue, 28 Mar 2023 16:31:48 +0200
Message-Id: <20230328143148.441555-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328000620.1778033-1-trix@redhat.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e6026eb080fa1c1ef6eec24567b733809a5e3018'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_073204_397835_6705C4D9 
X-CRM114-Status: UNSURE (   6.51  )
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

On Tue, 2023-03-28 at 00:06:20 UTC, Tom Rix wrote:
> clang with W=1 reports
> drivers/mtd/lpddr/lpddr_cmds.c:409:31: error: variable
>   'words' set but not used [-Werror,-Wunused-but-set-variable]
>         int ret, wbufsize, word_gap, words;
>                                      ^
> This variable is not used so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
