Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F18C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 11:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qegeo/3qakwpUyKKbR1T1HvosjTovk8WS5JnMYkGdxw=; b=NlB9Xv5PsVv08I
	dWYwkvOJjkutbVGSxb7HiU7memIF+efsfN34BJqI5YKfQ7udpqP715K4tNepwIKzh6z2AuBkTEDKd
	B4mBf2rasqao15IQ+RkqMukrdYm/Gu19IdmwX0Ejejp6o1cR3dsc2XKygFNm27JGwush2SH8yw8rn
	7M+eyGOWy7EnA+t7vpiJlL9IXygmz4fao8XnHCVp+iQawQbfIIBCfxns+5IUJw2YZfDjzHwrAz2B8
	oAzgTQH8wFDYb8G1/ibWWztalngMxogsMUd8wcz/0Jt0ehWb5r2hOq263yp6Y5WBzp/Ksv7ET6sg4
	qq3cB1BOvqWp9mulrbrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W44-00BW9J-PO; Wed, 29 Jun 2022 11:41:01 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6W2C-00BVE0-AO
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 11:39:07 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7C14720002;
	Wed, 29 Jun 2022 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1656502740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dp9QFpW9yNe+NuEsqLP3vN5J77NH2L3Sp/QQ3fi1Plo=;
	b=irYKoF7luqxuCRu/LpepIm6OPkZz2O+6DuLdjlpzAYM+vP3RhYyB5IpkbPA68aaRWQR/hQ
	efR55rMBzbX4Id3j+Icjvbo5vO1OB54vQUwgrf631lenO4can5f2GhtchFolRTHqMfuVIz
	ZSrvhbJ46Iojn3c1DtijNOVwus/pY81KBu2mcRU1BBKRYTfaJiMVrXKM1TA6qJUrxvrRWA
	CY4dpYQLZ8o20XFmfHEHLT2t7s9Q4Cc92ITAuXCrjaRWmjZ/GRRB9Ylb+IdRGl+S2lqZBr
	V7uvYJIVrrXqVzkgD20n5zy1b+3lPAXekAvuxG9xgo1L3FVBEMRBNr42wkYUDg==
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
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mtd: rawnand: arasan: Update NAND bus clock instead of system clock
Date: Wed, 29 Jun 2022 13:38:58 +0200
Message-Id: <20220629113859.283805-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628154824.12222-2-amit.kumar-mahapatra@xilinx.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7499bfeedb47efc1ee4dc793b92c610d46e6d6a6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_043906_231431_5ADD70FD 
X-CRM114-Status: UNSURE (   8.91  )
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

On Tue, 2022-06-28 at 15:48:23 UTC, Amit Kumar Mahapatra wrote:
> In current implementation the Arasan NAND driver is updating the
> system clock(i.e., anand->clk) in accordance to the timing modes
> (i.e., SDR or NVDDR). But as per the Arasan NAND controller spec the
> flash clock or the NAND bus clock(i.e., nfc->bus_clk), need to be
> updated instead. This patch keeps the system clock unchanged and updates
> the NAND bus clock as per the timing modes.
> 
> Fixes: 197b88fecc50 ("mtd: rawnand: arasan: Add new Arasan NAND controller")
> CC: stable@vger.kernel.org # 5.8+
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
