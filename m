Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9870C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egGKOexorLUHhLFEoXOzGE2jHDBx1D9wVVpc4Qq0sjw=; b=JTMlldaHv3W8hr
	RNvpKgTVLjVhJUEYX7loofE+A83UiJ9Q6wmYCb2KTN7x5rJYfR7BFO4fyMzt5hukkLvu5iqMMWfil
	7kjIkXspZCkrOdTwnkzslZ+Z6JBSauI0TYJhhzyB6iphmsaplcgxVPpXiQcg+4WLRaKjHpEsow2xc
	0Z+zDZzASqNCxKfE0e+H+JAEOu+8U/YNrHeolXUebHZAIvsQsc+ylwbdNEs7wCLS319zWfi7SQwol
	UjRoot/T7j5jv8UIU2yD1Xrf/ZBJ0d4Ba855o+J3TkhfzPpaKEUulZcA2KV9d6XIew4Y1o4zXiXFc
	QT8dRaH6A1C0+szWya/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYMG-001eC6-00; Tue, 20 Sep 2022 08:11:56 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLm-001dd7-Fn
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:11:28 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 64E2820003;
	Tue, 20 Sep 2022 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7AhZ/ZDIP3Pwi2ndC3tMWwpbduc1obZ/BRprK8FhIGA=;
	b=LRu6OI9HCs+P6a22iY4gLw38L1MOte9MHBOlsXlJXXwIJOXAfErSSYJHeCmAVV5QBwVN8T
	fntEcYgduBsXCdPYVhe6X1f2DKo3CRAGrXZP/uZaeh/53ltHZanm8kWi2l7zFMHjBKa7Ud
	Sj4Jib92IvWw5J3A/onZNt5G8b6ssP/tJUk/rXLdj8ltFLt8r7dgikW9zoMuvzznzixJq7
	Xe+vgCPC9BymRp3nbEqMi86uo2Fj6wBDFdHwZGSU5CTCKPqbRtF6rsyBcd6LXopoLbXFou
	dV5ej8IWTjCygpYCTfRFaCFmI9srKsMgQCCvCHABxGdemBSmP/wIiAQd9+4Oxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Florian Fainelli <f.fainelli@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Roger Quadros <rogerq@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Colin Ian King <colin.king@intel.com>,
	linux-kernel@vger.kernel.org (open list),
	William Zhang <william.zhang@broadcom.com>
Subject: Re: [PATCH 1/2] mtd: rawnand: brcmnand: Move Kconfig to driver folder
Date: Tue, 20 Sep 2022 10:11:18 +0200
Message-Id: <20220920081118.597448-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220711222323.4048197-2-f.fainelli@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'bcd80bcc5d0f288ba33c69ea034b57a7b0adc63e'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011126_698781_55F59CE8 
X-CRM114-Status: UNSURE (   7.81  )
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

On Mon, 2022-07-11 at 22:23:22 UTC, Florian Fainelli wrote:
> In preparation for allowing each of the brcmnand stub to be built
> separately, move the Kconfig entry to the driver folder.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
