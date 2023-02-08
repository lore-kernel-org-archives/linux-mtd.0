Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AE3C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 17:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyaCYH554VgMsphcM0l0FTJZ3T6YElBmSTLoT5+qy8A=; b=TM0mCq30DxsBYQ
	MHOecd2PgqQkuD8k6M8Dc3KlzK1abZelVWFxZrHk49hJCRNCYIuoM2nmgW2ZBQ+LgoFQAEGjOgZBK
	AacQnZrOf8QCgxH/OLj0W6mlf7Rem/hr54wyKVZbdo8AdAlubHXGFvpirD9o5aIvSKW85A3JELsiR
	ylJuBGbHu3txTg9Uz+Fh9rAJkzBtKLyDwzVzpHreQqpv9H9XD9j35OqfHlQoxUH4/FmAMcFZfMvKw
	ttVvy5fetVpkeEKAUJkQpvBF2EtXMgxejnzVt6z460CSte2klbp5FvxZBnY6RhJKGw37QErasFz73
	j1cyWTGKVDEuFfuUriuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPoHh-00GSuy-FQ; Wed, 08 Feb 2023 17:31:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPoHd-00GSt5-MT
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 17:31:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4BE93B81D4A;
	Wed,  8 Feb 2023 17:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94FD8C4339B;
	Wed,  8 Feb 2023 17:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675877459;
	bh=m4LGLQRhAU4B3yaYdvrvkLt+fmM4L3nYicIMpXCMVeQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R+mYO5Bp4GkXoD5hHKtk/yK+fLsXYhaxdrXN3PGxqvmtdoJLn+IffzQHySZ+PDNTs
	 dgVFyIM8gDACZl2J+T8N9LuhebXwDCSzWZnKbbliSvuaigZAE66Jk9JG3HT1XOU55E
	 1GHy2l4cWDM5ZvzV+8mlQvmLsYUoVlWErXpe88/U=
Date: Wed, 8 Feb 2023 18:30:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Walle <michael@walle.cc>
Cc: linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v4] mtd: spi-nor: fix memory leak when using
 debugfs_lookup()
Message-ID: <Y+PcUN2DQx+J4MPJ@kroah.com>
References: <20230208160230.2179905-1-gregkh@linuxfoundation.org>
 <f60870dee13900252e0b13fb2f5f05b5@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f60870dee13900252e0b13fb2f5f05b5@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_093101_915692_E0AAB43C 
X-CRM114-Status: GOOD (  21.30  )
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

On Wed, Feb 08, 2023 at 05:15:41PM +0100, Michael Walle wrote:
> Am 2023-02-08 17:02, schrieb Greg Kroah-Hartman:
> > When calling debugfs_lookup() the result must have dput() called on it,
> > otherwise the memory will leak over time.  To solve this, remove the
> > lookup and create the directory on the first device found, and then
> > remove it when the module is unloaded.
> > 
> > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Cc: Pratyush Yadav <pratyush@kernel.org>
> > Cc: Michael Walle <michael@walle.cc>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: linux-mtd@lists.infradead.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Reviewed-by: Michael Walle <michael@walle.cc>
> 
> one nit below I didn't notice earlier, no need to send a new
> patch version just for that.
> 
> ..
> 
> > +void spi_nor_debugfs_shutdown(void)
> > +{
> > +	if (rootdir)
> > +		debugfs_remove(rootdir);
> 
> debugfs_remove() already has a check for NULL.
> 

Argh, I knew that, for some reason I went back and added that check as I
was thinking this would have been an issue if rootdir was never created.
You are right, it isn't a problem, oh well.

The simplest patches sometimes take the longest time to get right, I'll
stop now :)

thanks so much for the reviews,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
