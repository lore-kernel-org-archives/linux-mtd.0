Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3821C56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A59122240
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TWAaUL84"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A59122240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eaIZAo09AHPM00SmwfMR709xfKRRiwDsYtl3A2E9UNA=; b=TWAaUL84tEgUZKSKV4G2cn+AV
	nR+MbCEQ5TpMGT/NShTu4CNnD6WKAogD2iCvMrmhMO8A2tZB+xix4iXqVUlTAsrMab91gF6aP9Au5
	pC9s57o3xuRRCIZBFaJsVFQpRUe32hI2AIqiGIWd+vhi+DU7GbGROqKrepQYykLobqCuoNdsqu0m2
	ZF022g011HXcavE2uB5CVpPmTYU9TM7OiW48xw/Uz2ue0OHJrkdn1lxqpuQS7ldWjhq/xxDKd9YCN
	crYYFX+GcaznK7itY3UMir64W7ATjQ6TN1F7+DLLOyhLn98pvTYnyc35TuVA1I920oOl18vR7RAdt
	zJuIuc6Hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrGD-0000RM-8e; Thu, 19 Nov 2020 21:14:33 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfrDe-0003pE-8m
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:11:56 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 481041C0005;
 Thu, 19 Nov 2020 21:11:51 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] mtd: nand: ecc-hamming: Clarify the logic around rp17
Date: Thu, 19 Nov 2020 22:11:50 +0100
Message-Id: <20201119211150.31852-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201030172333.28390-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: f2a9f63874fca71c23ba7e44d688b7144cf09f43
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_161154_474229_D056E823 
X-CRM114-Status: GOOD (  15.04  )
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
Cc: kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 2020-10-30 at 17:23:33 UTC, Miquel Raynal wrote:
> This code has been written in 2008 and is fine, but in order to keep
> robots happy, I think it's time to change a little bit this code just
> to clarify the different possible values of eccsize_mult. Indeed, this
> variable may only take the value 1 or 2 because step_size, in the case
> of the software Hamming ECC engine may only be 256 or 512. Depending
> on the value of eccsize_mult, an extra rp17 variable is set, or not
> and triggers the following warning:
> 
>      smatch warnings:
>      ecc_sw_hamming_calculate() error: uninitialized symbol 'rp17'.
> 
> As highlighted by Dan Carpenter, if the only possible values for
> eccsize_mult are 1 and 2, then the code is fine, but "it's hard to
> tell just from looking".
> 
> So instead of shifting step_size, let's use a ternary condition to
> assign to eccsize_mult the only two possible values and clarify the
> driver's logic.
> 
> Now that the situation is clarified for humans, ensure rp17 is
> initialized to 0 to keep compilers and robots silent as well.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
