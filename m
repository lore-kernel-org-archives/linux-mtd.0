Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FB3C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afcM/DPew3mKArpmWeGbWn3xwOQvBezkjdNBbF02Jy0=; b=q5iyA0T5UzKR6pWtaKEY+RCTSW
	meO2y4uBbmd2LW9L0tEZq2VlInS0lEJtGbArDA7gAKUqQH8E53enly28UXdaM8/57BLh5NeH0ovDU
	tyrr3MNiEw4I97znhfD1Nw8WuQKkGo9ZppGjAx2bxS10Tx2UTybj816dfiF3fVhLvGvqUPPmXmf9V
	ZcdIRbD3hTOjTGIRASUkv+taGt2iPw8DpsO/FnppWZDzn7SXrp2XEHvahM1QCkPSaiUDSv9S3YV/w
	fwDs2QpOt3bqtcNdzQ6ClDZJOiriL4go0RbU3XmXkIiB9QFQp2uxreL3ndTYk12mCopbsUJ3yUgeN
	nJ23JVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMPYz-008Juf-7e; Tue, 22 Feb 2022 07:26:21 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMPYw-008JtO-2c
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 07:26:19 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8FEE422175;
 Tue, 22 Feb 2022 08:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645514776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUE5F/B9ycxc5hgcNoeXQ3HZv9EjcmdgJCeELwpIrnQ=;
 b=o0JP7nlcZRESyarpSG4EVGLYl0hEnE63QsIFXcUonf4FAjldBidIvh7ylCHbYMREhBE9RO
 siCLgIivV/wflU87Zlr8KX7ttfx9veiKymz5w2Px1dZnUNtt1WKzD3gRlDjKycwDzyYuxX
 PHMoZ/qwRgdpayj1AeoyrdfX3D67M9s=
MIME-Version: 1.0
Date: Tue, 22 Feb 2022 08:26:15 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, yaliang.wang@windriver.com
Subject: Re: [PATCH v4 01/32] mtd: spi-nor: atmel: unify function names
In-Reply-To: <20220222072314.tk4bw5sngwnk6zwr@ti.com>
References: <20220221120809.1531502-1-michael@walle.cc>
 <20220221120809.1531502-2-michael@walle.cc>
 <20220222072314.tk4bw5sngwnk6zwr@ti.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <338bfd692a372450d1210a333994c31e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_232618_305937_776E7841 
X-CRM114-Status: UNSURE (   7.59  )
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

Am 2022-02-22 08:23, schrieb Pratyush Yadav:
> On 21/02/22 01:07PM, Michael Walle wrote:
>> To avoid name clashes unify all the function and static object names 
>> and
>> use one of the following prefixes which should be sufficiently unique:
>>  - <vendor>_nor_
>>  - <flash_family>_nor_
>>  - <flash_part>_
> 
> Shouldn't this be "<flash_part>_nor_"?

No, a part name is already unique and its the same "style" as spi nand
is doing it.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
