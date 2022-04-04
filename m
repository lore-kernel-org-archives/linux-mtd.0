Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFB8C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 08:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTe49ChFKXWaIZ307yGOhAmpLy0Y59lu5gaujRTrRfA=; b=W2Vb0OiaHu7IuR
	vtXCVtD4cm+YrDqXgeawX8X4+3uOPUailxRpTHRQqKXqXjgFJxI8fUeM+qDY0Jeu+TkNPZWcj/DMi
	bDf7H1oZ9HY9l7EnplN+D7honJPmHH1aHrNuaTWraKhoHMz8ZA2B2RjkqJFpffQZVhMw6CdBkd5iL
	nJ9oAYaaYRMr3kmWMVxyEQ/JIbXvMTFD7FSWHLTHpdp1/3ayoInrFTuCZTZGpgyiQjUUchwJv+/+3
	Yw0hGhdGx6Rr1z3PAVAS9Rtbd03ShW/zCQ5HDs89MJoLi0AFMP77rqWTG7fS4nnyT8+eh/CHww0EZ
	SnLFFNnmvxJr/erWwdcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbIJ8-00DtVZ-3x; Mon, 04 Apr 2022 08:43:30 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbIIv-00DtRE-1E; Mon, 04 Apr 2022 08:43:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E743FE0006;
 Mon,  4 Apr 2022 08:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649061791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0NzH/HJyQRA7JlgyykSLC9DM46fl6l8PCLhNaZ3vcc=;
 b=jZF818wUKjfz+K5hrYSg9ySnJtZQ8Xb/TfxgsB5Ttp0WLRiuRbcYGsHsItXtbJo6GsKF17
 Jkv8p14dEwBqiDWt68Er5GrsTqWB7TC5VFyeCXnLB/b3WMkN4aaJqFOslm79BPhVpLStfO
 2slDUf1LV+puUm0QLb7p49oXL3RfxGeskvZ2zjV/TnCd06HdVngpflTbJzU7e51SnPLqGM
 oRukwRc3FPTzH9B9xkYt2u9ftnxCTocwVzp/6rY4m0hH0AyDgzfImGyd9oRuk9s5/UkTMb
 /r4LVFZ/Lh5USgOUMXFHkhOfo68ebzBCdf5W0FP01SHJ5gVUJUURACAhseJ62A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Pratyush Yadav <p.yadav@ti.com>, Paul Cercueil <paul@crapouillou.net>,
 Yu Kuai <yukuai3@huawei.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 RogerCC Lin <rogercc.lin@mediatek.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH] mtd: rawnand: fix ecc parameters for mt7622
Date: Mon,  4 Apr 2022 10:43:06 +0200
Message-Id: <20220404084306.1055176-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220402160315.919094-1-gch981213@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9fe4e0d3cbfe90152137963cc024ecb63db6e8e6'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_014317_246827_65FF47B8 
X-CRM114-Status: GOOD (  10.69  )
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

On Sat, 2022-04-02 at 16:03:13 UTC, Chuanhong Guo wrote:
> According to the datasheet, mt7622 only has 5 ECC capabilities instead
> of 7, and the decoding error register is arranged  as follows:
> +------+---------+---------+---------+---------+
> | Bits |  19:15  |  14:10  |   9:5   |   4:0   |
> +------+---------+---------+---------+---------+
> | Name | ERRNUM3 | ERRNUM2 | ERRNUM1 | ERRNUM0 |
> +------+---------+---------+---------+---------+
> This means err_mask should be 0x1f instead of 0x3f and the number of
> bits shifted in mtk_ecc_get_stats should be 5 instead of 8.
> 
> This commit introduces err_shift for the difference in this register
> and fix other existing parameters.
> 
> Public MT7622 reference manual can be found on [0] and the info this
> commit is based on is from page 656 and page 660.
> 
> [0]: https://wiki.banana-pi.org/Banana_Pi_BPI-R64#Documents
> 
> Fixes: 98dea8d71931 ("mtd: nand: mtk: Support MT7622 NAND flash controller.")
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
