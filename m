Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2282FC25B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRRK+KdQaHiedY93jWRKK3juoFvUB55XKaIW3WRhIAI=; b=WVg/uWk1sKB/i9
	CRvlRtxmkPqkh7fIjBeXkEHWxg57nNWa/lFVZKzC++d9y+9Ef9pvpK+i0Gvv+u1jyx7JGcIiIlR+M
	cyQalgAf9rRflEznhslV1RRHXcRXNX4QFPyzRw7b92qCloW3OLSb1C8Kcyyi+Wt43psGeJDRxwVkZ
	dOjdqY7skQn5drqvmTeVbBkpPLJD1VCGysNcSNAe49WGNeC91BIpDpZTT7G0R8SwetslIk4abV3vu
	HHEvHoT28aoz7xPXfV3JskxeX3Q1p4yFHccy3N3i654tOKsOFhwFy5nAEYZunAGmRwnYw1JGxXKm6
	orwxlB4eYMtHG9s3dxAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFn-0000000EoUF-0svX;
	Mon, 27 May 2024 12:15:03 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFj-0000000EoRT-0LxB;
	Mon, 27 May 2024 12:15:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63BBEC000C;
	Mon, 27 May 2024 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrVdm/z2KvEg0yrOWu25wDX0USnHvBtchkP2Qgvi/GQ=;
	b=NAtbkWQ4kSk5tHLF/oQ6om0bg/WONKQXCF8eNDvX2hs2jjRjwRju1xTWDYYOSNnCV//GE8
	9r14Zar2835r35aPdW+jborI8AcU277ShICTaAoxXQRQUhrF16cOb5+KNM2S2fT9Wtgp5T
	XELWvf/LXocc96xrD1O6NbAVAfmoh2N2fWfcYV3Yehi6HJrytAn1GLW/xxzlRkrfh6tsC4
	M6/03LKLVzLGOmuCuOCZZ5XwUfxjYocgsdFh3MEzxXtvlWazpZY4YDRnyKA+MXQAAtpAOp
	CjT0tBWyOIVvuQZusP2d5Ee0MfFJjp4IQ4Q/O22w8ErTlMd6dJJkHQ03d3LLZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Val Packett <val@packett.cool>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: rockchip: ensure NVDDR timings are rejected
Date: Mon, 27 May 2024 14:14:51 +0200
Message-Id: <20240527121451.29710-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240519031409.26464-1-val@packett.cool>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b27d8946b5edd9827ee3c2f9ea1dd30022fb1ebe'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051459_283887_087D1086 
X-CRM114-Status: UNSURE (   7.92  )
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

On Sun, 2024-05-19 at 03:13:39 UTC, Val Packett wrote:
> .setup_interface first gets called with a "target" value of
> NAND_DATA_IFACE_CHECK_ONLY, in which case an error is expected
> if the controller driver does not support the timing mode (NVDDR).
> 
> Fixes: a9ecc8c814e9 ("mtd: rawnand: Choose the best timings, NV-DDR included")
> Signed-off-by: Val Packett <val@packett.cool>
> Cc: stable@vger.kernel.org

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
