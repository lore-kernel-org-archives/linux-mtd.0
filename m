Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0622FC48BF6
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 10:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d73X4zXlIPyI3lJIQMIaB9g4sz4GuKbK6tkJ9J7Amzo=; b=ixv1OJnTdB3WPJ
	jbKhXMq1SeOBDvo+ooc7q6OLzCbl2B4tOCXbCFQ2LyB/SalcFF6aZtj4mvwic8U+6d7RCGq8ddAod
	m9DMR3+LaZvWCoAdTuHkP4lbxb71fgPFo2TMnwnTQgw0kbzzC4aybOeVeqQqDQTqB/WwaRPcu6Tg+
	FmXO/otQoHRLESUy1LmLokqkz+jicvvxFKdZNcDyT2CTPiGn9H6Vlv9bO0v1VcjVyKQJNqdlf53Zx
	z33ZvyF2l4+aq3seg5o1ZwvxOVPwzDi2r/ZZ1SCdwhZu8XCjaOgqCdmfMjKXrwFpj/GDQHDeh8Qc5
	qmuv1D2dqXtC+FCkW9AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rck9h-00000000Zsq-2jsO;
	Wed, 21 Feb 2024 10:48:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rck9e-00000000ZsQ-18zZ
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 10:48:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8576F611E2;
	Wed, 21 Feb 2024 10:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D911CC43390;
	Wed, 21 Feb 2024 10:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708512525;
	bh=du6ulVJ73M5wtTyYQAMASVTtXVIeYy+D8eMVD7sAGcM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ti6uUWf4IMz0kw7JYGID5wK+hy5KW5gd72V9h+qGGVURRiy25YuWyrqx7ytJVmBQm
	 W0SefMJ5GIJZVl9iBOwtS2c+VvgfP6bgM8VNer3k88ze/LPMVPJ0NCSSZKczu1KTat
	 bjag50BtU0sZlPkPe9Up4g4bkxKFHm4MBYQFq9v6ISJIBil9r9+moARU88SsTawU94
	 I0vgD//rWiWYCPYePus98rkRTlOWbTNO1YBeNBAAmxc3b8WtWaO1dhr7uU3r3MeVGM
	 Te92lqOTFG2tM34rDUW9tJ2ZIoyAi8eIJRNJIBfGcmh+/WJ8KKFudToHPJdo/cZioI
	 jjgzAhewmIzNQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Josua Mayer" <josua@solid-run.com>,  "Tudor Ambarus"
 <tudor.ambarus@linaro.org>,  "Pratyush Yadav" <pratyush@kernel.org>,
  "Miquel Raynal" <miquel.raynal@bootlin.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Rob Herring"
 <robh+dt@kernel.org>,  "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>,  "Conor Dooley"
 <conor+dt@kernel.org>,  <linux-mtd@lists.infradead.org>,  "Takahiro
 Kuwano" <tkuw584924@gmail.com>,  "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>,  "Yazan Shhady"
 <yazan.shhady@solid-run.com>,  "Rob Herring" <robh@kernel.org>,
  <devicetree@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7] dt-bindings: mtd: spi-nor: add optional interrupts
 property
In-Reply-To: <CZANBUQ2RJ3N.DO07Z9VFJCBZ@kernel.org> (Michael Walle's message
	of "Wed, 21 Feb 2024 10:23:25 +0100")
References: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com>
	<CZAM553H2H56.2TDN36QEL90XX@kernel.org>
	<a0144c5b-4095-4a0c-84b6-93dfe9631a6b@solid-run.com>
	<CZANBUQ2RJ3N.DO07Z9VFJCBZ@kernel.org>
Date: Wed, 21 Feb 2024 11:48:41 +0100
Message-ID: <mafs0v86i6qk6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_024846_423045_18AE5583 
X-CRM114-Status: GOOD (  13.90  )
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

On Wed, Feb 21 2024, Michael Walle wrote:

> [+ Takahiro]
>
> Hi,
>
> On Wed Feb 21, 2024 at 10:13 AM CET, Josua Mayer wrote:
>> Hi,
>>
>> Am 21.02.24 um 09:27 schrieb Michael Walle:
>> > Hi,
>> >
>> > On Mon Feb 19, 2024 at 3:41 PM CET, Josua Mayer wrote:
>> >> Some spi flash memories have an interrupt signal which can be used for
>> >> signalling on-chip events such as busy status or ecc errors to the host.
>> > Do you have an example? Maybe one with a public datasheet?
>>
>> My example is Infineon S28HS512T, however datasheet download requires 
>> user account.
>>
>> S26HS512T has interrupt line, too, and datasheet is downloadable without 
>> registration:
>> https://www.infineon.com/cms/en/product/memories/nor-flash/semper-nor-flash-family/semper-nor-flash/#!documents
>
> Thanks, as far as I can see, both are hyperbus flashes. I'm asking
> because I'm not aware of any SPI NOR flash with an interrupt line. 

I found this datasheet [0] for S28H flash family from Infineon on
Google. These are SPI NOR flashes. In pinout you can see there is an
INT# signal. The signal description says: "System Interrupt (INT#). When
LOW, the device is indicating that an internal event has occurred."
Further in section 4.1.1.5 "INT# Output" it says:

    HL-T/HS-T supports INT# output pin to indicate to the host system
    that an event has occurred within the flash device. The user can
    configure the INT# output pin to transition to the active (LOW)
    state when:

    - 2-bit ECC error is detected
    - 1-bit ECC error is detected
    - Transitioning from the Busy to the Ready state

[0] https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
