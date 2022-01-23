Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5A2C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Jan 2022 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDQoJ/nRDdhJYkUFoqFVGwXxj9Td98XvCF2YigbS6Y8=; b=m+oIv9dJMulf+B
	XbniINZBkJd3XJiIoMUrxCc4bSe81iWzDmieSRmNbaWwyUMvMW3JRNVVuhlxWysauUN2zjURu5kq5
	vBGfiF6hdc3mBd96qrPRhbSyWfhOj//ZifdRcrcCb0pLz8LDhlEN3/6DwNhRoZrqTa3b/vfSDQnHs
	fd87oIG5py2F4r48Jzp4Iv4HcS3h13fgbnJAiBrZfxWZulPly5YgHahSbz6eKk/iOXj47PZpe7Jw6
	/+wl5F/vOel21ZVZTdfM8VPIicp8jzQHPYQwhroRW/uqd5Eox8bfE4AIecU2O0AoF6f/Wmp8R6gV+
	eH2nDBnfDlTHy8C2dmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBeiY-0013NP-Nm; Sun, 23 Jan 2022 15:23:46 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBei3-0013IR-0I
 for linux-mtd@lists.infradead.org; Sun, 23 Jan 2022 15:23:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E5A20100005;
 Sun, 23 Jan 2022 15:23:11 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Ansuel Smith <ansuelsmth@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: parsers: qcom: Fix missing free for pparts in
 cleanup
Date: Sun, 23 Jan 2022 16:23:11 +0100
Message-Id: <20220123152311.529488-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220116032211.9728-2-ansuelsmth@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'dfec63756043caadbbb092af19a06631b600819d'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_072315_244118_57475D8F 
X-CRM114-Status: UNSURE (   6.11  )
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

On Sun, 2022-01-16 at 03:22:11 UTC, Ansuel Smith wrote:
> Mtdpart doesn't free pparts when a cleanup function is declared.
> Add missing free for pparts in cleanup function for smem to fix the
> leak.
> 
> Fixes: 10f3b4d79958 ("mtd: parsers: qcom: Fix leaking of partition name")
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
