Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBDBC001E0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m/EzQVb5zXrSclSF0ER9SUuL6pGaxuCJo7zP1sqXvNU=; b=Vskh9gWjzKlF/X
	SUfAbNikwPBhTV8RUISqzM5LaHb1RIQEEmR9k5t22Q1aM+llsC0OjuG3XDBGo6LFJ2A+z8aChTic0
	meZOefjY9POCLgqLwL2MYvN/mTDW0Yn3PUfqlUXsOmZLWSnREZtkaLBX+DU+glRl60isM17vu7cz7
	MAo/iazNXKIvA3v+QeJrKhtj5CHQVzdABYOdpUCvmL5UiLEhR+vOD0X7EWLIXgPl2z/7JPmbduNAQ
	WwOIpA1oGmktwpTxqDDIz4lCbuiV+i1VCJtz2F+praUjuiUGu7SSh3UzFM/PnG7juRFVdx2LKjYOI
	brdhEjD7Hn1JGpfOWD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMhP-003LOb-0H;
	Fri, 28 Jul 2023 12:36:03 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPMgm-003L0g-0m;
	Fri, 28 Jul 2023 12:35:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6715BE0007;
	Fri, 28 Jul 2023 12:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690547720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uveafvL1+l/0WiwjggIOH9vsWbRybJ74nusxes2EiZI=;
	b=aMpzN7lhJtodMlHSrYhDSN7oLj0KymHf6NP8gVJNkjZKP5Ni7v5V7gtlilgEiZv7jZoGbN
	OLkGcIiC4UHKghbnNixuLUcS+u3A3zexi8YtBHOXgcYtx/2gXjZw1uQ/1TmtZqnmVz8TLK
	Ll+1TkDK+xbPdmceRUhEygO5AzBWQbfaKcz+UvcO6/RiHRo8CT1kaopUITFybh8JrfIbpP
	tPwl4pwgZU/Ui4YsFxvn8dTQ4iR15H/IKi6rgzyhzkx0Bgv4K5gPVGKfFIQui5LiW934ah
	NT+gUS5zmPtckpZUNnPx/L0HspOf7JPgafq3gJ3TDauVh72vm4EE06g9IQzkQg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/8] mtd: rawnand: qcom: Use the BIT() macro
Date: Fri, 28 Jul 2023 14:35:16 +0200
Message-Id: <20230728123516.640847-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230716144612.32132-2-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a6de66607a19095a1bc74aaefff44c9a5ca11da0'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_053524_423023_72243710 
X-CRM114-Status: UNSURE (   5.68  )
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

On Sun, 2023-07-16 at 14:46:05 UTC, Miquel Raynal wrote:
> Fix the following checkpatch warning:
>     "CHECK: Prefer using the BIT macro"
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
