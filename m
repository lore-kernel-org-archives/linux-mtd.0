Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867FBC5CFCF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Aug 2026 08:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jroelZk4BgYPI6yfGx0oidFsbI94rLDj3Ax605aTaI=; b=Qr1WaKkWLtxaWc
	de8uqvvUv5KwTUKrVnS9pxMlju5Dq/Jrm3XnByqL/HLyptpg/Xwuu1Ec4rVEkSXB3OsCRMzu0/odN
	72Rp+Rak5VkrhayZfhfpmL+T69988lL8U/JBGt/QXlD6+duqI298e9g7LgQbsJKMyMlsMtDzWtXC8
	bcGvOX01aKMnfPMusMW36T1t88sW+T5fiwO/Tb+bQOWm6lAkMvFpW9Y0H1MhJf54DdBH5KPao0HhV
	dhcA1y6tAmMHBBZH3DV5HtgI2bIGQcHi613O78WMRZOPirvjIMADzOy/0W3/8cUBX6rYC0Z0vQgiN
	8UtDQEvoH/5KQhc+nC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wti3B-0000000De2P-1vbT;
	Tue, 11 Aug 2026 08:41:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wti37-0000000De1M-0Tqd
	for linux-mtd@lists.infradead.org;
	Tue, 11 Aug 2026 08:41:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7D4EC1A1566;
	Tue, 11 Aug 2026 08:41:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 50ABF6033C;
	Tue, 11 Aug 2026 08:41:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 491A911C4BC20;
	Tue, 11 Aug 2026 10:41:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786437679; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=K8CQXiaoy6hLSyxUxpOtM0c7wWb31hYP1OPqlVQpamc=;
	b=XMQ2e7Hg8w9fjjP5cPcO8OW5pB2Fa3m32YWueklimYSxQkKLr5+d7+dXolHRzb1X1qAlO6
	oSi7drTvzBzwFqA9ps7BEpkFw49sB0HIIhgncUdhNg0SLITlJ26kyqH33r9hm8e9pIta3M
	apm7XdR4Plp/7rCxvpYLNxZpkyN7k9RMAWV30V0e2iIK/DHfaLSMHT8FazbUw5YDD7+q2X
	KqFPlC20Y6VSWGILZmQyJrQpAnGrPOmIfUkydgiJXxn8ipDBdNMcg2PLhxesAL2RQ9a8Eu
	GoDc62gCuY1yJEGuIuI4eKkqpeD+aZ7dda9BEqFUwKdC3SYNKJ5cHaHLyoptjw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  jianhao.xu@seu.edu.cn
Subject: Re: [PATCH v3] mtd: spi-nor: use guard() in
 spi_nor_rww_start_exclusive
In-Reply-To: <20260811083111.403453-1-runyu.xiao@seu.edu.cn> (Runyu Xiao's
	message of "Tue, 11 Aug 2026 16:31:11 +0800")
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
	<20260811083111.403453-1-runyu.xiao@seu.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 11 Aug 2026 10:41:15 +0200
Message-ID: <877blxoxqs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_014129_294036_0EE2B22F 
X-CRM114-Status: UNSURE (   6.70  )
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

On 11/08/2026 at 16:31:11 +08, Runyu Xiao <runyu.xiao@seu.edu.cn> wrote:

> Commit 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup
> helpers") converted the RWW start helpers to scoped mutex cleanup, but
> left spi_nor_rww_start_exclusive() using a plain mutex_lock().
>
> spi_nor_rww_start_exclusive() is used as a wait_event_killable()
> condition. When it returns false on the busy path, the raw mutex_lock()
> leaves nor->lock held and blocks the operation that must clear the RWW
> state in spi_nor_rww_end_exclusive().
>
> Use guard(mutex) here as well so this helper matches the other RWW
> start helpers and releases nor->lock on the false return path.
>
> Fixes: 03e7bb864d9a ("mtd: spi-nor: use scope-based mutex cleanup helpers")
> Cc: stable@vger.kernel.org
> Signed-off-by: Runyu Xiao <runyu.xiao@seu.edu.cn>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
