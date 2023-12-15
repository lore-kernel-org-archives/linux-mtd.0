Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7450C41535
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Dec 2023 10:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hra7s2C6vjcVVgKtiFDoIraw6NU+clpvsmzUTAO9Y6w=; b=FvSrp27hx/+FQt
	tQbkgiljfhbz2FGGKzo4MUkwQs2zp2GgegT1F+PJzx8y3gWCHeJPI085qTyJl5tXpwTkSYh4LN6uY
	lMn275PCVOQqnvAy45UB4QZlPy/Q/dO1bxLOfT+7+aFqnq3Zu9y4tnRG2ultfWvisNqUYPi/f/JD+
	J+MLKdI/EOinv+YqnBZjb2cFSGRifDm9CH6X2zTYDbds7sG53ttyStNH5EJrBoGHvw7DLRfs6lWu+
	pSYnotmN36xOHF+QfHw0fWTT269lhNLZEFFLeGxTy1aiDejBJvtYUnnCjbGyvp3lEhQ7Ot8oZ3ZhS
	zMtDP7i6YWilvQDXQ0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5ud-002qHV-37;
	Fri, 15 Dec 2023 10:59:23 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5ub-002qFl-04
	for linux-mtd@lists.infradead.org;
	Fri, 15 Dec 2023 10:59:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6908D240003;
	Fri, 15 Dec 2023 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702637957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A8qtfB12y+BeC7a00boq7oM6tyk44zmBIpG8B8Z9lcg=;
	b=kPsg7CVAb2Q0DGiyKr7KZ1X5RvOk72SNcxZN6OIxuFygn/HGlDV7aDNIkKykzAwKXDTmhZ
	vRZwX8oGjo+/IV3stGRHDYvtJzpRPZdUbC15bknYGHaDI/Amq0W9UVm8wyrRu2T7MP2qU2
	Y8Gy4yMzZKoidog827Nd4aBFUQ4/IzM+IeVkSBHauQ87QlIhmmH2wKdWQI+N0X122kfdVt
	GYQuJQ4CubWn+/SwQuKZR+2u3ahyFvpfuEqkxBmrs8+Odf0EnN+0ubtHRWV7z8LLq8iyBB
	DcYheDr8uBh1li+aUw2y4Y/sTjMKdio00GSxDjlh4i4gjkKXkLcxhGayjenv3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: diskonchip: fix a potential double free in doc_probe
Date: Fri, 15 Dec 2023 11:59:14 +0100
Message-Id: <20231215105914.499203-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231214072946.10285-1-dinghao.liu@zju.edu.cn>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2b8aa4c3e6a5d41b10b53da2017852f647d0345b'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_025921_200107_6BA9D361 
X-CRM114-Status: UNSURE (   6.98  )
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

On Thu, 2023-12-14 at 07:29:43 UTC, Dinghao Liu wrote:
> When nand_scan() fails, it has cleaned up related resources
> in its error paths. Therefore, the following nand_cleanup()
> may lead to a double-free. One possible trace is:
> 
> doc_probe
>   |-> nand_scan
>   |     |-> nand_scan_with_ids
>   |           |-> nand_scan_tail
>   |                 |-> kfree(chip->data_buf) [First free]
>   |
>   |-> nand_cleanup
>         |-> kfree(chip->data_buf) [Double free here]
> 
> Fix this by removing nand_cleanup() on failure of
> nand_scan().
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
