Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D42AC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Apr 2022 07:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bY9OEYTj5BKoW9oqLd+oFp3lrPAS4m+T9311tC9f+lE=; b=S+puqYTvCPV8gk
	IqpOvwsPGqO0sYIn6DvEENcMURuNUOJkRoYR2j3/7AZGmS/TaFwlM6z1o5ttQG0sYuh2e4CdkerYY
	b0q1kMQxOnRP8s7oSfnNazTSPu0e/0eY/XL2JI65wDJCloJ1px0smTEy8WBW14LAcZynPsoBQ9+pH
	ofCbc/I2QSEhkMb0oE/rlMHsS5qqGBNTNoToElHJjjo79g/emTccpVBaBgFAhM9xwELAqCHIvimNw
	OusQIJQNJr52o/QbK5+OpjPWhCLWqGREDEKAWNoWMXJs2EIQxyKcIl5ik9i8yB/raLQIDQnBUzAYH
	DXWuX99Pq0332hf4wkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njFiQ-00CzKP-F9; Tue, 26 Apr 2022 07:34:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njFiN-00CzI3-C8
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2022 07:34:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F31C340004;
 Tue, 26 Apr 2022 07:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650958462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P5bJaWA94MbeEcumkuk0ZButgw7OJvfuu3YZ1ypnOaY=;
 b=DKn2uSinHob9BtRTzHJGM+QzhKBlbJD2jEsOnPODIccuNrnwgPsZH6lJBrJcOnzgiIA1Uo
 nKKa2HU27uWChoaV4Zo236TMxDYI9h0ZVFVPkJI9QHw1wkzlU794vDsnQSDfRrSeu+sUFx
 5JQZfOLab7utin9mS+txApqj124u6vw5sNS5LC11/qPFkuKK2UXOcUATjVbwqm9Y8Hp012
 CeNQjiYQgX7lQpyUFusrzaHFTsHW2nQk/UjZ3AFfmo6gSBUjLUSVGQY9xV6k8Qz11cbZWa
 jfMWHHh/NrDtgMTS9/1dltGxCcTIcEOQd6Bz0St7FYqPX5bPC/fA53OAHpAntA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v4 2/3] mtd: mtdoops: Create a header structure for the
 saved mtdoops.
Date: Tue, 26 Apr 2022 09:34:20 +0200
Message-Id: <20220426073420.36975-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220421234244.2172003-3-jmeurin@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0bd359ee712d9d3e757971ded4094c8ba006acd4'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_003427_583883_C7542BA0 
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

On Thu, 2022-04-21 at 23:42:43 UTC, Jean-Marc Eurin wrote:
> Create a dump header to enable the addition of fields without having
> to modify the rest of the code.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
