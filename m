Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56134C77B71
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Apr 2023 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjHA4OeKFCJzYy1CLlwKMrk1Oe/WlvnraCns82zfGEs=; b=uooLB+Y8Q6aTb8
	FY6IeTUkdwroYRxU9D79Clk5MULek5OkSSy28eJ1HyoaMPWXrpeeT0K52YyApXpw0obr/k1cPIWRA
	7UXAwN4lZidUEjZKW3RvT3j660ZjoDVIi9cTDlJJoK04FkeSXt82sK2uyVcwV/rRIoz8upfeR2U+2
	+fUAVUG9LbZuKuxkPSIGdl/KucDz9ak5h8EeAtwPV+mNhdgMRiH0DMHlKBMA1HyzqDncKiUmnGEqG
	+c24zmr9uGWKCjMxAATk4KjHtF3mDXQe7LI2Cy5dVBFl7xEeLZPkcYnaWEnZ+kbOKo/FBVz1cAqgw
	92ljJ5WBUqetv+Izke3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poiWb-001eGx-18;
	Tue, 18 Apr 2023 10:25:25 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poiWY-001eEO-0R
	for linux-mtd@lists.infradead.org;
	Tue, 18 Apr 2023 10:25:23 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o6-20020a05600c4fc600b003ef6e6754c5so13248198wmq.5
        for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2023 03:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681813517; x=1684405517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRqUGTAUT3kQ+E6yNjWLD4fpiwu8oVq8M4urP2QVpno=;
        b=o2vFL8/ONjowdEfYbIyg6ASxTZ8DpDZrhA56l/nuCEIaWBSnH8fFn5Ar867nK4DrIS
         poVNqXS5Ib0b4eiCogZ5qviwEKwXDxNcVLXgNWgjgwroUN1ILZl6T3OyKrJba6JDTPWk
         QQhUb3Ta+zN/NVn19mrhREL7cOFEuNJkb69t1LIFCJUAWuzn7qv6A8e0ChA3xNiiNhTC
         RqAGa1ZhsQbuK/InYOAjMQI5IgOAL4UGRyb3g2M0mHXDhlKI3LDPpg82N4rls0rgP8RO
         ez3Uem+kWUMuWNkzCK6rYeb89rgM6X3thHmh3ggIXRn/jJHcoF+XfZJRr+nRyLoBLj2H
         qZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681813517; x=1684405517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRqUGTAUT3kQ+E6yNjWLD4fpiwu8oVq8M4urP2QVpno=;
        b=dFPkSQAmnZ7ZFfMgVM+3bOB62tf7Qax//bDy0i4nbOvmJ2WqjN/l35TP1NP/QXhvlr
         UJ3GaUiS8OHUYnH5VOVbo4l9hlvcxy/kKVjMlTw9o03SKbNN2C+powslECp9z0NxKL68
         nlEbNAyZFJgETNQvq4QcbhQ7CP5EOQDL3Q+MIEaxRPMf/a9Gb18evd2W04yxeJSm+a6g
         ShgncnD0qj3Oj+wuxOrSfNmlBZ1yMLeAB6Q2CJLmixkqKZkj7aZCkeKs+Wm/N8rGzWnD
         1kLwxzSJU9Nm6lqrgSnl1KOifG8/wAUCnIvIbDEQ5AFLGWdUa8+ZE/Zm9iW4nm9gSOo0
         2gbA==
X-Gm-Message-State: AAQBX9ej5t/TNXGXVa2h8Q1MteKl2ao7rq3Gb6PiM4Pxq84btJ6EVW4G
	C++4d81Y0G+n5OxZKV0JUc01Hw==
X-Google-Smtp-Source: AKy350bDXZYjCfKhVSKYmNNuhmjzU+SC1gQXyto6PuTk5yAclQsn9JdMOQN+bjGZbtBsW3b3Vkhpmg==
X-Received: by 2002:a05:600c:364a:b0:3f1:7bb5:9d77 with SMTP id y10-20020a05600c364a00b003f17bb59d77mr248059wmq.38.1681813517389;
        Tue, 18 Apr 2023 03:25:17 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.230])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c155000b003f177cda5ebsm2423589wmg.33.2023.04.18.03.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 03:25:16 -0700 (PDT)
Message-ID: <0f769bb7-ed66-8399-657a-b0dd39334722@linaro.org>
Date: Tue, 18 Apr 2023 11:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] mtd: spi-nor: spansion: Rename method to
 cypress_nor_get_page_size
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: tkuw584924@gmail.com, Takahiro.Kuwano@infineon.com, pratyush@kernel.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230405060456.48986-1-tudor.ambarus@linaro.org>
 <736b881c4dd3d0fb0522ab0d385798f5@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <736b881c4dd3d0fb0522ab0d385798f5@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_032522_177959_39AA696A 
X-CRM114-Status: GOOD (  14.91  )
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



On 4/18/23 10:29, Michael Walle wrote:
> Am 2023-04-05 08:04, schrieb Tudor Ambarus:
>> The method queries SPINOR_REG_CYPRESS_CFR3V to determine the page size.
>> Rename the method accordingly, s/set/get.
> 
> I'm not sure about this one. There is also a
> cypress_nor_set_addr_mode_nbytes() which queries the flash and
> set the params->addr_nbytes and params->addr_mode_nbytes.
> 
> cypress_nor_set_page_size() also queries the flash and set
> params->page_size.
> 
> Secondly, if this function is called get_page_size() I'd assume it
> doesn't modify anything. But thats not true.
> 

Indeed. Maybe I should have returned the page_size instead or don't
change the name at all. I applied this patch as part of
https://lore.kernel.org/linux-mtd/168093614108.51189.3153773628255664983.b4-ty@linaro.org/

Feel free to send a patch on top of latest spi-nor branch, otherwise
I'll handle it after the merge window.

Cheers,
ta.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
