Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CDDCAC58F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Sep 2025 07:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jC1zm8yQ4li1X/eNp8J67Vf5IaQ3+P5FLbrodcRGYHI=; b=Zpw2aSa63coUba
	PVzMFRdNp1K29p7wvAOFb59HzMa0eDWdlmJPgJpqkvx9aUZRreh3qC7wm8d+czUhjP+FLBWuGjUqN
	reAqm0mcW/lRKChEIvkOvMlVkkr/DHbRg9vy7G5nQfFJy7n6CYuHISe3ppmzCcsDOWLi6/l6g3zxW
	S0+OP9AMGNgJSzUmHpItZfe7kXv3wpGp2PyjrwH2468hSmwgis3lSg5mXayMavsW1HyDw4FfNJ4sK
	Yk7XXjSzhKuaHwTZkOoMHYd4Y8UxNTuDklEuLIPE5XIJNCiYI1cL4L+FFQxcPjoNhEE6mrGdNepsz
	LRrATEFnraNPmRVlq0jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3qE-000000035bd-47Jd;
	Mon, 15 Sep 2025 07:41:38 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3qC-000000035az-0Fk0
	for linux-mtd@lists.infradead.org;
	Mon, 15 Sep 2025 07:41:37 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58F7fFhw1510294;
	Mon, 15 Sep 2025 02:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757922075;
	bh=tEdZqpOd0p3VvYV6uzHABPpFXlZefqk+wQsFnV5+sps=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TQijDgckIKgT9uwCLGaAqmDcdrBruQN11rlXEFDUuw2T0tih3c4ergAM44IJ6lPu1
	 HP79l0Ed+nbXalOBG+0lqg5eQw4cb1owQbPJProSmPOJ58Y/qjtWq1XOScakMbenBQ
	 ZZx2s9ngiJbH0ONFIi/y6cLyfP1jDvzlPlC0bbtk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58F7fFJB3789550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 15 Sep 2025 02:41:15 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 02:41:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 02:41:14 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58F7fAFY3366317;
	Mon, 15 Sep 2025 02:41:11 -0500
Message-ID: <9fec8944-3bcd-4f89-b7d4-c5f5f9d6c185@ti.com>
Date: Mon, 15 Sep 2025 13:11:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: spansion: Modify addr_mode_nbytes for DTR
 mode
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
        <tkuw584924@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <praneeth@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
        <u-kumar1@ti.com>, <s-k6@ti.com>
References: <20250904131309.3095165-1-s-k6@ti.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <20250904131309.3095165-1-s-k6@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_004136_236541_D7842EE5 
X-CRM114-Status: UNSURE (   9.37  )
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

Hello Pratyush and Takahiro,

On 04/09/25 18:43, Santhosh Kumar K wrote:
> The nor->params->addr_mode_nbytes parameter defines the address byte
> count for the current addressing mode. When transitioning between SDR
> and DDR modes, this parameter must be properly updated to maintain the
> correct addressing behavior. So, implement the necessary updates to
> nor->params->addr_mode_nbytes during both DDR mode enablement and
> disablement operations to ensure address byte counts remain consistent
> with the active transfer mode.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
> 
> Tested on TI's AM62x SK
> Logs: https://gist.github.com/santhosh21/8d69756bd54605d79086b00850e1083a

We were facing write and erase failures in NOR flashes without this fix.

Failure log:

root@am62xx-evm:~# flash_erase /dev/mtd6 0 0
Erasing 256 Kibyte @ 0 --  0 % complete [   33.078034] spi-nor spi0.0: 
Erase Error occurred
[   33.086178] spi-nor spi0.0: Erase Error occurredock 0 (mtd6)

         error 5 (Input/output error)
flash_erase: error!: /dev/mtd6: MTD Erase entire chip failureTrying one 
by one each sector.
              error 5 (Input/output error)
Erasing 256 Kibyte @ 0 --  0 % complete libmtd: error!: MEMERASE64 ioctl 
failed for eraseblock 0 (mtd6)
         error 5 (Input/output error)
flash_erase: error!: /dev/mtd6: MTD Erase failure
              error 5 (Input/output error)
Erasing 256 Kibyte @ 0 -- 100 % complete
root@am62xx-evm:~#

But, I just bisected and got to know that the
commit b61c35e3404557779ec427c077f7a9f057bb053d
"mtd: spi-nor: spansion: Use nor->addr_nbytes in octal DTR mode in 
RD_ANY_REG_OP"
fixed this issue. My bad!
Lets drop this patch.

Thanks and Regards,
Santhosh.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
