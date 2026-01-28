Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA967D46BFB
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 20:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPxp0/aQDT4gGhKzysbqgo1617LNex//qvEYVKLaZd8=; b=ZJ9qBNyQcXv+st
	Zyn/xCXlxGIP72tnsKavrAVAdQn+u1oo/8cg0HzSdh0dAZzlqdIQYyDsBoXmy38+m9OR2jCct8OVx
	Xwioam7/uDiE6ugOIInJbSGa3h9Ch/6sW2sy9e6zoDbFMTZQGn0NNzNVrV4vO3cy7CqEJV98dObLC
	e8PgtPJNJwcScqLuEPi/5hRKYss/0V0S4ZP4DMP/I4BApHUj8wPItrfMLNdQlgGsGFM3ASZ90PQw3
	MjyzeW21bjzfGAyEIR5OUQ8nIwnZp//d68RnrjpGp4YK7DegkT0XM6DcbebXAXC4HQvkXDSW/a/Q3
	C+LE/b2jzchCLfmGjJiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCCZ-0000000Gli7-2UVw;
	Wed, 28 Jan 2026 20:31:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCCQ-0000000GlhM-2r7k
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 20:31:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6C666001A;
	Wed, 28 Jan 2026 20:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970CEC4CEF1;
	Wed, 28 Jan 2026 20:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632296;
	bh=zAqUqPi+IJHuKdMpXct3vGpjh9gKEStrN87eWkKsWY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hxfXdXs01pXHiAmQc0/u1JpjsRZXtWGwuifttmwBRE4g3GpE17c1CMG7INg5kYmRH
	 I8itvJwrMvZq2hIEfdCVob/BcZpXt0F7CPE0y0gcYvb4ZVDQmw0v5ct6qt2d33ICvj
	 5iohKgkktwBdHip7agMiraRtYPexXj0o9ls8xuyRD4F8T0eRcAsshse4ISB9qFjFRn
	 bnfqM2WyDlUrbRkFLbQ6xwQUJdVWyUb64IOP3EaQqeWHwtWNOGuQX3c6LnO2FVDauN
	 fIa6jkUCpYvUh/aYlMRIMvbIVvdfFYLWSQp0d3kqgCEsBSBXLChhTIXrPTn3cmrFAU
	 wkG0/gKWhTNVA==
Date: Wed, 28 Jan 2026 14:31:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Junhao Xie <bigfoot@radxa.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Xilin Wu <sophon@radxa.com>
Subject: Re: [PATCH v2 0/2] mtd: devices: Qualcomm SCM storage support
Message-ID: <njrzcyhdkohsmnlisdzu25b6obqotjjrzlrs42jhq5bhlz6qco@mdk5blghdqbc>
References: <20260126-scm-storage-v2-v2-0-fa045c7e7699@radxa.com>
 <d0652707-c983-4deb-981c-b1584168e330@oss.qualcomm.com>
 <875x8ln7tk.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875x8ln7tk.fsf@bootlin.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Jan 28, 2026 at 03:13:59PM +0100, Miquel Raynal wrote:
> Hello,
> =

> >> Junhao Xie (2):
> >>       firmware: qcom: scm: Add SCM storage interface support
> >>       mtd: devices: Add Qualcomm SCM storage driver
> >> =

> >>  drivers/firmware/qcom/qcom_scm.c       | 161 ++++++++++++++++++++
> >>  drivers/firmware/qcom/qcom_scm.h       |   3 +
> >>  drivers/mtd/devices/Kconfig            |  17 +++
> >>  drivers/mtd/devices/Makefile           |   1 +
> >>  drivers/mtd/devices/qcom_scm_storage.c | 265 ++++++++++++++++++++++++=
+++++++++
> >>  include/linux/firmware/qcom/qcom_scm.h |  34 +++++
> >>  6 files changed, 481 insertions(+)
> >> ---
> >> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> >
> > This is 6.19-rc7, please rebase on linux-next/master (the series
> > doesn't currently apply because this base is essentially a full release
> > behind)
> =

> If I may, I even skipped the mail entirely because it was not about mtd
> in the end. There is a single big patch labelled "firmware: qcom:". I
> believe the series would better be split in smaller chunks. Typically
> one for the storage support and another one for the firmware part, at
> least.
> =


The firmware patch adds wrappers for the secure world interface, which
without the MTD driver will lack consumers of the API - i.e. I'd prefer
not to pick that part, or parts thereof, alone.

So I think it does make sense to introduce the two parts together in one
series (if you have any requests for splitting the MTD patch up in any
way I have no objections).

This leaves us with the practical problem of getting it merged, which I
believe would best be handled by me picking the firmware patch and
sharing this in an immutable branch with you, once we're happy with the
set (which won't be for 6.20).

I hope you're okay with such plan?

Regards,
Bjorn

> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
