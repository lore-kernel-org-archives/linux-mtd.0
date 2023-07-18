Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B0AEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 06:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjW7KWlLPndGiROkYmGrb02ntELBCCOCxKlFtlL6tqA=; b=IH1+/oJ2Xln1Kxj+/OEtrgRZOH
	dvraeYzFqEBBW4+7xzpU0p3DrJgX5YTsbMC+RoAWaIv4TPW9aAw7M+0KEi2Mm/RoR8C6SNjVPqFJo
	EUTzlexUJGj0d3Z36EL6swoGndwOG4VnFNMvQE84z5PcjIBbIeBpq8FIBuvASR5iyACH18GjDQHgs
	lvZ9jckEtKCwlx88xFpYsU5CwtpkipmRFgPN15rZC+wyC/A17FTNlDcK8t857JvZns/OVxQJ26iAZ
	eHmm2KBUvdReoHA2MOVo7MthoK+2DBh7aHS6MHTF833/yQnIF/nVLze5X3IpKpvrzNiafVbscRLrx
	dfs0/pbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Ii-005XG2-19;
	Wed, 19 Jul 2023 06:04:40 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Ih-005XFL-0E
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=07XNaSOxgZ/2jakkjVaFZnnVBwtPf8HMJf0+mPyTFEw=; b=nwh4wLaA5gR/WRDf6tffXj/7DK
	uWa5lhfBt/ozCqRCFYP0w+TqwY/+DvnqGnl/bJh+t5BBCx7gkPhIvVJ6BB4VF55oq03jBXhJ1QoBG
	Xh1ck/PB+iubnjNdDD0j3clRVSis9yUe3Czq1Y2g2GL1wNLXNqZwbFdegt4Gj8CDDr6z3ANT2rnrB
	JRQuwAOHriCg7wMqiEZySF/P146voR95GvOoHxWtp7uouVsVhKERVfLmKXCWr5LqzHl8uyd4cUCBV
	kg61A0JwrzpNJwsOIxL0UAndTipMOELXZTRJ9xwixA1q5OsYTyDTR8NdJdgjXwBesifivQRkgKJMC
	7TuKIlzw==;
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLfAq-00BGCA-1L
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 07:31:10 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 2B222126;
	Tue, 18 Jul 2023 09:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689665431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07XNaSOxgZ/2jakkjVaFZnnVBwtPf8HMJf0+mPyTFEw=;
	b=LCgFOu5lE8myrainK8G/jarug+8GaYkcvybKhCyoMZkPRXCGHUusT3F0JMeAPd/OatmRmL
	avFZKhD/JbqTvemIby0vi//aKFjpd3HMheWQcxQhhlssOFDhUZAEZ+yovCF0V63gk/EAWg
	ucupD3sRzAC4ug/irFS2DdZmFo+adDX0NZaSuOHH3MoQd629qp0O0bacDeaaW1u2q6PceH
	z8ra+uP0SeTZ7/R6yaEysKSyFnXRE3ODODGDoMXWwgc3hD2GGg/P9DlV3hBHfSAq6CvLAk
	Oo+iSPdNMN6e1tklf6kqqtcUSSxYERO7nuah+rFLLx7ONzQeh3kDAJPkCQADfw==
MIME-Version: 1.0
Date: Tue, 18 Jul 2023 09:30:30 +0200
From: Michael Walle <michael@walle.cc>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, richard@nod.at,
 vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com, Takahiro Kuwano
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 3/5] mtd: spi-nor: spansion: Add MCP support in
 octal_dtr_enable()
In-Reply-To: <4917c61b-7f08-44f4-5a14-3443349e3277@gmail.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <cac44f4d9ed06e250c2fa8aa900d8de3de4c4337.1686557139.git.Takahiro.Kuwano@infineon.com>
 <d05156c981f0ddcdfb754c685530cd22@walle.cc>
 <4917c61b-7f08-44f4-5a14-3443349e3277@gmail.com>
Message-ID: <0f9e1cad34038cbed3c9ca277fe4b6eb@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_083108_722183_1A15A2A3 
X-CRM114-Status: GOOD (  10.22  )
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

>>> S28HS02GT is multi-chip package (MCP) device that requires Octal DTR
>>> configuraion for each die. We can access to configuration registers 
>>> in each
>>> die by using params->n_dice and params->vreg_offset[] populated from 
>>> SFDP.
>> 
>> I'm looking into cleaning up the flash db and come across the n_banks
>> and n_dice parameter. Which sounds like they seem to be similar, maybe
>> identical? Unfortunately, there is no public datasheet for the 
>> macronix
>> flash.. IIRC there is one for the Semperflashes but I'm not sure if 
>> there
>> is one for the MCP parts.
>> Could we somehow clarify if these are the same properties? I've looked 
>> at
>> the SFDP tables of the macronix flash and they don't have the SCCR map 
>> for
>> multi chip devices :/
>> 
>> -michael
> 
> The n_banks and n_dice are different properties. One die can contain 
> multiple
> banks. Infineon does not have multi-bank parts that support RWW. The 
> SEMPER
> MCP parts do not support RWW on different die.

Ok. thanks for the quick answer!

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
