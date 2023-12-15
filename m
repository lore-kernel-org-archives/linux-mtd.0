Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EFAC35274
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrH5dWR9zWVaog7TDNAVgNIbh2T8xajqIPgbmy+0CEk=; b=UiwwKN4AFZT0Gk
	C9yNjyvmVvCPSOxcRfT7RGUSsB94FPm2W3gMs9s/M+ljQXcZJktspnAAEdOzjTaCCa7KyPAr/L0fI
	dwefeQibHTuYck34oKaMeDOyV4jK/wlYHcvQche4LAmfd3Xv4v6sr4z3hrlY+c1aOpDGryy52quZG
	mzJ6YuenRmVxGx9IoPvx+0+e98kj7TkwcAghxaahetVfu6Hv2vBEiWja48SNcJ4YD2/Jc629EHldW
	AlyFOHoHkDVLbd0Bf36W3768S48cUDJrdSIixPRt8W5kViiT3XhuI24O9Ld440B1XHmxTk6nvykFL
	KXAh1vAFXYbvadLRsmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE6sx-0039oB-2I;
	Fri, 15 Dec 2023 12:01:43 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5uu-002qOx-1U
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 10:59:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F2BF2C0003;
	Fri, 15 Dec 2023 10:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702637977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ppulf4ieaWbGeulXk2Zryw48ZtbAkelk9ZVt/rra0H0=;
	b=E70orBVoReLl8AHERna54K4a2U8iYK1VDfFecgphZb+ciuJu+Xmn6U0LlATox9gcVNDJLu
	sZinZELjX3w0OKVHohDtNnuF5EE8EdHjRIOwuTMEhEWLpF1Nwfaieioj3p4dYOd8DWNOya
	NcL5bt0/+wBnOuE5cSSmEf1ABuZuv8G9tucDxfbMnr3r6H7p18p1cKXSW2Zco7AAZB5gE3
	kBCKv0Lllu70gnlvr5W9Kkwq3FTnRhEowflq6zDmeEacVanYzV/mwbx2eaHiP8tRuJUhP+
	wrO4YnKruhT5LJadr303HBxFyhaBzoUY5SDVm/Bqu0FOAU5OV1miZV5+4rS7jw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Michal Simek <monstr@monstr.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: rawnand: pl353: Fix kernel doc
Date: Fri, 15 Dec 2023 11:59:32 +0100
Message-Id: <20231215105932.499338-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211150524.108803-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'199d1402229f26804c81508346b57a0e9c094bb6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_025940_632102_9285934E 
X-CRM114-Status: UNSURE (   7.25  )
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

On Mon, 2023-12-11 at 15:05:24 UTC, Miquel Raynal wrote:
> Both the "chip" kernel doc member and description are wrong. This field
> is called "chips" and describes the list of NAND chips connected to the
> controller.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312102130.geZ4dqyN-lkp@intel.com/
> Fixes: 08d8c62164a3 ("mtd: rawnand: pl353: Add support for the ARM PL353 SMC NAND controller")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
