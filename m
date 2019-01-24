Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2A4C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:55:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E64AF218AD
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 11:55:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sRblecwB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmDz6Ise"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E64AF218AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=gjD+j8vPsrrEQXwRTuMynbMEsNfc14qI6+XMVKXbmwg=; b=sRblecwBcFG/Rr
	HvjGxItcxif2a/VQexZ502iYeDmsVZkbcpmmFIWF3Czvi1E4pMYb1/wjO+Om0FrcehbtNi8WTQvqg
	H+sA7pEZLdYOzSRDHPnNqwElkJKatQBd8SriLNwlrwGYD69HqeBcB0o4qo9jGDVOMOg2Cl1jZnIQN
	gtrT5ckpW7A2o6mzf4velVcj9y4vcL2wtyAOXqAEPdsPKOlRsLSmlBk27fjreQtPgKtDc7H3yZB34
	B/f+/+VfBrRAT1rBUPKYKNqMj0NhRT68tJ/X7tqg7nY4s2pvgqiStkkbgT9h/mQt28BADCzy9yJ6n
	gRgc8Xuam0hGKO5qskMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmdbf-0003ST-Tc; Thu, 24 Jan 2019 11:55:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmdbc-0003S7-IR
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 11:55:37 +0000
Received: from localhost.localdomain (91-160-177-164.subs.proxad.net
 [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED78121872;
 Thu, 24 Jan 2019 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548330935;
 bh=PN9izKmF5bt6IW2zGGwdTH+lJzRJ+8D5ZXFA1K1wiJc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=dmDz6IseLWRp4guTR1k3coDHlmkNuI3oJVJQ8NPgDA6p/FGSYK37W0WZiVlH0Wl8L
 IV2qBGywXMSjK4Ji053UVgixN4Y/gkwPWt7bbTQcDOKqRRnSZLGaORWWxIQpciIGL6
 8azwh5aSeqafH6WSK0OGjVAJKd0irgMKCnG0xRg8=
From: Boris Brezillon <bbrezillon@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [2/2] mtd: spi-nor: refine Spansion S25FL512S ID
Date: Thu, 24 Jan 2019 12:55:29 +0100
Message-Id: <20190124115529.23456-1-bbrezillon@kernel.org>
X-Mailer: git-send-email 2.17.1
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: a2126b0a010905e57ec8c855c58596098a3839ab
In-Reply-To: <09a2508e-f63e-4804-bf11-76832faae1f5@cogentembedded.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_035536_629910_CB24C88D 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2019-01-16 at 17:53:25 UTC, Sergei Shtylyov wrote:
> Spansion S25FL512S ID is erroneously using 5-byte JEDEC ID, while the chip
> family ID is stored in the 6th byte. Due to using only 5-byte ID, it's also
> covering S25FS512S and now that we have added 6-byte ID for that chip, we
> can convert S25FL512S to using a proper 6-byte ID as well...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Applied to http://git.infradead.org/linux-mtd.git spi-nor/next, thanks.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
