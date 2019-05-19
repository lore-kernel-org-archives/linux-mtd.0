Return-Path: <SRS0=for3=TT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A66C04AB4
	for <linux-mtd@archiver.kernel.org>; Sun, 19 May 2019 20:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1821520675
	for <linux-mtd@archiver.kernel.org>; Sun, 19 May 2019 20:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TeUJgG1v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1821520675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lv6e9uwDrDYWYbx8rE/3JaZ29q+WdiXLGMLYJf3trDU=; b=TeUJgG1v75OtUF5xWvpHil5Pf
	CiMtm/Ut1Kctqxfyl5H+j71oyMk2NJ/UW3TuFR1Zo5SNOABh3MiuwKtFrEqYSbLCNMkhw0BpPgt1c
	iP4NDM5N1knrkXWcQ/TEi7nIbMvsCnKw82EQlUFsLAjbvQBSBfBbJTndB9QZYXMSaXSxyzB1Km9x0
	WpYOH/NWMm+dboSi1OasDapzFqMbZGcYSvAYTxt4kmwkeuDXWINp7yCDkkakAk3sSPU1plisvNY4v
	OiG/2+WjsrKFq2uy5oPEnl98XCxUau+TVqJIs8P6sND6UsLcXO/O/9pub8LE1V2DoOdAPYJnOaJa8
	qFqmBseuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSSPb-0001Uy-0K; Sun, 19 May 2019 20:28:03 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSSPY-0001Uc-Pg
 for linux-mtd@lists.infradead.org; Sun, 19 May 2019 20:28:02 +0000
Received: from ubuntu.pn.wagsky.com (c-69-181-42-248.hsd1.ca.comcast.net
 [69.181.42.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 16A7E38EBC;
 Sun, 19 May 2019 13:27:59 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] mtd: spinand: Add #define-s for page-read ops with
 three-byte addresses
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
References: <20190514215315.19228-1-lede@allycomm.com>
 <20190514215315.19228-2-lede@allycomm.com>
 <355bcf8d-bce6-1b82-0f57-539c8d9b6cac@gmail.com>
 <efcbdd61-d60e-a5d1-9f91-f8f747fadecf@kontron.de>
From: Jeff Kletsky <lede@allycomm.com>
Message-ID: <d62d64a9-c7c3-3b0b-a3ba-71ab2a4f61e4@allycomm.com>
Date: Sun, 19 May 2019 13:27:58 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <efcbdd61-d60e-a5d1-9f91-f8f747fadecf@kontron.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190519_132800_838753_43289F58 
X-CRM114-Status: GOOD (  21.54  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/14/19 11:49 PM, Schrempf Frieder wrote:

> On 15.05.19 08:17, Marek Vasut wrote:
>> On 5/14/19 11:53 PM, Jeff Kletsky wrote:
>>> From: Jeff Kletsky <git-commits@allycomm.com>
>> That #define in $subject is called a macro.
>>
>> Seems this patch adds a lot of almost duplicate code, can it be somehow
>> de-duplicated ?
> We could add another parameter naddr or addrlen to the
> SPINAND_PAGE_READ_FROM_CACHE_XX_OPs and pass the value 2 for all
> existing chips except for GD5F1GQ4UFxxG which needs 3 bytes address length.
>
> This would cause one more argument to each of the macro calls in all
> chip drivers. As long as there are only two flavors (2 and 3 bytes) I'm
> not sure if this really would make things easier and also this is "only"
> preprocessor code.
>
> So anyways, I would be fine with both approaches, Jeff's current one or
> one with another parameter for the address length.
>
> By the way: Jeff, you didn't carry my Reviewed-by tag to v2. So I will
> just reply again to add the tags.
>
>>> The GigaDevice GD5F1GQ4UFxxG SPI NAND utilizes three-byte addresses
>>> for its page-read ops.
>>>
>>> http://www.gigadevice.com/datasheet/gd5f1gq4xfxxg/
>>>
>>> Signed-off-by: Jeff Kletsky <git-commits@allycomm.com>
>>> ---
>>>    include/linux/mtd/spinand.h | 30 ++++++++++++++++++++++++++++++
>>>    1 file changed, 30 insertions(+)
>>>
>>> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
>>> index b92e2aa955b6..05fe98eebe27 100644
>>> --- a/include/linux/mtd/spinand.h
>>> +++ b/include/linux/mtd/spinand.h
>>> @@ -68,30 +68,60 @@
>>>    		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>>>    		   SPI_MEM_OP_DATA_IN(len, buf, 1))
>>>    
>>> +#define SPINAND_PAGE_READ_FROM_CACHE_OP_3A(fast, addr, ndummy, buf, len) \
>>> +	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
>>> +		   SPI_MEM_OP_ADDR(3, addr, 1),				\
>>> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>>> +		   SPI_MEM_OP_DATA_IN(len, buf, 1))
>>> +
>>>    #define SPINAND_PAGE_READ_FROM_CACHE_X2_OP(addr, ndummy, buf, len)	\
>>>    	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),				\
>>>    		   SPI_MEM_OP_ADDR(2, addr, 1),				\
>>>    		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
>>>    		   SPI_MEM_OP_DATA_IN(len, buf, 2))
>>>    
>>> [ _3A addition repeated three more times for similar ops ... ]

It's easy enough to change the wording, and will do so on the next revision.

However, it's not clear to me that there is consensus on if the present
set of macros is acceptable/preferred over definition of a set of ones
that accept an additional parameter.

At least from my perspective and as Schrempf Frieder has hinted at,
these macros are syntactic sugar and all result in equivalent C code.

Either should compile to the same run-time size and performance (assuming
reasonably that a construct like `true ? 0x0b : 0x03` is optimized out).

Adding an additional parameter, at least for me, wouldn't improve readability
of the code and is offset by the need to refactor four other files. Even
though it should be a simple/trivial refactor, I do not have any examples
of the four other manufacturers' chips to be able to confirm proper operation.

I'll prepare a reworded set of patches with the present macro structure.

If there is strong feeling for refactoring the macro set, please let me know.


Jeff



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
