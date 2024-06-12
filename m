Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84716C27C53
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2024 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jNWh84baEVd6WtpkrPAKUurhNARps2h88oQPNbGXR0w=; b=TVZBJOJ9551WV1
	qBCsv2PkNLY+9ceCaJJaIvXHzUP3Ek2vft6eaLkw1BocPIRcgzhf3AKcP/eMO2SM/ib4JeWt2JWS3
	8gThJrtQZQrQUA+Tn0VtihYe0GLm4mXo8uHFfs1xF7utEZ3Fxl/d/9/BGbfNdjE2Pd7kmv9jSyi9p
	OUafmyTIxewmBYeS/rYpTrPeZs14b+Hm43wsFX/BCb1u2YWGsDK1ssQPq0Kxxwu1MzwYIZWZZif8s
	ELWEPIK5H8elu8SgxlhTYXygu6hoqjXi74ZnPa8NYIBxKsksEc8nzi1dtAgRzLKgCda9kQAvTfIg8
	oFYKn0TLK5gzFpaFIx+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPEU-0000000D079-1L9w;
	Wed, 12 Jun 2024 14:45:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHPEQ-0000000D05o-2lUe
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jun 2024 14:45:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBAD361368;
	Wed, 12 Jun 2024 14:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB693C3277B;
	Wed, 12 Jun 2024 14:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718203545;
	bh=gyrNWe9KzLBAJMK5rRHPXMaZ3/0hf4xbjg1wOTVTEEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vWxb2qoQZKs/68gSQtchZahCUcBhYXM+pIELKkjbWZlrVX4GC2xf/wYNHnMHI9uz7
	 S/mw5Axnhz8MJ/06gffXEvbC/w8c7E/bKt1L1/HThZS4C8dchJJLGvKthv5hosda40
	 Rle0fbwg4I+ExecB+tMyckMnh73Q859EJa+M9HVg=
Date: Wed, 12 Jun 2024 16:45:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: miquel.raynal@bootlin.com, dwmw2@infradead.org,
	computersforpeace@gmail.com, marek.vasut@gmail.com, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	richard@nod.at, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>, stable@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spinand: macronix: Add support for serial NAND
 flash
Message-ID: <2024061250-contend-citadel-7d03@gregkh>
References: <20240605054858.37560-1-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605054858.37560-1-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_074546_767137_ABFB66BB 
X-CRM114-Status: UNSURE (   6.80  )
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

On Wed, Jun 05, 2024 at 01:48:58PM +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> commit c374839f9b4475173e536d1eaddff45cb481dbdf upstream.

No, this isn't that commit, it's just a portion of it :(

Please backport the whole thing, and leave the original signed-off-by
lines and text in it.

Also, this is needed for 5.10.y kernels, right?  Please provide a
backported version for there, otherwise you would upgrade your kernel
and have a regression.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
