Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D65C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 07:26:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63E9620738
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 07:26:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AxSieLi1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63E9620738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FsjCi4UMhqR9s2q2Jev1Zr+qcMV21NUwzH0skZYFt1k=; b=AxSieLi17k/k7C
	7MdY1szrgXwfymyw33JCsTd2b7STrh9dM3FzS41n+yNo6oci6WeIHO2+6CSbsw98M7Y3WnaxwvMka
	qRkUUv/tJSGK0+DF9Rf6QcWHGz7/OZnmCPRGJOCqfiib5YZhT/gSNJi3/yuQ0FkdkRYHMRkpFVwlS
	vrlBJCmHaXyUqGgJmDEr5fBawmnHY8YYhz+qgFsa9w8+VwgOx5SWju2qCmY8RhqrrmFjkVe96GZTF
	ykgrxnELEekeySfTSYGrpgwI7/XvMtjHb2viqidRWKGh8kh6SiWtiA7zaYzqRFwMisoxKba2Y2etT
	ne3opaLChCQb+B6UkMLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbfb8-0005kI-C1; Thu, 21 May 2020 07:26:34 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbfb5-0005jX-96; Thu, 21 May 2020 07:26:32 +0000
Received: from mail-qt1-f177.google.com ([209.85.160.177]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MryKp-1jExgv052b-00o2HU; Thu, 21 May 2020 09:26:28 +0200
Received: by mail-qt1-f177.google.com with SMTP id o19so4729767qtr.10;
 Thu, 21 May 2020 00:26:27 -0700 (PDT)
X-Gm-Message-State: AOAM532UnN+wmRYp3YkKzGuAac4g41s6Xn2wN6X64ZgDO7BvMhARYXch
 ppdjcH0Pzr9nxoMXhSZv72ePsmze044nM0M6nG4=
X-Google-Smtp-Source: ABdhPJwtcCxeerSd4Izl6Ppbh4nfWmYkoOcJO9aURyJ/GfisH9qmLWEQPIm7eTlwdocPiblvoWRcM1OSE5P8EXylSkw=
X-Received: by 2002:ac8:474f:: with SMTP id k15mr1208706qtp.18.1590045986859; 
 Thu, 21 May 2020 00:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200520102125.8934-1-robert.jarzmik@free.fr>
 <CAK8P3a2+auSWBROZR-hobM_qSWtKiG1DRYP3Y7uvbCy_ZLy+gg@mail.gmail.com>
 <20200521071213.GI1118872@kernel.org>
In-Reply-To: <20200521071213.GI1118872@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 May 2020 09:26:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
Message-ID: <CAK8P3a2XdG_u6_o2NbQDTb5dbdzByBkUXZNM6nZ3wz0c-LFT5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: pxa: remove Compulab pxa2xx boards
To: Mike Rapoport <rppt@kernel.org>
X-Provags-ID: V03:K1:WZPYnEDxivP2seXALXCOgKEOpRhgncGtD0vAZZAf+Qdk0g/hiKA
 gVuSHf7pHD0YWbYRDnSzhkSsor/1ec1Ta817DvyJ14zLji1sHRn/RSgNRiwVGHKLvZHMAN4
 A3oUaoq1rKIUgQlSLI49C7z+zfz5zxRf5MUZD4Ttz+PcPBVXZwwPi2n+rbbL0Uftb/d99LQ
 Q7SJfPkcfZZ/Y6gEPZjvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HTQoepo4rU0=:FOsOixBnBqOHd2XOlrVgWq
 GIpoSVAoaBZRmnJESOYuZ54YOGZ0JFFYFbRuGjiH9m5l+PSjT2VviWQJ+KppqQAzFiyG1mgvd
 tF6hEu+p0kTvmQaHwSIrw5H8BVvz8ZjbE5AIu1ZmwwNHpk6p9D0oljInh+C2UP893KP2J1F6X
 s7Fs7yMElpIm0mMmBRTsH9wQnYpS8jsb54soBEEjOx0AzgjyCcwrzUYoYbiFF9oXoG7a12Enx
 qpvEqT1lFdmtE547T58d030EIKbKNQCTj0o9rEZU9836BSpWDGYYyCKD2Mm/TML9l2JcMW7V6
 QHeftl6koW3JYMLTv3F89NjLM+uSMqt+YfpjrE8OgHbC54SdDGE4fn8RN7HeCjzjEh4Jh76dl
 CCKGlWkgwcaMs8HqiqCJXAIo4TESmLiXZpxAt4oPY8kcdH9UWhTWUKiblniX78VQfA5GjX0nk
 kF6r2vFtbxUr1s5FvnLF3gFg4EHr4w9rpu1wawKrNs98JlqjqwQrZf9Ccwr9uDhvjmzAAHR7i
 H7MjRXsyTCiDmozGKABT7xqepjYPcjgV0/NfV5xOH/noWXDmRN0ZCKjpdaEaU2G51q6t/E7HK
 0frijQiUPcLBN+hF8UCudvJBu4kZoGgZmdk6YcTN+6ubFqae4uqbRNebtZwirq+YJp/Fmrbp+
 EcWvIsli0/dBam43DM5EdXHa54TQfp7nEjR8J2Oeq9qotlyYEYlpFT2iUm/VgYgp0L9dDsaMD
 YvWBowvAVmlIA3Iq/9TwjZVMX9Cong+Pi4zs6y1aP5xZ/6LBU9trAOTN0KI/J9rAAIsrsbBkO
 YzcywxNy5MqfwTmlqoxVf+lLZ0cTxTbjGtJBopn1ThAhnNpaIg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_002631_616109_08B8E163 
X-CRM114-Status: GOOD (  16.92  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 21, 2020 at 9:12 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Wed, May 20, 2020 at 05:21:51PM +0200, Arnd Bergmann wrote:
> > On Wed, May 20, 2020 at 12:21 PM Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> > >
> > > As these boards have no more users nor testers, and patching them has
> > > become a burden, be that because of the PCI part or the MTD NAND
> > > support, let's remove them.
> > >
> > > The cm-x300 will for now remain and represent Compulab boards at its
> > > best in the PXA department.
>
> I think this series missed the cm-x270 NAND driver, so this could be
> PATCH 4/3 (not even compile tested).
>
> From 56a11987f82ef8b32b25dfc17b849f9bbbf03e4d Mon Sep 17 00:00:00 2001
> From: Mike Rapoport <rppt@linux.ibm.com>
> Date: Thu, 21 May 2020 10:09:47 +0300
> Subject: [PATCH] mtd: rawnand: remove CM-X270 NAND driver
>
> The cm-x270 board have been removed and theres is no point to keep this
> driver.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks! Removing that driver was actually how the discussion started,
so we definitely want to do that. Boris earlier patch "mtd: rawnand: Get
rid of the cmx270 driver" did it by changing the board file, now your
patch is the right thing to do, and we should remember to do the same
for mbxfb.

      Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
