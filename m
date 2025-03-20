Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45421C28B30
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Mar 2025 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R8Z/jGPbRasb9Wi4o8AaktPewx8N8p2+YK9FUfkvo8=; b=GUyCy0BiqfQgeD
	Diy00qhCL5Er5JicM4vJvtpkz8ECDIXGC+oAS8DcJFiUrbTczdqSMk/4IKiZH/3p+ROOSIzCJNduZ
	JQWM08hL7JJNOIRYPxJmZVtFYFiYzduyETUm1B2XPXE0/A1+onxGrTseUzxj8dCILYuuB95fJDz4Y
	Wh7E0T98rcU6FwB67SUeRFcKSeMcqUQMo3GBn8Bb827uGBCqjE88CbSFSLWCtMKmgYs5gi9jr5HjX
	7PlLg9dl0biFjlOHZ8fNAc0GAdVUbF5Rbrm1UE1nk31Tr6a+SL7CRZTrebDQ8oZ1lylzqjzeg3rKy
	DgNrpFPK8Toor8ekPuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHXQ-0000000CVDW-2FSc;
	Thu, 20 Mar 2025 15:10:28 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHXO-0000000CVCr-1jI7
	for linux-mtd@lists.infradead.org;
	Thu, 20 Mar 2025 15:10:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95BDD1484E06;
	Thu, 20 Mar 2025 16:10:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1742483421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbBt8LqXCurgxY2vjrCN0Yd0RXecmPkAzvq6cM3/PXM=;
	b=AVvw0FmXXXQC8deZ9FjV+1djreDyY9mSlpv28iafAWeqEy+4EE0IME9Xwtz3EEEluuCRW2
	w0vzSB4bG8M0vAAjAowMB4hY0JsZn3CqsvmgKSczYjUvD8BvsEOeaUGT0eedkxpcx0gnwd
	JRGwJiRknl2ctcpKZ4DbcC+WzsenLlGgmf2mhk53LgVl++9ZpZuTIykArreUraBJX/+qnI
	IlKOaFS70CjfurCZNhCcM31l+f5JVGEGtihq+AEI5VgA0iqxjPFubYT1XpdwVPUqyKKs1A
	b53eSMx2dgNLtYFiE8FUOUjJvA8nMmmbZ+95yvksirPGgeQ8rduZ+h5ixdYODQ==
Date: Thu, 20 Mar 2025 16:10:13 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2] spi: spi-mem: Introduce a default ->exec_op() debug
 log
Message-ID: <20250320-cactus-laborious-64dfd1998b72@thorsis.com>
Mail-Followup-To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250320115644.2231240-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250320115644.2231240-1-miquel.raynal@bootlin.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_081026_940457_D2CF4E8E 
X-CRM114-Status: UNSURE (   8.55  )
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

Hello Miquel,

Am Thu, Mar 20, 2025 at 12:56:44PM +0100 schrieb Miquel Raynal:
> Many spi-mem controller drivers have a very similar debug log at the
> beginning of their ->exec_op() callback implementation. This debug log is
> effectively useful, so let's create one that is complete and concise
> enough, so developers no longer need to write their own. The verbosity
> being high, VERBOSE_DEBUG will be required in this case.
> 
> Remove the debug log from individual drivers and propose a common one.

Like it.  Especially because it allows this kind of log together with
drivers which did not have such logging yet (like atmel-quadspi).

Tested-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
