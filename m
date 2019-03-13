Return-Path: <SRS0=ZvR1=RQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3284C43381
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF7552087C
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Mar 2019 13:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHF3QusI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=126.com header.i=@126.com header.b="Znc0xRP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF7552087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=126.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMHSqkJAtcFPNqEA+ZqJ2hYdcpYAJoDRlGDweP4qDRM=; b=KHF3QusI8M2fiS
	ekRfitC7GDkf20W7m0duDMzlmm0cNelN1hb43JKEs9/CPq3IWa+NkG8COyACUi07srPCi850E+3+L
	Q7ZYxL7MTDbrpdJdB1nldUYpSHktPZeyor6i0LqNyuBIfd8YsUuVxrA51zPHTkhKBFGNMZaPlA6EK
	9+SzmBl1XKe9GX63l86fInh3y/fq+0U4fT1W6AnEf3xK0uLoIMOfbggzCEe3fa5adGCoxmXgT1a9u
	h9pke19FD+PUb8tw2aahetUIdoFaBniAZ7QBOGTuOkGJ22eslVTVcEgdxK8PKeo59SiFLZtOIq/A0
	GloUnWR+xDFUaXNrvMuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h43pD-0008Mi-Fu; Wed, 13 Mar 2019 13:21:39 +0000
Received: from m15-22.126.com ([220.181.15.22])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h43p9-0008ML-Ge
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2019 13:21:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=Tz3ko
 V9dG1zZG0/+pXEVnWHseM45fw6JVQh8KAdEq40=; b=Znc0xRP1cF9sOxfvjkei1
 gaHAm/OFQHqHn/a2X6jwMXGVNTLTPg6EflHLkpr7gKejpOQFwBjoj7VLVBzx2DjW
 ofQ7ioX3H0GAkchaGfb4TKVt22SG7PIs2LseNufHhAwAS8g2YEN6G6Jbo1JESn73
 tG+4/pBKpg575SEZ0J46eQ=
Received: from liuxiang_1999$126.com ( [110.184.152.196] ) by
 ajax-webmail-wmsvr22 (Coremail) ; Wed, 13 Mar 2019 21:20:49 +0800 (CST)
X-Originating-IP: [110.184.152.196]
Date: Wed, 13 Mar 2019 21:20:49 +0800 (CST)
From: "Liu Xiang" <liuxiang_1999@126.com>
To: "Liu Xiang" <liuxiang_1999@126.com>
Subject: Re:Re:Re: [PATCH] mtd: spi-nor: Return error when nor->addr_width
 not match the device size
X-Priority: 3
X-Mailer: Coremail Webmail Server Version SP_ntes V3.5 build
 20180927(cd7136b6) Copyright (c) 2002-2019 www.mailtech.cn 126com
In-Reply-To: <55597875.b295.1671cb170cb.Coremail.liuxiang_1999@126.com>
References: <1542200165-3073-1-git-send-email-liu.xiang6@zte.com.cn>
 <20181114145129.568e4bb3@bbrezillon>
 <96397ec0-14de-f09a-a18d-c67396e33fba@microchip.com>
 <20181115120256.4e1a86b2@bbrezillon>
 <55597875.b295.1671cb170cb.Coremail.liuxiang_1999@126.com>
MIME-Version: 1.0
Message-ID: <7dc8a742.905e.16977366cf9.Coremail.liuxiang_1999@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: FsqowAAHEViyA4lcdwEDAA--.24590W
X-CM-SenderInfo: xolx5x5dqjsiqzzzqiyswou0bp/1tbiTwJ2sFpD74V6sgACsy
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190313_062136_084546_A43695EB 
X-CRM114-Status: GOOD (  18.06  )
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
Cc: Tudor.Ambarus@microchip.com, richard@nod.at, liu.xiang6@zte.com.cn,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org




Hi, Boris
I am sorry I have not got any further information from ISSI since last reply.
As your suggest, when the Address Bytes we are reading from BFPT is wrong, an error is returned
from spi_nor_parse_bfpt(). Then it can go back to use spi_nor_ids[] for setting addr_width. If
we make sure the spi_nor_ids[] is right, it can work well.
I will send a v2 patch.


