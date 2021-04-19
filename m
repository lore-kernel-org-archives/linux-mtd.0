Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26EBC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 11:45:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4520261166
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 11:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4520261166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p0QpCU0+POJNtAuYqrf3h44rBtdDroEZnazoccDNtug=; b=nkVXT0DeAi9PGtWWTQlAVaX6p
	4DlokjA2ulu+8CWrntUwW3w3JePvJBJ2Bb1RHVwUbXchVFah/qcZoFKtZuFi56KCVgtSna/XnWJ/J
	GfdqveKThQu0uUv2ceWPsumHnR0zsky6hLfQcvhTgGi/PFCaCl4f/ybaaeB9rwSOYpDS8DCKoNbId
	sOAFGmH14QHv9LXB+OfBcrqLjUsG+MBwUs6EDNEnRAHBmRThysqDg2+f7KPC09SciC0iDbIv4XcyM
	Xv0ScjS+DsASr2N0afEwmxDq7mQCxibiwPQIIqBjPGjgcgoxEHw1LK1i42OWhUiwx0PsrcMk/WSyU
	cXROaRiVw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSKx-009nup-KS; Mon, 19 Apr 2021 11:45:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSKu-009nuG-SP
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 11:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=SYX5gkZRjrpsYOJbGnnG3O3r7V3ElN39fbI1O5590C4=; b=N0mKabt2Tl/9JmFy/GmK+/wQYZ
 8dj7O4VOP3H3hbCEu7kcA9v9y9T6sYUqICnMSYev3RzZAsn2UwP+iM2rV1jfqRRbY2BupIk2Svafq
 EufMYiKexQDeadmOiExPKecylYaL4ktj4sm76HPrja4beHZjgi0dGGtnFBeufPXiamHqVse/bV1RZ
 EFYDDhgJUg5vbz9h6P9Q6CSQIaT5snnO6IqhRKBHD9NH2n/FbslIeZMqV0MM+bB0Co4+2cXWLdSmJ
 vCVKr+kGdiMPudS/NOLtlHYgNRUEYXN3B5mgBu5l5yp4GAmZ6KHESnkXDJb/hTdV7zflbnx+l2po+
 tCdnNrYw==;
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSKp-00BJnk-4v
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 11:45:03 +0000
Received: by mail-lf1-x133.google.com with SMTP id j4so15934518lfp.0
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 04:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SYX5gkZRjrpsYOJbGnnG3O3r7V3ElN39fbI1O5590C4=;
 b=oDi4SR3voPo7ojpx0lp1jkTilivWUwzVScFi4fTXHGS16Z1IzWY/MPoDHpMHvOmeM5
 e7Mhubg8asKk0kzAdG+WuCDd61QI5AeARPk1UhLj55U9Ian7+ZhMOxrXBT6lw0i1BQ2D
 tmzUlbMCWQJl0IYiRrFSFKHg+I8umdt4gE7MEp9FozMToLTgK0lMK8VpcQ/QtHY3lV+C
 mldhLJb27TdCnxVjfCTNGajKoi+HBaj3BGuORKvwgu8oWNpy8+96DE/+EEfwKeM2Ksl2
 vAjbSNaZQnLbfb3D2r5/q46zyxINb9DfvZHy5eYGqqrkyTh7egIoFypV3mQKubwoZf64
 nAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SYX5gkZRjrpsYOJbGnnG3O3r7V3ElN39fbI1O5590C4=;
 b=tE9qniBvVucprS5i1mPUy4YRRNh9G39Bc4upn0jQuTTWhd8+hejO2LA52hMsrwwniY
 meiGsEKrkibg/FqxiArFXvUIYtq4071AXzdXRc66m4wAORHYhb7laNZCfpA3f/3Rdb8g
 N5TvYeWZHmQWx8Hg5dOQpOkCITC3BdxaDK+9zdN+qLP0xJsj+nynM3fSZ2o/oWe1P8We
 JjQSJAH/NkzmcBVOK7jX80VZeWk4FIoT1bbU4BUB2GD788lhX2dS4gPKTH7HxshAHYK+
 bqA8o1bbHu6Yfhn1WND3sFM7Xy2Dkkxc7kehKLKtkA0v/OrNu65gzqDpF+fNkFtItmyq
 3JqA==
X-Gm-Message-State: AOAM533JII2wr4CqGGydIsA5/2iw02ZRnZfUU2rZkVt61McY0X2vwN4Z
 DnvlB19eYr6fIe6MgeeTavYipQPavZ2ezLXL7lY=
