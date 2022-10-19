Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3167FC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bah3pYdohNc0FqxYSZIaA93XMORNKtI536QVS0SY37s=; b=XJEikyfFnte15d
	kOHqv6naX1r2URpNsN7AphYRc23uAr8zrIoz2t1p/PyhOVf4C+W0VneK8ieU1W6wODg4DJFu9qpQR
	F7Ptog0K3/rMfPjJoZHj8c0AqtnrrjwYBQ3Y90KjsZG5Dn23hmxPZu43CUU37r2GNtLhy/K3mgBtz
	qVvd8rHWnVvFjWzsaPNRa01lpU0Zou/OE5/plg+46o+RzX3kEPpUDzpCkwcQRLL0MeQWS1w097jQ/
	Ag7ZRRDPOeT/5sp7KFb8ApobY1juFi5A9NtRG+FX316Urhv49KtC/0IqNnywSS6oF6h91l0QnVYdj
	cghCqrvwU96Hf1iGotpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBct-003k6F-F0; Wed, 19 Oct 2022 16:09:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olBSr-003b2G-Ku
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 15:58:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C0C7DB824F5;
	Wed, 19 Oct 2022 15:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F087C433D7;
	Wed, 19 Oct 2022 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666195118;
	bh=noYbcHwkG3P9El50OqsKdApzJvPH0421hm6FW1Rne7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xaCLRwMD/L7rFYep7GFlO6eXAeXXpl9AdJwjZnCxYh2B2EB8akuvX/U9FCkQ/fgvE
	 0aNwnRTu2XWxutMBOR1N056zGzx4YSJueXOGwMECujIJLqjYMlTSHl1bdv33Hx5ECy
	 ZPs9C11TJcYlH74rUg8mXNqTDd2cqgFDje9Rc4Xs=
Date: Wed, 19 Oct 2022 17:58:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andreas Oetken <ennoerlangen@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Tokunori Ikegami <ikegami.t@gmail.com>,
	Andreas Oetken <andreas.oetken@siemens-energy.com>
Subject: Re: [PATCH] mtd: cfi: add fixups to support MT28FW02GBBA1HPC
Message-ID: <Y1Aeq5Jzj7+RdCSd@kroah.com>
References: <20221019154924.15088-1-ennoerlangen@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221019154924.15088-1-ennoerlangen@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_085841_884176_1AFB4493 
X-CRM114-Status: GOOD (  11.09  )
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

On Wed, Oct 19, 2022 at 05:49:24PM +0200, Andreas Oetken wrote:
> Apply existing fixups to MT28FW02GBBA1HPC from:
> Commit 0a8e98305f63deaf0a799d5cf5532cc83af035d1 ("mtd: cfi_cmdset_0002:
> Use chip_ready() for write on S29GL064N")
> Commit 0fe3ede7941dfcd6fd540fc2b086453d3ee8f236 ("mtd: cfi: Add early
> fixup for S70GL02GS")

That's not the proper way to reference commits in changelog texts.  No
need to use the full sha1.  See the documentation for more details.

Also, this text means nothing.  Please spell out what you are doing and
why you are doing it.  as-is it doesn't really make any sense.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
