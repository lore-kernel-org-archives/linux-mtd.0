Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CD8C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 09:28:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEC602072D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 09:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lXe7Rp+z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEC602072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7iu2zSIGAQF4rnbg02AaFPJedY9JzDJIF/vTfJHCP0=; b=lXe7Rp+zqQP8wk
	GXSWMD6/VaMHGRN/5/Fkng1FokEbfEokNSEvZc5PyWFxh2PmMqus0mvC8yg13NoGjxmGC3Jdrr8ka
	a1DohiT63O1sUR6O6cbx+v9pRRaY2wJqpMeN3UjOmHM1tC5QucDcfy5fzY4aUUpC1aJio7c0qQj5D
	iJXZHI3IBht5HBSm26HOryKOUnGtW/rf8d5e49I4zorp0ppphEwM0L0CpORmL5SPFObu7D4Vtf7XS
	vOf/iEh3hIPUqlJbUAupWRz9NZaGcqVKOGiVEo8eiHYKx8JO32jRHSthR8GMM1dl5KCtbDXJr2U9i
	cjTFJbnE0aeYcq+hu2fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jebJG-0002bI-Pf; Fri, 29 May 2020 09:28:14 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jebJD-0002aM-E5
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 09:28:12 +0000
Received: from localhost (unknown [42.109.222.225])
 (Authenticated sender: me@yadavpratyush.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D76C2240005;
 Fri, 29 May 2020 09:28:04 +0000 (UTC)
Date: Fri, 29 May 2020 14:57:58 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v4 2/7] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Message-ID: <20200529092758.ezuyac2r6vmp6tfs@yadavpratyush.com>
References: <1590737775-4798-1-git-send-email-masonccyang@mxic.com.tw>
 <1590737775-4798-3-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590737775-4798-3-git-send-email-masonccyang@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_022811_603545_91AEEF95 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, boris.brezillon@collabora.com, miquel.raynal@bootlin.com,
 matthias.bgg@gmail.com, linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 29/05/20 03:36PM, Mason Yang wrote:
> JESD251, xSPI profile 1.0 table supports octal DTR mode.
> Extract information like the fast read opcode, dummy cycles for various
> frequencies, the number of dummy cycles needed for a Read Status
> Register command, the number of address bytes needed for a Read
> Status Register command, read volatile register command and write
> volatile register command.

Like I said before, please don't re-introduce the functions. My patch 
series already parses the table. Add whatever new feature you want on 
top of it.
 
> According to BFPT 20th DWORD of octal maximum speed, driver get it's
> specific dummy cycles from profile 1.0 table and then could update
> it to device by their fixup hooks.

My patch [0] already find out the dummy cycles from the table as you 
suggested, though it doesn't consult the BFPT. Instead, it uses the 
dummy cycle fields themselves as indication that a speed is supported or 
not.
 
[0] https://lore.kernel.org/linux-mtd/20200525091544.17270-10-p.yadav@ti.com/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
