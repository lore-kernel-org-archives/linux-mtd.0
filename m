Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC74C5CFEB
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 06:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ezApn1+ATJ87K7vemSU8JbSPYS0aJJkZNq7dBqre72g=; b=yEz6fE1+hPAMpB
	+dBn66YFbt0Q4toA6BntBSKhUI1lr/v0/VJWjeEaxYr1/rJYBhBX6Dijr6ek8vZQdhEhSf0gL5yIo
	uP638FKpw2MKzwk5XEZKUpfyXGpnrrJvnNlRa6vOMkGiziHeYjERWDCgeoumS49Q6Q/2FC9tXFxTf
	RUsRjIRbLGaTKGoD+6x/mpx9eR2mduier+d9WG6w/8XxnlnpUB2vtXM0tJZk1t2G6LBXa6KnwsH1E
	EKy4kaFs53hcXO9NotEFO0h7y5E6uJ/h8qrDL1Rr3kztXzwviJ9zq9VKUEBVdPoumHgAmc9MsfUJ0
	qAkcdDD3zi5W1Td3hLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPFP-0000000HW7u-482S;
	Thu, 13 Aug 2026 06:49:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuPFM-0000000HW7N-0ztg
	for linux-mtd@lists.infradead.org;
	Thu, 13 Aug 2026 06:49:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 227E61A15E9;
	Thu, 13 Aug 2026 06:48:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD5D7602B8;
	Thu, 13 Aug 2026 06:48:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A4BE11C4D998;
	Thu, 13 Aug 2026 08:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786603732; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=QztDvkrTOg0tEXWNbD2tiy7gnCiVPZ43TKonFLmn7bc=;
	b=kHnbYAlS6UqhcwdOwgGOP74hfnHrXY2AsAMHvoze4HBxrKEvGcxVDI9kMCYpekCrovDO4e
	kVyXuddoTiACTZZUmdhHbpihKi37X+ARnGVREMu21/UagqJPv36T9kin0Q5qPmt0LCJxbR
	NZ72MhRr54qIMZhZNiVEUTUrHnf6XOFPTfF/L2Eb27rh3OUmDsPTY8LHF7d4qpVEg2Gski
	t2kO0pYaJ4JFStDj5WAOEW7/rZSqHh37OarSzLa41sxDODcimZ+GDKnExP7CJ+03NsHm7m
	I480TA8oeiESBt9/KBVVl78zdyvvWLh65c+WpSxshlTKOEBRerfZBvt38t9cfA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "han.xu" <han.xu@oss.nxp.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Peter Pan <peterpandong@micron.com>,  Boris Brezillon
 <bbrezillon@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH] mtd: spinand: Enable QE on all dies
In-Reply-To: <anowMUOYurNYphfU@cozumel> (han xu's message of "Wed, 12 Aug 2026
	11:34:26 -0500")
References: <20260807-spinand_qe-v1-1-c102c79834a3@nxp.com>
	<87qzk6s8yr.fsf@bootlin.com> <anowMUOYurNYphfU@cozumel>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 13 Aug 2026 08:48:47 +0200
Message-ID: <87v79eldm8.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_234900_432295_8B32F10F 
X-CRM114-Status: GOOD (  13.37  )
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


>> > +	/*
>> > +	 * QE is a per-die setting on some devices. Program each target
>> > +	 * individually when enabling or disabling quad I/O mode.
>> > +	 */
>> > +	for (target = 0; target < nand->memorg.ntargets; target++) {
>> > +		ret = spinand_select_target(spinand, target);
>> > +		if (ret)
>> > +			return ret;
>> > +
>> > +		ret = spinand_upd_cfg(spinand, CFG_QUAD_ENABLE,
>> > +				      enable ? CFG_QUAD_ENABLE : 0);
>> > +		if (ret)
>> > +			return ret;
>> 
>> If there is an issue in the middle of the loop, the chip will become
>> unusable. Perhaps we should reset the dies to the !QE state and return
>> an error to continue in degraded (single) mode if that happens?
>
>
> Single-lane is the most basic op - if the QE set_feature write fails, the link
> is broken and single-lane won't work anyway. And falling back needs the vendor's
> own 1S op stored somewhere, but those variant tables are discarded after probe.
> So it likely requires refactoring struct spinand_device to cache them. Given that,
> maybe just keep the current return-error implementation.

Ack.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
