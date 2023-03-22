Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C24AC6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SiA/2UE7FIGoHBI37SAe1QrHQuC3y5qU7rFImhVW6c=; b=NctJIbNpF0PL4G
	8iwzuWmTB9oa2Pw0M8fF42QLOJExL9D3GGokdWD6Pf5Il2QfQd/Hz8lhkcRhRw9nr4AgsDb1XF6g7
	Tv7vnKKQYjqohyFpQK+i8DOQWvrQOeuDqm0S60qzRTEbwI8rr12AZkKYH6NOCfw6EaVsvQ2hGHOCs
	alvrC2pXU8bNphrh5gUFetSLwEW44+iqk/ZcZOxibYEDaUAv8ahf/NNEZO8V+9cqMcEE2Qc3dJ+YQ
	wsKND7JThgkTICPLHZXrDALLpyz9BMmYEbG69fdP1JTvMdwh+JacTEWCvxj0xR+kmMVXt/wfx4Rti
	/soS/EW5KZt40GF61dMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf11H-00Gbp6-0U;
	Wed, 22 Mar 2023 16:08:59 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf10r-00GbSR-24;
	Wed, 22 Mar 2023 16:08:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 021CD1C0004;
	Wed, 22 Mar 2023 16:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dt4HoT+yYJ4HPjHglsZ/hMmFGsQX2hkqWUWZQbfR6lk=;
	b=dvthIQqE6hdD3zrssw7UAsPOUtWuYBcS78+lXwTr8wKRINeZMzfIRHLTbl8vYa9wcS1jHF
	HNIztIjmgUATH3eVNgw1LLCPGQza3jak4sSBWGuE+ZfcJL2UUbjziiOGKWWHwdl90j2J78
	MFi32f9wWCaXHUKQBxdpIw+ugtSbWyynCT3LLu13P2d0VY8Kw885ZfQJyRIet9QvTK+x1R
	KroN+DD8PtAU56HSPx7pvDwc/Qf/J0EmM4joPmEW3yAVSeZ0+TwVq4Y1+kD63mM/RafqP8
	aD8EA2+YDELN/QDiyDKsy3qX9CL3WE+VcUOyeQht9hs7bX/u+UVmnV9j62yZUQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>
Cc: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: Use of_property_read_bool() for boolean properties
Date: Wed, 22 Mar 2023 17:08:26 +0100
Message-Id: <20230322160826.2232802-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310144716.1543995-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'57150c40b6391bc350c6016641b2a487a3de3cba'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090833_871411_9608E6C2 
X-CRM114-Status: UNSURE (   6.70  )
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

On Fri, 2023-03-10 at 14:47:15 UTC, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
