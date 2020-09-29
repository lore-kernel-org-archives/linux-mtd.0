Return-Path: <SRS0=p2FF=DG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75EAC4727C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:40:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5538C206A5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Sep 2020 11:40:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PntFruj5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3qtNbij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5538C206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A30FfMo5+GBfIodD9i2qRg9ddDtJicxPXkJa5omnsk4=; b=PntFruj5CCIfs4X7b6xXY+CSN
	JxRiNvDitU+YYyL9nc7xZ8689HDeeIdb4bgI901nk4EFiZEqWsdWSZVdLlstFmRILx1rZgm0uGdnl
	nE4yBmsgTKQYsVJFpYM4h2Sk9H6eWxeqFDLu+kz3nPV5WttR1s4CWjdZKuhtZ7c+isikE5R+bQA4o
	PpwaNTH+26NbxROirfdIYcaMD3VkNsHxKdS5Bwmpa+vaHGoqPugEMJmlXfbznKDVargr9l3fnFP9/
	naGw8svDV66rHedBCZXyf6/PA7WR/CrJvAb5byP97NahdL0YNND9u1BpJfDCCWjNIa27YXrnwptIZ
	YOLcqmphQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNDzK-0003ai-7d; Tue, 29 Sep 2020 11:40:06 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNDzG-0003ZE-Ur
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2020 11:40:03 +0000
Received: by mail-lf1-x12e.google.com with SMTP id q8so5094250lfb.6
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2020 04:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1lRe3rXVu8cYRJOGWAS1e0HudWBfoP+qdpnz45WbWn4=;
 b=U3qtNbijBRhUcTNsnltCdHWtId2xeSs4o6e7EWd9KIdRwDHUACuC1GeBLE4HaCE3L5
 v6j7ga/WLAldJXn+Y0y73qGKImW+JQZMRGM0XMlMrqtr+CPbX8SDDoRHkEWp22LB6MaY
 fTDjPZfGjSuSpBxkVoAFWX4nFkLWdn9qCcg/j+HoF4KmVE68VGyWY8K9khcfRuj+2ZyS
 1EDUImccBT6QLh0AJxfMbks4N7SDfuIIr61YUsz/2ZCHk5RtKgJol7Nd2G97PrLDn9cS
 HRivzF4fXdBeQK4PCckEjVg6tf3C9ooxLvIiOveBdEOC9voZ32hcY/jRrVomS15gymv1
 vq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1lRe3rXVu8cYRJOGWAS1e0HudWBfoP+qdpnz45WbWn4=;
 b=VQ+7TgpQFrGK0qKd2E6D0iF83RLvTTC8yr2qpcQDTEKa9UJtav2m97a3mg6TerD53W
 FpLBG2bPkPebDl/q21QQvFp/wcTk5AZROw7m6ujbxHc2yNE4EPcm07um42mNDeYOSGen
 6ZS2CBF75Kr3xlUNHFMb+m4FVauEiVfzG2VjzfN9rMEyMPupON4/tkSjRIcGirF9ZJDV
 qxPMBCFUUg7OBd2fRTgFx538/iY0FKku9xzF8GZf0/efOcAvCT/El9ZWGumHgGHbBCfA
 xl+lGNGtjFo5mYRW1fdUJCtOvlg2wzDLmCQ7R9Z+t5FWnnFL/Lz54NJ09OqkHSvAO4kW
 ACjw==
X-Gm-Message-State: AOAM531aDwL29AKmAlhwmKN2DyjbRKsmZZxBC47qYcrgf2hdWUyy2AZ9
 OFFNlSCZbWC2VH8Vi3Xas7AOOe7t03u8soescqk=
X-Google-Smtp-Source: ABdhPJxQz+4A7gy2q9Ha+sURi4acHjAk15pMbMO18lRWMDnkP3JrHRmHOuR9Fp4aGJoMJL2WVImnthWOSQSbuACc+l8=
X-Received: by 2002:a19:c6c8:: with SMTP id w191mr947376lff.348.1601379601587; 
 Tue, 29 Sep 2020 04:40:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de> <20200928172012.712035f8@xps13>
In-Reply-To: <20200928172012.712035f8@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Sep 2020 08:39:49 -0300
Message-ID: <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_074003_108044_6FD0F6EF 
X-CRM114-Status: GOOD (  12.35  )
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

On Mon, Sep 28, 2020 at 12:20 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:

> The issue is now addressed thanks to Sascha findings, it is fixed in
> nand/next and should be in today's linux-next as well. Please tell me
> if the CI still reports an error!

linux-next from 20200928 still reports the same error:

https://storage.kernelci.org/next/master/next-20200928/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html

I checked that the fix pointed out by Sascha is not present in this tree though.

I do see it fixed in linux-next from today (20200929), but the report
from 20200929 is not yet available.

I will let you know after kernelci publishes the boot results from today's next.

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