At 2018-11-16 21:24:10, "Liu Xiang" <liuxiang_1999@126.com> wrote:
>
>Hi Tudor, Boris, Cyrille,
>There is no JEDEC BFPT tables in the datasheet. 
>In my test platform, I sent RDSFDP command to the flash and got the
>parameters back.
>My device type is IS25LP256D-JMLA, which is not in H/E/G/F series of flash
>that is described in chapter 11 of the datasheet. The reply from ISSI  suggests
>only these certain devices can support SFDP table.
>I am confused why my device can support RDSFDP command and give 
>parameters back. I will ask ISSI for more details.
>
>
>
>At 2018-11-15 19:02:56, "Boris Brezillon" <boris.brezillon@bootlin.com> wrote:
>>On Thu, 15 Nov 2018 10:54:39 +0000
>><Tudor.Ambarus@microchip.com> wrote:
>>
>>> Hi, Liu, Boris, Cyrille,
>>> 
>>> On 11/14/2018 03:51 PM, Boris Brezillon wrote:
>>> > On Wed, 14 Nov 2018 20:56:05 +0800
>>> > Liu Xiang <liu.xiang6@zte.com.cn> wrote:
>>> >   
>>> >> In is25lp256, the DWORD1 of JEDEC Basic Flash Parameter Header
>>> >> is 0xfff920e5. So the DWORD1[18:17] Address Bytes bits are 0b00,  
>>> 
>>> Liu, can you point us to a datasheet that has the JEDEC BFPT tables described? I
>>> couldn't find one ...
>>> 
>>> >> means that 3-Byte only addressing.  
>>> > 
>>> > According to your other patch this NOR supports 4B opcode, which means
>>> > the SFDP table is wrong.
>>> >   
>>> >> But the device size is larger
>>> >> than 16MB, nor->addr_width must be 4 to access the whole address.
>>> >> An error should be returned when nor->addr_width not match  
>>> > 
>>> > 						   ^does not
>>> >   
>>> >> the device size in spi_nor_parse_sfdp().
>>> >>
>>> >> Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
>>> >> Signed-off-by: Liu Xiang <liu.xiang6@zte.com.cn>
>>> >> ---
>>> >>  drivers/mtd/spi-nor/spi-nor.c | 4 ++++
>>> >>  1 file changed, 4 insertions(+)
>>> >>
>>> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> >> index 3eba13a..77eaf22 100644
>>> >> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> >> @@ -2669,6 +2669,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>>> >>  	}
>>> >>  	params->size >>= 3; /* Convert to bytes. */
>>> >>  
>>> >> +	/*if the device exceeds 16MiB, addr_width must be 4*/  
>>> > 
>>> > Please add a white space after '/*' and before '*/':
>>> > 
>>> > 	/* If the device exceeds 16MiB, ->addr_width must be 4. */
>>> >   
>>> >> +	if ((params->size > 0x1000000) && (nor->addr_width == 3))  
>>> > 
>>> > Parens are not needed around sub-conditions:
>>> > 
>>> > 	if (params->size > 0x1000000 && nor->addr_width == 3)
>>> >   
>>> >> +		return -EINVAL;
>>> >> +  
>>> > 
>>> > I'm not sure this is correct. Looks like some NORs only support 3B
>>> > opcodes but have a "4-byte addressing" mode (see set_4byte() [1]).
>>> > Don't know what's reported by the BFPT section in this case though
>>> > (BFPT_DWORD1_ADDRESS_BYTES_3_ONLY or BFPT_DWORD1_ADDRESS_BYTES_3_OR_4).  
>>> 
>>> Boris, this is in close relation with your second patch: [PATCH v3 2/2] mtd:
>>> spi-nor: Use 4B opcodes when the NOR advertises both 3B and 4B.
>>> 
>>> When looking again at this, I would say that for the flashes that have a "4-byte
>>> addressing" mode, but just 3B opcodes, I would expect the DWORD1[18:17] to be of
>>> value BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 (enters 4-Byte mode on command - uses 3B
>>> opcodes).
>>
>>The NOR we have and which is exposing BFPT_DWORD1_ADDRESS_BYTES_3_OR_4
>>actually supports both 3B and 4B commands, so, in this particular case,
>>BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 does not mean "3B opcode+4-byte
>>addressing mode"
>>
>>> 
>>> If BFPT_DWORD1_ADDRESS_BYTES_3_OR_4 and 4B opcodes, then we can query BFPT
>>> DWORD16[31:24]: it should have value xx1x_xxxxb to indicate that 4B opcodes are
>>> supported. But which 4B opcodes are supported?
>>
>>I hope all of them. Wouldn't make sense to have only some of them
>>supported.
>>
>>> Do all 3B opcodes have a 4B
>>> opcode correspondent if SFDP 4-byte table is not available? This might be a good
>>> assumption, but I can't see it anywhere in jesd216c.
>>
>>I hope so...
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
