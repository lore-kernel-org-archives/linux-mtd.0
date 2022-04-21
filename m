Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7E3C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/xY3X581VHpAc/jjdoSu94LWvOscLzKMrEbU1zbPvc=; b=JK3qeO7Cxq4byn
	gw2sQa9ARmHk8RwXRcR67H1T2MfckrOPHEn1AOSJUUIXKS13kUNUvTLNbksWwPjZtqkqg+nhRi4y8
	6dm1tc8KvrJvgNoTwePLGlu0ZIB/aNR6wtC93bCUQvjEEv6sb5WAo26QXr0kJn4o9NDUjiUVqyuvr
	wYnl+8UKJWhwf4sQqvnjbK3uhlLcSOOGVFz7Jlrn4oM7MMaLDueFJ0aijmrmRcyziOIJmU9UNoR+2
	O9ZyUZwBuQcCcniquydNjx132Nk/pAZplm+BnqaoZoFZLUe04QgojNvFWQc79+6MouxkGMHUCqlPD
	ceLy934lt8LrxMXGpz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRMV-00C3Nl-UC; Thu, 21 Apr 2022 07:36:24 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRM9-00C36C-UK
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:36:03 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9AA8A1BF205;
 Thu, 21 Apr 2022 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526560;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9ZQakAlm+CSj2qFh7po/Pr9DPdMQhOqjSdYOtnNW7I=;
 b=FWsQAqlTFYLNe3SiSYEGFAlXtHXFYrpKXy9UJuNF4Z+s18kFrkupi4xt1YVK+GX+A/dcBF
 wjyGgwF38NajzBHOLrjvdoHDGk0pjY4O46BFPQEnioTbqaAeVuyAyHpDnEWtw8h7yHSRAb
 DapeU2j4EZ2lwRAsx4uPBZ4kF1bfFFVhzGze1lQ3RHiN/fNbc/Oeie1nklyXFh6mKHmTow
 HWbGmNb81hLeKd1HWmuLD4gU/VdiTn6poFPTCL52Ay22HhYpqR1U90zb+f9iJcr1c0AtTp
 vvysKGkuw0/Ynob7R0PgD1ProF8yvDd+Y5MV7drj0iwneuTWrm878QHH4pjVfg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>, vigneshr@ti.com,
 richard@nod.at, miquel.raynal@bootlin.com, joern@lazybastard.org
Cc: kernel@axis.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, frowand.list@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] mtd: phram: Allow cached mappings
Date: Thu, 21 Apr 2022 09:35:57 +0200
Message-Id: <20220421073557.72082-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412135302.1682890-5-vincent.whitchurch@axis.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ec8615bcd6f3a02e983bbafb3a4e4d35cd7e8c47'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003602_196565_F1A3DB2D 
X-CRM114-Status: UNSURE (   8.87  )
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

On Tue, 2022-04-12 at 13:53:02 UTC, Vincent Whitchurch wrote:
> Currently phram always uses ioremap(), but this is unnecessary when
> normal memory is used.  If the reserved-memory node does not specify the
> no-map property, indicating it should be mapped as system RAM and
> ioremap() cannot be used on it, use a cached mapping using
> memremap(MEMREMAP_WB) instead.
> 
> On one of my systems this improves read performance by ~70%.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> Reported-by: kernel test robot <lkp@intel.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
