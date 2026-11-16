Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA96606A323
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tguyKFtz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=uHMtrG8C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7YLt+QjA1N/G8BP3pXf3/b/FaTJLGV18VfkpSTq+Vyk=; b=tguyKFtza04JYU1XmLTR85NxRZ
	pxK+TYbxLKjthlOR+GwjVYXqJRdImXt2wb1VlpPrFQW5FTyrwE4Y5Wg1ECT3XvjDBdwSx7fI9tIZH
	++OAQqTW4m4y9IQmnh7G1d8DCLqFiDa+U3VqYYukkTG+OpsMw7J+DceqAA6+trU863mwbJfWi+SMb
	gz27/cIuMOW0TeMdcICuWbeyzTgrYeCnJ6J/qnIRA42rEakiD4azNcKtfQkHazG3iNdYJsuD46m06
	JxR33r4YwIbInJ+2FdMWCLUqRzvPPTcKMUBHb+PJiW6xPygDRwz3ZBX4U9VgDR7SMhJjx26qR7K1v
	Kk4nDw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxEh-00000002jw5-2OgI;
	Mon, 16 Nov 2026 13:59:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxEf-00000002jua-1iJr
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 13:59:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A47404E41600;
	Mon, 16 Nov 2026 13:59:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7878F6023F;
	Mon, 16 Nov 2026 13:59:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7C3B11BC0298;
	Mon, 16 Nov 2026 14:58:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794837541; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iaqvgRtBYr1vwCiy/P8BDoJRixcx8rIq3CnR06buB/4=;
	b=uHMtrG8CfsDS6DrHfFBHZ0/AUBFDKdhoZ17yOGEElcPnGryIpeAnZ/27pbpEg8mL/eGxrs
	LoBdoI0Kl78K8/6XBS+HrZkCblz7bQDIu0o5L/WUqZMSJGjUz37OSbP2joRgXFFGqidjKM
	LtxHUVC7c/CFznxUOAmSP++b1pu6zc352tbuom1AVDbYSFduBRJ5kLcfLc5ZgHT7M/ZpjT
	hXNoYrzKr6zddLTvEK1klTrn4EW0u0/2joplpvGxBnUCdlgrD/1FhKejEtTWLKWeFzjq8h
	4TyHjwOglblNKGFpjjluxXrkR0XLfIvtNGXJghzmdaH+q5NB357Sh34m+O+9pQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Samarth Narang" <samarth.colleges@gmail.com>
Cc: sashiko-bot@kernel.org, "Han Xu" <han.xu@nxp.com>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  sashiko-reviews@lists.linux.dev,
  "Richard Weinberger" <richard@nod.at>,  imx@lists.linux.dev,
  linux-mtd@lists.infradead.org,  Frank.Li@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
In-Reply-To: <87pkw4sx1v.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 16
	Nov 2026 14:52:44 +0100")
References: <20261030150929.2944717-1-samarth.colleges@gmail.com>
	<sashiko-outbox-191156@kernel.org> <87pkw4sx1v.fsf@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 16 Nov 2026 14:58:59 +0100
Message-ID: <87jymcswrg.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_055905_622309_585A6F6E 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 16/11/2026 at 14:52:44 +01, Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> On 30/10/2026 at 15:20:32 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] mtd: rawnand: gpmi: unsynchronized DMA termination in
>> gpmi_nfc_exec_op()
>
> Sashiko complaint looks legitimate, since you haven't actually run into
> that problem, I believe the fix is incorrect on this platform and
> therefore a DMA patch must be sent first. I will drop this patch, please
> resend once the DMA part fixed.

Please answer to your previous patches, stating why I should not
consider them for review when you send another series including them.

I will in the end consider this patch -in other series- for appliance,
because the fix seems correct on the NAND side, but is still probably
not working as expected on the DMA side.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
