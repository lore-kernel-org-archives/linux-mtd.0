Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211FCCDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeyjA2RUDDf7NssSG/JYV7eihOdLuf1MOx3PEf7JIHk=; b=WMaA2kopiV/KNO
	LeoMe62DxMYo83K08mSDGtQZ0YRtWluoxrFsL8MyYrS8t4D1/Hce+8gCUlGMDLnD1W0fQETCQoU4T
	/jpalrLUw3rm6181GcdFlnDRythwe1pVbGgg8MnLqah8OlRv0XwjKziSy4vzpBAIesI6LUuVsWi+4
	Bz3EIA4F710P2kf+rVabUVS7+cHQGlMcWU+lZJH9I/zTsPaTn+W1ow7foXhxu0czuQMnQSqRHaeW8
	Vz188A80kf0hbBQ6oJ6bwBMpVxcWWhIPC0bLOze33O8iOnzku7v4RO4XBjmOtav8HotIvsI9wgluI
	+H+bePsgQP+o127ocPpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuj-0090lq-0w;
	Mon, 16 Oct 2023 09:29:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuh-0090kN-10
	for linux-mtd@bombadil.infradead.org;
	Mon, 16 Oct 2023 09:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=roto2Ms7aae9Nrn/EG4m5v2+AAmE4JeuXUIB3zViURE=; b=i+gdxZhlZ2plRTJKHTc97EoRVC
	RJkjTktjjqWNeSBrlRm8XRNjfDeg/Dh4zSTL4ZKN7m2zfuBl1w1ptJ2FqHnpoJKX1YooTlRwISejh
	5Tdw4DhtAzAAqAwXzFT+UTl8dqF119omKSifKrq4mBsMhDE4GVyER5vMXE/M4y5LiWz7kMDIFG3hC
	0qgTj71W9J6mJf9mN3f777FhBHXCbxnVEaHtVqldd4E5UBelqyeLdDfYPcsFfW+4shPDM2HIUtY9g
	2z3teSwIxj6eZZMMNIDuVykS++iigQkSg1flH5Xxa/Mzx6KTZYs7qn0iLoEb7m4G4u2qWv0LvuDqd
	bLE2vF5Q==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsJuW-005smf-0Q
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 09:29:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DAA340004;
	Mon, 16 Oct 2023 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697448553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=roto2Ms7aae9Nrn/EG4m5v2+AAmE4JeuXUIB3zViURE=;
	b=HbNexEedPtyTC7NOct2pfHl6gYY28pnQsEyF+HtbB0qfUwxPdrDe2W3aF1V5WN/xmR2s2j
	F1K6F/sMbcvvbv85k3dyk0YpPVzWP8BlNCdGESM4EToEK2aw22JfiMHZTict3hcfMUkkMg
	KPIjFojVikiwg9ysV77+EQq1W5QCGW0b+le0jy+VzaccvW02/GcIgaK7Z2WC4R4sdAg6j4
	UiRSMYKJFYFnD9bunkaHb35VRbEE1GYWkWIt/eV9W0XNRLKvPPYiGbnPPCCz+2mIYHpJza
	2VHuPtePVMpgBubd25uMZkedPcNzIj3pvjZ1crLdpKBfDJe1p9u93zvcHjjjbQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Mario Kicherer <dev@kicherer.org>,
	Chuanhong Guo <gch981213@gmail.com>,
	Dhruva Gole <d-gole@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v2] mtd: spinand: add support for FORESEE F35SQA002G
Date: Mon, 16 Oct 2023 11:29:11 +0200
Message-Id: <20231016092911.289145-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231002140458.147605-1-mmkurbanov@salutedevices.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f447318fb1d156b4b6da79266724c7ee347d1b59'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_102920_955800_1DFAEDB0 
X-CRM114-Status: UNSURE (   5.45  )
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

On Mon, 2023-10-02 at 14:04:58 UTC, Martin Kurbanov wrote:
> Add support for FORESEE F35SQA002G SPI NAND.
> Datasheet:
>   https://www.longsys.com/uploads/LM-00006FORESEEF35SQA002GDatasheet_1650183701.pdf
> 
> Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
