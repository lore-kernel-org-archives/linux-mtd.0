Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A233D0E6E0
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUMH2fX69/rpROjPpRsnS9soZ49uqSKOWtbPTcQrmos=; b=bivSfikTtX0HAy
	6rIMMiHRBEnFA5taqfWUE6x3sP22qdJZu2hhIUm7RzGLiHo4KXAZ5ydKzSjyqLtZWHpPBGXecc1zR
	zGgjEbw+NZeY146PBUEITHW7XYJGMEwwOvzEe15HO5uhPQ9X5tEIUAw9453Pfbk3eEkRPD+BNu6Ay
	cjJUzK3dROlF/jPQxkfAX+AuOGfL08hwdRQ5Lb/rMSRmEDs8sxL7NR4K8F/UZu5fO/WVmocofoaxw
	hwBJ7kIR6NpCtreSElTSpJ6RofPP9QVh0LipZSYuD79azZAxlZUx59Te1pYA0XHErTlebVwuuDGeX
	lxWlqPvLxaX8cCLTxGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pNr-00000006qQ8-29bU;
	Mon, 21 Oct 2024 10:11:31 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFh-00000006nzY-3tiq
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:03:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BB976000D;
	Mon, 21 Oct 2024 10:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJZhQ6CMjsh3YkdMElA00TYYsXFupRYN7sb3b64Oh9A=;
	b=NikMChGku6eQx9kABXAlD79s3Qn7zq2DO1RJNqh3UTT7sBjzMxS8ljQxDQEmhAFkJ6GyZh
	U7KlvWFFPcTWiG64erPJ6ra/8CVQikIuDFqqCQ/34BXcUsF+tOKkHi1TV797GRg5pDo6WD
	8Uo56Nzf3mQyoivcQQWDGsWqflDac18P5O8FVRANc7G+kOIgxGa3tzAMnVe2WmNQA6hgyG
	4DtecHuYev46Mh79+SAztbbXCkekOagvu0khOXpSw42InsOaUA/+9Y1PocfYwY2osLMTvR
	BwtYYz454G12aGLtBQJF8NgqDdEPLaKx/P0ndzLpGsimylKYNJ61sQhXV/9SxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Shen Lichuan <shenlichuan@vivo.com>,
	computersforpeace@gmail.com,
	kamal.dasu@broadcom.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	maximlevitsky@gmail.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	richard@nod.at,
	michal.simek@amd.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com
Subject: Re: [PATCH v1] mtd: rawnand: Correct multiple typos in comments
Date: Mon, 21 Oct 2024 12:03:00 +0200
Message-ID: <20241021100300.173547-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923065649.11966-1-shenlichuan@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8ab1b51fa45e29edcbd887208f046a2af0e92a08'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030306_150906_35C8F460 
X-CRM114-Status: UNSURE (   5.86  )
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

On Mon, 2024-09-23 at 06:56:49 UTC, Shen Lichuan wrote:
> Fixed some confusing spelling errors, the details are as follows:
> 
> -in the code comments:
> 	remaing		-> remaining
> 	alingment	-> alignment
> 	capabilitiies	-> capabilities
> 	operatoin	-> operation
> 	decriptors	-> descriptors
> 	stareted	-> started
> 	Unfortunelly	-> Unfortunately
> 	compatabable	-> compatible
> 	depenent	-> dependent
> 
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
