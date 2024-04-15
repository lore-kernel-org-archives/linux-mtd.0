Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F947C4345F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Apr 2024 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NDZ7b8fd5AteS1pOGXDQn1dJiZJFefW24sV+3KjNSw=; b=jRzbTQRO8sM4NB
	ZVEuoo+c5VHzwvoCBrWmR8MLiGaC+Das2vn/B/Xw0ZLaP50itxlaOyGQRYdo7FSEbay+1vgcgEOa5
	DJCVY10qALrnjJUSEuyQxPv6F5GiZESX7Q2+ev81KV2x2ZxP/MF17yZ4e8sI2fO2xkmLeXVhBEmfA
	9eJMpi4Z8m2WPSSTqpu2pDs+cPOgqPoqO64XuEPS/fSlK4q3sSz0/WMsktnSKIcyf2OA0a4s2W6zS
	qyftcwn74bM1qYK9sDKMf8W/PqkwHtoampvUVUgpVVEKczKLO1NIsa6QG8OcoDm3ccWEm3j1+2bm1
	Bs/55Q3o3ZwgveLlVYDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwODv-00000008skU-35vN;
	Mon, 15 Apr 2024 15:26:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwODt-00000008sk5-2q2E
	for linux-mtd@lists.infradead.org;
	Mon, 15 Apr 2024 15:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 614F960E86;
	Mon, 15 Apr 2024 15:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D21C113CC;
	Mon, 15 Apr 2024 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713194780;
	bh=c5A2ZbFFlaMWCo1btByGYDCqOF3ITNaXb24+w/6iX1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PVMtViJ1lUVqr4hJO1GaQV5frmWssd3EVGySDFeIvq3f0ms/PpMHxtOHS5sVGKT7B
	 7bICcbk7Znj904jgQck54gQEf9SKYhXLqZaOLcNaueJrzdtI8cz0Z77eyHMP7t5arf
	 G1PNYYZMS3jQHzYE8lfvZ5UnmWEKhlMkicNBqy/l63PIvy7zEWPEyaxf2riTM6UZFZ
	 KJmaws70LCvXqrnZtHKG7u+m195ROdk7HVU8RFKww1339z5dWZHTN/OET59c/QZ+tc
	 vued91MarqPEILWfD7TDZmtRX0tCmuvbmKXdqAsePWo0koZt2SfQTmvHY1c8rR/a8Y
	 gocwDlyZYg6Tg==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v1 1/6] mtd: spi-nor: Remove support for Xilinx S3AN
 flashes
In-Reply-To: <D0I76PPKBWF9.X2XFZAO5OE7S@kernel.org> (Michael Walle's message
	of "Fri, 12 Apr 2024 16:01:43 +0200")
References: <20240412134405.381832-1-mwalle@kernel.org>
	<20240412134405.381832-2-mwalle@kernel.org>
	<7b2fc5cb-d1ab-4e9d-b955-b88698322057@linaro.org>
	<D0I76PPKBWF9.X2XFZAO5OE7S@kernel.org>
Date: Mon, 15 Apr 2024 17:26:17 +0200
Message-ID: <mafs0a5lu8x5y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_082621_784818_0E548612 
X-CRM114-Status: GOOD (  18.72  )
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

Hi,

On Fri, Apr 12 2024, Michael Walle wrote:

> On Fri Apr 12, 2024 at 3:53 PM CEST, Tudor Ambarus wrote:
>>
>>
>> On 4/12/24 14:44, Michael Walle wrote:
>> > These flashes are kind of an oddball for the very old Xilinx Spartan 3
>> > FPGAs to store their bitstream. More importantly, they reuse the Atmel
>> > JEDEC manufacturer ID and in fact the at45db081d already blocks the use
>> > of the 3S700AN flash chip. It's time to sunset support for these
>> > flashes.
>> > 
>> > Signed-off-by: Michael Walle <mwalle@kernel.org>
>>
>> Good, I'll let Pratyush review the details:
>>
>> Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>
>> Please resend once you get enough feedback and include in To: all the
>> contributors to this driver.

+1. It would be good to hear from past contributors to see if they still
use it.

Also, I think we should let this patch cook in linux-next for some time
before merging to give people a chance to complain if we break
something. Since now there isn't much time left until the SPI NOR pull
request goes out (around 2 weeks I reckon), it would probably make sense
to merge it in the next cycle.

Otherwise, the patch looks good to me.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

>
>
> For my future reference: This seem so be the only interesting
> commit:
>
> commit e99ca98f1d7190c16601b00d0c96212d7c00577d
> Author: Ricardo Ribalda <ribalda@kernel.org>
> Date:   Fri Dec 2 12:31:44 2016 +0100
>
>     mtd: spi-nor: Add support for S3AN spi-nor devices
>
> -michael

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
