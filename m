Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E437C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Feb 2023 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yr9SsJHBDsFFCXhLxbZ11BOaex1w3Akz2Ebp4mlyyuM=; b=dSt0uXDWAEscmF
	JPmcDkCmX4f8Qt05LM4Ba5W/YJMKEFcvilX9pq9WhlzHfyEr1pt4fkHsEjiVMDtqxIOEyiD46ZU0T
	ffQVoqCd8sHfBcjO9NrbND3fSbRrKFHc2wjojgIp0EoWplwZsDszrByk/XMAkdjvHMIhn5o42cOoI
	R6juOtlXQ6SGBd/pOVPSs8TsTFcCOAN8vuo38CQclxzrDI8JHWSYKZJoWa8/+vT+hP7Ez3g3IdjA0
	8HzL0M4NeD5Rj48lgwTZIQbIA0W05MI26ot3rnre8NSHwg+7St+qog73NnHt8TUiIoJoepIwaLXgr
	FHOrYux0yTk2Nav3eJRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP06Q-008MtV-Ma; Mon, 06 Feb 2023 11:56:06 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP05s-008MYG-PE; Mon, 06 Feb 2023 11:55:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9AC16E0003;
	Mon,  6 Feb 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675684528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6opdrNXEFTZP/9r8sTzfu5r14DTeRX8UGZDZ1N132Q=;
	b=dQM39NG9tdBzdOSMBVXvNAhdkiNm0ThDtqGF20nsPA0ShGtP5SbQHprPSujOQxa5VyQVvA
	d/yc9GAL2Y0/MCCOhM3csRA+Ahvd8zGnjw71h3a0V9+3gVPl/c/5W0qrWACS4guNCYk4BC
	2N/bKMwwTmvfJuoi2r9urlC8qDCDOhOeClzjHEmQ9oVh5FEg1qzhmtfHSER9qQ5j8yg3/5
	j69rqQF1AlWiv2CPyKVpeC6jrc8RB1khXYxt4uKjEedDkR9doMcll/PIeqBf0gpweVXWwV
	n56mrVFzi3QMcQPoqLZ0++9pAqlimqD+VzIyxjGsezMLzYAf9w6+7zvK/sPgDA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] mtd: rawnand: sunxi: Update OOB layout to match hardware
Date: Mon,  6 Feb 2023 12:55:26 +0100
Message-Id: <20230206115526.560886-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204143520.9682-2-samuel@sholland.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3998a4611e8be2e9b5833e7aae29619ea0305437'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_035532_985280_D11AB4BB 
X-CRM114-Status: UNSURE (   9.08  )
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

On Sat, 2023-02-04 at 14:35:18 UTC, Samuel Holland wrote:
> When using the hardware ECC engine, the OOB data is made available in
> the NFC_REG_USER_DATA registers, as one 32-bit word per ECC step. Any
> additional bytes are only accessible through raw reads and software
> descrambling. For efficiency, and to match the vendor driver, ignore
> these extra bytes when using hardware ECC.
> 
> Note that until commit 34569d869532 ("mtd: rawnand: sunxi: Fix the size
> of the last OOB region"), this extra free area was reported with length
> zero, so this is not a functional change for any stable kernel user.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
