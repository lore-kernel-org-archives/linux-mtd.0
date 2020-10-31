Return-Path: <SRS0=Ys1R=EG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0E8C388F7
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:45:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2CE82074F
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Oct 2020 21:45:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Je/7WO+W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HY8uz+B+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2CE82074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CpK8y85nKPisr7Hbr0ZlzdihlYWQdnmgNvzEtnZlkk8=; b=Je/7WO+W21mGN6tO/q61KMeho
	//kS9EI4vk0InsD0SPlmytN2k+F58cOyzE8Ilu6sEgLqjS8JWSyl2MT4HZM00BA+RBW3mq10guiTd
	oYuXhFPl9NDlmxGbELr1WXvl1cRR4Npx+lpLaDccUljpLl3XbT2H3xNof+GmY/lCLDiIIEZq0hfCt
	Vku752Os7dm64aqTN113GOUNdGHTN5X1VETC5oohfDa8POL8Vp9+H4puFmBhiP8pgKJ5240mEx13Z
	ZS/PWSsfQzZzefjhLLSK+aPXY65BYry7mST8nrlbsO9uCPRxfhim46oxACy5DsE97dENgfsd9xQ6o
	5zprat/jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYygF-0006Pt-CR; Sat, 31 Oct 2020 21:44:59 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYygC-0006PN-2S
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2020 21:44:56 +0000
Received: by mail-qv1-xf42.google.com with SMTP id bl9so4467080qvb.10
 for <linux-mtd@lists.infradead.org>; Sat, 31 Oct 2020 14:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sahw264sE/LyEO7a7nLEXCUZeUzMZhuha1nEtTxABu8=;
 b=HY8uz+B+X3dSpv2OFDQdkGdx5TH54JcsL5igPmcmOPU9ZxQCYeqWWmGVYLxyWGTYNF
 AFoT2o2SD6vOUc0/poZJBcF90i9ToTQJY2I73AX0udzS77bH+LbvMGSD+DxBlsruHdBx
 WJSzlICycgeiEdP4E+ZvqgwuojGCn+/TZBTw6mYixY+VS6zd5ubygGT2b4OAKUYq7nSv
 RD+E8HSYKqOeMZuPe3xowvZMFwbRyrqah2X5kYyBDrJdY1XAfuuE3c1rTuhCmOSe0gpk
 yOnCfN7y+cZR5E95IKxO3z/+EnwLnKiCkSFkZXMoP7CeKCzr6pVLkIIxVBK0WJVsVpHO
 wf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sahw264sE/LyEO7a7nLEXCUZeUzMZhuha1nEtTxABu8=;
 b=elR3abqJpj3OdqHrju9btpcuUH6PhOxcDsrDyW0xR+qOcxccsfc1YZRRcyxMwXvB3w
 9Plq+xuQjrsSLnv9vYSofqQ4v8NN7XM6zPqD88sGUbjqI5Bdawugz2iSaPNHXM1Gpfa5
 enwuA7se8VeaNutds9QhhTsLK1CbaN6jjEyge1S05dexOh/8LD3UxjvNva+O/L8FAMff
 Wd/X/PNYgvLSzKRJF3Qw1+V36jiEBvlTgMmA+mXEQqUiBJN67c2BF2kuM/PhgKmrhgOU
 fXJpmPflWPgym16kq0gtNXiaa6M2WnCmVkooXaX7H7f5KTKim3XGs+Y7egRi+v/Bw6xn
 qFEQ==
X-Gm-Message-State: AOAM532n+fhn8QptEM1lvspdrP10WBeHWs0elQvLJVhMKsePO+amiMqL
 5Y4xzURfbp9V6WfWfn0v17wkIVecojJopRFF8SDeh7qLU4UxqIkh
X-Google-Smtp-Source: ABdhPJyDPvjPeLtGW1e1DiY98ub4lJ6jFhNtt4OdJc8KmWSMIwbGa0YHKbUUVfy7accf7Hm7/6ql+WcnGMAGe43PFiE=
X-Received: by 2002:a0c:a261:: with SMTP id f88mr16170913qva.56.1604180694346; 
 Sat, 31 Oct 2020 14:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201027111804.e27pyvf62eksngmp@ti.com>
In-Reply-To: <20201027111804.e27pyvf62eksngmp@ti.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 31 Oct 2020 22:44:43 +0100
Message-ID: <CAFLxGvxc=EqBStzLz3ApwYDomKMe=WeK22ohfPQs1WrMCsaVQg@mail.gmail.com>
Subject: Re: [PATCH 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
To: Pratyush Yadav <p.yadav@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_174456_204437_DADF7ABF 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 27, 2020 at 12:24 PM Pratyush Yadav <p.yadav@ti.com> wrote:
> > [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/
>
> Ping. Any comments on the series?

From the UBIFS point of view I'd like to avoid as many device specific
settings as possible.
We check already for NOR flash, checking for NOR *and* SPI_NOR_NO_MULTI_PASS_PP
feels a bit clumsy.

Tudor, what do you think about SPI_NOR_NO_MULTI_PASS_PP?
This kind of NOR seems to be a little NAND'ish. Maybe we can hide this detail
in the mtd framework?

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
