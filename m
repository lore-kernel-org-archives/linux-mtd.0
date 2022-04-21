Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF59C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfp0CuhRhgdMGAGZQ5QWVxU4K49Q1LHQtgsjb5ATYa8=; b=nuo9/9f+dS6DW+
	Bw9BOMqt67IoUzKBml/bQyMZJJkdt03gCbnST6ujO6oyZmv5n96onmZdcjbiu2Oujmrta8m520Qnv
	LBLlAKK744Y4JTLWtrXIUAjmM/vrMDUxRGjwDN74PRep+5N9vOJ6kqrmMvHB4mvCJjPqQrC5OikXy
	pPsRe2FQLOUAKsrYluQVgJ5sIV+28W461AXfzyrTvhd1U/pzETU7f8oRwK85rfrM2B9lfw2Ktvnlp
	Vi8zhqHLlIatMv8mpo/gHw0TKNIQRNW1FsreDGQo/UBz6N6GzrF0yAvjl/PChoZ0OfMsuRWJsxdaL
	XR4On9qUtiT4Ch65VWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRLp-00C2t5-1w; Thu, 21 Apr 2022 07:35:41 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRLj-00C2r4-QX
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:35:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A62691C0014;
 Thu, 21 Apr 2022 07:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5sUaNXOTPfSNutP1Nw7SXQWnMZHzjp1ss3S3Q/iiVUM=;
 b=DqqHDeRhUgldMcsQYFpqSMHOXjUkSTLj0wpr0kTgrr3W3ou2YcG22IF0xK77bUqWH9paZn
 WG2Sy5RHNhqVKmjvnkVmnyqtYuFShP1GV99cfNy/Uy73y501M8I5+e+Qi3hR8OithBlC7m
 7Oeez/NM8/i22HCoyGgHCyT3xD2gJ3cpYPQgwRkJY+4VCAWs0HCsNoh1HsL5AiLSpztvqE
 u62HdYhqZJRJP1BOSFoPuQHo3SR72pG0KIP7nbixy5ug6HD2rtZfnP/3rzVcg7Th3NQ/du
 LJohDkDLxaKcTIsFfzfK+sDf3VtZtQqByYbmjYjJLQgD9jej5aL9iuYAPWp2QA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Oleksandr Ocheretnyi <oocheret@cisco.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: fix 'part' field data corruption in mtd_info
Date: Thu, 21 Apr 2022 09:35:33 +0200
Message-Id: <20220421073533.71758-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220417184649.449289-1-oocheret@cisco.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'37c5f9e80e015d0df17d0c377c18523002986851'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003536_036782_1392C7D4 
X-CRM114-Status: UNSURE (   7.09  )
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

On Sun, 2022-04-17 at 18:46:47 UTC, Oleksandr Ocheretnyi wrote:
> Commit 46b5889cc2c5 ("mtd: implement proper partition handling")
> started using "mtd_get_master_ofs()" in mtd callbacks to determine
> memory offsets by means of 'part' field from mtd_info, what previously
> was smashed accessing 'master' field in the mtd_set_dev_defaults() method.
> That provides wrong offset what causes hardware access errors.
> 
> Just make 'part', 'master' as separate fields, rather than using
> union type to avoid 'part' data corruption when mtd_set_dev_defaults()
> is called.
> 
> Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
> Signed-off-by: Oleksandr Ocheretnyi <oocheret@cisco.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
