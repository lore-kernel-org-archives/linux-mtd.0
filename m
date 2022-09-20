Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84297C54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5A0tmjWIV9hRP2COolkrlE5KOjm3Ehv9nsJtmU3wF8=; b=CLCF2Sz4ZvOCjl
	6gl2J+65nXZ3GBTk3xKWls6RaZLR6fRrOzZ9R7fwLcG71HAqm7A0HDOwjlyVPXUO0guaJ9xJdl8sl
	Ka3vL4OTfCmbHHJw4qkaMj8VJIpkqB0VyBhGvbsxGzXUrWyu8Kr0htUob2RC0BtRkWlvpOvfm/ekI
	8lkeCfoltM0CJBsnAxIQHbS9zV6h+ayZwdKqlCYXBCmjvtytQxVWvC4eeiYpGjXzGGTFzr0YfgfjJ
	2QssUvrtSfbCyJPtFlAXt82Yjb4JA3b6RxDBMRVcm37RCmVKDCwVKIWeYQeTdkawTrDQcmNyqyyxr
	aWczte0LFYJpY/2du4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYnd-001wm8-Om; Tue, 20 Sep 2022 08:40:15 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYhr-001rSN-19
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:34:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F1AEE4000C;
	Tue, 20 Sep 2022 08:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663662853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aY89X0PRSKW/Tm5MujcBMq9ADfJbIg8jUF4Tdi3x5F4=;
	b=XPOkmnRt0cMH1SHyb4KS986crfs9OMus+cgIXnstSuR/iqY2NoOI9+5AH7XNz+D03lnoXF
	PoR37rT2clMTZw1g2tqJPfg7tIo5ZpaoZO/gbnQ6pNyBMT/gfgu3It1067UeLfaI52pROT
	ghVIYXZlh+45o0PgQVQz5JqexciDN+AkPMhWDTZQ8tHQP0RHsHKkCEC6ZxZYxCdnRQGSdz
	2TqHKh5hR9G3MusFWLsjpVucalh/B95x3BzpVZQ70TMiWNsjs+zsMC40Uw5h/x6Yj8wl/z
	ehex2Ou8GX425To4Ah/qDHuTyTsx9PpA4yQdLzbFvXe2Hd30/2DcaLYgRGLjVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: ChenXiaoSong <chenxiaosong2@huawei.com>,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: remove misguided comment of nand_get_device()
Date: Tue, 20 Sep 2022 10:34:12 +0200
Message-Id: <20220920083412.601208-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819021846.2924539-1-chenxiaosong2@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'35f88fc8c2a3224c66f59bd85055161a46b55dd9'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_013415_252772_13748E94 
X-CRM114-Status: UNSURE (   6.39  )
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

On Fri, 2022-08-19 at 02:18:46 UTC, ChenXiaoSong wrote:
> After commit 8cba323437a4 ("mtd: rawnand: protect access to rawnand devices
> while in suspend"), it will wait while in suspend rather than returning
> errors. So remove the misguided comment about return value.
> 
> Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
