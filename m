Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32418C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:14:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB0A610D2
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 13:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFB0A610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7a0a/kfO4/sIicuFnQFFOndZdNvD+ZguxjEt08f1NU=; b=yHNAMKKVAGpZFfk44wGEAj9yfd
	+s/frrtwjaY8u8e8lcNMditE0Ag7nB4J7KhHVdDzqFQCHCfucfGccH5JCEkr19FvRhcGw+SOw/w7j
	4P8U9uNq7wEShip3CZ+LbD9yIcwKc7BJhJ/XwOaqg5KTr+SHn5HVOyESvKzTm45exIeZfEmjln4wS
	Lt6VLNBcwtOc6Z4hNdpzrbR6fE1AG/QtCHz4BnelxQAV1lhnoer2byjfJYcwWppzeaGo22Js1kQtH
	BLp4BeJLQbrRpVeQK08g6wRXdciFmADFw3Nb+fh/EB4UtA5lnTNB4QZehB/DBen5HeubCbq6z7KAb
	5W41kqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mduMS-00B3Oq-Ez; Fri, 22 Oct 2021 13:13:28 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mduHy-00B29m-HD; Fri, 22 Oct 2021 13:08:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3008F221E1;
 Fri, 22 Oct 2021 15:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1634908126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UAKxEIBXCEmiA3qQwCi6r5xb621z585jaJeiRq3CIl8=;
 b=jMMFEdHW6W8Kpa7rpKG23LiDoXl3HPQw9znJqxTS73EnMJRtte0gmYjAtApC1oDVYEG7ww
 5ElzmD1tqx7Z8qMMuwnuLLuhRMXVpyQymFJHwMnUcK99jBxJ3zerdqync54mjVUj1NuIl8
 sA6iHqqQzeMQV45dWX8+eJnrPmCVkb8=
MIME-Version: 1.0
Date: Fri, 22 Oct 2021 15:08:46 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 22/35] mtd: spi-nor: core: Use common naming scheme for
 setting mtd_info fields
In-Reply-To: <7d264652-abcb-b317-7745-36995deff003@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-23-tudor.ambarus@microchip.com>
 <4c0ac0a3efa3075e77260185767c8554@walle.cc>
 <7d264652-abcb-b317-7745-36995deff003@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9c08f234068d328dd229893e836cda60@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_060850_791911_0E78CC29 
X-CRM114-Status: GOOD (  17.77  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-10-22 14:51, schrieb Tudor.Ambarus@microchip.com:
> On 10/22/21 2:57 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2021-07-27 06:52, schrieb Tudor Ambarus:
>>> The functions names are self explanatory, get rid of the comment
>>> for the OTP function.
>> 
>> Mhh. I see, this partly addresses my comments to the previous patch.
>> Maybe it would have been better to have this squashed into one
>> commit :p
> 
> one thing per patch

well it is really just one thing, you're moving the function. but then
the function name doesn't make sense anymore. So the patch on its own
is wrong or at least it makes things worse. Also, I'm reviewing that
just to see this function was renamed (correctly) in the next patch.

>> But my main concern remains: what if we need more that just
>> the mtd callbacks assigments. Basically we loose the otp_init()
>> call.
> 
>         if (WARN_ON(!is_power_of_2(spi_nor_otp_region_len(nor))))
>                 return;
> 
> is there just to avoid setting the mtd function pointers when OTP
> region length is not power of 2. This is not an init, just a check,
> so for the moment I see it ok to have it in spi_nor_set_mtd_otp_ops().

It is a sanity check which actually has nothing to do with the mtd ops
registration. Just to see if there was a mistake in the otp info flags.

Of course, if that is not the case, we don't set the ops. But that 
doesn't
mean it is part of the mtd op assigment.

I said stricly speaking, I'm ok with having that in the (now renamed)
"otp set mtd ops" function.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
