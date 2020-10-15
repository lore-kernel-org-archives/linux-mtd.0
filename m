Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9598C433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 19:25:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE84206B5
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 19:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fvP1mn/Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4OigbMQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE84206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7/E3O8nbVuES9gzXdNcnQmn83qc4wM6uwKV8W+wCqXg=; b=fvP1mn/QlqGgjh8iPtGUhxYow
	xlUiT6UjV6BQBr5RBUoP5B/Fxjfi4CIuUwrrG8lgSuzdr9MKVG5XqE08wMPMA+YQmP0AVm6hkLDS6
	dNJ4VpzfvMD6Fy48L0TWxwYI0u1qR4DSlMgKIfT0Pg7Gu9zxDwrb+WpMDVoG+SztFMRN1XUF5yd0J
	c1NkmGESp6YNDVtmAJoZA5BRavSe2bSdeVNgZOkCBk0JdYhbXYlNQtQW2m6y5CxzPwS4HJAP++Pka
	qcTGXLWpLonhLLS6LTUmqVhN5r+esIYn4n2DnSVYPRVjRZ8D9XNLECTsETNXsC7qsBziqVcWW2DpE
	r+FABf3CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT8rh-0002sR-DK; Thu, 15 Oct 2020 19:24:41 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT8rf-0002s2-EF
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2020 19:24:40 +0000
Received: by mail-lf1-x136.google.com with SMTP id c141so3151lfg.5
 for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2020 12:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vb4XCQQ3lCVqhaykHroXTsGOtoGeEo4BuOvHFVJaXoc=;
 b=k4OigbMQBAOEhU2bDC7mu1IlybAKsGuPeIB9Xtq/tUKwLEzy9BjrOKLYcCO9E/5W1t
 i0yCHH2kK84BiB+0C77DdJHB0NVuLy2rCHLxlF9/foZx/2AKJBHzVUHdJBRqICD1qpWJ
 iRadW5iAeBfozIJi64hwY0EkDRzWQScXVzd67iN2S772hoGz9YCVeAXa4Db1l9TAgTvv
 B6tzx34cD5lVB96Q86WOkXQcPaM8DtbbZMX3aacZIM0agqiYvbFUP3avR2MlGMEkVEX2
 sOekx1UdIa+/H1E55c6a5FiOoFvea+lTn1OwS06MCOiznX2cOpMbG2ooaImPyEQNZG7m
 RZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vb4XCQQ3lCVqhaykHroXTsGOtoGeEo4BuOvHFVJaXoc=;
 b=gIP0NrtygeWtwlyggg6DzzzHaH2gc7Z6e2/4bAn1ZCTfuwDGBp3Dcj19Un6VNSfPvA
 hI+10WAhmgB5H29Ny0ivA8nvWKa0dQs3ZMLpsx2O8TdKbs/4xQCbgdF+wUi1PIEDOaTo
 syaajb7fYwD2VsZ5aj4awTREc/VtlEGZUjhLN63akmsqxCIB8+t3nMsWwDNFsCd/431K
 lUPs36QYMDsfKLL/TFICGNkBiLEwZWTJFOzGCtOKvmS6jkqw+USTjxrQ7uXBtpd2wksq
 grIZp6qnokZO5Mek8b43tAf2VKkp/b674O0YJrrbhoPm0IMP4fwHpYKG+RVEvO08ebJM
 v0ig==
X-Gm-Message-State: AOAM533lZYFzoY2kWYacPsOUsvMkVuK/aIpONOLjEJSe9NwlDERHh53B
 47lCPerfZwjCPFjcWtFXMx6bS96CB64t93ODMaZmfGJTEKE=
X-Google-Smtp-Source: ABdhPJwlcFSDhPvzhv8jMdpFCuoHPlLkyecKuEVSF2VGJ/jFciW8pxQM9amcC8spuhjfuexyoN8Vpq3y5mAGIDkrek8=
X-Received: by 2002:a19:3f06:: with SMTP id m6mr33351lfa.25.1602789875943;
 Thu, 15 Oct 2020 12:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DnGGbZg_th=kjwBmNa8FznYErYCGvmD6dKgBbMV869+w@mail.gmail.com>
 <20200921094010.GH21278@pengutronix.de> <20200928172012.712035f8@xps13>
 <CAOMZO5CzNrGnwAB4zuUzeO3LVUqxaD4u0UXfYO8HBNcKSS-mvw@mail.gmail.com>
 <CAOMZO5D8W+Z5enehxFt7XTPn6sEXe9pWM6Tn1SixMntkZ31Wgw@mail.gmail.com>
 <20200930165831.418b8edd@xps13>
 <CAOMZO5BVHBqxLSEZgEqHEdAXstaK8GHHqjQnY+FtOJhXjX--qw@mail.gmail.com>
 <622a62489fa717fe8a94cd2e9cdf3d906da5141f.camel@pengutronix.de>
 <CAOMZO5Cq6v0OvpLSYwqqpHQFDjviM3mwozHcH35qoOTFvdnJ-w@mail.gmail.com>
 <20201014152659.6ef6a2fc@xps13>
In-Reply-To: <20201014152659.6ef6a2fc@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 15 Oct 2020 16:24:23 -0300
Message-ID: <CAOMZO5CmgzWtaq1n_RaO6GJP3SrymRj-Pwa8uxGBGOj8Vm_RZw@mail.gmail.com>
Subject: Re: imx27: Unsupported ECC algorithm
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201015_152439_484692_DD36C79A 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Wed, Oct 14, 2020 at 10:27 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:

> I guess we should be able to reproduce this error with any board using
> the mxc NAND driver with hardware correction (now also called "on
> host"). Do you have such a board available to at least verify that the
> beginning of my logic is right?

I don't have access to such hardware, sorry.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
