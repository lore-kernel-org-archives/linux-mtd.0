Return-Path: <SRS0=0ANE=S3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F90C43219
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 19:44:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19525206BF
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Apr 2019 19:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hWG8eARB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wWjqPpiN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19525206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ikk5l1LdL7XZotB4q5rEAZwwRRprGWny2LlOlX+lR4=; b=hWG8eARBEnZkze
	Et5iiMG9C8jYSA38eUAycgsBfmGth4/zy7LLt+5NG7VkWyF3RpeEXb5n8uG1eb9MrOp1xTp7NsbS8
	uJ8q2EuBSFMuakSKOb8jjqGjZex/IZ/8Wg4YKMUgqUHX2/9KLiIgWbMNLM81UjdGq00OEDrcQ1kuI
	x62zrCWLaOIN6r7ZEWBStEsYDFp0MBUlN5J17VF0TD8djw4XHEsfFpB51QHdzOstVh2Lub44XTFha
	R8gb+rm9MuKNaUwT99BgTvu/i4pRccfKUVZgtVbSwNaEIvh8ZnWo8IQ5efYwLiBX5jTyQj5sBjwU/
	b3rCWlaBCErgvKplZECg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJkIi-0004Mw-Tq; Thu, 25 Apr 2019 19:44:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJkIg-0004Mc-2c
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2019 19:44:55 +0000
Received: from localhost (62-193-50-229.as16211.net [62.193.50.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 19250205ED;
 Thu, 25 Apr 2019 19:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556221493;
 bh=+WbavMlUKYGr1ZDi1CRg0fUacKJqI5fSp3MW8bgjmtk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wWjqPpiNpc/JRSMEIGJRruva0t/q03uMvb1NujGEDZM2gjjeS+wwLvWgxJpKVmsf1
 Db8vcghQqpdnLIcISnVJTfyeCihKRK+5IWtvnVjyxt8SbL98sFwMIhmO23cDeZSaUD
 RPavxocu7vnpbjT6fwG14PPsovBfPDKA6F9kZsuw=
Date: Thu, 25 Apr 2019 21:44:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH] eeprom: at25: Convert the driver to the spi-mem interface
Message-ID: <20190425194451.GA14552@kroah.com>
References: <20190330141637.22632-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190330141637.22632-1-boris.brezillon@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_124454_138529_2C6CA11C 
X-CRM114-Status: GOOD (  16.24  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Mar 30, 2019 at 03:16:37PM +0100, Boris Brezillon wrote:
> The AT25 protocol fits pretty well in the spi-mem model. Convert the
> at25 spi driver to a spi-mem driver and use the dirmap API instead of
> forging SPI messages manually.
> This makes the driver compatible with spi-mem-only controllers
> (controllers implementing only the spi_mem ops).
> 
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/misc/eeprom/at25.c | 282 +++++++++++++++++++++++--------------
>  1 file changed, 176 insertions(+), 106 deletions(-)

Will there be a new version of this to fix up the problems that 0-day
found in it?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
