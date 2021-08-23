Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA1DC4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:12:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FE6561184
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FE6561184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CWB/6FlfPOOLmQvYgK13Ru4Q3wNG2eIOp0zbrb/RSFs=; b=lm57CbNylQE/BT
	7URcmJ1JBvhxHmIUdXayETBRsfqfdDzuXFXJnEq09Nkz0nqGSsq8DtxhOr/YEubwsZRix9I44ASPz
	s0L+7fIilSP2Yrn78gVFPsHz230IMF2GCEY5ilOZelEIBwci78JchmbN60qiGphHjrCOs75CkWv5+
	b3+PGr+3gihA2eo/lEL4cCR4vKn6ifbTjX0UBfZWQbUOkNyOsW2ubW16jI4XU4Ty/UesAOIV3GUPq
	7nkpz4LxKdZyjjf25DOQMbU/ieAgJ5xGDxwenQ+mROT95uvVpgindq0HiO4pp5FpmrPcKom0DtbJf
	vNXFEHXYquvJZdPvVkZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI47g-00Fgoe-Gg; Mon, 23 Aug 2021 07:11:56 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI47d-00Fgls-Do
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 07:11:55 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5B6C51F422A0;
 Mon, 23 Aug 2021 08:11:48 +0100 (BST)
Date: Mon, 23 Aug 2021 09:11:45 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Apurva Nandan <a-nandan@ti.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 03/13] mtd: spinand: Setup spi_mem_op for the SPI IO
 protocol using reg_proto
Message-ID: <20210823091145.0fd471ef@collabora.com>
In-Reply-To: <20210820140840.4bbcac7e@xps13>
References: <20210713130538.646-1-a-nandan@ti.com>
 <20210713130538.646-4-a-nandan@ti.com>
 <20210806203013.30a41fd5@xps13>
 <3de32033-2a6e-bc46-a65a-4027ce78c6d6@ti.com>
 <20210820140840.4bbcac7e@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_001153_661395_3F867F11 
X-CRM114-Status: GOOD (  10.11  )
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

On Fri, 20 Aug 2021 14:08:40 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Apurva,
> 
> Boris, you might have a good idea for the naming discussed below?

{patch,adjust,tweak}_op() all sound good to me. This being said, I'm
a bit concerned about doing this op tweaking in the hot-path.
Looks like something that should be done at probe or when switching to
8D mode, and kept around. The alternative would be to have per-mode op
tables, which I think would be clearer.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
