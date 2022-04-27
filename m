Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96262C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBXxUBTmHZJamqy6OgtB++QoNvARQHA3Tet1tBTj2Fw=; b=OHt1VFtkON643p
	Gok/Gc5zgqLsRt3virtg/RPEoR/By0rBEllHqv+z8TRkUXL65KDwa7c6Yrj/dVIfD8sm9OIhXpLyN
	7PJ2WCIL0PPqDQyWT2QLqT4NP5tIDc5L4kjRM72TZz1DcS3sPRvPHbSgBm8vYUNHvCjkmDMnD5IXc
	LmtsJwfLoquPZReKYEUbMZgFwtSfhBIV9tcLVzJZ98GgZUA0siIi9tQaZDwsZyQnHB1DkhfQULlr9
	pzfKoE7Ft9qY85RuzCcl2axdgdBt5O2IjFfTaLqhYO+aiJ1gxcrZ/2fIzdonskeN5/6moPQ3EuBKT
	F4Y8pMbAxv14ba6HKaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njjYT-001yjx-Iy; Wed, 27 Apr 2022 15:26:13 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njjYQ-001yiA-K9
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 15:26:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 37C5FFF809;
 Wed, 27 Apr 2022 15:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651073167;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wTZZPinydjcjv1I4AgdUoYpVwYx1Dn3FddOafhqD5Y=;
 b=QWGmZPBP5zuKML1STJVjCP2ZYTRb+zr+JLX8/DOlI80QVASlR5kcTXua9ARdiWCNbuE9I3
 cQmXalTI45lGAFEMWzjRYYsyW7hdlQjWsIBUo1kswZimYqjPKqzZ0rMD7sroV72KO7YbW5
 rCyBZXHGfb/M3BtmEkKtieUGVRFKuYreynNW4ZIIe9OhtftJltXMSKLZNoRsjUCSVn+tCn
 NdXB9P1MCMn9aGdjnC0o88sLQCDplCOtJW5HCA4g7DXtApkxVpUAsXovXBkxVDtJ499qwW
 HXoRBAmWPNcA+7uWJ2xXHOzq9D2BNhkOLlR25Ew4zTozG7UQ/W1xUX85BAOP6Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at
Subject: Re: [PATCH 3/3] mtd: rawnand: tmio: check return value after calling
 platform_get_resource()
Date: Wed, 27 Apr 2022 17:26:05 +0200
Message-Id: <20220427152605.100908-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220426084913.4021868-3-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'9b2152f96f4a243bdfb89027c0d920aa0af810e7'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_082610_862549_C6C283C0 
X-CRM114-Status: UNSURE (   5.11  )
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

On Tue, 2022-04-26 at 08:49:13 UTC, Yang Yingliang wrote:
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
