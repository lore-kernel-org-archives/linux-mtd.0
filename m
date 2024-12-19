Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03605E7718A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 16:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAm3j5lIqphzY1QDtVqUQOYyrY8l28aU775jBJoGPuc=; b=DEughNfNQwo+i9
	LhDRZgVUm3Cj13pbouRk2Z2re8RQKHPjV92KTOlAt6xrMOcIqQ2wFVjVeKAMl7uH2szBvv0IWB6cI
	ti28TQ56rxOyMgDy1lujc4XP+NSjeFBhZDHRDSQ2GbHTH7GH8i9vXUudUytpixdE15lB6mLd3Ldlf
	MaHT4TrKFLvxgJ1cgbMomfMdr0XoGkBui6JVsR/IklcfGoPhKTM0e/maSWITRCc5JMdTBHLAVJ5BX
	hVAmGuLZkWuEJUrihkYKWBbdOjWsSBCr49hHZD8pb4Nqtoo2htLP486mqOQODeWE9QguD+eu1nFAW
	6Ktcck1ofVebYVp25TVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJBv-00000002JQc-2dj4;
	Thu, 19 Dec 2024 16:15:59 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJBt-00000002JOt-2W4n
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 16:15:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E33B6240004;
	Thu, 19 Dec 2024 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734624953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lRtyNx40vCtDNtySsV71nviUX/3p9WlXOjeSIjpqfOQ=;
	b=II4qOlaALc7yMtiJWyPXktlkEPN55zLiQ9LLiOx4x8vGaAR3gA/ev7JuZMEoEesP7UaxYU
	0OQ1HYOKpun/sRIJ+RgCHwRtMUOV13hMjkqwirqV8PrGd9SvVA3hDHPC82ICPRDrDllKSJ
	NjFMDscIgxuVJoJUTmxT2c7gXAyPO6a+9upZbGWQ6g7R+jVyx+vGArMFK9fNmbikGkpRli
	RHpeOW64uzK6u78Kzf8Bbp4SICQV1Dk1qgHpyW0nq7fj7kjRbqCNXyWnQLIQGuVFs0f+Hj
	qHdY5HzBR2XjFobAAfWqrQb5RJxGsni+J17RXMYhxAX/+K5pvJTPximOR2a0Fg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Renjun Wang <renjunw0@foxmail.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: extend description of size member of
 struct flash_info
In-Reply-To: <4660f0ea-b1d1-46c3-b5ea-efe549c9adf6@linaro.org> (Tudor
	Ambarus's message of "Thu, 19 Dec 2024 10:01:41 +0000")
References: <20241219-spi-nor-flash-info-size-desc-v1-1-6b53cf011027@linaro.org>
	<87r064c8r3.fsf@bootlin.com>
	<4660f0ea-b1d1-46c3-b5ea-efe549c9adf6@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 19 Dec 2024 17:15:52 +0100
Message-ID: <871py3abt3.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_081557_768112_5874D8E4 
X-CRM114-Status: GOOD (  11.93  )
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

On 19/12/2024 at 10:01:41 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 12/19/24 9:38 AM, Miquel Raynal wrote:
>> On 19/12/2024 at 09:20:04 GMT, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>> 
>>> We use the size as an indicator whether to parse SFDP or not. We don't
>>> introduce a dedicated member for SFDP parsing because we'd like to keep
>>> the struct size at a minimum, as it's used for every flash declaration.
>>> Ideally we won't have flash entries at all, but there are still flash
>>> parameters that aren't defined by SFDP, thus we need to statically
>>> specify them.
>> 
>> TBH I'd be perfectly fine (and prefer) a dedicated member, because
>> code clarity is IMO more important than memory footprint today.
>> 
>> However for now I am totally agreeing with changes clarifying what we
>> currently do, so:
>> 
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> 
>> One minor nit below though:
>> 
>>> + * @size:           the size of the flash in bytes. The flash size is one
>>> + *                  property parsed by the SFDP. We use it as an indicator
>>> + *                  whether we need SFDP parsing for a particular flash.
>>> + *                  I.e. non-legacy flash entries in flash_info will have
>>> + *                  a size of zero iff SFDP should be used.
>> 
>> typo, 'if'                            ^^^
>> 
>
> iff is a conjunction: if and only if.
>
> I think Michael used it to emphasize that we don't allow size > 0 when
> we want SFDP parsing. Using if allows it.

Ah, ok, I didn't know the abbreviation.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
