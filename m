Return-Path: <SRS0=7oEw=WG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8998C32751
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Aug 2019 07:29:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0A1208C3
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Aug 2019 07:29:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZsTWYyoy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBqrC7oh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0A1208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MJFqDgeS9GeROwe8oPw71GLJbLMFICS/GNhJ+th8Fq8=; b=ZsTWYyoy7HUfYI
	ntcrFn8KwOeoTm2OH1vDbCYT7STDAHs+1+YCA6BTbm6YWnOZyqt+gFFeKCWfs64mHTShg0bywdDYg
	sfyvyQkl3XGC2uZtWpwA5woTo4ObyQ7v9WMY0npqwxCAiO4yJmmWifvUwB06+E1/ytHqvmAGSGjrS
	9lRkprXkV7GUe/deV6nbYnaCylS8VVUqYmtesOZRfzWDoijP3LyvmuJoplRGdB7H7ac6qUK31qDE+
	VmP+tKoPMU0sl131148vktz8SjaG8RwhT56Fstdq7TFJPO4qbHMAqJKS//UxWN+MkK0M2XytBsqba
	LoalG3M+6MrBLGNqyZfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hwLoX-0001qf-As; Sat, 10 Aug 2019 07:29:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hwLoG-0001ek-D1; Sat, 10 Aug 2019 07:29:05 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A8F5A208C3;
 Sat, 10 Aug 2019 07:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565422143;
 bh=6VbgVATIK8gQ19RGol0s4sZQa5UMwCh4OTfTrF86+S8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lBqrC7ohyxzl6vsNis9zlpMAhEi70L2WIqFNi8DDBsBBNwByj5leAHxmTIVNndq9s
 TmKlDe4pOaS0AZ1mw/6SXmBx+J4FF6/e2v1l5HTChKEx5JJo8ey/k96tf5JfLLG90A
 9Xpmz9DaBhJLkh1c//sGGMllxdkZ23lOJlyBP2UE=
Date: Sat, 10 Aug 2019 09:29:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 00/16] ARM: remove ks8695 and w90x900 platforms
Message-ID: <20190810072900.GA16359@kroah.com>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190810_002904_465984_D3FCEDE4 
X-CRM114-Status: UNSURE (   8.08  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-fbdev@vger.kernel.org,
 "Wanzongshun \(Vincent\)" <wanzongshun@huawei.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, soc@kernel.org, Greg Ungerer <gerg@kernel.org>,
 linux-mtd@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 09, 2019 at 10:27:28PM +0200, Arnd Bergmann wrote:
> As discussed previously, these two ARM platforms have no
> known remaining users, let's remove them completely.
> 
> Subsystem maintainers: feel free to take the driver removals
> through your respective trees, they are all independent of
> one another. We can merge any remaining patches through the
> soc tree.

Serial and USB host controller driver patches applied, thanks!

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
