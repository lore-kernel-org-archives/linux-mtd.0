Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C60D105F79D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 11:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gDKuWZHelljZhWappzNutEuxsn9iQjRYTqZjNW6guak=; b=cOFRjyX6/vBAnQ
	l7rb3WHitePD4WJB4hyktTY4nvHVvR6aDEZO94pnEcQS6fE8x6DS21rac4hkbWb5spKtEq64OyIW+
	HwPWO1qTr+tgX+0JAuZ0AFgsVjYKckiaO9Y3UdX6HZhkBaEOTdJnz3WpUVuQizNZCcBa9t6Cdhy0g
	eNw11B33Ew8vQ0w6qjUXVHGK2FEhAVzliTuyZ/kYy6GGcLQaku8rPudFzlwixz4FnQYk3kEbGsZxI
	DlCgFwCpdskMaq9/VNSDotYmnjFlSZtZAWOllUwso3h7k0tbVZm0w1n1RBG+9tHkyn1ter5S5wMYA
	G7AtS3QzscPyrJeiYbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w112J-000000003y3-0OH3;
	Fri, 13 Mar 2026 11:50:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w112H-000000003xK-2LRk
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 11:50:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9375460138;
	Fri, 13 Mar 2026 11:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F33C19421;
	Fri, 13 Mar 2026 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773402632;
	bh=9lbANBg6+mHghNgxFMOF4JmZobstldEXa2BjBFJu6gE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NwzUEmuN8zuAuWrcsJ5L6wRbHh8tWObMwdEbg9Bd6bBfYmrXyPUZS/iqUrJRbf6Ly
	 bvZUW5ePxvpO08ttvYL935iPvNa+CWXm+qXy2gUGlS6bgnEnvUEt7eZ+RH9syhX05z
	 B5MufsPLNnRfA7EsdEiUcggpm70ZX846M9RnXlyQWzjpP9O9e6/opEG45w5g3xFvxh
	 0nIMYPN8u6ft25kKgzjBBKW/lw6aNUSlIg4M4CZIrX8DHcqYUTJbhIZRIL9fghhwwp
	 bXSpyJj9g01+VZjB40SRXHOHIigurUF3rD93AEh0HdXqOSY1uZWT90gDyeJ78p4vH2
	 hSPh9LC8e/zgA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>
Cc: takahiro.kuwano@infineon.com,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  mwalle@kernel.org,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] mtd: spi-nor: gigadevice: add support for
 GD25LQ255E
In-Reply-To: <20260214010608.116226-1-wuweimin@huaqin.corp-partner.google.com>
	(Weimin Wu's message of "Sat, 14 Feb 2026 09:06:08 +0800")
References: <20260214010608.116226-1-wuweimin@huaqin.corp-partner.google.com>
Date: Fri, 13 Mar 2026 11:50:29 +0000
Message-ID: <2vxzldfwdk3e.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

On Sat, Feb 14 2026, Weimin Wu wrote:

> gd25lq255e is similar with gd25lq256d, has 32MB of total capacity.
> It support Quad Page Program which mean programming the memory using
> four pins: IO0, IO1, IO2, and IO3.
>
> Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>

Please see the feedback in [0] and do a v2 with it addressed.

Also, when you do a resend of a patch, also explain why you are
resending.

[0] https://lore.kernel.org/linux-mtd/DGG91A4GSBE3.1BC2CKTHAI68D@kernel.org/

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
