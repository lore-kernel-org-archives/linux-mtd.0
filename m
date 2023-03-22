Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6DFC6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Mar 2023 16:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CFY0ZJhTlODn50GffLdSLo3+uHfS7IsvjBya3JBKxAk=; b=fAmWC1xzm95GTs
	yCREDAuO8XcVdrTVvlZh4zFSgXJ8r1PnhTCjsp8os0lVKU82+hivhkSoMLzpRCoL5CzCW7LMGOkVd
	zn4NkC8gZQfmVCppoAjk8wv04M6x4MNS059CbNHCqr1HP9M/NGMYNyevHuCJ2dCBRb6F3zkOntfnp
	3UUAGu68qyqy/CbRA64Ii7z3opRSXd0ZWB0RZTlBIrTxn1gz3e3fzIZEdjh1GQxvQ3SpemDSlyIOH
	V6o4NDttGgLx262L5ZWl1Pi+dttEcBHSUvF5OruxJ36FN8GN0y0PtSWh781myJbPPv6QKJdWxn4f/
	0Nw1nz0KzkJiwIa3Zs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf11S-00GbyD-1j;
	Wed, 22 Mar 2023 16:09:10 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf113-00Gbf9-27
	for linux-mtd@lists.infradead.org;
	Wed, 22 Mar 2023 16:08:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EC19A240003;
	Wed, 22 Mar 2023 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679501324;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BmDJBFU4ANKKPCDO66I9sZQV3Gy2AT4HbhZE3mw6cAA=;
	b=NxKlPRE2Cyiwga0SmhmhPvcnNA1Gpa0fv0rUnQTvB53hWr1L7ffLkedpZWzKqWxUMQKRhz
	00LnNQ2MztC8ckIn/zhhKSK6jxm/aBBF9jhbJjOJWDFmlBSppYK8PCFx8+pRnM6X1DvaBb
	4HY/aC+32EqWmWKNhht+C8maVMICy1i63EjQW8i7ojUP+lNEBAc89TTFKAd+sOTfgpEizq
	f9h2iYyu/VmxtLCbNkKq1WcxtQRjRh6TaV+L9UOSUNKjL3G4xYFHiYotDELvtU3YfIc31E
	OPGdjThTi0blZ9QN1/dw+BcDwmcjMd31ikS5RTD0LtSzUkingBxLZEJl/hgdAw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: qcom: Use of_property_present() for testing DT property presence
Date: Wed, 22 Mar 2023 17:08:42 +0100
Message-Id: <20230322160842.2232923-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310144715.1543926-1-robh@kernel.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7c09abba58cf912fa417be8720cff00df12354aa'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_090845_855305_D041F366 
X-CRM114-Status: UNSURE (   8.04  )
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
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
