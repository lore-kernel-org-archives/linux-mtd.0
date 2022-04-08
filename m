Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59923C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Apr 2022 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fzMDXVICXVjoPv0UaO1k+0U0gGhTlj2JOtIET2FS75M=; b=DD2o9B/iGOyi/O
	4VCaXbUB2qRHKSrJsUrvZKKlgKvPJbFQAwZD2ryZTnfmnkg+44TKlUmX/5NM/G2pAsWUSn96yUQeL
	wkkWTmrkJtrGgY5qAAxPGH6MnExHNOdW4y4PmfJCvEw8yX/3IHtED7WirN4Oc4bo4LwyhTsN0z5VB
	GzTg8zFqCZxYE2osQDQtdovWoxjlaVA4owEkKxPULMH5b8OL60k28gShIi8uvWlgN8+7swfHNhJlt
	hFMK4R7GJ+s54IYfrQy2X1EY30AZx+nLP+xNwk1BkbDzQGeMgMr19KX0NQKBTY/HnCJgBjtxRVcV1
	EYbS6gNZ2+0oQNCgLEkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncrOr-000UAu-Q7; Fri, 08 Apr 2022 16:23:53 +0000
Received: from mail.fmat.eu ([2a03:4000:21:70a:b8c2:1eff:fea5:fc02])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncrNq-000Tav-5p
 for linux-mtd@lists.infradead.org; Fri, 08 Apr 2022 16:22:52 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id 9E175E0862;
 Fri,  8 Apr 2022 18:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1649434968;
 bh=OfzxPHL8g/f2cqI7NJfd13lCHElKiVm8q8SGjMV3BKQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=u6enwTteDn00kHwCUsX2obO9ayUvOLEHY1oQxgItD6vKVwd/y1Tm2FtDIMy48MxEJ
 6G79Oy5YVwAcUwjLlr8gip0cGoYYpijd8QCerqbNHO/Cq4Oo0+vAR0A6Oxd4ZtD+dr
 XEIjdktpN4rFW1SawoG29rcQBIrMs8gADZRYX5cJ0uO8vo0Pb63bzSY54HXHhQubt7
 HqNL6kX2ELeuIQxkTZKHylR3rTKwq+W1JEbpvO3ZXNGW2Q8HHC9kU/AmmaA92e3ScX
 aej/RLVT0LdkbjNs0IJH1spDq6twyhaO+V26HnyD+WPhpKOhditET/1zTV51qFl35Z
 vWCmLP2RXaIYw==
Message-ID: <87040be5-b1b7-346a-6fed-ec39d304aa83@matouschek.org>
Date: Fri, 8 Apr 2022 18:22:48 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] mtd: spinand: Add support for XTX XT26G0xA
Content-Language: en-US
To: Chuanhong Guo <gch981213@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
References: <20220401212951.1133780-1-felix@matouschek.org>
 <20220404104141.7b7b79d5@xps13>
 <c1387c1949a8ec705116f5ee8a73fa35979aa196.camel@matouschek.org>
 <CAJsYDVJ7e4zagG9Yvu5r8dQn++ta9TpetC6YHzq4S-GBFEBABQ@mail.gmail.com>
From: Felix Matouschek <felix@matouschek.org>
In-Reply-To: <CAJsYDVJ7e4zagG9Yvu5r8dQn++ta9TpetC6YHzq4S-GBFEBABQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_092250_459523_AF571C73 
X-CRM114-Status: GOOD (  11.51  )
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

Hi!

Thank you for your guidance! I posted a v2.

Regards,
Felix

Am 07.04.22 um 09:09 schrieb Chuanhong Guo:
> Hi!
> 
> On Thu, Apr 7, 2022 at 12:20 AM Felix Matouschek <felix@matouschek.org> wrote:
>> The data-sheet says that only offsets 801H to 807H can be used for user
>> data and are not covered by ECC (offset 800H is reserved for the bad
>> block mark).
>>
>> The remaining 16 bytes from offset 830H to 83FH are read-only when ECC
>> is enabled, so they are of no use? Can you please advise if there is
>> something I can change?
> 
> According to page 30 of the datasheet[0], the 64Byte OOB layout is:
> 8 bytes: OOB not protected by ECC
> 40 bytes: OOB protected by ECC
> 16 bytes: ECC parity data
> 
> so your OOB layout should be:
> ECC:
> region->offset = 48;
> region->length = 16;
> 
> Free:
> /* Reserve 1 byte for the BBM. */
> region->offset = 1;
> region->length = 47;
> 
> [0]: https://pese.oss-cn-shenzhen.aliyuncs.com/pdfs/2005251034_XTX-XT26G01AWSEGA_C558841.pdf

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
