Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8081CC0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QwZTUX6098x9ggNaoBnRCstTrV0nJeIVNSWdeU4WRc=; b=CpQ/amY/OIBO3d2HwvA8I9PTuo
	9AhR96Gx4kKfst1LRQW4Anat5XALEo/ErNk1fHhyxJapkjJRp1Lqpj6TN9sZV5OyEhRddZWRsnxN9
	SYgbiPcnG3L8Nejm/4JNrZ/sdpNcHcFfiXYf17UJh6z4xQFb/chR+D/AGyXWeQ3uJNi1oPhDGuTv9
	VZpn0/BL4IA/US67GQdRv1TYaA/PdiVsXRdnxA2abNKn1vSmj+leKxea2IOixhWLQ+4ghuQzQ4qJD
	uX1v+srwv8mgwo7GBPzGYRaBC1k51gccacrkY2m9jSTuEcqInT6XiJLnXfciXMnZLVjMyYL7KCOW5
	8li27Nqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPG7-00A91H-2E;
	Fri, 11 Aug 2023 10:20:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPG4-00A8zT-3B
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 10:20:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2520063384;
	Fri, 11 Aug 2023 10:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B5DDC433C8;
	Fri, 11 Aug 2023 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691749237;
	bh=CHbPJ3kGZVP91QcuTr1lZ9ls+N486AcPZ5CBAliKCys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mMDZQ75FPV0iV9MVD6V7dHZLQd0o91jC3ZK0jcT7cR3yLdSpNzNjRjuAD6kdG1Nq0
	 F+IcbJO7ZVL3lXysWQqi3BKjtyhy5pLtA6ksX7Z32pzMshaY3XTTa2VRX00sgSZ/Qx
	 4colMsnMbmKopIf6dIliO4BKwuvyXRMopd2oXwud2Ec9FsjyoN3cGu4JoZJxp/EIK5
	 LLfJ+FshHB4qhonu2lrBQXtVliNrCN7xhnmbAhiXGlGvZkCuCXBbr/hguiQwGIAJmB
	 7BnPQX6SE9kL12JuUntjYe8oMPiHS6r7BeaCY2C7bxssYNVR6AfRe0Bit1MXmSF1dD
	 Hwnnc4A27d9ow==
MIME-Version: 1.0
Date: Fri, 11 Aug 2023 12:20:33 +0200
From: Michael Walle <mwalle@kernel.org>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
In-Reply-To: <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com>
 <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
 <92234e4c5aca657a966d7c4d9d5f219a@kernel.org>
 <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
Message-ID: <ab8e506ea941749b07f0a93565e731c0@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_032041_201209_B33C0803 
X-CRM114-Status: GOOD (  12.63  )
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

>> >> This won't work beacuse the manufacturer id is not always
>> >> one byte long, think of continuation codes. In fact, as the
>> >> flash_info table is of now, we cannot even rely on the
>> >> continuation codes, but we have to always check for the
>> >> complete id_len, i.e. there is at least one hack where
>> >> the id is reversed and the manufacturer is the last byte,
>> >> iirc. some oddball cypress mram chip.
>> > According JEDEC standard, 1st byte is manufacture ID.
>> > I check id table, "cy15x104q" with multi manufacture ID in
>> > later bytes by RDID command(9F).
>> 
>> Yes the currently supported cy15x104q is broken.. but nevertheless
>> it's there. Also some spansion flashes uses winbond manufacturer
>> ids.
> Ok, got it.
> I have a idea, create a member maybe name .check_vendor in 
> spi_nor_manufacturer.
> A example, macronix_check_vendor function for checking this IC whether
> belong macronix or not.
> Each vendor could create their checking function for ID table didn't
> include that ID.
> Is it ok?

Honestly, I'm against adding that vendor discovery stuff to the
generic nor driver. What's the use case of it? You can just
read the ID from userspace and a tool there can decide which
flash it is.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
