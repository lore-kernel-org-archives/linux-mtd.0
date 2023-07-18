Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED33C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hfX1O5UZsEQhNpnMZheAwDMcHEfKuTX618XtwzamjE=; b=LJ50RT+sR0QZ3F6Hw34+wxvMrf
	U+cj39r++BZTaSw+HD1YAXU5ldur0u+kjGTVAXcYqJnjCAx+lzmoLCpU3tDVKDVanrRsI/N3rGYS8
	sTv1q43zRy5Dp3hrqtDIGEgawWgvq3rXSbI/gNpWUH3qOnTgMzyCgcmj0Lqub4BbBeZZuWUl/a3+U
	+4QwY/m4mSFfnVkxlTghFWOPbKV2ATBTIxoy3hTSPyJDBjCA7jQnSCrbUsSVKSz43Ahk3it2ESpDf
	+YxRrRBbvC5MhvH05P971DnYnm+0KjGn9BwkvtfPGgPFBmQ/NxQNtoUEkXygIY0EmqsVtJJ1wliSU
	4Z7+r1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0a6-005gv0-1I;
	Wed, 19 Jul 2023 06:22:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0a5-005gtx-02
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TliMGa/AjS5CE9Jf6SZ3Vzpj2EtgwzwZjg72TLl0zqM=; b=dihkeqBTdos8BaILsJ2hwzNOMi
	VB+iwlK0YIVrFBh3NKdfr4x91RWOddLO6SG88XCNF6P8zk7vvrdjaBPSpl0M+5li8vZ230rqSUDrP
	fEVO++v+u4IVKhZGk3pqPukxywKqZllz2Jt0SBGGSGcqZ1iy56shQP9cyHOkziJLdMD0bsM6Y/Adv
	wRP0mwn47QV5ckMZ85z27UbPjgOZgY0ys+lN9XW7PBBF1DsHpkUUaOyA2sgW374Nb2fF3+SKI2Stv
	+PmYdOTBs8e4SFM+L3fCMnF8UnQjsKsx6K9dpsxHw5jxvbt0AbfRssyWEUmMkb0X972DhjFvHC1dA
	UdqTRryQ==;
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLhWS-00BOay-1L
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 10:01:38 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4A2363BE;
	Tue, 18 Jul 2023 12:01:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689674460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TliMGa/AjS5CE9Jf6SZ3Vzpj2EtgwzwZjg72TLl0zqM=;
	b=1tZ25vKAwvmo1bgrRHA025NmOefVDb6pIPqUrbYMERVCHhTLbGXhBFrA0BGs7RgMtOirHD
	3zMKlXEtVvZGO/pQaKbZMrgkr5vfgduAnYedFZJXCCmfAvkNZlL3/aqxD1eEsBvZ/V9tHm
	oWV1nY3Og16O8NvQ1K5Iycqnz4LoIRGM3LggtBwF8LDXzGYn/36SovjHQdsyqu4Nl4iLq3
	DqYoTFqzSWS4Py5HODIvrWQkSGOEXd1fq2DB8OA3zZqN2O8koZKgNfUsAWSsfZsHOQ0RPq
	Zo18n8Z3vl2RRYF2cwzIqxFq1yzoEBsZuM0V2vky8MIsGC+GKpiXXO5GcMZrAA==
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 12:01:00 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, saikrishna12468@gmail.com, git@amd.com
Subject: Re: [PATCH 0/3] spi: spi-cadence-quadspi: Add Rx tuning support for
 DTR mode
In-Reply-To: <67e1d3af-d106-bd5c-f8d8-3f43a58975a0@linaro.org>
References: <20230207060924.265789-1-sai.krishna.potthuri@amd.com>
 <67e1d3af-d106-bd5c-f8d8-3f43a58975a0@linaro.org>
Message-ID: <85d8e122a236818b162b64b473a3fdc4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_110136_973108_FB1A4324 
X-CRM114-Status: GOOD (  23.30  )
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

Am 2023-02-07 07:48, schrieb Tudor Ambarus:
> On 2/7/23 06:09, Sai Krishna Potthuri wrote:
>> Enable PHY and DQS required for Xilinx Versal Octal SPI to operate in 
>> DTR
>> protocol.
>> Add and update device_id field in spi_mem structure with flash id
>> information. Xilinx Versal Octal SPI driver requires the device id
>> information to perform the Rx tuning operation. Since there is no 
>> common
>> Tuning Data Pattern defined across all vendors, controllers like 
>> Xilinx
>> Versal Octal SPI which requires Rx tuning to find out the optimal 
>> sampling
>> point for data lines, this device id information will be used as a 
>> golden
>> data.
> 
> Using only 6 bytes as golden pattern seems fragile, but you are aware 
> of
> that, as I see that you chose to read the ID 10 times to make the
> decision whether the tap is valid or not. Other option (which is not
> perfect) is to use SFDP data as golden pattern. If I remember
> correctly, JESD216 suggests to use the Read SFDP cmd at 50 MHz, so it
> won't help you much. In practice SPI NOR uses the Read SFDP command at
> the flash's maximum speed and we haven't seen problems. But better 
> would
> be to use some flash OTP data maybe? I remember Pratyush has submitted 
> a
> phy calibration series in the past, I haven't had the chance to read 
> his
> proposal. Did you? How's your proposal different than his?

And its not 6 bytes.. it's usually only three. The last three bytes will
probably be undefined. So the might return ff or just wrap around and
return the first three bytes again.

Is there a datasheet where you can read how the calibration is done? Is 
this
the same for all i/o pads or individual per i/o pad?

I cannot see where the op to read the id is coming from. Are you relying
on the fact that a RDID is the first command which gets executed. If so,
please don't.

Do you calibrate only one pad? RDID (9f) is  single bit i/o, right? And
I guess you are calibrating with the highest frequency, are
we sure that RDID will work with any frequency (on any flash).


>> The reason behind choosing this approach instead of reading the ID 
>> again
>> in the controller driver is to make it generic solution.
>> - Other controller drivers which want to use similar tuning process, 
>> they
>> will make use of this ID instead of reading the ID again in the 
>> driver.

Honestly, I'm not sure this is the way to go. Pratyush proposed solution
to have a dedicated memory area within the flash array with a know 
pattern
seems to make more sense, because you are calibrating on the thing you 
are going
to use later, that is quad/ocal read with the fastest frequency.

>> - Also, we can avoid hardcoding the command information and initiating 
>> the
>> transfer in the controller driver as this should happen from spi-nor.

So how you know that this is a RDID instruction?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
