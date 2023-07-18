Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF53DC001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zrMa9M/UjbDysul0LP3xlB9DbHQhKL5fkdw4gW3T7MY=; b=UVtSWmr/3E8mf+2Ejb7eK0kd2c
	lzOT052o8n75r6b7sp+LFqNeeG+BUjb6WoMSVWGEReZCPjdeVvEZZvetxb4J7RgNY0jo9RpcHUCL6
	sIHNkQRmz+fYTX65d+jQY/C5boLUvQWuChrZp9aNJUmwqtRPJwYK3GTxJNV69oVRARaCbmEauhUQh
	aB6kOOM5l61ZaTlyZ/JFqziz39RG3750QewiZ8Bgmlxyofz7DUb67qM8y/JCAgJMh6kHK6wTYi2cQ
	c/J7++BTlKqmRZf12ahTR2DjNH8lg7mnCFbTLS8Y4DPgtdmDcSGmdkdvvOGSvC6eEPD3+gLEbi0Ua
	IBsmLQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzrf-005LsF-2s;
	Wed, 19 Jul 2023 05:36:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzrb-005Lqb-0Q
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=g9UoT1kdI6Mgg8/d9aVYHcCgudZxBQNoa3KgIIea8gc=; b=bPxGuO75j9K5vE6eaZpkN58LVN
	r2kuua8oYXalKsQGlcy0NGoLj7bcuXCSFr+to5TpRzn6YxVuLZRLM2hLIDVIMTvy0CDGMR8GidlaU
	SOvyc0HX8qJKAX+69hkEl9B/g/rhG5FAFxCI/svHHtzYKKOUVDnnSYLENAWY+piWeXtFwfiHsdFNZ
	wFVk2+pYOPXHrovySIUlVZQiM58WqcVBLbqMmP1E18IbBLks+2/Cv+walFCTcehl5gwKbPOnp9SeY
	qCKAPvAQsNZutGR6/39fKOQFplDOtQEy1mU0pXMHit4osk2OD0bPHPq9dk3fRtuDVMocVNOUlj/kb
	fc1anf5w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLh18-00BMQQ-0D
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 09:29:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D86B1614E9;
	Tue, 18 Jul 2023 09:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E37C433C8;
	Tue, 18 Jul 2023 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689672537;
	bh=/cGfBekDmE+BR4ZDOyJIAZUw5e6tGf6HSK7pUmBl3oI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=azgiJ+0Ur8pGuAGjT6ILrF9o5NYoWyE/NERtLdI0upCbK62KaTC1hrwpPmBEs5TMK
	 WNst5b5welfijI3kS54b+CP4W1asS3XSpp301vVdnCwbfr4Lhts41Z4YkfCavd8cmq
	 6jaXSylHgqsSBLdbZ1Cehj28Enjr/j6Qt5WCAXMTbSkbfjiRZhK76E0mmMW3w+JIv7
	 vmrhgQi8dVylgvcpqrGpV8k4rKV3mekpNemCtUzLATHrMDGuKHpWMmogUqCcT4Jhad
	 tD42vWNI/Kjs1/N1P4t7T+CEWmSWGQB/WXfXFfgZovT2CrkWE2cARB+q67Ucz2rnaH
	 9lH57D0nlbsvA==
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 11:28:53 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: tkuw584924@gmail.com, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, Tudor
 Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] mtd: spi-nor: rename method for enabling or disabling
 octal DTR
In-Reply-To: <20230714150757.15372-1-tudor.ambarus@linaro.org>
References: <20230616050600.8793-1-Takahiro.Kuwano@infineon.com>
 <20230714150757.15372-1-tudor.ambarus@linaro.org>
Message-ID: <b85368d2e3bf829809344406247193ea@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_102914_443008_7535FBE2 
X-CRM114-Status: GOOD (  12.02  )
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

Btw. this was threaded within another thread. At least on the
netdev (and spi) ML this is discouraged.

Am 2023-07-14 17:07, schrieb Tudor Ambarus:
> Having an *_enable(..., bool enable) definition was misleading
> as the method is used both to enable and to disable the octal DTR
> mode. Splitting the method in the core in two, one to enable and
> another to disable the octal DTR mode does not make sense as the
> method is straight forward and we'd introduce code duplication.
> 
> Update the core to use:
> int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
> 
> Manufacturer drivers use different sequences of commands to enable
> and disable the octal DTR mode, thus for clarity they shall
> implement it as:
> static int manufacturer_snor_set_octal_dtr(struct spi_nor *nor, bool 
> enable)
> {
> 	return enable ? manufacturer_snor_octal_dtr_enable() :
> 			manufacturer_snor_octal_dtr_disable();
> }
> 

I don't care much for this naming. I've also seen _enable() functions
which take a bool and then actually disable something in the kernel.

So I'm fine either way:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
