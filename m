Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1647C38142
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 13:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTC/68avI+PLnQQ7kF0/EY43Loj9Mtfmq9fDXPsmFb0=; b=I95w9anWfH/8kt9fR4QdC/18Mw
	VJmvwxqVJpbr9IA2FFHZc4DKBxhtA/s9MBQvsyWCFJgDbo/FjHFx3dY5As5c2oM9Siif8WjXXcve8
	CBQJ7EDf1WqvUy62SCv4pIG6RykOUan5epfqvNAxctzdzY4zTy5tIIJm4JegmsQ4deA019vTXn0e2
	dHe4IN1ZLr+yBAM3ni8qAHpus46HHofCzWl8qCxjVVod7rUN3pTuhqSxfniDa4s/yXfuWBv5W+z8z
	U6E9MqjTuG6GWEz0302nKALBZGoZP1rzRe5kYpFyZ4HJjw3S4AGx9dS8HzDIvbb1UI4ni8mVMmTBo
	oTjfJrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqRn-0081VC-V4; Tue, 31 Jan 2023 13:13:16 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqRc-0081OI-Kb
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 13:13:06 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6D5561235;
	Tue, 31 Jan 2023 14:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675170767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U+vWxWqrgtW9QgsIEF5MSK7eCkHJpE7dEHHoU1sRWFk=;
	b=lNGnKhmDNZa4l0p0apy0dSBUUt/XGcXO9K5x2Zuk/FHoY59+B/6rFFZ3IpmMtV5Ua0fZ/I
	gxcgD9OFgazojjAzE4wXLdpeaCF6c/sRkTl3lmi2y1VEe+FUUZrdC7H4WvXYJ75pXg6azh
	GgJBYbDc/Q3BS8jJjbEzQGQLtPYXGwABHs8W2BJrP6MvnxgEd9RcYOp5Po1l6lxd2VmDx9
	Ahc9+hKwszw4DVW+kYywiO3nFWWzQ0Bxe44iGN/aDCvSRyNHtsGE50JTCc5RsWL/2TwVQk
	hZSs3x8EsaOGcxB7E4z9dPc+jLI42fizaW86qZwSVIHmScRREK+cxOfj+Rqn4g==
MIME-Version: 1.0
Date: Tue, 31 Jan 2023 14:12:47 +0100
From: Michael Walle <michael@walle.cc>
To: Heyi Guo <guoheyi@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] drivers/spi-nor: add support for Winbond w25q01jv
In-Reply-To: <a5920ee3-7168-7415-f975-fcdbdde069d5@linux.alibaba.com>
References: <20230128033957.125853-1-guoheyi@linux.alibaba.com>
 <c7c3c4cf5dd477953e366053859df08f@walle.cc>
 <a5920ee3-7168-7415-f975-fcdbdde069d5@linux.alibaba.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <65255f429ad88bf78b34b17e99bc5624@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_051304_902065_979D631D 
X-CRM114-Status: UNSURE (   6.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

> Is v6.2-rc3 OK for the test? If so, surely I can do that.

Yes, that should already contain the generic driver.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