X-Google-Smtp-Source: ABdhPJx2b4DvT968JawvAVnMpZvHXfo27WMpcg2WBwXXKNAVcPnAVKjQKpTa7taBed6DNQIzc2N152fsy6bf9gtUYWs=
X-Received: by 2002:a05:6512:1050:: with SMTP id
 c16mr12926964lfb.295.1618832696557; 
 Mon, 19 Apr 2021 04:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <a066668f-852e-b3fe-0e91-23f0187d6c20@geanix.com>
 <20210419093244.1f27cb48@xps13>
 <f82932ce-ef3d-519b-c9db-2f49b81f8a22@geanix.com>
In-Reply-To: <f82932ce-ef3d-519b-c9db-2f49b81f8a22@geanix.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Apr 2021 08:44:44 -0300
Message-ID: <CAOMZO5B=VBfjo2+vYq4HjT8USUdnvf3Gi3hjz1+_gWA1w3meEw@mail.gmail.com>
Subject: Re: gpmi-nand ecc
To: Sean Nyekjaer <sean@geanix.com>, Ye Li <ye.li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 U-Boot-Denx <u-boot@lists.denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_044459_230358_122BA2BC 
X-CRM114-Status: GOOD (  29.10  )
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

Adding Ye Li as the author of such commit.

On Mon, Apr 19, 2021 at 6:34 AM Sean Nyekjaer <sean@geanix.com> wrote:
>
>
>
> On 19/04/2021 09.32, Miquel Raynal wrote:
> > Hi Sean,
> >
> > + u-boot ML
> >
> > Sean Nyekjaer <sean@geanix.com> wrote on Wed, 14 Apr 2021 15:13:39
> > +0200:
> >
> >> Hi,
> >>
> >> I have two boards with a iMX6ULL SoC one attached to a Micron NAND flash (MT29F4G08ABAFAWP) and one a Toshiba (TC58BVG2S0HTAI0).
> >>
> >> After updating the boards from u-boot 2018.07 -> 2020.01, the Micron fitted boards is having ECC problems(in u-boot).
> >> U-boot 2018.07 selects ecc_strength to 18.
> >> U-boot 2020.01 selects ecc_strength to 8, but if I hardcode u-boot to run the mxs_nand_legacy_calc_ecc_layout() it selects 18 bits.
> >>
> >> The Toshiba boards always selects 8 bit ecc_strength so they have no issues.
> >>
> >> The kernel driver (gpmi-nand.c) seems to also use the legacy method (Resulting 18 bits in ecc strength for the Micron NAND).
> >> In common_nfc_set_geometry(): Both chip->ecc.strength and chip->ecc.size are 0.
> >>
> >> I would expect ecc.strength to be set to 8, earlier but cannot find the spot where it should be set.
> >> Is the gpmi-nand driver missing a call to nand_ecc_choose_conf()?
> >> Maybe we need a legacy option for the kernel like u-boot.
> >>
> >> We have +10K boards deployed so it's not so easy to switch from 18 -> 8 bits.
> >> I can explicit fix this in U-boot by forcing the legacy mode via a dt flag, but the gut feeling says this will come back to haunt us :)
> >>
> >> /Sean
> > I honestly don't know about such issue on U-Boot side, maybe you can
> > try to be more specific on what commit broke the logic for you as there
> > are not so many of them between the two versions:
> >
> > $ git l v2018.07..v2020.01 -- drivers/mtd/nand/raw/mxs_nand.c
> > 1eb69ae4985 common: Move ARM cache operations out of common.h
> > 9ab5f221a5e nand: mxs_nand: add API for switching different BCH layouts
> > 1d43e24b946 i.MX6: nand: add nandbcb command for imx
> > 1001502545f CONFIG_SPL_SYS_[DI]CACHE_OFF: add
> > 04568bd0b6d MTD: nand: mxs_nand: Allow driver to auto setup ECC in SPL
> > 5645df9e00a MTD: NAND: mxs_nand_init_dma: Make mxs_nand_init_dma static
> > 5ae585ba3a8 MTD: mxs_nand: Fix BCH read timeout error on boards requiring ECC
> > a430fa06a4a mtd: move NAND files into a raw/ subdirectory
>
> Hi Miquel,
>
> Thanks for CC'ing the u-boot list :)
>
> commit 616f03dabacb6c500e8a7ceb920cd08554c9fcae
> Author: Ye Li <ye.li@nxp.com>
> Date:   Mon May 4 22:08:50 2020 +0800
>
>      mtd: gpmi: change the BCH layout setting for large oob NAND
>
> This commit  ^^ introduced the legacy function that was the "primary"
> before.
>
> Guess we can say, that u-boot broke compatibility with the kernel.
> I have fixed my setup by enabling the legacy option via dt, in u-boot.
>
> /Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
