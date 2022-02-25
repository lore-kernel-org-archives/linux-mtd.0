Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D0FC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrQ9jwI97FLLRvJPDe35/hdDNDOixOAH9BzBd/d3WBc=; b=iD1tjFG7XMuA/L6ESmTP8K9vWS
	FNf8eIVcufDjObcWyCSw4PcTAV87WTRjif5vUIG3z9un9LT2mNEnEzooRIRrK0CCPO8b0Z3KMSZf+
	HCrtAjY92AP8FwtZX8+yZKDNrf4Rg5odONZKwwl0weH7uDawAC8shYlOPSM/DeIZB/ZcWWER6vFW+
	IqZXCPf1F3hZKdDis5sOuKha2RWZ4/mLEsyLJPKAtUB5nSbSOzH5T02Xk+EhB8CYqnn5WOo1Mt6yI
	EGP6tGrgAarna9pZgf/KtlalJn/KdqASojKqa4Bc7kQ23xHYiZmwkLOPIap83+QwwZaM+kfuGyo3E
	19lnE6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNcdx-005dIv-Ck; Fri, 25 Feb 2022 15:36:29 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNcdu-005dFk-5K
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 15:36:27 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1ED062222E;
 Fri, 25 Feb 2022 16:36:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645803379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0Um098r4StpC9E3GpfYoclk0Kr7F8+yFe60ER/u4MU=;
 b=kZjKi9Ss5c0QGn8M4BR52N3J5Ggy/qT7ZsDuoYegIYjnjR2xf1eb547EslZm70hfhXjZmp
 7LIpkB3/bkS6Q0yfyfUUd6u6TTSWF0BacizP9fvTpHrelXdOwZvSvOdclIKseun8BFyQSI
 W2ndR0Cp3HuFeCnHKt8dLeuuxg/PR3c=
MIME-Version: 1.0
Date: Fri, 25 Feb 2022 16:36:16 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 yaliang.wang@windriver.com
Subject: Re: [PATCH v5 26/32] mtd: spi-nor: micron-st: rename vendor specific
 functions and defines
In-Reply-To: <3bd0bfad-7f04-a972-0f65-21dea2173dd7@microchip.com>
References: <20220223134358.1914798-1-michael@walle.cc>
 <20220223134358.1914798-27-michael@walle.cc>
 <3bd0bfad-7f04-a972-0f65-21dea2173dd7@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <7f3ab0cc9115f15f1cfa85e7da13d56d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_073626_382902_5A6A537C 
X-CRM114-Status: GOOD (  12.00  )
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

Am 2022-02-25 15:03, schrieb Tudor.Ambarus@microchip.com:
> On 2/23/22 15:43, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Drop the generic spi_nor prefix for all the micron-st functions.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> Tested-by: Pratyush Yadav <p.yadav@ti.com> # on mt35xu512aba, 
>> s28hs512t
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 18 +++++++++---------
>>  1 file changed, 9 insertions(+), 9 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/micron-st.c 
>> b/drivers/mtd/spi-nor/micron-st.c
>> index 1a7227594bf0..8a20475ce77a 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
> 
> you forgot to rename the macros, as you did for xilinx.

Sigh. Actually, I didn't rename the macros at all (except for xilinx,
but that was already way before the naming discussion). I couldn't
come up with a good name, so I just left it as they were.

TBH, what was just a clean-up for the ready function turned
into a gigantic patch series and it is very time consuming
(and frustrating) to respin it just for renaming. We shouldn't
aim at perfection for patches. Minor details can always be
fixed later.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
