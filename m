Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8865EC5AD5A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L50TQxo8fH4uOs0TU8FQZv6b63YRxD4SC1GXZHAMLfY=; b=nuon5sJT2IcvmX
	FVGdwBNER/PmvyIAcHbCJLFAbg3ycqx2p7rgc4HoTyUjtcEeJkPuOprPWA/HE69JuRmvyjXyTzXYb
	+qkBNTt8pGohnJHfbQnhJU0WMK7JJKFR4WHqkEF9R9N9yN/jfzagfS8YqOrVhNzYnXmliR+fqWSwg
	t7NaUdvkLQvmELeNvS1xaGtPKkZ2JfHe78j0jOhlUJsXLn3vzOdYHZ2MbyvnhVrSkNwU4iSFDZ2Tc
	kfgAhIFeop1eu4ZSvop/VEGzp5FUjcyNLgW2Yqk6AJXA+GKNFNtxy/hD8bXVBkd6NpLHSeLi3K8ca
	JZvN7IGz5MVAl7vZhWjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5Za-0000000FoEh-1zk6;
	Wed, 12 Aug 2026 09:48:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5ZU-0000000FoCY-2qRB
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 09:48:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so3775345e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 02:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786528107; x=1787132907; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cgAavsMPfj374Y2O8g0TeLMK69exN+jOmzYmrQT4dPo=;
        b=jdT3Gk4GT9wB2axPow6KmsNz36dMqhKigAVIGHIlolB/s/CNk4GOulF6cyeYYsc8J/
         /JVFLZEEB8AhDsswmcUFpZV3RmX1dfO6a+6Ohb7z2db+Jg2O+uXTk4Af3XcauW2K5rw9
         KjEps19d2B4HfLzleIlEkHmLwm/+dbTbMrQSKZ1MwFz7QxTssOOoLtzmlpGyAU1LdaOj
         XY/rY4MwiFAhb931KmqUpkiKrSsw79eweILk5jSBrAB+Op+RUtkTMgrMlM0kxVpmn9iI
         0RcvnGewHpZEaLOndo6zM9wmFMi9WJl0TJ+Oe3C3MGVizOOuZ8kKmH6H4/6IFSShQxJx
         GR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786528107; x=1787132907;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cgAavsMPfj374Y2O8g0TeLMK69exN+jOmzYmrQT4dPo=;
        b=VbFlRS6g67krfNvtP5i/PlH4QRcE5bQcPEum1O3rz4iOctPI8am98C7dQbnETKzO4y
         A/4p7BHGXjCMC95ocWzGJrTQtViPe+U9i992YKSUhJ+TI6drBi7gXCcfF0s/4cVmpWPl
         VNOaggmIE7dNJZwYMlMidfRM2n0Flq3O+FgcGN3KHGgpvTT9IzRi6GZaXY2u9NnAVJCM
         08QwVpGiiBn+opjC/+4F6MYnMhBjsO1yZ/uQvWO/IvjjFjp1VroyAuFy3Ix2gotCTlxZ
         ct4nF1haIfiPZkBXZJItMaLx+NN0sJmymH9QStmJvKabK6WEak9QSc7DmpdcqkZEFtwy
         Bqyw==
X-Forwarded-Encrypted: i=1; AHgh+Rp0G8oYwab1dYAf8aBTaYMX+gJizfS2PPf0VUoWvlWY9SWOVlSyGK26QK4/CAJCvkC50TO2+1+M2Ag=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO/9XCK1n480xs9UEp6/XIjnsQIjZZsKtVMBcH59HbNwvaAKXi
	TJi6VoygI20ipigIebQ6y/jNwHcNuX+sCVIaNsy2uH6lNnGy1gCtmTO1cTfgArpNt6cv5IkdjU+
	pVKxcVOg=
X-Gm-Gg: AR+sD137Ny/HakDzblx6PaE7Ian455AxCkXu5MecCZ8X5ezPSDvAkYhGGSBm8MipF5p
	KjAF5YP7ldktBcPkOrHeUbAKnqRJZCdwklAknpSjZdjLpwEgPOp3ytCBzZ2JvGsSrL2h4reveFw
	Q4Oqf51rYJmp1xUniFWFoy8qeZxlRZDVyNSjt3baePtxX9NSC5CS5Hj9wSFg5nwgiuYXG/xn7Oi
	ohQEneV2SThS+GSl4ATCS6Hxdv1Wc1c4t9jD/2XnyBhMdUwbEg7QpVip4Do7rDlf4V0OfJvlRyi
	+vkxcQRxLHJ+f4piLHhAnLW8rHefttfZ6pxoGew3lSrbb/8H+j2oGpdv4P1GGAavEXV71OPTujc
	MhpCa/RNrKf/Lm6aypgQPOSRP4qP0H+BVz+xjCRn/4A39zAU6mbPju4VvSZVzuXlREYeYe1aV10
	dtt4/F3LrnR4wD/07AJsASM5lzDakxYfbiYLdchyOziWnOs5ZBigrn4MyHr9ANjjKbehZfNoy3b
	UbniSjv
X-Received: by 2002:a05:600c:8b75:b0:495:4fd4:619b with SMTP id 5b1f17b1804b1-4997c0d7775mr54602815e9.1.1786528106684;
        Wed, 12 Aug 2026 02:48:26 -0700 (PDT)
Received: from [192.168.0.252] ([79.115.63.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d4c10asm5835562f8f.20.2026.08.12.02.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:48:26 -0700 (PDT)
Message-ID: <754d6dc1-1993-4fe7-ba45-31d02f7e7a0d@linaro.org>
Date: Wed, 12 Aug 2026 12:48:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: scope the exclusive RWW lock
To: Michael Walle <mwalle@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, stable@vger.kernel.org
References: <20260809084223.3596259-1-runyu.xiao@seu.edu.cn>
 <DKL4CBQNKCO2.3NAZ6S25Q60XN@kernel.org>
 <6e208a8b-da11-4ba1-adfc-f1e80c891310@linaro.org>
 <DKMQSZRM4QEZ.2EXQD5U58EVTI@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DKMQSZRM4QEZ.2EXQD5U58EVTI@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_024828_731291_C0D6F02C 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 8/12/26 9:14 AM, Michael Walle wrote:
> On Tue Aug 11, 2026 at 12:05 PM CEST, Tudor Ambarus wrote:
>>
>>
>> On 8/10/26 11:25 AM, Michael Walle wrote:
>>> Tudor, do
>>> you know why you've omitted the guard() in spi_nor_rww_start_exclusive()?
>>
>> because using guard changes the behavior of the code.
> 
> But that commit removed the mutex_unlock(), thus keeping the lock.

oh, the horror, indeed.

> That wasn't the case before the commit. IMHO the Fixes: tag is
> correct.

+1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
