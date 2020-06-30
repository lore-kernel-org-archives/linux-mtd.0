Return-Path: <SRS0=kN4B=AL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFDCC433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 09:15:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 683B820675
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jun 2020 09:15:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UcyhQZiZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4g1le9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 683B820675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fBxJrgVgLuwClrqyWP1XwKKiZsOvK659T5vjLGF2MCs=; b=UcyhQZiZicx4PJ1amIHil8V47
	WH+9UY1mey4OYLlOrfqsbEaD795pblUzsfaVP+k+lAarzw/iauZv8VxUtVr3I06ewKtRpljwTYKDg
	gpW1UgnLuWrElmeRuQB4ViFT/JW5Nq3pMqEkT+/fvFLLN12Qdi2hVvmkURPcKZ5KubBlnyqYTskpx
	VRhoI19lqahBZmqx46yTLA8AoF5URIcefI6KO1DrSoeVHm70Mr94CehulB7CS/lmpRgErSuG1PxCb
	HYwrAS/+ExCMfQSWHCGzlcGbfsKM2kcOe4lQ0BTRw6KDgOlMVDRi0DFvHsz9txck+ZjhbUPVEnUoS
	GcWgSLJPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqCLB-0003fC-Q1; Tue, 30 Jun 2020 09:14:09 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqCL8-0003ee-PH
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2020 09:14:07 +0000
Received: by mail-qv1-xf44.google.com with SMTP id u8so8924210qvj.12
 for <linux-mtd@lists.infradead.org>; Tue, 30 Jun 2020 02:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=goGiq75i1r9UL5Bg9QEBSzEo+ZjMGYFQePVSHu+1Wss=;
 b=p4g1le9/ZfF8ilquMjXqNMPvi8RiOh9kTjkToZUu3WyBU++LirvbrgkQ2h6Bpf877K
 cYygMEY+jS7/cpIyNcFb1rQcKtotPZr5PTnakDOxRpMtSjb54dHI31e1N1b/hWSa07r5
 HyefN36kstRQuh6GF3RPPy5+F8KJ3yjqQnSG/dsmh8x4fYTPaHuosfNtJ5yPz3ijeBXs
 hbxpZ9SDS3SW7Qg7t6XO357gC63oKuabATS6UhqWjc35Qm6rs65ZHvJNehPaZoVTR3JF
 Il7X5gOb/qraRnOM887GonIo46XEfKfz+aRm5zk8UIQN7GTbSXWL6InIx51H4VG09t86
 W1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=goGiq75i1r9UL5Bg9QEBSzEo+ZjMGYFQePVSHu+1Wss=;
 b=OG0AIlySCHXAzddBH0kIybLJhW5WN5mOvuxdRyWMSx+BZy6f1wDure00No92cV5/la
 X3hMTf7sGjfRmflI6uW2EIBRbzonQIf1a8d4+qT35Y1xOYmJrJuWwHDgFSI3X3r6UMaU
 H+uO9rT9D8AwDNhSEqq8ZI7ZCNYU2y07u7e8JJEkH/XliZxRJHLXFiYSip2gt4CGIuTp
 /rFb3FvF4qow5pAlq6VoEatzWhR2DsbJt3457m030pf5RK0dICxlzaqX9UGisEmEKM1a
 FEvRTvkRRNFRItt8tTCAfbjI5C1n5L8AJ2kBesYFD0SZVYrm/KeJO38bhQHpN8kLjCew
 BF9w==
X-Gm-Message-State: AOAM531aXKEJN2Ci/n9eMKoHV3aw/kdwGz/TXq+raC+DInIaWeJPs70g
 MZuLA+SkC9kDhtiuqTQ7wqGdQoQ5FF/0SARnmwY=
X-Google-Smtp-Source: ABdhPJxEorLd2eAYPtaEGcI5F8EpfrHsypfMl7/Fu8I7Xbr0FcWZSr3cSenpQxQD5tD7gaEocYzMslPBrkwzWe8rPTs=
X-Received: by 2002:ad4:42a7:: with SMTP id e7mr19066154qvr.212.1593508443740; 
 Tue, 30 Jun 2020 02:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <1591975362-22009-1-git-send-email-christophe.kerello@st.com>
 <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1591975362-22009-5-git-send-email-christophe.kerello@st.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 30 Jun 2020 11:13:52 +0200
Message-ID: <CAFLxGvzfh1Qa_gM9bZAxaoCbO6xCoNdaPN=Ea20Up_zPVgjugw@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] memory: stm32-fmc2-ebi: add STM32 FMC2 EBI
 controller driver
To: Christophe Kerello <christophe.kerello@st.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 arnd@linaro.org, Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 12, 2020 at 5:24 PM Christophe Kerello
<christophe.kerello@st.com> wrote:
>
> The driver adds the support for the STMicroelectronics FMC2 EBI controller
> found on STM32MP SOCs.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
> +       if (!IS_ERR(rstc)) {
> +               reset_control_assert(rstc);
> +               reset_control_deassert(rstc);

Shouldn't there be a small delay between assert and deassert?
Other than that the code looks good to me.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
