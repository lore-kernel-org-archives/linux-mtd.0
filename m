Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF80AC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 22:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ND1TmH6Y2kEUNx6/xx1HgfRHtrcuKvvcEbdZLMSiSaI=; b=CSWE+7HKoj7TbFSRylhnhiiFm8
	+qY7sKlEDOTZlolc8iN/DSUOSh7g5aikI4eDoT52sH1L6JWy/o/7x1s8fnd5m6dsi2Mi6CsgsumHh
	Y73NBS/kDyhinb+UcV3x5bKBVM0bzvfDNJmWGk3nwF7Xf05r9491jfln8oJEXUtjBjWHS7PlqmlA6
	2z8KHrVC5daQLJWJsZDWjj4mTXsxD7Us/JUCLTTyB3jXDw1hKU3bukWdPxfminPJhVUJUePrKsWHA
	a1iwtjFV5DE3OnjKglui0wwY+M4+SRZRvyL1g9H/xd9j6ttML3uNGM44NhY9JdPiOU7RbldnevQWO
	NlR+lL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCqvu-00DgJj-8E; Wed, 26 Jan 2022 22:38:30 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCqvr-00DgJ2-Nf
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 22:38:29 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 711522223E;
 Wed, 26 Jan 2022 23:38:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1643236702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PecoamdTzvINOalik00tsBphSo/Nm52UmAwdXu2OT3E=;
 b=QubxIKLzKoONoLg4yY+sG1eA2aGPHTCdm5ZK8lEsbOucMXtxYmTLqmGesVqZZbU9QyrgTF
 0+kATZip0nlCwg1FFgPw9o/jM8UNXcCeK6XW20jbN3Bd9mTcA3sNiOkdVU1/sEIRuQs/pJ
 TeKl3f/ddguGkm/wodobh5K37BiW74o=
MIME-Version: 1.0
Date: Wed, 26 Jan 2022 23:38:21 +0100
From: Michael Walle <michael@walle.cc>
To: Chen-Tsung Hsieh <chentsung@chromium.org>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RESEND PATCH] mtd: spi-nor: core: Check written SR value in
 spi_nor_write_16bit_sr_and_check()
In-Reply-To: <20220126073227.3401275-1-chentsung@chromium.org>
References: <20220126073227.3401275-1-chentsung@chromium.org>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <8625876c695685fc5409997403130194@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_143827_980007_A9FF4541 
X-CRM114-Status: GOOD (  10.09  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2022-01-26 08:32, schrieb Chen-Tsung Hsieh:
> Read back Status Register 1 to ensure that the written byte match the
> received value and return -EIO if read back test failed.
> 
> Without this patch, spi_nor_write_16bit_sr_and_check() only check the
> second half of the 16bit. It causes errors like spi_nor_sr_unlock()
> return success incorrectly when spi_nor_write_16bit_sr_and_check()
> doesn't write SR successfully.
> 
> Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on 
> lock()/unlock()")
> Signed-off-by: Chen-Tsung Hsieh <chentsung@chromium.org>

Looks good to me. spi_nor_write_16bit_cr_and_check() also checks
the SR1 and the function doc also mentions it will check it - although
it doesn't.

Reviewed-by: Michael Walle <michael@walle.cc>

Out of curiosity, on what flash did you discover this?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
