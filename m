Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD063C433B4
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 12:25:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F68611CD
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 12:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66F68611CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KdIglWfHGkk0kYVNrG+sP606fYmJyiBx/QAp9n01bWk=; b=fN9lokf3hG+nifx1/7kbTbr4P
	ALIQENFw6/UBTvtQwEIGMt037/OLId80cwGj1Hxccx7152xZdt5XjJlf7C7xoaTxGvstDE1EATt3H
	jf9i37RwiiXtQR/3FDVmOhQaZILYrr2a49Gfstg2o3kQTD3mZD/qAlCFQ0jSe2zh7+PcNB76goW8S
	hKklQqA5imNALYCT+EgyjaErndXbumVFLBHqbQ/F8tT7vqSAogORKYeVEahsT6kfoLxxuiWVa4cCK
	U/bRokGkNagcS2yUEo5kWB5KwV6yoNftr5CqQrS7plZ2YOLIeCp5IZrrVOqzRsUjLO/R291hpLWxj
	DYLRMptYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldXcF-00DqeQ-3h; Mon, 03 May 2021 12:23:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldXc5-00DqdU-QN
 for linux-mtd@desiato.infradead.org; Mon, 03 May 2021 12:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qAWVpDTtSlc5/KVmffpjQlQdMtB+/RTsWpeRwHTYtT8=; b=fl5/R2Ck13+npv/+suh1DYC9IC
 Hjj9KUNb/oAJY+hJGsRJ5n21Q+Kqr38XwQJBjj8/eLM+hX+bMe6d1JJgkiL1Cr4f/Bymj8YBjWNYj
 qOrVvv4B/SymRKQ1w2+AnMKwexN1oszX112SWofKQ19Rg9dVGQVC0Ip9AZABlHdgKHSzB5f2Rw6oj
 7kXnr5BBgbOzIbg0TLPI9nMyWVyk9ER1fcIYTsPsFTYIjjMpv2OmFM3idozwzYiNLxthIhMiYsAky
 sr2ADwZV6EkxcK9G0p1pAmHQJB6WEZ3p3JVNoAdv1p+AYXikwtCbZAN0QvAaL2gLK0VGacFqdsjR/
 Uj/TOlYA==;
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldXc2-0033IQ-Te
 for linux-mtd@lists.infradead.org; Mon, 03 May 2021 12:23:48 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MK3BO-1lrDNJ2K0E-00LUru for <linux-mtd@lists.infradead.org>; Mon, 03 May
 2021 14:23:43 +0200
Received: by mail-wm1-f53.google.com with SMTP id i128so1211588wma.5
 for <linux-mtd@lists.infradead.org>; Mon, 03 May 2021 05:23:42 -0700 (PDT)
X-Gm-Message-State: AOAM531aXeBE8A3+O+e0CgGlqTvWEQ+ssSFveDhggDO8Z9nOcJt2SJpp
 fwV2f7a9zbj1NoRaY7M9/EjhKVoWTjqcfxnD2Iw=
X-Google-Smtp-Source: ABdhPJzgZnWYW+fOuChQUPyL8ctUyHMhpQ7+njGfdV1G5yVqSA4zSIMSXjfnegUMZYYWLAeOIA1tvONv3koPAKICOxk=
X-Received: by 2002:a7b:c846:: with SMTP id c6mr31174650wml.75.1620044622642; 
 Mon, 03 May 2021 05:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210430153225.3366000-1-robh@kernel.org>
In-Reply-To: <20210430153225.3366000-1-robh@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 3 May 2021 14:22:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a16ZRoisiQeubTJz6E=w-=34BPHtPRYiwwnFWiEUnew2Q@mail.gmail.com>
Message-ID: <CAK8P3a16ZRoisiQeubTJz6E=w-=34BPHtPRYiwwnFWiEUnew2Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Remove unused Sigma Designs Tango bindings
To: Rob Herring <robh@kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-pci <linux-pci@vger.kernel.org>
X-Provags-ID: V03:K1:TfdwH0KZmcSON2/8NocZZTvvmpZC7P2FTuXK5dME4WJIpwATNW9
 ChCxtDM5NNiCsI/eQc8aHjdFUht2V22KMVetDObb06UPDQVYCq1eOnCIlvRb1kWjtuVXvIU
 HtvnbFRyL9L6L/lLLt10v3t0653K2FhAMcQOn16ePFItc70IHAk12yLMSZ7gxhstWwzoUip
 UiMvxoy1a5vIWbb/H2MFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:GyG/4cfZD4o=:UU/UgWl78lZvKwr6QaGgKz
 qShr5Qa/iLTm/+WJvt7HkXeFwYSHfRBpzXhDFP5ezqK8Z9rPMxmlxqFPMQxm/7sFDwq8opc16
 pzNy2mOQ0+uB7UNAQhQxCqa3GhsnZILA8Vbln1uRfu5pOTjpnNvUkfB2EYNllG6DjH85vFw08
 R75vHjjpEllDSfFx/25S7Zia4ihkj+HAObKiOMUQnA44M4GyTZE1+eMCRFER4xZpteMtZo0xB
 OT2Xu+druKgy9VWYWtH7RSYL6ryEx3Zi9AsKfP1JkF41yVJ0C3LQyc5goa3icHIWm+QygkXMZ
 EStubr6JYbN1mA1dUODEAqBi3jSxL0tD/xloLFlxBsWEW/omlOLwvqD+r3Ef7mBqdiKrskyOA
 qkbxVzOEPZjSeO3trIE1mghSSViZiCNfA4W6d+0JvuOMChSGUTMW5VFiS+sqr3TZT3tFtT65y
 4jGM5KGYbycb4ZjXS3jkoPB1UjBi3bttWNnq7rfcLJZldbs93Jt7WT2xhI+TV7iz2L6imVnKk
 LlIcbdB9YTXPNUDSOo+3/n+vXLtwHQmQxkN5uwnVSxHlS+PZvX9eRUJRdCfS6KDNREWIsKxVE
 iBmSlrBVKDYvwHTCzonPZbp5wcAsB37s920e0lyyOUq/ktext60OI6GW9qsAlGvU2KRVq5YuQ
 oKFg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_052347_266591_7EA7E43C 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Apr 30, 2021 at 5:33 PM Rob Herring <robh@kernel.org> wrote:
>
> The Sigma Designs Tango support has been removed, but 2 binding docs
> for NAND and PCIe were missed. Remove them.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-pci@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
