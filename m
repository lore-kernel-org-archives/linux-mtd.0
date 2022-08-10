Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D2DC00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8FXYlWBBi8P+9p2R/G11VPdjiawOLnDc/6hzO/qVSs=; b=UOpXQr9mu26IiP
	pFEMXwqbhq4XvlHsSzpqW3IyiiCzYkrZd10QQCJ7QSgF7KTwNB8ObaQ4f5iMCHaNqtzaX5EqEHX1E
	nTtDRkyNrvLT9Dma+D/4yddNwGKmgcHGaKUV5HZFWVYKLtSguC8FcIt+Ux99k6ZP8C/2btWkEfXMS
	RMQVA1UGdNOfw+UICzY8W1VMSPtf90qb+HrZ5M+S2cf+wZrwcaLcesL2N40Bklv+MW6gXo3AWw06a
	qPYa/05vu/PF2SVMU35z7cyytoeYizTJzD3yydvXwOc8rkvfdmZZmA/N8e2aH/TSjVoYP0IqmNXXt
	pwoZwpufD8QNXWQXOASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLnPg-00CUyB-CZ; Wed, 10 Aug 2022 15:14:28 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLnPd-00CUua-1r
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 15:14:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gk3so28256493ejb.8
        for <linux-mtd@lists.infradead.org>; Wed, 10 Aug 2022 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=a7p2Aw6uqyxGssz8N+URjITzJ9u83rNDpdd6+DwVix0=;
        b=c7ogfFCYk7LHsN7fWjkFNGKWDOb3QEPWn3xYbvLXkLsXTvXWay55qJITaojRTU/15Y
         ae3X470ITVyVB5ZmVwbAkMxPzgRxfaL90Ws/zfABUa1fnLJmHHVb6y+XydkHyh3s8LmM
         DXjVOFKEdJxEwd5t54RZRcaG8kSx0OEz47p/S4F+YC2yBG8e+0+jkAbYZpLdX9xsmdWe
         w66cFE/zVP7I/5/jcOPPaBX6eI13hxAXB95WNNwu5sLPuQymu0VZ9KMZpzbSqkF415+1
         B/4mhJq41/eY5QdM26ZNOEtL7DAbBH1O5Z/Y4DE/5bp5TxtC1JdnZnGJ/u1LfnLhjrkr
         5TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=a7p2Aw6uqyxGssz8N+URjITzJ9u83rNDpdd6+DwVix0=;
        b=TF0BJrlyoVWtjut29UP5+7xFVXAVsbb/xEnDbTnSts0D0Ww5k/onGB9OtEiIKzX/qF
         dwoLJq8epB+8w/23wwdTb30KgePLorjq0vUJ4QosD8oNtpzTECGuNjaBT/o523JZut9t
         QuzlpijxEgWFSYtCRCvHFPdaoXgqBnKIdBkR3ycnCXFikqzyifji/yG1UBXLD/m7QnRE
         GXsuYorMSaoooow9plT+jT/Bv+ZLnfwgwyrsssB6gqdIkVKTi1K8ThUzEjT/bNKvz/uo
         o4SOzzwM1PGgrK/VmgyQGC3XQ4S2Z3t7OeK77NoaKbzCT+K5EL7APdDpdIplImwS7/S0
         Fjww==
X-Gm-Message-State: ACgBeo3twZBm04zpkbp02+rHPK7Cd+vbz56fmsOfLqGs8inLpqOBydDF
	Kz6uFnBWr+TCT8f4ZLuwzCsI6aE1scD+v8+InwnPRA==
X-Google-Smtp-Source: AA6agR7y9hhKnZINQP71Ks1DUUklmiwHLYS0noEA84FATWHb2VED65vVJB3AjkDqkfcSTFrDPU+aNJoQXrUrRKkCLUU=
X-Received: by 2002:a17:906:ae95:b0:730:7c7d:3868 with SMTP id
 md21-20020a170906ae9500b007307c7d3868mr19938951ejb.564.1660144460733; Wed, 10
 Aug 2022 08:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220809201428.118523-1-sudip.mukherjee@sifive.com>
 <20220809201428.118523-3-sudip.mukherjee@sifive.com> <361fa56d-617c-ee92-151e-5d8fe0a29e53@microchip.com>
In-Reply-To: <361fa56d-617c-ee92-151e-5d8fe0a29e53@microchip.com>
From: Sudip Mukherjee <sudip.mukherjee@sifive.com>
Date: Wed, 10 Aug 2022 16:14:09 +0100
Message-ID: <CAHyZL-dgrGu3z4ySy_EdG7KdZwU+DHdo8nH=+Go_nGZUZYFq_A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: add SFDP fixups for Quad Page Program
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Jude Onyenegecha <jude.onyenegecha@sifive.com>, William Salmon <william.salmon@sifive.com>, 
	Adnan Chowdhury <adnan.chowdhury@sifive.com>, Ben Dooks <ben.dooks@sifive.com>, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_081425_281133_2A10EC8D 
X-CRM114-Status: GOOD (  13.65  )
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

On Wed, Aug 10, 2022 at 9:06 AM <Tudor.Ambarus@microchip.com> wrote:
>
> On 8/9/22 23:14, Sudip Mukherjee wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > SFDP table of some flash chips do not advertise support of Quad Input
> > Page Program even though it has support. Use fixup flags and add hardware
> > cap for these chips.
> >

<snip>

> > @@ -520,6 +521,7 @@ struct flash_info {
> >         u8 fixup_flags;
> >  #define SPI_NOR_4B_OPCODES             BIT(0)
> >  #define SPI_NOR_IO_MODE_EN_VOLATILE    BIT(1)
> > +#define SPI_NOR_QUAD_PP                        BIT(2)
>
> No, as I previously said, SPI_NOR_QUAD_PP should be declared as a
> info->flags, not as info->fixup_flags.

Sorry, I was confused as info->fixup_flags says "it indicates support
that can be discovered via SFDP ideally, but can not be discovered
for this particular flash because the SFDP table that indicates this
support is not defined by the flash."

--
Regards
Sudip

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
