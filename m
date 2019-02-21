Return-Path: <SRS0=HEdT=Q4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAB5C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 12:17:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89DE32086C
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Feb 2019 12:17:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YHXwDD/Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG4yAQ/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89DE32086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j5JncsNiuUCvDOeFo7AWnmSAqBSaQi+uWQ0cptMWUHE=; b=YHXwDD/YQdj3E6
	V+boPrqtZvNPBx2aux/eZJ6fpgdTQ1ZhPOvhrN28U43iWSWr9P2VX6w/5C6H7APOsy6MVbf4HZSOE
	d08waVeVlFvmYV7NmQxVi/vDOUuKm+SIXaAJfEl+kQLmZTmcmL0UAKOeGZp5UkzS8qBEpE2+RIc3c
	SZbEXQGrzPk0t9Gh3+s+HnBQUk21zomd8UU6pxoKyRE7DDkV37fctqfhflGM9yTCl2ZilZDEBsAyC
	PaR7rkc9z8txubwqyTpz01BCn8ewj1tCezIcTgIQ5im+cd16tzfgqdelRHkljkglBgymTy/Dd2aEP
	vgshGfJ5rMTxnifhabFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gwnIW-0002KI-IW; Thu, 21 Feb 2019 12:17:52 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gwnIT-0002Jy-O9
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2019 12:17:51 +0000
Received: by mail-wm1-x330.google.com with SMTP id y15so9710044wma.0
 for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2019 04:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YthL/mhvKKQr/TDMEUAxa8fFru66QAxxMN7NKqm6Qcc=;
 b=aG4yAQ/nm7G1fY9Ah/3oCvw9eLUhKcBRsrbiXGO5hOQ/+VPC6+WOfe+GibOKMeg00S
 HU9FWw0OcfxLDZ4x1VnltVmI0sawTJpEH1jSWt6UPnI9xXh6JqBUY5tjRkfx0L8+p2Fs
 zAXWeslavbWvL8dlzTCPRvwHVnR6342bJ+cXL/VvVh095tVDl7B9SrPD6oEXv51jt2bK
 7uxm8cIUF7C0x5j2xisMaeipfnv2pHeuiB/V9jjrbFf9GB4bHQGWEJY5dEFWYwoXjcnr
 EXDHw7xdC3P4H2xwAILDCG1OkgXDYiqby2wyLbFKPkDYlh8bGg+ti8aeh9m5s+tPO3sR
 LfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YthL/mhvKKQr/TDMEUAxa8fFru66QAxxMN7NKqm6Qcc=;
 b=GAn34hXhmv0bXrT29L/pgS7HSrPWiryX2GG4pAIdt86hipR99d8KZ28j2tyoubpgvw
 QfErJ+Js/IAz4EtoASMP1tk1/+2RS+gEeAN0Pm6gCsJCq9UKXelyysNlswms79OEAv4b
 1W5DD1MXRGZMOUygrVHS10swSjuMyH6dcpS57Hwc8Cvcb7EZER+9O6wq7WS0hghjRoLV
 csO0I6nK+CtXb5E96O2OeSf4xdpKMcb9voQipkJc3nY/U35kDZlSqU/CCwKNcrH7Le76
 i97GHCSk0gU7j8VHFHKyZ3GTB5N6cfjM6nEc17nQSld/5bEu2jS4eB4r1/izhV3wLJW7
 /NiQ==
X-Gm-Message-State: AHQUAuYoYaCJ+/qx6Vav3HdA19ZVv+VyNuxlNR3pX6xWtUKVcQnBBP13
 ylWc7xrz/kSR3tFGhFc4PxgPFmLJvWJ7DeGCwdE=
X-Google-Smtp-Source: AHgI3IZUTEaMFT9hlUtzWtMShPTbNfRX1sj5BKe6tsOlvn11PrBs9klhj/vmx5S0sD/1wwrjjgt+6z8px0eEncIA8g8=
X-Received: by 2002:a1c:5581:: with SMTP id j123mr9944903wmb.10.1550751467096; 
 Thu, 21 Feb 2019 04:17:47 -0800 (PST)
MIME-Version: 1.0
References: <20190220135820.b2ku2unaxxdqflut@pengutronix.de>
 <20190221091055.266b9627@collabora.com>
 <20190221101747.zbznw2mdf7p7rcy4@pengutronix.de>
 <20190221113646.6d4eccf1@collabora.com>
 <20190221112138.i5cqclnlpsjnms7y@pengutronix.de>
 <20190221123709.000aa79d@collabora.com>
In-Reply-To: <20190221123709.000aa79d@collabora.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 21 Feb 2019 13:17:35 +0100
Message-ID: <CAFLxGvwdFoJCYOeXMHDKgL_Eyd8JtYCNs=Et8qFp5K+991uPjg@mail.gmail.com>
Subject: Re: Prevent Nand page writes on Power failure
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190221_041749_811626_0B08B62B 
X-CRM114-Status: UNSURE (   6.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Feb 21, 2019 at 12:51 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> Other than that, yes, tracking which block was written last so that you
> can move the data somewhere else in case of an unclean detach/unmount
> is an option. Don't know if UBIFS has this information (UBI doesn't,
> that's for sure).

Yes, neither UBI nor UBIFS have this information.
With reasonable effort we might compute this information using the
seqeuence numbers.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
