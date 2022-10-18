Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB25C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 07:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDNVBAhz82Hy9IpCoc54pgsvRrWtt0q/FRUTRxJLD+k=; b=XDqBYCEYoEV8k0B4APZjnc4WiN
	SsUyA6cPgSQldlzArlNBBiArEjI6OhREs7aJjVo5IFIqRp2VBKkB6uWSKYywA9wFycXDGoDqZxY6Z
	D01wdHDl9v4ts6t6LsR/5PyMI2AdTurqPe02Yalu+ZYhrpJq+HklAl5CEasoBnLp5lkGjDg1dnkDz
	d6HndY3bwDF0sLcuotE/mPrUMU0Je2mwp3dkyO/kRzJ3/cGkKV4qZHLAWpw97AIpNSaI2Ih075pdq
	1zQSRXIvYZMYYp1N4cTYfmVbb0F5j/HZ3lV4CNkSe78iNcXVRle9AFlSzkZikN+Qq0cVu1QFk+F9m
	Wv/I8nKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhIG-0040QA-VQ; Tue, 18 Oct 2022 07:45:45 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okhID-0040Lh-KY
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 07:45:43 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C68741D2C;
	Tue, 18 Oct 2022 09:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1666079134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YwuNwWcyNAFSlRAr+eqDH3/oNtts/gH6iawPwlibttI=;
	b=PdoxgIbf8iBcEgq/aSEK/uDPeL9g9X9zPXxrlIfMP0FtQ3EpuSGYy9U7Javotb0Fucc4/F
	85Lwz4NrbUhuG9ZTl53sYz1ZzxfQYC+TeD3ghHeDB0CfaopN4JDejM8p0+9UOzL7lvpk69
	1278m/oT8ro0G/qj3rVwYw1fsTGQeMB256DZ08SonSut37BLEEXk7o8VAW85gth4m2E1kj
	6VGD58hSW73kCRkYTTB7vvwA86lq6ZaXjt5EvvrT7JsFGI1ZGy7L1INYTKf8pXIw7T9q+9
	gNGDtDeEhR15SJbidCgTIs90HU7v1kQk+ARBf8+u+48meIgf8SHekE9x4r+WLQ==
MIME-Version: 1.0
Date: Tue, 18 Oct 2022 09:45:34 +0200
From: Michael Walle <michael@walle.cc>
To: Eliav Farber <farbere@amazon.com>
Cc: tudor.ambarus@microchip.com, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 talel@amazon.com, jonnyc@amazon.com, hhhawa@amazon.com, hanochu@amazon.com,
 itamark@amazon.com, shellykz@amazon.com, amitlavi@amazon.com, dkl@amazon.com
Subject: Re: [PATCH] mtd: spi-nor: micron-st: Enable locking for n25q256ax1
In-Reply-To: <20221018072254.21606-1-farbere@amazon.com>
References: <20221018072254.21606-1-farbere@amazon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <bb7040f60b86b1f028fc6a40f6221ca6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_004541_875383_CA41E265 
X-CRM114-Status: UNSURE (   6.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2022-10-18 09:22, schrieb Eliav Farber:
> n25q256ax1 [1] uses the 4 bit Block Protection scheme and supports
> Top/Bottom protection via the BP and TB bits of the Status Register.
> BP3 is located in bit 6 of the Status Register.
> Tested on n25q256ax1.
> 
> [1] 
> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_256mb_3v.pdf
> 
> Signed-off-by: Eliav Farber <farbere@amazon.com>

Looks good. But could you please dump the SFDP tables as
described in [1].

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
