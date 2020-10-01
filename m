Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EFDC47423
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 21:40:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD5E720796
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 21:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b455NmHw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bY6VOO6p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD5E720796
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gi9oi57CY5kkcOApxywyL//nSJ1WKrBxWJsVH7x44wk=; b=b455NmHwe6EUbGQtXUR0IJ/RE
	4rANT1gq5B3B6EWBxDGJoE/m1f7ie5GJHd2YkNWy8BQbf/e+yTXvXjpuNS2blDRuUnCRZH+7vs9Hu
	Ju1Vu2VUqXSE5OAWW0GahNwTpoxxLETzZcgt3dChseiLOGRoClOvbQG0+ri7LIb/CKwh62cs5bOzd
	uejJRt3lGXjuvDMnENBiMWDcpxK4hp3PQm3Ac1uFwLlDRvKUk8xD66udeycy8r3QmsN42j8hc/jVu
	OOZSamiL6Csyp4BKPlF24E3rZDyRYr5Y3jIREZ65HPzFN2tMA52/KlJQiqjaMee00exVZDFu/Bxhl
	pCGmvHkdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO6JD-0002VN-UY; Thu, 01 Oct 2020 21:40:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO6J8-0002Ty-6D
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 21:40:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id z19so421252lfr.4
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2020 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RvoMvaeDGm5NloAZY+uCKX0xPTpskSM32F9TG7D0YPo=;
 b=bY6VOO6p7AW7BQGuNsyCSkCFuZlJVZcXV9KoW5ZVj+aS/AmwFkxciA1Q0WSVGMDbIy
 mKtGiS3JCwS74UMcda8mCTttLQmBYd/jQf9yGLfggUWhAQLS/u0rK+gbehj4UPqstQBx
 wNDugM6wEImpdN816yHSMxBPTNFPsLeWRMco7HnKVaBHXG1fErPaEntgqUYu//3fgT6Q
 M2hAZtjyxh8gJAiDO1/Cvw9lSVUzP2fuFKkVEt0llcortD9bFW/UL4JxrdeQ67g864IV
 K7KESvjDttbP5w4wP8zqdJgEBy/XCnnYq4mMPEZU0NtvsLiNSQyUd1Cj7nwFzi9w3JpB
 PWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RvoMvaeDGm5NloAZY+uCKX0xPTpskSM32F9TG7D0YPo=;
 b=Fg9Ea813M69mdxbx3J1LuVgMVwAbMqwCXUfNBOUQIO2eBf3Pdap8ijfJBwwOc6TPDg
 eiutcmKF5johvmzxdkrIKlsNBsiwSOHdmkp124CU9CvSfGC46N08exFbmfsA0dvaeJoH
 8GNKa6l9BOxKwFk0s5mX5oRtaEOHRmR8/Zyz+WbgbhkNv0m1b1NLSamBUPQ7ebW4Mqf9
 I1bS1U0RzN780bKoCq8Rx6AcfAEhxOD27mYBajJoC46CM8/QkzJGnS9xGGRYvlLxebi2
 5NZZ1NhrMVqhmQm+NC7x8/+4osaeI/tog0zVIyRGi5zmHcnQ8n1HtPd4IL/CC7hKqBRp
 b5DA==
X-Gm-Message-State: AOAM532a6g2RTVM0fAy4eQtjRzIthGJ86vTDV6lyLStE13J3JeSau+Uf
 BHwm4jvAOV+Y3X+Vq0pTt3B7P61t3+oswf6WmRc=
X-Google-Smtp-Source: ABdhPJxKQyYIqb81y5nfaVGq7cumDbaeXzmEec7pj0LIiPqJdMDf025Ufd44UebTJgFstqJhaLvTOeiTmVh9qfUSYQk=
X-Received: by 2002:a19:820c:: with SMTP id e12mr3105113lfd.215.1601588407160; 
 Thu, 01 Oct 2020 14:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de> <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
In-Reply-To: <20200930165831.418b8edd@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 1 Oct 2020 18:39:55 -0300
Message-ID: <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_174010_249297_669B5FD4 
X-CRM114-Status: GOOD (  15.65  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Wed, Sep 30, 2020 at 11:58 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:

> I found a board (NTC C.H.I.P, sun5i R8 SoC) with a parallel NAND.
>
> with the same DT properties but a different NAND controller driver I
> could not reproduce the issue.
>
> However, I did tried with soft BCH and I found a related error which I
> just fixed. I also got a bug report from Intel's robot which I also
> fixed. Perhaps what you see is related (still around this ->total entry
> not being set at the right moment at probe time).
>
> If tomorrow's report still returns an error, we will need someone
> to get physical access to the device to add debugging code and track
> down the failure.

The linux-next 20201001 results from the kernelci Pengutronix lab did
not show up, so let's wait to see the imx27 boot log to be back online
again.

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
