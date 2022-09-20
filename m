Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8540BECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eOZ3E5m4J1j1BPp+DKiSY7hfzMRIlUYPHVXsB5brHHY=; b=eu1mke30zUZrua
	1+feS5f84srEnX3GghE5bGrfLOQucEI5YbcjWi8uZ4t5bmdwp+wo6M2OpppSFOPhOMumD5nXY+CK9
	y+gWtXQ4H6O3ctlOfOjzTzt3oUu9X/jsu1mhSrwXgb5kVmAPKj3+X7+acWS4xM39cr3ota44a3dkV
	kEo/a6HEQzVqsNd4SIeG82FIrLsQ9h0KwZ5Qw9gw46+8qOkTtY2M+h5C6KI6/TgHTg6j/jjiJNm+1
	y3AZtncst7oJbGHQLzwsyxkmlsylOG1MTm/i/gNp5KbdolIXB4Qzw8oPr3Ax+fb6/a5+7tkdeQ88s
	FWmeqMdPFPWYT9LRuz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQK-001gu4-NP; Tue, 20 Sep 2022 08:16:08 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYQA-001gpv-FP
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:16:04 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2440C1C0015;
	Tue, 20 Sep 2022 08:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irYS8rB2BM2PxXgnGQ/bb//+3yKCxrRzr5QdV9zBcVw=;
	b=KsomwEOTSWXQXQglkRXNCnyQ+Prt2w37XfRkvwipz8XgK0g+uTPSACMbHiJFljASYg8kDQ
	Pc3AGWN9WW95iDwFafIoOeRqq50XLrI02rMC0mfL0xh1LjLbcUriDeC61Svdbz1oP73pUm
	WZk4xEeXaec39Xlb4gvl/ca3t8opEK+VYWRj70N0vpu0iO9oheiJPN5B7kSs3Kn0bjeb8M
	9mQJS7FEGrxzw6sH0tlYfqktNpl/G5824sP/89OvxQTrXEyUYP2Eq/rFh001wDRdUqAkx5
	K2cp5Q73XGcAaG3yLi3HB4cH57j6q0onCxVUceONhOGcMuJkl8GrVvBI7Cqksg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org,
	tlanger@maxlinear.com,
	rtanwar@maxlinear.com,
	richard@nod.at,
	vigneshr@ti.com
Subject: Re: [PATCH v3 8/8] mtd: rawnand: intel: Use devm_platform_ioremap_resource_byname()
Date: Tue, 20 Sep 2022 10:15:54 +0200
Message-Id: <20220920081554.598124-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702231227.1579176-9-martin.blumenstingl@googlemail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7471a53ddce54cee9b7a340dc930eb35b02c9eed'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011602_881697_199A3306 
X-CRM114-Status: UNSURE (   5.73  )
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

On Sat, 2022-07-02 at 23:12:27 UTC, Martin Blumenstingl wrote:
> Switch from open-coded platform_get_resource_byname() and
> devm_ioremap_resource() to devm_platform_ioremap_resource_byname() where
> possible to simplify the code.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
