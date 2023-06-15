Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9EEEB64D8
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 01:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rO1dA3AvX2Po3vp0y429W7295nlQfsCA/GVywjxGoQ=; b=nrBlylx9zmfOyL
	83j+xpfra630qxig1HU1/qnnjVjDLzDw6LbtEoypFxGx2vxak1q1j1PAxBcwfVRUEWTbH5nu2anyN
	o0M6wdDgXMCoGEqG8LGU8e70lAmMr6xnscgTY/qHkrMC/cJMAziiXIT2RHuxGhtibo2Z0MBdrJzRV
	gw3j+DSaaZxw6GqfkpujsXrNBj8jcUxmY9B6y5zvLbHmiGivZQjQvqaumhzxa4/QOwwGoM23NUGjx
	DchYkCZ0OwT2gnNQ2ksnKHTRMOXreNif9+SDDzJ2ykRuLmvS27Lg0vjMiCDpfTIQcCnihrHmYAYks
	Zky6KPHF7auNM+P6gD7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9cDx-00DInu-0k;
	Thu, 15 Jun 2023 01:56:33 +0000
Received: from m12.mail.163.com ([220.181.12.199])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9cDt-00DImu-2D
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 01:56:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=CCG05dD4INRPTANzctOkoiunfbfjsGyxE9kDgsOov3c=;
	b=GDZQlqZARwUisqMrf21y83AcL0WJp0ej/tXCkpNaOMR1uv31G8vGVWRyqVv0uC
	LcFGpjBBuJHG8lv9ah9vSfzlmz6zqaLzBiL1yxAUdTgOysPhgbNJ+W+3wMHLxyVA
	wgGQ4ffwUH/kzqDO+QZlMPhU4eSCdU41ZXqW9gN7CAL6c=
Received: from [192.168.49.70] (unknown [119.123.76.184])
	by zwqz-smtp-mta-g3-1 (Coremail) with SMTP id _____wDHLdyrb4pkwyVSAg--.57803S2;
	Thu, 15 Jun 2023 09:55:56 +0800 (CST)
Message-ID: <5b092faf-2e06-baf8-d3d7-366054d5e0dd@163.com>
Date: Wed, 14 Jun 2023 21:55:55 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] mtd:spi-nor:Add support for xtx flash
Content-Language: en-US
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20230601102238.948177-1-bruce_suen@163.com>
 <60cea62991520f98d80af0382e43bff0@walle.cc>
From: Bruce Suen <bruce_suen@163.com>
In-Reply-To: <60cea62991520f98d80af0382e43bff0@walle.cc>
X-CM-TRANSID: _____wDHLdyrb4pkwyVSAg--.57803S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1DZFyfWrWxJrW8WF47twb_yoW3AwcE9r
	Z0qr9FqrWq9ryUWFs2vw4xAry5Gr4rXr1Uur1xK3sxJ345ZrnY9wsrCry5Grn5tr48CF92
	va98XwsFy3y0kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbWCJJUUUUU==
X-Originating-IP: [119.123.76.184]
X-CM-SenderInfo: 5euxuvpbvxv0i6rwjhhfrp/1tbiWR+PKFWB0A89bwAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_185630_122383_C01C1512 
X-CRM114-Status: GOOD (  10.24  )
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

Hi,

Thanks, I got it.

I wonder what I should do if some parts need special bugfix ?

On 6/13/23 03:38, Michael Walle wrote:
> Hi,
>
>> Dear Maintainers,
>>
>> This patch add support for XTX spi nor flash.
>> Dadasheet Link:
>> http://www.xtxtech.com/download/?AId=449
>> http://www.xtxtech.com/download/?AId=267
>> http://www.xtxtech.com/download/?AId=426
>> http://www.xtxtech.com/download/?AId=445
>> http://www.xtxtech.com/download/?AId=274
>
> Link: tags
>
>> Signed-off-by: Bruce Suen <bruce_suen@163.com>
>
> XTX parts seem to have SFDP tables and they should work out of the box
> without any patches with the generic spi nor driver [1].
>
> -michael
>
> [1] 
> https://elixir.bootlin.com/linux/v6.4-rc6/source/drivers/mtd/spi-nor/core.c#L2019


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
