Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7C1C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jan 2022 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cCuJJE4tGYcJJUmLsRPz1f9Jsj6zhGrbMktcSsv31FA=; b=WnB93XdaPPfC3/
	DNRahLZVHwCQeI5qsYQ7bAy9G1TP3v6ndDBwAzwSKKE0K4/8GVgW9kgTFclo/C97I1TXuIovwlcbS
	wqBlcyKLFSSEj6dGM6tCrY5voeqheZZpagfvitZHqB22jUbcS2/jshMNKhqsQlD/ReHYJv6EVm+pW
	3Db6qSUoQGweeUsUFRFstnqIjgmT2RAAIMphSp8OXY6buC4B59fx8pQvnyvaQOz++qWi9/chzY6Tf
	IfZv6iXF1MnKFjTvS6AhEIM09qBSves+oPfVtYqRgZEDKIH+1xo+37eY20aPoq0cWpLRSnPxoqxrT
	9j8Bqhj+7lb9rkCsReYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD94g-00GmrR-KB; Thu, 27 Jan 2022 18:00:46 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD94c-00Gmr9-0K
 for linux-mtd@lists.infradead.org; Thu, 27 Jan 2022 18:00:43 +0000
Received: by mail-pl1-x636.google.com with SMTP id c9so3120008plg.11
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jan 2022 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QCyINIrgT7Ex33G6b3ru5obxbrD7IgNNP5oMlpnX+sY=;
 b=S/YWMQm1I4t1Og4svi4tIBpp2mIQp9l6xUipNAxK/rz5yPWIg1W2/uPdkHSMfW9iTN
 76slAPAqCeRVmo//fs3eRoRoiPkvYHcmcYc63VdUmsUUTZ9IYphDWr9bkLDt2dszE0fY
 ttFFI2SB+/V+7yaGcyEm18KMh93PX2myz4SZcJ8nsV3vWBU+8zxgSUZ1Jhf2MyMjlWKq
 fCY8kg23A0ExLHyzsMlQQDIpQCTy7EEfuYRDkXSGvtUuaBftHMPz9/esezKxpTAyk6mY
 tzMb3wfQh1EQkB8Y+BfRxNsKZGzNQuSjLy3ETrIQxOAmHpBuDousjfNO8o2foOa0URzW
 gKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QCyINIrgT7Ex33G6b3ru5obxbrD7IgNNP5oMlpnX+sY=;
 b=GXqIwXFllQCOSiPhbKTYARzEtfmax8c60YXG/qgUh7W5yUhLVySHmWA0MWiLYxoV22
 cE5nflpczFM0E7jmLpkDu9q49pezcyZlOzBH5eojTQHOCHiIYFoOkQxnioK073oO7oVf
 m+9G+itezeKyXm75tWCGQHbEJ6VxibShFIhHtw4Mrxq4nLVoKTs/Uxi4/tqOYZk5WIfc
 yQBoYxKcS6I6dR8vA3NdYmi8PBCFC/dF6p19aVWupjzpjSuNKgjw8B2vzhLD71b6/2Ct
 2GXz0wyi5Q+c6mYSvDHja/SL93KY11g3WI7tUt9Ne5Qffyk9YzMsYOPAvl0Ab2zv8oHU
 JnxA==
X-Gm-Message-State: AOAM530vwCdEvHRbmZ7d2jND5gpXkapJzNUWLHd9XpnpUOr9z5FG5z/2
 1RLEzfaMAZHbUe+392LIs2E=
X-Google-Smtp-Source: ABdhPJwrPagVG42wdqIwhZAjJSoqBoX/Ub6x3RMk3b1TIlQUjHAmsVDBItGuOztlRKBHRKOgqzLYQQ==
X-Received: by 2002:a17:903:2301:: with SMTP id
 d1mr4336452plh.26.1643306440819; 
 Thu, 27 Jan 2022 10:00:40 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id na5sm2626pjb.23.2022.01.27.10.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 10:00:40 -0800 (PST)
Message-ID: <4f08a49e-2c55-80ba-2072-51d47798e360@gmail.com>
Date: Thu, 27 Jan 2022 10:00:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mtd: rawnand: Fix misuses of of_match_node()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
References: <20220127110802.1064963-1-miquel.raynal@bootlin.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220127110802.1064963-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_100042_116855_22938907 
X-CRM114-Status: UNSURE (   7.89  )
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



On 1/27/2022 3:08 AM, Miquel Raynal wrote:
> On non-OF enabled platforms (CONFIG_OF is not set), of_match_node() will
> expand to NULL. The of_device_id array pointed by the macro will then be
> left unused. Let's mark the array __maybe_unused in this case to prevent
> compiler warnings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
>   drivers/mtd/nand/raw/atmel/pmecc.c           | 2 +-
>   drivers/mtd/nand/raw/brcmnand/brcmnand.c     | 2 +-

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
