Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E87C4167B
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Nov 2023 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+1cbbqqtJTdiquDRAAcrxKgF7NTO6iL60KxRexjWxk=; b=pcxwN9VfcjFhUd
	YllsK+WoeoY2of4VmQQlt191TxogwK3mDiSwMQefgLlTEHgTdphy+Vfwck5yGLJAPiq76ChuNjsOy
	L15n5it7Rw+tg/Hlco5Fm7oVo1kQ7V/ReEZkzbWJS04nGYY8a/dVFibW8dfcXVHgfsQPXHOBrTcZC
	dz/39Cf/Rk4bQCPruKasIGFYHFK3VrGar4usdZLzPFAwpJWeoOoxDahqB87qbUNNvfpMDdnF6SJtW
	RgZ8ksGiRDZ3mibsUPFJfBqCHwEchxb7SEJrTUTzVqqftxIHlGzeov7jn3LzF3I4UpaaFb0pZvxwG
	g6j8rV5/MRuf003gAdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hJM-00AzJL-2p;
	Thu, 30 Nov 2023 13:42:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8hJK-00AzHy-1A
	for linux-mtd@lists.infradead.org;
	Thu, 30 Nov 2023 13:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4ABD1B844F7;
	Thu, 30 Nov 2023 13:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1382CC433C8;
	Thu, 30 Nov 2023 13:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701351751;
	bh=hQ/RagFiP8S7jcAu4xKFuWQvjo1jYf9ATTjsPi8zRN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoYyVwv+YAX+XpiEXzB4bFYMQhZmN57ExLH64rUSOV4SW8/QFJXrQxz+MCsuCjG6e
	 yfOGes/ycUfxYURxLwHR32fAj+GJJkWj6mhFaDiWJZo/M5FVMkS6rYxJE1JnPSxXd4
	 U2Q5iQnh1zYcjlsfJ57+vmeeSKcRKcIrzRzHwHaE=
Date: Thu, 30 Nov 2023 13:42:27 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yuta Hayama <hayama@lineo.co.jp>
Cc: stable@vger.kernel.org, Sasha Levin <sashal@kernel.org>,
	Claire Lin <claire.lin@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 4.14] mtd: rawnand: brcmnand: Fix ecc chunk calculation
 for erased page bitfips
Message-ID: <2023113017-dictator-rotting-6bbe@gregkh>
References: <1dfa7e7f-233b-43da-b0ea-0ad3b1f69a37@lineo.co.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1dfa7e7f-233b-43da-b0ea-0ad3b1f69a37@lineo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_054234_547569_C3DCBBA5 
X-CRM114-Status: GOOD (  12.97  )
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

On Wed, Nov 29, 2023 at 05:29:13PM +0900, Yuta Hayama wrote:
> From: Claire Lin <claire.lin@broadcom.com>
> 
> commit 7f852cc1579297fd763789f8cd370639d0c654b6 upstream.
> 
> In brcmstb_nand_verify_erased_page(), the ECC chunk pointer calculation
> while correcting erased page bitflips is wrong, fix it.
> 
> Fixes: 02b88eea9f9c ("mtd: brcmnand: Add check for erased page bitflips")
> Signed-off-by: Claire Lin <claire.lin@broadcom.com>
> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
> ---
> After applying e44b9a9c1357 ("mtd: nand: brcmnand: Zero bitflip is not an
> error"), the return value 0 of brcmstb_nand_verify_erased_page() is
> *correctly* interpreted as "no bit flips, no errors". However, that
> function still has the issue that it may incorrectly return 0 for a page
> that contains bitflips. Without this patch, the data buffer of the erased
> page could be passed to a upper layer (e.g. UBIFS) without bitflips being
> detected and corrected.
> 
> In active stable, 4.14.y and 4.19.y seem to have a same issue.

Both now queued up, thanks.

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
