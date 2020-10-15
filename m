Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB742C433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 03:11:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D260922226
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 03:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGBP1yL8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM8zWH5/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D260922226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5dwY4PgKVZ0+lrxZFPuYLhlCKSY7nchxhUPGX7TFQuQ=; b=cGBP1yL8ektPtBJNEwmWtZ9xF
	CUd9QOszJ+N3udnbbg5/xVrlOYV1x9SALjkN2w6PmKvdqoIuwpDOzGw/WPeNyd+9F5pVxBxJ1Wdr0
	BuhC5+MTxNMDYr26QiAbUwzKJEyZ7j5/jooY0qZr6juJa6mzObqc11Oz8MqVauSrawYAFVE5UJ5fP
	Si3dOGx7HSK3h15xrnaGywFfGrw2V1xTpuRqflmEnfscQuPUmRf2zcK86TGpsgnQOgceSinJB54SP
	NNYaaIx8aWX/GawwHJxnVCGzWyIoopgMjfqLttgcRRWFKhIfxFXiDaHmtcdR6sbpOkh1lXv4XnzxC
	Lx40rSXJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSted-0003mC-Ux; Thu, 15 Oct 2020 03:10:12 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kStea-0003lZ-OW
 for linux-mtd@lists.infradead.org; Thu, 15 Oct 2020 03:10:09 +0000
Received: by mail-il1-x142.google.com with SMTP id p16so2464586ilq.5
 for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2020 20:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SsS3nWQ51IpbkZ8mRi2mgXFdyKvxDI+zok3aVtScdRA=;
 b=AM8zWH5/BgihJ+4bURksK9UIaS0k3ZsHtPYScOFZI7qtPvagLUH2ThnSMnaxYxkqNT
 BSqEFKop3umM3Pui38YC8QQuD8omG5Jlluyr+orJXlojAfrJm1nZt1LbT0WlSC60JBNX
 Q6fXy9aGYY5asKrCXS/KUvbJuZGpQeibK6kYO8KV+6vdlFGVJoD1BAlAHHMf5agGi0Vd
 2jAKXwK9SfMbUA2tQ/9Rs2OddrSdZKL6qCh1llnEGraBBu7el36UjP05QBSRl382sWEe
 p1Dv0NlRTsGPOdocfFi8aXHBNK/pQkNUuyESkTAgaPPl0QrZek7AzaoEqEqw9Bzg3Ys0
 1VqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SsS3nWQ51IpbkZ8mRi2mgXFdyKvxDI+zok3aVtScdRA=;
 b=DIxanbskpN7BuI9MC0n/FFu0/NNOe8bgO6m7yqrcfTZNJgIvsbWgmaiOrHjOIVr5/6
 s66USYMkNSt+DND0A3RHKAHMJ8RgVfCRAAfznG/t7bhQPTuFrrWWNDxyMdDk6n/JtoOY
 vY42gJ32V5Nf4rD8TFoGMhPs4USXBs4qwKO7b6+ZaliafLUCA6EFRTozMWjlWzTy2/1h
 okKduBbC3Hv2M83MjdSyoDZh5z5mc/WWRG+QYiU6bPS+boOy2SLCZsONWfFIZ69W4cku
 TBekmevhJpHJCCmniapEk+LkzBruQ/0FPR70eDJC12iuCJNHKaFyePa247Zhek4c9W3K
 gP0Q==
X-Gm-Message-State: AOAM530RE/p51881/vioXKGVfl0UmtLl1dxNK9syD3zYrsCYejvC01uL
 JsG8PMVryoChW6JrCQtn+jKhupCSVfT375/MciU=
X-Google-Smtp-Source: ABdhPJwgteSkytIPr01UY8VKG7Dfj/a2lMXamEVL/CkCHmLZYjDXD0dcNtEMODx3W93t5V83X1I9gBAnHBCRMuQO8ik=
X-Received: by 2002:a92:950d:: with SMTP id y13mr1715877ilh.42.1602731406841; 
 Wed, 14 Oct 2020 20:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
In-Reply-To: <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Wed, 14 Oct 2020 22:09:56 -0500
Message-ID: <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Fabio Estevam <festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_231008_835625_1B0E8254 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 8:35 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Han Xu,
>
> On Wed, Oct 14, 2020 at 6:38 PM Han Xu <xhnjupt@gmail.com> wrote:
>
> > Hi Miquel, the changes to the nested switch statement make the logic
> > of this break wrong.
>
> Care to send a fix, please?
>
> We have seen ECC NAND regressions on mx27 and LS2088 platforms.
>
> In which platform did you noticed the ECC issue?
>
> Thanks

Hi Fabio,

CI test reported all LS platforms have the ECC regression. The error
is "Driver must set ecc.strength when using hardware ECC"

I haven't worked on any LS platforms so I tested on i.MX platforms
with gpmi NAND controller,
the code ran into NAND_ECC_ENGINE_TYPE_SOFT due to this issue. So
these are two different issues, I can send a patch to fix the nested
switch statement problem but won't fix the LS platform issue.



-- 
Sincerely,

Han XU

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
