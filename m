Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70CACD5BD2
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eP7osXsYpIb/ggkIJvAPmNDHFM/pw64DBK9822qriWs=; b=iLvStneAnkmQ73
	Ta4sYtUOccnQj3B6lmLPZhlO2ZZCa0ivl5GQNMoX0Ro2gmbQ4f0630aaSxL9ifY1T1hNX71Bibdnt
	kOrgkupgrPipBDNLh214FIRkoGJbSlb/0KhNuk42jVQDeXIkEzDAYT8jxqfN0BQce3+XA6FP7iuJG
	ypQSJCTi8aWv/UmJmGOHvuo27TQlbk7mKfHB4jVipQ8+76GRUnOgHE0eBlilcQ0jLvbbHUQzdQVs4
	TboFYlfOr0ga/dyCnLWGuzcUURF0phsOoGGUUZPB1LN/+vMTemfXNrXjJLECPNMvwaNnx267Rugun
	bbbygq6ZaTUvNH0rJJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDj-00000002FmQ-3R8A;
	Tue, 26 May 2026 14:57:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDi-00000002Fjq-2mOE
	for linux-mtd@bombadil.infradead.org;
	Tue, 26 May 2026 14:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=380DMxOtkVf4S8j1lpaF5rnIUMKJfHDNDSHsb4bomqI=; b=rO0wgHjcNaqNXoLOTHh4XBNknm
	ckgyu+po+yQ7YKoLhLeYfpFjBYU68zBVWzf37WnsWx7zsgJ4ox9Zz+H/J73ThbFZEwGdU/KSpgv0I
	BYDaBvTSGLZHJ3IT70PJst7LQZBRzdt8pT7oq7S2soi4ZPfMrD/i5cktyo54+FuPFaHZIE1LEnNu6
	3osWspeyX7Z303j7KicTEVKtmx6kPdWLspw+GEtVm/JTVMum1HyIWqiXYwotKKpHrvHfzDTEQQ/H1
	c0uoIQb49EPSQzOjPdA3clIFQziBZQwskJW5o7nhkLDIc/2UOVt0mxH9NYroF4gggGQLh7VEpCvTx
	JOZnZf4w==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDf-0000000BamN-0HM5
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:25 +0000
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 626BEC79ABF;
	Tue, 26 May 2026 14:57:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E798A60735;
	Tue, 26 May 2026 14:56:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8FF88108888D2;
	Tue, 26 May 2026 16:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=380DMxOtkVf4S8j1lpaF5rnIUMKJfHDNDSHsb4bomqI=;
	b=jpodCC0J/HI4BxzNyH/hQ9d7usrpD7o/C4+HxMswodZ8RXVNr5dOg9AkAjqTW61X1vGfxl
	VGSbVS8x8S8oShzcV7s24frPWQ+DCRl7UZYtJPRgj4ZDdxe4zWuXmq8bvVc3+bCIgfWGSU
	GusW3iD9iPhEv8b2cf0jw6cZ5wx8CmHToWf3jtA7ZsqhNDUg66MExHkV9ZpO+VIZDcpSos
	c2vj+B6Qr2Z9/2Qqu3rGvkR67EXZqGKqeoM8tXbC/yOtnE4mpRVIMyX6JaDjkuGGraFjaO
	Xg9uGYPbHxwXd90c8djUYPi8fFlGE+uImNDT2GTIJXVgTKzRfxtw3rq2lZXAEA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:31 +0200
Subject: [PATCH v6 07/28] mtd: spi-nor: debugfs: Enhance output
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-7-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_155723_899445_0A7A31CE 
X-CRM114-Status: GOOD (  10.87  )
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

Align the number of dashes to the bigger column width (the title in this
case) to make the output more pleasant and aligned with what is done
in the "params" file output.

Reviewed-by: Michael Walle <mwalle@kernel.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 69830ad43990..d0191eb9f879 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -144,7 +144,7 @@ static int spi_nor_params_show(struct seq_file *s, void *data)
 
 	seq_puts(s, "\nsector map\n");
 	seq_puts(s, " region (in hex)   | erase mask | overlaid\n");
-	seq_puts(s, " ------------------+------------+----------\n");
+	seq_puts(s, " ------------------+------------+---------\n");
 	for (i = 0; i < erase_map->n_regions; i++) {
 		u64 start = region[i].offset;
 		u64 end = start + region[i].size - 1;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
