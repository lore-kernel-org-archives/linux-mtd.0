Return-Path: <SRS0=dUJy=7P=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E791C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 07:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 342B6206C3
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2020 07:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNzShnzz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 342B6206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCPmYJjyisaX2uGcJIjtmtkYEpeTkJfgf471+p5n7Nw=; b=KNzShnzzWKaS5m
	obFiYeAGrrIP2ZPUTX9zBBBoHO1cGjQ54pwrn+vAzKTP8fdfvTVxzUSCUHN2XwLiq5TjUHUoGSuga
	LLiQQR2FMloztFcEhI8mWIST6GM9XycPJpXFACUZQc+qrheXEeFhhLyfE9X95Q+L4E7cKSg64LZqj
	uDAuclCI3wFnYx5Sm2xoSR8VAXItxk+aVkn3+HNokuHX2IkIYuJUN2P3maOwp644kS+hcUNkYJSwM
	MK2JwN9VkP+f6HHtc5DNV8GFcAv6ncDhjtlINxf5W//tqOq0xMKX10CiEo2voVz7TaIjYmcI6E07K
	5TfUZbB1E7J1ItS78k4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg1f0-000382-9I; Tue, 02 Jun 2020 07:48:34 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg1ex-00036h-GC
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2020 07:48:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 90E452A0A5A;
 Tue,  2 Jun 2020 08:48:29 +0100 (BST)
Date: Tue, 2 Jun 2020 09:48:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Bean Huo <huobean@gmail.com>
Subject: Re: [PATCH v6 0/5] Micron SLC NAND filling block
Message-ID: <20200602094825.26396b06@collabora.com>
In-Reply-To: <0a4fc94213ca5c2040796a66942f626587483721.camel@gmail.com>
References: <20200525121814.31934-1-huobean@gmail.com>
 <829d76189beff5a50ddc56123d22bff3aa6a3378.camel@gmail.com>
 <0a4fc94213ca5c2040796a66942f626587483721.camel@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_004831_674600_4007B802 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, Richard Weinberger <richard@nod.at>,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, derosier@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Bean,

On Mon, 01 Jun 2020 23:10:43 +0200
Bean Huo <huobean@gmail.com> wrote:

> Hi Richard 
> would you please help us confirm below question??

Miquel suggested an approach that would allow us to deal with both JFFS2
and UBI/UBIFS without having any FS/wear-leveling specific code at the
NAND level, but you decided to ignore his comments. Sorry but there's
nothing we can do to help you if you don't listen to our
recommendations.

I've been quite disappointed by your behavior in the past, and it
continues. Recently you've taken Miquel's patches and claimed ownership
on them (probably not intentionally, but still) while you were clearly
unable to rework your original series the way I suggested (which Miquel
did after seeing you would never send new versions). And when Miquel
suggested a change to the implementation he had done based on the
discussion we had with Richard, you decided to ignore it and pursue in
the original direction. So, quite frankly, I'm really not convinced you
can conduct such a change.

Regards,

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
