Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FA0C54E64
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2024 16:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUmpklPFCiUQvux9hfS1s0UgNaVCQE1iBz3RKjMl60k=; b=wKvo1WdJ7Bt5Z8
	Y42IaC2O9NQ2nuyVBjkAqFuU8AwtX60Fpew+ks1VfCN4kB2NszKgdT5NpkflrOp0IgWMyG5+YBdax
	IeqcxfyzIhbRFYRx0hdlVYmEA/9CFNA40ZxLIpu5R0Gvo03BlFUGMLdbrVeUBStU+7+iuqVoSKFfB
	XNCil6EK+X9pUu2kY7kXVcJsgCAFOPbVj4A8ewuqm+EPhgwZvJHwYp7b+MwMFczgoegWPO93trV+D
	O4TXhbaWidGDzpjVomKxWy9+58Emeo39sNGrYDjWNbLwhAAp2woCRdPs2zNUC9bgo2nWbKBY321rU
	swrA1ja94w9UeSj0qx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ron69-00000000jlC-2Omy;
	Mon, 25 Mar 2024 16:22:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ron66-00000000jjK-3kOm
	for linux-mtd@lists.infradead.org;
	Mon, 25 Mar 2024 16:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A2623CE1B40;
	Mon, 25 Mar 2024 16:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF74C433C7;
	Mon, 25 Mar 2024 16:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711383771;
	bh=Nn9yAwz6gZxbSteIuZaZE+uSVwVjPtH/MxPFZVa4f9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C7DFIqc5w8NfWpQ2Ap2KqM/NT2tZzuBGjXDsQn6kD8Kgbgf7H2NlfKQU9LXc3Xa7U
	 mZekM1MMiHAQAukef1X+/QF/Jy9fUL7IJVZ3bgqb57DeJG25Mk5Z1r5SPaq5rJSdOM
	 xubrm4VbOThj1RTcy7Zjt8w0fmRJQQ+Cxp3rg+8U30FBYF29rfLA5jA1NhBMFYTB9J
	 QIrMqiZJhDCk2YRlTMTSArlhBT6/FSbJfZK89y+NkgI2qC3Wf5MG+NHSyzsWGfYt/B
	 B3LEiODRYOfRSVr2Du4toLr6eMb31bJG0/+Fv70sz3rwFl1ayanIlfBoSamJ+Q7d17
	 x+lV63Q73tzOw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v1 1/1] mtd: core: Align comment with an action in
 mtd_otp_nvmem_add()
In-Reply-To: <20240325151150.3368658-1-andriy.shevchenko@linux.intel.com>
	(Andy Shevchenko's message of "Mon, 25 Mar 2024 17:11:50 +0200")
References: <20240325151150.3368658-1-andriy.shevchenko@linux.intel.com>
Date: Mon, 25 Mar 2024 17:22:49 +0100
Message-ID: <mafs0ttku1dt2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_092255_140563_971EFBCF 
X-CRM114-Status: UNSURE (   7.55  )
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

On Mon, Mar 25 2024, Andy Shevchenko wrote:

> The comment is related to the non-error case, make it more clear
> by inverting the condition. It also makes code neater at the end.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
