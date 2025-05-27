Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7AFDC54F30
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 16:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUT4OL7BgSGtLEu1wXMgrt2ZP4dMKOvVT+yKkAmsUmU=; b=m1kyX//PL9j8dC
	j9VPWvRtExxCRQzLcf2qIxIKhH+CNk0u66vSglTICkp6l/xs3skADic9PZeRqNU0PAxTFHdHmTyYl
	41ZK/UHmJ/Ct5sH9AJAk7cHOxRKdH6t4aHg4BT31etvRvqlHwM6dcWBf+I3PvG53V+VBFAK6qphGl
	eCWUGevfVqxSnJGTJexbdXTCPWh4d0ZSeLTwkEBX9l0mhBBNfl7i5zqA2JH+pnD91f9hkBLKTKDeQ
	2PtcGenzsR94kBSgy1SGYxMoQsUEDRXMTu6k0d3YwaNRutXt1z3M7oTfoeihSWspDh7yEB9KPGYEJ
	L9QztxQf2UnQpvIkoH2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxCg-0000000BA9u-0Gge;
	Tue, 27 May 2025 16:31:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxCa-0000000BA8n-3AxT;
	Tue, 27 May 2025 16:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15E8F5C3A67;
	Tue, 27 May 2025 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25DFFC4CEE9;
	Tue, 27 May 2025 16:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748363455;
	bh=GuhC62725B74CDQxC/yoRR13F77zMV2WzAptKnXrRbI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PlNYqNDOtOmMCyy3kUWVdLbu14efKch6HwKNvabIXOn3tGCFNL63UmKUlPWIqfSo1
	 v/5Orf9OqD06ZD+KI5ruCMAcIwaFubWzmKsdYQfslCs5naZZPvcg3DuOsJviNiexUH
	 VifC6ecM71J4rE45zvm78hpYSmOQ4yGW87MvipcQnmQ+kaYDN2Eohea0QrGJvdqWbI
	 mTzqtjzSR7lbWQ2eLdsvRTQdfzETGN9eiVqJMTJhdl4ymC/mO9FD01pJiKcYEz2r9H
	 98Ia7W3Zth5F2x6leXQbLg5zLzdggEoEPlqahdjkFS5j9UpGBX7f3ZJl5ra4q6/MJr
	 KSWOaj5ldUpvA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Zixian Zeng <sycamoremoon376@gmail.com>
Cc: Michael Walle <mwalle@kernel.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>,  Pratyush Yadav <pratyush@kernel.org>,  Miquel
 Raynal <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Chen Wang
 <unicorn_wang@outlook.com>,  Inochi Amaoto <inochiama@gmail.com>,  Mark
 Brown <broonie@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Paul
 Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,
  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,
  Longbin Li <looong.bin@gmail.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  sophgo@lists.linux.dev,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-riscv@lists.infradead.org,  dlan@gentoo.org,  ziyao@disroot.org
Subject: Re: [PATCH 2/3] mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info
In-Reply-To: <aDCf84cRw0tmcAbm@calculate>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
	<20250523-sfg-spifmc-v1-2-4cf16cf3fd2a@gmail.com>
	<DA3HXNN7HTD2.2NUKORU5V6CS2@kernel.org> <aDCf84cRw0tmcAbm@calculate>
Date: Tue, 27 May 2025 18:30:51 +0200
Message-ID: <mafs0msayrp6s.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_093056_841345_285D3A2D 
X-CRM114-Status: GOOD (  16.65  )
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

On Sat, May 24 2025, Zixian Zeng wrote:

> Hi, Michael, Thank you for your reviews.
>
> On Fri, May 23, 2025 at 01:16:50PM +0200, Michael Walle wrote:
>> Hi,
>> 
>> > Add GD25LB512ME SPI-NOR flash information
>> 
>> Please have a look at [1].
>> 
>> This flash supports SFDP, do you really need a new entry in the
>> flashdb? Could you try without it?
>> 
>> In any case, could you please dump the SFDP see [1], too.
>> 
>> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html
>> 
>> -michael
>
> I was following the testing requirements from [1].
> Before that, I have applied the patch:
> "mtd: spi-nor: Add GD25LB512ME GigaDevice flash_info"
> Because without this patch, the spi-nor device cannot be detected normally.
>
> ------------------------------- LOG ------------------------------------
> root@localhost ~ # dmesg | grep -i spi
> [   10.199526] spi-nor spi0.0: supply vcc not found, using dummy regulator
> [   11.206477] spi-nor spi0.0: unrecognized JEDEC id bytes: c8 67 1a ff c8 67
> [   11.213691] spi-nor spi1.0: supply vcc not found, using dummy regulator
> [   12.220614] spi-nor spi1.0: unrecognized JEDEC id bytes: c8 67 1a ff c8 67

The flash seems to have a valid SFDP but for some reason
spi_nor_check_sfdp_signature() is not able to validate it to allow the
generic driver. Can you please take a look at why? Ideally the generic
driver should be enough and you shouldn't need to add an entry unless
something is wrong with SFDP data.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
