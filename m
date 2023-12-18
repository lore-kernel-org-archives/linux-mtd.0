Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26E6C35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 12:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19zCoymuzvJuZSDsA1EBGCy6vIgIJ3XU+mIEuED+C/U=; b=v8JT4anxIeNrJNmo/erGYABF0j
	nqdIsELpQo36+wEAcFobbASzT7HpLsCU4s7VYlQ9N9pC9fqoQLNQGmDL8PBj27J5QNbMPgFrv8u84
	/0TkAqFVJaj5rBx0BBFhZXM8jxDEkZivj849rY+3TeMF2O1RVR8PbOjKPqQD4/GF7oVW8FI3pQIGQ
	UaZjoxnujhNmSKCQRgAM+PsJjfVXCreqQ4Tny5sNoQA0j5zgabb10Fh81XI7l7oVIAiO9BbpI1iDw
	KE2+dxrUgdxQcq6go961P4T9IbxrIz9dXanNjO1OStMlxag7VAsp6ymsR94MW3GDz0VN+DkanIurl
	c9DDDuuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCWP-00Aa92-1T;
	Mon, 18 Dec 2023 12:14:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCWM-00Aa6r-2K
	for linux-mtd@lists.infradead.org;
	Mon, 18 Dec 2023 12:14:56 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CDB6D5D4;
	Mon, 18 Dec 2023 13:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702901692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3syL4boPsKSxtc4draQO3ijO1mk9nC2sQSx08Ey95Y=;
	b=L9xiH1EjkgX7nLQ3y36aVW9YKxib4KCy0Kp2DuUD6jSD8FjuMCJ9s9MPFn0zCGV1+jKguM
	QlF4Vldvuqq7eS/GtxDHvOQ8SKxdv0uRZP971dTtu/IQDyLeSDKbdw/5Vu/de9WylfROgk
	8SWMekbP4/tXESsgGcPvgHBIBv8rDGa9alXpEa4YX5vQWD9+ys9YriHstD7ruxEvX0Risn
	kM8U4EtrpP/k3EfepFWUjspvNLMsu4P3Uxwq4eyA5YCR0rsE0WAJKH5Pm/DV+fR458OPb0
	8GBYogYNq7sOXFYlnIYNbowe5X80FDsZniAg2vvHKHwC2WrKR5WW6gAw7oUONA==
MIME-Version: 1.0
Date: Mon, 18 Dec 2023 13:14:52 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: spi-nor: drop superfluous debug prints
In-Reply-To: <20231215082138.16063-5-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
 <20231215082138.16063-5-tudor.ambarus@linaro.org>
Message-ID: <7d80cc0afe33ee9a9f660b6876b69e81@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_041454_941274_9FB9F61E 
X-CRM114-Status: UNSURE (   7.24  )
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

Am 2023-12-15 09:21, schrieb Tudor Ambarus:
> The mtd data hall be obtained with the mtd ioctls or with new debugs

shall, debugfs

> entries if one cares. Drop the debug prints.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

With the above and the unused variables fixed:

Reviewed-by: Michael Walle <michael@walle.cc>

Miquel raised a valid point that if the rootfs is on this very
flash and if there is an error, you cannot use debugfs or the
ioctls. But I doubt that the info about the erase regions will
help much in that case.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
