Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FA2CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 10:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Df7UQSe6l/VmS+BmWrRaBd0Mf/gKCen2WlCQhu9p4E=; b=PbObYGz1HLdBUR
	xgIOCbyyojuzoE5zIaQKObGNomNVgB8rVEWMpfEZWWUxrbVTxzaRsRlO3WO+S9pYehzz3tEpTH8r4
	RLNWsHw0/cGZlRXhOqUfdcIA7Bcl93SfbVL7ky/Re2UCyDP15cjJ4z6tp8oI9mZJeag71Ly8ie/DM
	aNeL+A62P4iR/pbHSfb8FKKeSrwzBsF3CfULaTMYMG+1fnw4JURCMIdDetApSk1JxTvgN+l5ouXok
	2K1REzhf9lSw9lTmwpBl/cMLz1kXaQwln1SIb6jmoBSOTMozsa/9DyGZy5fyVzJVVWBvDhQl3mpu4
	IPiex5WFe5b816LTX6bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIJS-0000000HNX6-352K;
	Thu, 15 Oct 2026 10:03:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIJQ-0000000HNVv-2OyG
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 10:03:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C109D4E41247;
	Thu, 15 Oct 2026 10:03:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 94E5860360;
	Thu, 15 Oct 2026 10:03:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F1A810328B70;
	Thu, 15 Oct 2026 12:03:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792058619; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=D3CxsJn/Jj2PPvSS3mvcrxcs87Wgh0gGexSX9GetVaQ=;
	b=VVyaTMfGkquhuGj/vK2qMZKH3dkfe/WybRVoW4OQSav3TELqERgffvIAZRqilEREBLneAB
	FDkwZ+J2yp1LJcwXzifafmu/hi6ihUP8wS0C4Oyvj1lMzLk7mSR92scymTzM4LDGJtjsUT
	R8X2AqU2GTtgkJiXyUK0P1MeAAk5459W7TJSKCuyGNNGsaQX4uU60Fc8O5B6Q/FSxRx0vh
	ZTGuOfEUn/zBA7xJEnr3gJ7SdzIzez368cwGx9qezReCZiHnUhU1+66s0tvxazROvdJOlp
	FSY5EaRU5Ey7WoP2bYIJAGyWsdn0MSGXOvIYOy8zYSuW6x8rQygGIe+4OSdIug==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <mwalle@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mtd: spi-nor: sfdp: fix missing kernel-doc
In-Reply-To: <20261015084219.887963-1-mwalle@kernel.org> (Michael Walle's
	message of "Thu, 15 Oct 2026 10:42:14 +0200")
References: <20261015084219.887963-1-mwalle@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 15 Oct 2026 12:03:36 +0200
Message-ID: <87bj8vwa9z.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_030348_752338_D0565431 
X-CRM114-Status: UNSURE (   6.15  )
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

On 15/10/2026 at 10:42:14 +02, Michael Walle <mwalle@kernel.org> wrote:

> Commit 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into
> sfdp") added the kernel-doc but missed one description for bfpt. Fix it.
>
> While at it, also add documentation for the return value.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610040802.yD5XKM5i-lkp@intel.com/
> Fixes: 69d9d7dabbeb ("mtd: spi-nor: move spi_nor_post_bfpt_fixups() into sfdp")
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
