Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9EBCD11C2
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2024 10:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kOSOOIeptXbTJ/Z0LEkNrCGjFsK3d4Yk5qE8AdnNy7w=; b=PN7OhAyRUFPe5c
	6WedEB2Q2IJq5KBR4CNwig4ws4ej8RR3f24rauCC9lrGPQH8GZQoWZFoEA1zscNOiucDxW77QmJnF
	6jUSQhY+3O3sTQnbu2NdbeYqM+o0gKBajdBwlC/jTzy1Imj7ycfDyDBI5dRx2WFIVUAjKRpusib9W
	cXU3nO+6ImgyZTInrKMwwgi05POlQVC/dnnNcRVU0QGqt81Lw0Gm69nW8EyCnjTwYGN67YwgKeGOM
	LcOcZa7ZsQI8KkPM1QCXN8aUrV/eN/XvbsYe7FJpd2cMfmoUoh3W6NuZFwTOhy1GZG2P7Akl4IlmQ
	MCxWg49OPWoKcY/MBeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsgO7-00000006Jqz-1K2a;
	Fri, 05 Apr 2024 10:01:35 +0000
Received: from e3i57.smtp2go.com ([158.120.84.57])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsgO4-00000006Jn9-2P05
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 10:01:34 +0000
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rsgNn-rloBs0-2Z
	for linux-mtd@lists.infradead.org;
	Fri, 05 Apr 2024 10:01:16 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 5 Apr 2024 12:01:10 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 0/1] mtd: spi-nor: everspin: add em004lxb entry
Date: Fri,  5 Apr 2024 12:01:03 +0200
Message-Id: <20240405100104.480779-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-OriginalArrivalTime: 05 Apr 2024 10:01:10.0750 (UTC) FILETIME=[2F9FA7E0:01DA8740]
X-smtpcorp-track: 1rsgNnr_oUs02Z.DxvqHifFu2J4R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712311277; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=BEE1Q44IuerTAix98C68lkBVz054z7wXlAMnf+3bW8g=;
 b=SKgULN75awU1oqgL4gdp1ysA1ErTKmEqXNC0/4pDJBAV5ANSB+Sa6KXbKDWrejaYLVC+E
 wzZ0Kp6zckJq74udy+qfNgxn99CofjwWSutFvywGT9bPVyBrxNRXv3FKFocxx3XW5Nx97tP
 iZ24m0FBNsthpb5RBCMh1TopvVi8H/bWCI7Tv9A/qXC/QdaGh00A666bM4kofetIznnlFZl
 WwxAu10xtnyVofInP8XQdBAbesYQ0g99IyOtryE/SwDRCjti6UyHmOK86Pwjj6/dJkALP9h
 cc4f5FnUtU7w9/Qp0isk38CS8I/hlNSTyy49u/M8/bIMO/brZ1Dp4jNpmIhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712311277; h=from : subject : to
 : message-id : date; bh=BEE1Q44IuerTAix98C68lkBVz054z7wXlAMnf+3bW8g=;
 b=QTt1Hj3FvN8QSpVh3QEjFUZZStG1EzkfKgpY6pzh1xVno3l7YXRaqf+oTErZgGhAOnt0r
 KH92kSXdr9qUYtCOGELXQ8ETPeouJ82j0MCrvMc/GDYH71IFb+tG9SfQCKnhmiQ8fAy2HNA
 /cgsqNb+IhcYiitJutWKYHKqVWHyeoAduPkFBwI2FX3+YIa+udCl/zL5Y/j3Z+dv/B6KO/5
 GUUBV22YbDhmI3jB1ZwMaQCJTHo51ED/zXpanqxX6s1n+2Gpfh6LiRhqVibTVhl9e7G2gde
 kpnVMN/HXsUauYqwKsyjgoydfNidROmJTi1nFfn/sSdIwVI5KzuvAcOvDZsA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_030132_775273_E2F7182B 
X-CRM114-Status: UNSURE (   7.52  )
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

Add the Everspin EM0004LXB 4Mb (512KB) Industrial STT-MRAM Persistent
Memory.
This device is JEDEC compatible (JESD251 and JESD251-1), but it is not able
to provide SFDP information.

Link: https://www.everspin.com/file/158244/download

I currently use this MRAM on one of our i.MX8MP boards.

Flavio Suligoi (1):
  mtd: spi-nor: everspin: add em004lxb entry

 drivers/mtd/spi-nor/everspin.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
