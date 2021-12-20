Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F10AC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5baM64okieeyH067vS8qRPvzO/nbm4EBxBsc54OX+o=; b=0hPN9Yof65fO1nVA9rCmNdo75m
	lSX0Ct/RVQ4jYgLc163uyFucDBcGJoyCf9qxu1JI1Zm/QPsEd5nSqd06c74ds6Jld2NTRJRIQQ7eH
	egLd5HkXsr08JtmK979tOfpf9FnCBd3kkppR1mo6SEOtlRaY00RDPK5qBzETExavaVdaVkSdJxh+j
	P6xSKqzabLgjA1UWW974wt9TRl9KTqeuL2ppPJcewHEqKt/oaRFTZE1Aw/YlZKaVA/16MAWwqi7IE
	ZBag3TcZcjTYmmW1ydlCdhoOgqoY7mUFvRysZ5mFKgxAFdXsCa7EaihmncZJ2GPHALVOJlc7gJIs8
	1Mya6zLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzKtE-0039zv-Dk; Mon, 20 Dec 2021 15:47:52 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzKtB-0039ys-5R
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 15:47:50 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6F4E5223ED;
 Mon, 20 Dec 2021 16:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640015267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/3Ez7mRfxbwsP6b4TIPeFtFpVI24qbdeAeJgmIgils=;
 b=oquRCuHl4wJfYFLqxMXoMRuJM79wwCuVzpxgAvwFiVJntyj/alqM9t+tlOv8GF1eB2mnAM
 4vCpA/UjcitQ+ib9GvB/xK55gSHTo2AxZhNR5lYAus82Y440jtRMQvrMIkyPod4eRZRs5C
 bKOfYxALWPZET2WYvZ/bAsGrGaAoXbk=
MIME-Version: 1.0
Date: Mon, 20 Dec 2021 16:47:45 +0100
From: Michael Walle <michael@walle.cc>
To: Takahiro Kuwano <tkuw584924@gmail.com>
Cc: Tudor.Ambarus@microchip.com, Takahiro.Kuwano@infineon.com,
 juliensu@mxic.com.tw, jaimeliao@mxic.com.tw, Bacem.Daassi@infineon.com,
 beanhuo@micron.com, shiva.linuxworks@gmail.com, sshivamurthy@micron.com,
 p.yadav@ti.com, linux-mtd@lists.infradead.org
Subject: Re: How does an SPI NOR handle a single byte write in Octal DTR mode?
In-Reply-To: <d40c879c-c419-82c4-c385-0a03e105a622@gmail.com>
References: <f593ded7-6cb1-7645-a0b4-dc20b5576d1d@microchip.com>
 <d40c879c-c419-82c4-c385-0a03e105a622@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a7bd7dc6db2cb9f74aa6e7737e888625@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_074749_396713_24B50E71 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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

Am 2021-12-20 11:32, schrieb Takahiro Kuwano:
> In case of Infineon(Cypress) S28 devices, it can be done by 
> de-asserting
> chip select before clock falling (not sure typical controllers support 
> this).
> That means the device can take odd address in 8D-8D-8D mode.

Ahh nice. FWIW, I had a quick look at the FlexSPI controller found on
the NXP LS1028A, it doesn't seem to support deasserting the CS after
half a clock cycle, though.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
