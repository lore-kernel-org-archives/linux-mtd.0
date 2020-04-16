Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666F2C2BB85
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 13:20:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB50217D8
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 13:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Us6QENKO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB50217D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Na5dL/EzytowehzIyKYmchja+zQA6+QZHpL50kBaNig=; b=Us6QENKOZnzluJ
	9tE+hN79cGnT5dl00u5NdiiEPH3wd/R0wo/KizjqISd+rTBlejUq7btJ0jiouAePjSSYtC7+UH4W9
	C5jOEgjUruhNgiUITt81co6cbDQdXgDW7KiAWckncnXvhkdlqExx5lFHkVh/U6dZLp/RhS/zCzDs+
	46xINXWF6b8E/m3YcMGvtUuv+ZIpIiw3UQ4sR/EEkZfWiGfmSvRAuWPEWnuWkftFh1BnXJMKEH345
	IkjxAiHZON84dvb4vJ5/v5Wrw8S156v0V54GT+g0ODE3YoIudTQaVIzuKzVEwVQJivVploZ4SExE1
	P02kIS8GweiAYMcQf5QA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP4Rb-0003oo-Gd; Thu, 16 Apr 2020 13:20:39 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP4RY-0003oP-2l
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 13:20:37 +0000
Received: from mail-qv1-f52.google.com ([209.85.219.52]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M42b8-1jP4RV16zg-0001cx for <linux-mtd@lists.infradead.org>; Thu, 16 Apr
 2020 15:20:33 +0200
Received: by mail-qv1-f52.google.com with SMTP id 37so1937797qvc.8
 for <linux-mtd@lists.infradead.org>; Thu, 16 Apr 2020 06:20:32 -0700 (PDT)
X-Gm-Message-State: AGi0PuZCDP0+49yqDMVHYoifKc97HTThFvHWZv+e952H6wVlp4tBBYFD
 sdSnDW6hl4ddDexm4aMQNxQWvhGwb/s1tOCKeQ4=
X-Google-Smtp-Source: APiQypKHZDxipZPAWZYdCIqDu16HNzhscAsVQ9lmrMyp9kN+/tCK/He2321isOUyHo5GRU/I+lGChb4COn0weT3yGEQ=
X-Received: by 2002:a0c:a602:: with SMTP id s2mr10311429qva.222.1587043231971; 
 Thu, 16 Apr 2020 06:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
 <20200416122619.2c481792@collabora.com>
 <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
 <20200416131725.51259573@collabora.com>
 <de9f50b8-9215-d294-9914-e49701552185@linux.intel.com>
 <20200416135711.039ba85c@collabora.com>
 <CAHp75Vcpb-556imBuhsY-asrKqx7LjvQbq+P-ysK-+ii91YpWQ@mail.gmail.com>
 <20200416144036.3ce8432f@collabora.com>
In-Reply-To: <20200416144036.3ce8432f@collabora.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 16 Apr 2020 15:20:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rYDfTW60eY3RiiSOeT9EsNxw2rxMuQ9UjaS+JDiHy3Q@mail.gmail.com>
Message-ID: <CAK8P3a1rYDfTW60eY3RiiSOeT9EsNxw2rxMuQ9UjaS+JDiHy3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
X-Provags-ID: V03:K1:ZgsZOU3h8vzkW2jlTu+eGsvuhtfoqEx4pYeLQtfuAry0cEaxDHb
 n0oRsvSak1JbN+awxiAUazgoxrviNlhknGVMQaJ25OR+osxZDByI2MMvKD/xOBga8wKJ40x
 5U7HniCJB/oYUd9MLSt5ZSRoU/tQ76wzNnJ+O4CcYm1FYRsP2kvY2snwtGQzNzn5blQGe0I
 pnkBcroFWsuKmqYiWB9sQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yz/Efi23D1k=:EAm5OkmBZjxMn673Ct26wr
 lMof4f40YWVjsRDdJgAKO199gT0uX0+r8UkixcBIk1tyd4Zre74wdbOEFh6ex/7tjOpY/y4zd
 Z6Wh4V+Y3MFplWCmPqg3cmEHZwbW8uzAiaolJHhO6SwJbKZwqv2u4qJVShkq7llljHwXBVlC1
 sp8nFKwFCIKg9aSqg5Yk/G+dE0YqwgxicB2IRnKHulL2fqI2hFLpABEKMpVLwFPgSFOt0jACu
 m6w83GZE/synAyloPPXQT2abhG78iECA1r19egDFZeJKVCRu3tvcRcww3eOd8q8bgYj1ELM4w
 S+DxmQZe6s8bly83iBeFyLq6jimEOrqVm6FOqUtgmWeaUt9fU9MEU1HLqWGY+N2Nd4CsIQjcE
 u0rmPmbPFaHqd8Tje6LLO59lk67UqpKOsrqBQC5fixq0IGUC1q7b89vQR3zh+ZhZSjJ/h6vnn
 m+V3kYmIfC41+WwgikoXFgWxU7FY+3pRxUlBDXtRzzEtNJ2TE6mnHDyO37m5pzLx2DP1Mcoxm
 +RF1g7sf1V/lOqGoPTNbtAaJCnCBAnHlIMZDHSo/22XGdq3AASPln+rlsT9djhE1Ti02UtdBn
 S6pQ7WFTMbuNcsR85bqreAn4v0jviqiH9DjI1ZGufkm50G1nxepkkwgrZxeetKQclcXsffN/Y
 cD47JXKERhdlK3bC1el4hQKU6ogCsqUZynZNIRzKzlWkpW6vNjGWdDFul/9EcKx/4fEzdF99a
 TGCoII+GofuBb4EA/QjjUbUFDkVfr0muW2xhOyD8xsZBCkbpJG2rNbescQ3qoYDOUD2Hvxtp1
 lLm2SADmIOj/DYYagT41UBd9TV4Sx32m3jRds36ocmmCiVJ1EY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_062036_413797_51B5D676 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: Vignesh R <vigneshr@ti.com>, Brendan Higgins <brendanhiggins@google.com>,
 yixin.zhu@linux.intel.com,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, cheol.yong.kim@intel.com,
 Anders Roxell <anders.roxell@linaro.org>,
 Andriy Shevchenko <andriy.shevchenko@intel.com>,
 Richard Weinberger <richard@nod.at>, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, masonccyang@mxic.com.tw,
 hua.ma@linux.intel.com, Piotr Sroka <piotrs@cadence.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, chuanhua.lei@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>,
 qi-ming.wu@intel.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Songjun Wu <songjun.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 2:40 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Thu, 16 Apr 2020 15:26:51 +0300
> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Apr 16, 2020 at 3:03 PM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > > On Thu, 16 Apr 2020 19:38:03 +0800
> > > Note that the NAND subsystem is full of unmaintained legacy drivers, so
> > > every time we see someone who could help us get rid or update one of
> > > them we have to take this opportunity.
> >
> > Don't we rather insist to have a MAINTAINERS record for new code to
> > avoid (or delay at least) the fate of the legacy drivers?
> >
>
> Well, that's what we do for new drivers, but the xway driver has been
> added in 2012 and the policy was not enforced at that time. BTW, that
> goes for most of the legacy drivers in have in the NAND subsystems
> (some of them even predate the git era).
>
> To be clear, I just checked and there's no official maintainer for this
> driver. Best option would be to Cc the original author and contributors
> who proposed functional changes to the code, as well as the MIPS
> maintainers (Xway is a MIPS platform).

A lot of the pre-acquisition code for lantiq was contributed by Hauke
Mehrtens and John Crispin. There was an intermediate generation of
MIPS SoCs with patches posted for review  by Intel in 2018 (presumably
by the same organizatiob), but those were never resubmitted after v2
and never merged:

https://lore.kernel.org/linux-mips/20180803030237.3366-1-songjun.wu@linux.intel.com/

        Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
