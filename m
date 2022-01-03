Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3743EC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jan 2022 17:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ix5Q6gOCQa0O309GyW73pGQEDCdoUGtdP1UHxV5rJW4=; b=JhEhK+iG4ZjGu2
	V6wKtvq5mbylNQPGmPUYjHJO5RC4kwh3bmVyFjynv/sLiUnRnIjbCE5MVYFSKhfvgbOkxYtt3+kJ/
	XDcuWbAn7U61C7Y8G3VdvAt2PK8AxFc41MXNVAWAgk7iwg8ggIL2DDHffVDcyYPqZZwwuGKcaAaIr
	3t1ncG6K7rQmFGeqHXYa3nlxziDzcafAe71D55U2p2yo57hu1Sy4aka/tWxSOaMkO6F07kXZqJAT1
	Quhq1oKPbwq+N+y2ybOcMrBQWzVj/o//bxaTIw1NUV637UNQidOS33aKGEmXQ7scKF4ICg+rIchuu
	tqh9LatlUi5uDfDNBL1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4R8R-009fXj-Lf; Mon, 03 Jan 2022 17:28:39 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4R7w-009fPu-8k
 for linux-mtd@lists.infradead.org; Mon, 03 Jan 2022 17:28:09 +0000
Received: by mail-ua1-x934.google.com with SMTP id p1so36841491uap.9
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2022 09:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PYGbrhrQYdiiSYIr0MXbuo0UU4USUTz6W+z6yxq4FV4=;
 b=BnZOr5EU2lrKnxSQmroAAnfq6BcslDRr2J5u3MctuVOdiaJVPVhfDuZVLIowJcd7AP
 iMcS7BhWGfWVqvqOURttEr9A359GHzprrxoLFo7MhWGYomSBrsFfFVJcF+zu09hqFgF+
 VPNiJR/4/gEN/6cLIFabbwQOgL883J3z28RJuZPDI09R/Wm1q87XJZMcrbO2yFWyufzN
 HF5MB84rHskI35EkAuMSOhIClhVvzErUlBEc8P9yKE3zyYjmbRAZBefu5oGf9OW6vwKo
 JyLczSQlRVPLpFEm1MAxwj0+HsOYsN8K3+KytAhcgynmKjd/XkyuvCxmDqchbgTzFb1Q
 p76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PYGbrhrQYdiiSYIr0MXbuo0UU4USUTz6W+z6yxq4FV4=;
 b=Gr1TVd+EwPtLRmFkZT6bhizkCGwpUv2UXGlkJpUW4J5K9qeyjgeGdpOEyUNezBxR0T
 4/4DjAxKjSlu/Qgx4tXsX5jLvsxZdDDC3jY7pz/ycVUpKvjPfeAYkuGr8ag9DAuehYy9
 UGuXY0imDlgJVeMLaOpe4/KmSQxToAbszm67V98+LRaXt0oN/ytfTMqlN8ta3QvIT0T5
 4VhgaOF0hKOzmMYHsOwvMsaxONVefTuiUdDT1PmP/fuUEBFpFtN78Ao9RXJEKPnvC+4r
 +JEavrpAeHPnZ9uE/LV2IRHmT+yaBEdaQYy0k+8JTZ88Q0RHI1dZ5IPt2DDWxYWnPgkf
 +XdQ==
X-Gm-Message-State: AOAM530mzIx2RR0y+a1qFY5DcgpEZ2e4X3LVN5tw/NNNp9l7zSgLTwvn
 LP+e5p4okmncKlzF588gIis=
X-Google-Smtp-Source: ABdhPJx2RSQhS+KuqJ+EMKRyl3I/xAbCf0zk5fLf9kfioM02gpzSAtHML+uEAGGas4nMSNqtZuqPCQ==
X-Received: by 2002:a67:c81c:: with SMTP id u28mr14740609vsk.71.1641230886268; 
 Mon, 03 Jan 2022 09:28:06 -0800 (PST)
Received: from [10.230.2.158] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id h26sm775182vsl.21.2022.01.03.09.28.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:28:05 -0800 (PST)
Message-ID: <ca7eae05-899a-7805-6e6e-9fbdb2b83dd3@gmail.com>
Date: Mon, 3 Jan 2022 09:28:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 9/9] mtd: rawnand: brcmnand: Add BCMA shim
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu
 <kdasu.kdev@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Cai Huoqing <caihuoqing@baidu.com>, Colin Ian King <colin.king@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA)"
 <linux-wireless@vger.kernel.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>
References: <20211223002225.3738385-1-f.fainelli@gmail.com>
 <20211223002225.3738385-10-f.fainelli@gmail.com>
 <20220103181225.20a60d82@xps13>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220103181225.20a60d82@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_092808_347442_CCDF9BDE 
X-CRM114-Status: UNSURE (   8.99  )
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



On 1/3/2022 9:12 AM, Miquel Raynal wrote:
> 
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_AUTHOR("Braodcom");
> 
> Small typo here :)

Whoops

> 
>> +MODULE_DESCRIPTION("NAND driver for BCMA chips");
> 
> NAND controller driver, I want to enforce this *controller* word
> because NAND is way too vague and refers to nothing specific.
> 
> Plus, it's not really a controller driver that we have here, more like
> a glue interface.

Certainly, thanks!
-- 
Florian

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
