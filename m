Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C749C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 22:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBsaxk90BNTQQMj+Y6AcLdMbRCspR5DUtU+buH6AwmU=; b=jtL3shMqUtpX5EGDEqe43ZYn9R
	Kv5uDyfuPx5j6EYaO8Kj+4OYEG8cIahAa8UHIDYpfdiN468376PA6WI0xNX6qbL5lRO7nXINdVEAc
	AHyF2ToKjJgMkLrEF7cnhlfJntffntfcm7A/BxhKf6T//39buOyZ66v/Jb3sJdbFTs8S9LC+EmlXU
	yTbwp49WQoWWj0OKtEFj87f+UD6cUc4jqAnGODsV7qR4kSpC4LahkApBb9WpQarfJXql1mzYFaQsk
	XTU77YrQ0+E4VM8yZcvE4AczmqVxBMOmOrXIXk56HKYA3ldL0stN3smjOPY82M6MTBOiE+z0ADjUx
	QEbNgq9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWQfF-009GgG-Hy; Mon, 21 Mar 2022 22:38:13 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWQfC-009Gfl-JI
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 22:38:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6F11322175;
 Mon, 21 Mar 2022 23:38:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1647902288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TEMN5oOp8pSsz/f4qOvx8LZ7Vw8/HeFkF2XWTUYxriQ=;
 b=BtjgrziDWJyVywDlXY3kCqPTQGKAeoqqVoErY5czyswMRNwE6++zFd01lSfoevNWfORAU5
 i/34WLLul0p9ATWtQxhvb+Vn0AFDBI1eMsTVPpa1dO6fTGKbgAz1/OXp5tg8JVT2C9ybC8
 g52amaC2MzGEQUgacAV4Gb8MPSeEsVk=
MIME-Version: 1.0
Date: Mon, 21 Mar 2022 23:38:08 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor.Ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v2 3/8] mtd: spi-nor: core: Use auto-detection only once
In-Reply-To: <20220321174251.ehhobu26tgoxrbps@ti.com>
References: <20220228111712.111737-1-tudor.ambarus@microchip.com>
 <20220228111712.111737-4-tudor.ambarus@microchip.com>
 <20220321121455.bpql7x4ebhq7s36l@ti.com>
 <b4e8c044-f16a-a72d-6047-c42cdcc253f1@microchip.com>
 <20220321174251.ehhobu26tgoxrbps@ti.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <148e6c16421e6a94a2ee41fa251130df@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_153810_828237_BC493719 
X-CRM114-Status: GOOD (  27.24  )
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

Am 2022-03-21 18:42, schrieb Pratyush Yadav:
> On 21/03/22 12:50PM, Tudor.Ambarus@microchip.com wrote:
>> On 3/21/22 14:14, Pratyush Yadav wrote:
>> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> >
>> > On 28/02/22 01:17PM, Tudor Ambarus wrote:
>> >> In case spi_nor_match_name() returned NULL, the auto detection was
>> >> issued twice. There's no reason to try to detect the same chip twice,
>> >> do the auto detection only once.
>> >>
>> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> >> ---
>> >>  drivers/mtd/spi-nor/core.c | 10 ++++++----
>> >>  1 file changed, 6 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> >> index f87cb7d3daab..b1d6fa65417d 100644
>> >> --- a/drivers/mtd/spi-nor/core.c
>> >> +++ b/drivers/mtd/spi-nor/core.c
>> >> @@ -2894,13 +2894,15 @@ static const struct flash_info *spi_nor_match_name(struct spi_nor *nor,
>> >>  static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>> >>                                                      const char *name)
>> >>  {
>> >> -     const struct flash_info *info = NULL;
>> >> +     const struct flash_info *info = NULL, *detected_info = NULL;
>> >>
>> >>       if (name)
>> >>               info = spi_nor_match_name(nor, name);
>> >>       /* Try to auto-detect if chip name wasn't specified or not found */
>> >> -     if (!info)
>> >> -             info = spi_nor_read_id(nor);
>> >> +     if (!info) {
>> >> +             detected_info = spi_nor_read_id(nor);
>> >> +             info = detected_info;
>> >> +     }
>> >>       if (IS_ERR_OR_NULL(info))
>> >>               return ERR_PTR(-ENOENT);
>> >>
>> >> @@ -2908,7 +2910,7 @@ static const struct flash_info *spi_nor_get_flash_info(struct spi_nor *nor,
>> >>        * If caller has specified name of flash model that can normally be
>> >>        * detected using JEDEC, let's verify it.
>> >>        */
>> >> -     if (name && info->id_len) {
>> >> +     if (name && !detected_info && info->id_len) {
>> >>               const struct flash_info *jinfo;
>> >>
>> >>               jinfo = spi_nor_read_id(nor);
>> >
>> > I think the flow can be a little bit better. How about:
>> >
>> >         if (name)
>> >                 info = spi_nor_match_name();
>> >
>> >         if (!info) {
>> >                 info = spi_nor_read_id();
>> >                 if (IS_ERR_OR_NULL(info))
>> >                         return ERR_PTR(-ENOENT);
>> >
>> >                 return info;
>> >         }

+1 for the flow. But is it correct that we just ignore any former
error and just replace it with ENOENT? Should we return NULL here
and let the caller handle the translation from NULL to ENOENT (and
keeping any other errors)

>> 
>> Here we miss the IS_ERR check in case info is retrieved with 
>> spi_nor_match_name().
>> Do you expect spi_nor_match_name() to ever return an error? As it is 
>> now it doesn't.
>> I'm fine either way. In case you want me to follow your suggestion, 
>> give me a sign
>> and I'll make a dedicated patch to move the IS_ERR_OR_NULL check. Will 
>> add your
>> Suggested-by tag.
> 
> I think it should be safe to assume it won't ever return an error since
> all it does is iterate over an array that is always present. I don't 
> see
> that changing in the foreseeable future either. So I think not having
> the IS_ERR check is fine.

But what does it cost to just add the error check now so it won't
be forgotten in the future?

          if (name) {
                  info = spi_nor_match_name();
                  if (IS_ERR(info))
                          return info;
          }
          if (!info)
                   return spi_nor_read_id();

          <flash model check code follows here>

And then let the caller handle NULL and translate it to ENOENT.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
