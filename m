Return-Path: <SRS0=Ceh7=ON=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C30C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 06:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C521F60EB4
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Sep 2021 06:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C521F60EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LYSNJtPTgV6YF0MLTOGIkTuUSckbGCwqovBCu4j2Vsc=; b=PhaWn62B9sQddf
	T0qU1CTIVny/q6y1gJiViSa3lt9ZCdQiAmqHJ2+NDe+kNfOuUQz/S0n8oRrXjboO+O8EPz7S59Vg7
	Ht3OPq8d+qUjxmXmDNqtteT3uvskhWtc3S/WD5UHkivU08+cKM2VCdpaodPWPhRi+h0CCGnZkGk9A
	xffo78l1qeGnI1nQ78RbLGg71vlAL5XUpkW4hFjSB3JzIZR7sT0ycdo3XPqxXBLzdz4W0nZe0GGqI
	C5Pz5twuPP5j1LIhhn09q7e1RTBWh8ugccdiqI6SExnSpULSaec6nUjlUhQWvqV7P4TR4P5ilSnyn
	UWxkt0k3oVOdWuWtX5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTIRc-00AP0L-SW; Thu, 23 Sep 2021 06:42:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTIRZ-00AOzV-9E
 for linux-mtd@lists.infradead.org; Thu, 23 Sep 2021 06:42:54 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6C5851F4121C;
 Thu, 23 Sep 2021 07:42:49 +0100 (BST)
Date: Thu, 23 Sep 2021 08:42:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: CGEL <cgel.zte@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, Daniel
 Palmer <daniel@0x0f.com>, Alexander Lobakin <alobakin@pm.me>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Ren Xiaohui
 <ren.xiaohui@zte.com.cn>
Subject: Re: [PATCH] mtd: spinand: add merge-two-spinand function
Message-ID: <20210923084244.54a6a899@collabora.com>
In-Reply-To: <20210923015241.248910-1-ren.xiaohui@zte.com.cn>
References: <20210923015241.248910-1-ren.xiaohui@zte.com.cn>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_234253_505451_557DA77B 
X-CRM114-Status: UNSURE (   9.87  )
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

On Thu, 23 Sep 2021 01:52:41 +0000
CGEL <cgel.zte@gmail.com> wrote:

> From: Ren Xiaohui <ren.xiaohui@zte.com.cn>
> 
> Combine the two SPI NAND flash in the MTD layer

Just had a quick look, but it looks like you're re-implementing
mtdconcat. Maybe you should just extend mtdconcat to cover your use
cases.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
