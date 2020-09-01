Return-Path: <SRS0=YYjO=CK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95683C433E2
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 05:23:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631A2208DB
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Sep 2020 05:23:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YzUYpzoz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1Mo+Ye0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631A2208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PBgMUYRDxgVlH+mie08K9O0M/GRaAh2iVEQ0v9X2PEY=; b=YzUYpzoz5xNBxU2/FCK/jVqN/
	Nmczkl5ARwUcJyjxwEAlN29GIIxM1lNeLleWHdUIXFHbhp2uGfLcCEgJOuG7KS8DWjFxmeieXTXig
	yZ373a7m7iIh7xcvi8p7BeAL5u8HiVCEQWSL90OJZHQZ7kQ0OiTfXvo4Tal/Pb8glqpSaamtZ9Abd
	n6lqZ9QaZD4ehDCBJQGOanRBKp+j4tiL9w/mCqAKAk/lkDd/lvUZCTzG5BsZW37LmnAHiNy8Tfh2K
	VY0lVxAX3Y+E94odoxDA/vRa6hepEI43sXBydUMTL4O+a7E/VxPQ6OfIaNUzgfH+UT93Wi7qUn/UO
	75N2VhH/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCykZ-0006W5-Nh; Tue, 01 Sep 2020 05:22:31 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCykX-0006Vf-C1
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2020 05:22:30 +0000
Received: by mail-il1-x142.google.com with SMTP id q6so108785ild.12
 for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2020 22:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sTCxmzY4cu6IgaR+9q8FRfLqYC3al+mdtRVXMHvplIg=;
 b=q1Mo+Ye0mBArptKKHXctsHFTXkuelMAb4sa+F1jd8S5AOWd5McL3nZkA5r0Sj2GobY
 a7gz38Sn+661zCnEB5f74rc6bzuCl5chPQMoEo+VR60iCaAd5s1TQGLbcl03kJOUJ/xV
 DKJ6zcMB/1KLkb54rI0FPq6pnj+Oa1575/IsAJlrPJ9JDfR5anUdjVjNMSQLcEx/cE6n
 RY4z7JLw8cIvs5U7+3Hj3wXw5Hbapdkaf5Vxpwwh44CT+KbX4h6TkhGoZ1oeiwt5+rxS
 2UlthNIRSPFh6mN6M9ozs3LEKtBECZn4rpYFkgizafe9vokrO3ghIU6I9HVVpPa6l9qT
 WnYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sTCxmzY4cu6IgaR+9q8FRfLqYC3al+mdtRVXMHvplIg=;
 b=BtDeuJ6GvL3AwuUhEkPROCkxXZ94hRkZdQq2+EI+vwz4kewEzTuW97NZTuPCRCrPe2
 ibHpgBmFHDGVtWRv1wlYRLspWErHDtGo2Yq9AoYtqIT18qMpf/6jCBo2I2l6Y4jzwCf9
 28QrvuZxmIAVIygNlSfSdRs8akq4B5wVI2nAY9vQyTEzzjbF555A6H9RIgPfPZwCRs8U
 n/TaDJzTyauEmD9u09OUs+/v5ShjA+9FFAayyRd1ao+iVXe5lZtAJ/1g+B1DKfqfT/9L
 oltp1T5S7MPCL1IdNYHXFBuJ+HSuOmlnOuOAZMSot1vclz2/IGu8MToEU5MRzNYmje4U
 mKfQ==
X-Gm-Message-State: AOAM530qOG9Td5VvDT01/sPt51GdNvpfD0bn/AeBX8AZNczJYgkTD7u+
 gPiJLu+/gZckqTnmCgL44cgRqfub8YgO86XKvOArU8Xwf4A=
X-Google-Smtp-Source: ABdhPJzc2vR6F1b94lbgY+50KKtkBIOJc87X+ZdAY7YEzx5V2iXJkRWHglttquDXDdXP73t1ZOgEbQzdn5bxgEaA/uE=
X-Received: by 2002:a92:6b04:: with SMTP id g4mr4375026ilc.203.1598937746779; 
 Mon, 31 Aug 2020 22:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200820165121.3192-1-hauke@hauke-m.de>
 <20200820165121.3192-2-hauke@hauke-m.de>
In-Reply-To: <20200820165121.3192-2-hauke@hauke-m.de>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Tue, 1 Sep 2020 13:22:15 +0800
Message-ID: <CAJsYDVKTNgg8RZU-uOwuqtigvc+qBNN=+5mqC4NPURZsZitFKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] mtd: spinand: gigadevice: Only one dummy byte in
 QUADIO
To: Hauke Mehrtens <hauke@hauke-m.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_012229_436675_ED39F5C0 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, wigyori@uid0.hu,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Fri, Aug 21, 2020 at 12:53 AM Hauke Mehrtens <hauke@hauke-m.de> wrote:
>
> The datasheet only lists one dummy byte in the 0xEH operation for the
> following chips:
> * GD5F1GQ4xExxG
> * GD5F1GQ4xFxxG
> * GD5F1GQ4UAYIG
> * GD5F4GQ4UAYIG
>
> Fixes: c93c613214ac ("mtd: spinand: add support for GigaDevice GD5FxGQ4xA")
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

I made myself a QSPI-capable device and verified that QSPI works on
GD5F1GQ4UAYIG
after this and the QE bit patch.
Thanks for the fixes!

Tested-by: Chuanhong Guo <gch981213@gmail.com>

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
