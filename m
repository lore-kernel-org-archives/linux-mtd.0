Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C044C54E4A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Mar 2024 18:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYSFFhI0tq23ku9Xs0RVuxQp5fGWbNWRw8C0wiC5C0M=; b=m5tzbKN2/K+Epd
	gOgQ/th6dl4aLVA5ZmmyIyrdoamOeByh+F3sujuOgWVIRWqd5+BHkWyzMrAtIOpZI8tjQ9NVmScxC
	2WbxzzT19yCqrUOlY+MuHCNl6b6VAW5nTFcaM06smNja5p4YNjlAW0g1nzLBbgIVajyXNy+6URrrh
	m8VAbt3+9j5zSBm6rJkUP9/v9NXi3XhobMj3rrVg/xs46fKHNA6475xPB1xARgtyWKRRYF4dTcWNS
	FHr1+4k/JVIe5pRz6F+KaX+IdtdjnspRt9SFqvom0+k7yjQEJia87/ZziERhqmWozh8Q0KOZtNuLB
	gO9CLXgSJgFIxk06Fa/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riIbh-00000005t6D-0xyx;
	Thu, 07 Mar 2024 18:36:41 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riHY0-00000005gfW-3yBs
	for linux-mtd@lists.infradead.org;
	Thu, 07 Mar 2024 17:28:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B51D40002;
	Thu,  7 Mar 2024 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709832526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2e3/6XO20oG2XDljssKzak32D0T1QE2mvDvHVnEscA0=;
	b=b/IflWcvh+HMQyPmPHjvGylFcoQfn8Vtu3ZBCrT9gPP6WB93KFdDbbjg7oVa5wrTqUhwie
	C2YHrC3S3TGkLV49Fe3av5FVcXY6Q5tDOfJ47CtkGrSYOXp7vEgC7Bd3KH9M5xBy8wUyh/
	bCO5jyi/gKxb2x55TklVZL559u3cveKArW9XMoydAPClUmB2IVnRUZ0lrsF8eHjJV10Wdo
	gETcegNlBykHSLB/7Z2RZpV50T/IklAFgX3wNyKAjRhZO/lSxfZQJY2CWZIHodGF03z+fH
	bjQnMOWfAkwpqlFOJOWMv9uALIF70/J7bRG0NSvbP5lE+XzRy8j2zPjDAFivgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Christophe Kerello <christophe.kerello@foss.st.com>,
	eagle.alexander923@gmail.com,
	mans@mansr.com,
	martin@geanix.com,
	=?utf-8?q?Sean_Nyekj=C3=A6r?= <sean@geanix.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] mtd: rawnand: Ensure all continuous terms are always in sync
Date: Thu,  7 Mar 2024 18:28:41 +0100
Message-Id: <20240307172842.3454534-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240223115545.354541-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4a18a8c8ad8a8921004e5c9e3b59223f95d6cb37'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_092850_164485_7A20818C 
X-CRM114-Status: UNSURE (   9.21  )
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

On Fri, 2024-02-23 at 11:55:45 UTC, Miquel Raynal wrote:
> While crossing a LUN boundary, it is probably safer (and clearer) to
> keep all members of the continuous read structure aligned, including the
> pause page (which is the last page of the lun or the last page of the
> continuous read). Once these members properly in sync, we can use the
> rawnand_cap_cont_reads() helper everywhere to "prepare" the next
> continuous read if there is one.
> 
> Fixes: bbcd80f53a5e ("mtd: rawnand: Prevent crossing LUN boundaries during sequential reads")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
