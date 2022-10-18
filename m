Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E44CC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/NupInewrR8siMVLgRJH/FzxsFpVichJluFkK8LBz0=; b=VepEMK5kXuX2ap
	+llqPFTKghW2tPFNfGIGYGSKRHqC6TXTpsR89T69/yOnWiAYG95GkN2nCKz6FTWrVH+ey5MH4tR3q
	L9bm8EzfONWcNrkog9u2SQ/wUqc1/iQUawjoibRHCUQwnWfQRygMzTpAnNbpcYQsVgKLBR8zikffc
	+OuKQE+CCjcsVFUI8HywTgyU9WTUxJpTU5AkVlLh6UEc21uBwyYpgfdjkhF2mAM0orTladqqMikgg
	toexdLZQPBjG+ZG5q+DDni9FGYySAE//DfcfAwZpZdXrQFTZH7CCrsZU5iMYeqq1oDVnClhaPCsb9
	dibREQcqTJzKVXfdhuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjLI-005PI6-1N; Tue, 18 Oct 2022 09:57:00 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okjKd-005OXr-4H
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:56:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9564824000A;
	Tue, 18 Oct 2022 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666086975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDvagrwwNd40Q5o2uBnuXvgnDyFVN7WFGLk79IsNyow=;
	b=eZIaR+c78n6KsifSckfRH4rwD4d0b+KCLHb/yfY8+PksaYWiUcILVTgx9XTor5nUpAuXHl
	VRXbyhvLNVRGoZQXx420PSUTdseIYg4Oeo45BPSae9eP2+EjjjcvGrWU86iID/fXiZULOo
	I8Tye6YNbh6cAIduUStxSQzIXfpwyQrOaib1Ug2UaSBxr6E4YBC8HIHQ7RyZrTq5AOiTOY
	unV4QnsByGK59ImWw3Vkto9YfYbrfI368DCas2mQhoN+T4x30e0dgFP5KXDbAitftr08sJ
	+NeRjn52vEg97z66BL4jW27TRRZM0/0EGif9oHDQr2IBX4JbXcj1yRnT4b5g9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ray Zhang <sgzhang@google.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] mtd: mtdoops: panic caused mtdoops to call mtdoops_erase function immediately
Date: Tue, 18 Oct 2022 11:56:13 +0200
Message-Id: <20221018095613.543231-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010045549.2221965-4-sgzhang@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ade5011442eb7a9fa16e548341230b326cf11a86'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_025619_375601_DC019132 
X-CRM114-Status: UNSURE (   7.66  )
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

On Mon, 2022-10-10 at 04:55:49 UTC, Ray Zhang wrote:
> The panic function disables the local interrupts, preemption, and all
> other processors. When the invoked mtdoops needs to erase a used page,
> calling schedule_work() to do it will not work. Instead, just call
> mtdoops_erase function immediately.
> 
> Tested:
> ~# echo c > /proc/sysrq-trigger
> [  171.654759] sysrq: Trigger a crash
> [  171.658325] Kernel panic - not syncing: sysrq triggered crash
> ......
> [  172.406423] mtdoops: not ready 34, 35 (erase immediately)
> [  172.432285] mtdoops: ready 34, 35
> [  172.435633] Rebooting in 10 seconds..
> 
> Signed-off-by: Ray Zhang <sgzhang@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
