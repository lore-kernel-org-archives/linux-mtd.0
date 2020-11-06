Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BA07C55178
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:46:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE7C20724
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 14:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="onS0pEeX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEE7C20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HKs2qOKBnYfEpV5qCPrK3N0RoashbwEGcHYyQ51rUjc=; b=onS0pEeXa1xbs3VU4GAga/Ndd
	vloNXnG0DLO3B++iCLwLfQ86TjMx3qWyjp1mfRxMlFCkMKld2mPH1rOC0HlxrS8LHVm3Xo4yjKyKZ
	tgt5oE5yN9VKNIkGrrYJKmP9/tbCX9zC5DBfe+WsMe2liwYp0lZUFc9/7jkN9lAKfGCl2oUzrMp3g
	aDKxZAO77iqyKsylx4k2j0K29NL4n2tX33wqt6HGA8FvT8RUZMroZ4oADChATx8QPtIL67p8ndadg
	1ORaRIyvB3c/RwruQEV/H9W5s/1PvuVlRGynLWU9kZxwqX4JLbrn53gJpz+fkSp2oIcN7fzWlXX7l
	/2tymuAgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb2z8-0007Jc-IY; Fri, 06 Nov 2020 14:45:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb2z6-0007Ij-GG
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 14:45:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 395521F46A74;
 Fri,  6 Nov 2020 14:44:58 +0000 (GMT)
Date: Fri, 6 Nov 2020 15:44:54 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
Subject: Re: [PATCH v6] mtd: spinand: micron: add support for MT29F2G01AAAED
Message-ID: <20201106154454.20ca277c@collabora.com>
In-Reply-To: <20201106142838.7772-1-nthirumalesha7@gmail.com>
References: <20201106142838.7772-1-nthirumalesha7@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_094500_636351_790D5564 
X-CRM114-Status: GOOD (  16.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Chuanhong Guo <gch981213@gmail.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri,  6 Nov 2020 22:28:38 +0800
Thirumalesha Narasimhappa <nthirumalesha7@gmail.com> wrote:

> The MT29F2G01AAAED is a single die, 2Gb Micron SPI NAND Flash with 4-bit
> ECC
> 
> Signed-off-by: Thirumalesha Narasimhappa <nthirumalesha7@gmail.com>
> ---
> 
> v6: Reverted the SPINAND_OP_VARIANTS() as they were in v4 for
> MT29F2G01AAAED device
> 
> v5: As per the review comments, the changes were reverted to the v2,
> except the MT29F2G01AAAED device related (including the review comments)
> 
> v4: Split patch into two parts,
>     1. Generalise the oob structure name & function names as show in v3
>     2. Add support for MT29F2G01AAAED device
>        a. Add oob section check in micron_ooblayout_free function
>        b. Rename mt29f2g01aaaed_* to generic name micron_4_*
> 
> v3: As per the review comments,
>      1. Renamed read_cache_variants as quadio_read_cache_variants,
> write_cache_variants as
>       x4_write_cache_variants/x1_write_cache_variants,
> update_cache_variants as
>       x4_update_cache_variants/x1_update_cache_variants,
> read_cache_variants as x4_read_cache_variants

We want those renames in a separate patch (ideally happening before
this one).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
