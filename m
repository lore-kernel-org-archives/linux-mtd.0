Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3E1C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 11:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QEwlgRSBCNTXon69Y7KrNtXinJhZtYJxn1RMesl5SLs=; b=xw2hWNAIJjf8i5
	vV3ChI6wVyAluLARbXv+LcjFZeHquajfsRDofpuXqJrzgydTIojRNMZzHl6qMfVBmaLLqLTBmG9E2
	0y65fumGYWN6TSutdx1lqFde/nze9rivhWE6e7qEw9pecooHiEfi4rLZpmpsEbOSHu3AFwIozUUQ0
	OqeNAGr9aVV6IWff4noVWQ4dk+9j+8KVgN4W1f6bvTXZWDroBZfOuo9uIJqWtWuk37P6i3xRfZael
	Qkk7OUrxoNMm7iyLv0iwB486BpyCKtl8pVlC7KBgegeT0fxA/gcLvZp4UEsAXWFoqn/5d44eRoqAn
	/jiVyVP9MyQ9Ekte+wwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W3X-00BVuA-Vz; Wed, 29 Jun 2022 11:40:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W29-00BVCs-3Q
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 11:39:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B97C91C0007;
	Wed, 29 Jun 2022 11:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656502737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MzDaS83uRvN7N2712p5p6kNZK0guhzhsJz4z5vTBUnI=;
	b=kqOt8I4U1SxqkuWTomp/zztwci316/QgGWxEBeTRPSTMiPX/wBWekh0krNzGxOuMvORZ4L
	P3l9LN654tz9Q9IH2KGiv4+JNA2u+i2b49F+0XpI5zYqoP0JEvyYfexbXxZ5YPImlA7Wvk
	q7CKzA9b9uLl2CVmrRzClewX1XJ9ONN7KqHeafhVXaoAGjHql8525xn4ma+K2yRT7YqOIN
	dESv5cMTaOUSv+Q9GO8Pkm+VZxZoo0YvmQRs441V2jEWy8+QxDBuBG/PMKeD/LRWeKfE2A
	JN0qwMm1ummEPsj0vdDWd3dAiJYtUJqcsSPDo+Irj/Gd9B6quMVf1Mzkjknk/w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>,
	miquel.raynal@bootlin.com,
	nagasure@xilinx.com,
	vigneshr@ti.com
Cc: boris.brezillon@collabora.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	git@amd.com,
	richard@nod.at,
	amit.kumar-mahapatra@amd.com,
	Olga Kitaina <okitain@gmail.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Date: Wed, 29 Jun 2022 13:38:55 +0200
Message-Id: <20220629113855.283760-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628154824.12222-3-amit.kumar-mahapatra@xilinx.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'e16eceea863b417fd328588b1be1a79de0bc937f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_043901_397995_8BF36716 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, 2022-06-28 at 15:48:24 UTC, Amit Kumar Mahapatra wrote:
> From: Olga Kitaina <okitain@gmail.com>
> 
> According to the Arasan NAND controller spec, the flash clock rate for SDR
> must be <= 100 MHz, while for NV-DDR it must be the same as the rate of the
> CLK line for the mode. The driver previously always set 100 MHz for NV-DDR,
> which would result in incorrect behavior for NV-DDR modes 0-4.
> 
> The appropriate clock rate can be calculated from the NV-DDR timing
> parameters as 1/tCK, or for rates measured in picoseconds,
> 10^12 / nand_nvddr_timings->tCK_min.
> 
> Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
> CC: stable@vger.kernel.org # 5.8+
> Signed-off-by: Olga Kitaina <okitain@gmail.com>
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
