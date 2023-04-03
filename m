Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C889C76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AO+V5x6hUQ+PJQQESXg+qj2b70bseE0zeWckn3y18E=; b=aHOmg3QAMP6dou
	hs/+QyDgjmElxvIWjUHbI3ec4NkT5MN6Bj3OxvuDWuIkYnMQUqZ6TjIZ8wGmU7lPPKG7VY3AXbWv6
	qJr7NOS0NIlp8KVZagMI4gk8Dz0zDwogaT7yDsHuc90/7Mk5W/qMXh0G4DGb4XIWNUoHErdLkHbX0
	q+Zp7PFfyvgoZUGwFhQUES+CpsBp9f9L92hF54Ij7CUT2AGhEmU7XuLQkF70r9r2+f2T1W1Velziv
	WloEnqppMio+T4aP0N7sNd7Amo7IWhkE8GvvzbhHgZ2ouZDtRx0H50s+mWLAuVaDc4wTh5XEZM1HT
	sloSZra1cOAFyvI5074Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ8e-00GSi7-30;
	Mon, 03 Apr 2023 19:46:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ8d-00GSh4-1u
	for linux-mtd@bombadil.infradead.org;
	Mon, 03 Apr 2023 19:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mz4VHGXz6DS1YgoT5sffndIrCMbK1I9V2lRSBl4Rl/8=; b=L/Zf6b+viPHmOV+rt59BYs/OQj
	tCBLKuqhWsLr1zg8R1dAUoKNDTZUDsffavJaFZPMcNi406U7kRoIeLIPaKEi5W49ZE99vUfFXWgB7
	D1GojL3ORisSZOsGXGmtxJT+E9fHzuSR9CEtRt4qP7NG6Szrd5fhxugQzefvGVi+7k67QgRChtQds
	yvj+Vo9q0cmaJFULSjGXdgmtPUPygV3RMFdSSm+ub7S7o2f8XNc07mIUbUU+njnneJtbpDym30tKj
	QKLtYF6IJpqqRXJUP0Af4HPisKtxRCL2xpb4g3PVT0/hI0mKib3auUT3WRsueFQTOgufciZNQPKRY
	9bl9K+jg==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMaY-008vLr-2t
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 15:59:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B977220005;
	Mon,  3 Apr 2023 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680537558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz4VHGXz6DS1YgoT5sffndIrCMbK1I9V2lRSBl4Rl/8=;
	b=FDaIT0gY7prNMxDiZ5XpwX2vX+R724wNbtq5lBzGawcDsjFAIm3noHaiBmFyEczsbTo0cy
	Or9jsPVom4iDkSbnxVTVwQBQOm5fPzaDhVw2LJxRVjv7YGjpjAGHBf+iXEYtGsdRC+9I0w
	UiJC8mTkpr/AxetoJr2mwzzsef02hu72P19FvxLwXmG8lqNK1IvC+9grejJWZ9eurUeevS
	qYfxM/5wZ4g9Xq3P1yjeiEYsNroAM24M7kwu+Y0/cwEMzzRHnkdedW3HuUtHgy1GrXbpNX
	k/XdS3dcygnI47pi+5HHYeUGNqDPfEy9c4U7dz54Y4CeDlBjCMcxneeRi8WwsA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bang Li <libang.linuxer@gmail.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mtdblock: tolerate corrected bit-flips
Date: Mon,  3 Apr 2023 17:59:16 +0200
Message-Id: <20230403155917.137591-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328163012.4264-1-libang.linuxer@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0c3089601f064d80b3838eceb711fcac04bceaad'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_165923_205908_825BDC98 
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

On Tue, 2023-03-28 at 16:30:12 UTC, Bang Li wrote:
> mtd_read() may return -EUCLEAN in case of corrected bit-flips.This
> particular condition should not be treated like an error.
> 
> Signed-off-by: Bang Li <libang.linuxer@gmail.com>
> Fixes: e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
> Cc: <stable@vger.kernel.org> # v3.7
> Acked-by: Richard Weinberger <richard@nod.at>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
