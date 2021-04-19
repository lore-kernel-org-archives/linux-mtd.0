Return-Path: <SRS0=PDg9=JQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0349EC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 11:48:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 570DE6101D
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Apr 2021 11:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 570DE6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0ulgyNXY32gjrsJJGWP2njxRz3UiCL15DmzSAFLROIs=; b=GsCqyVYTwUuotHgc4OF/749K8
	b/bbvaS4vn3pS0GVZNyMH+D3EGVV5VGh/3WP8Y4MK4S6/jV1inxwvC0Z2qF2rQ4ngA8z+BcC4ivyD
	CjPc7fRqEuS0DRaJSwOPJ76JhT45k2RU2WtZU1Nhrv7GvcqPgDVZQpwllrZzIwlQ/0QU9mDT3dj0c
	LNTZb005W887glFjvLiOG1elNo2MR5LtfCUlMw+SxJXPaw43vpq/ZlkPNDIYZ4B4XF5hkQM+7/XzV
	A55GlzEZpNHkV/ywe+qiMMPz7m8+6+kKMHXR8c29TsPnD/TpFO8nmtwNhrlS+nUGzWCt1VVdyIsxm
	TRtYUQLKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYSO1-009oDQ-Oe; Mon, 19 Apr 2021 11:48:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSNz-009oDF-Jw
 for linux-mtd@desiato.infradead.org; Mon, 19 Apr 2021 11:48:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c8mJsm8GaeXtWDHzV27HcKcUv25VPqwek08DmDlzIxw=; b=dz4zDawGhxUYZ0hsAigaN4nvTG
 vweeMwpHprpcuhn65k/NQhOn+C+80UBkNBVi0G+Lj3SWDK45ksmo0tcd9ph5jC6Jx5KeSjsDOGbm0
 8yUrPOa7bfXKxXnVlIcr8dVoLsB8bbx33c/QFJ/kq/6iiCJFDUNJzsPielrG3Uy/EDdFP/OhIIV7q
 5sU/ET/0q6VRICubuH7SkKHPME2VSu2Gq8nUUC/CTlQQ6FEeVZaVV2aw/VMPdcvvBUpQQZ6PrBmwV
 +6Rlh6yXYUt0ea9j6BB4wlKZdlh+jDMK+6koj9P0nCsrh9FnfyaTS8nSpGuN9jP7q1Zq/pZLjOrts
 ZS/lkPDw==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYSNv-00BK2e-2I
 for linux-mtd@lists.infradead.org; Mon, 19 Apr 2021 11:48:14 +0000
Received: by mail-lj1-x229.google.com with SMTP id a36so28137454ljq.8
 for <linux-mtd@lists.infradead.org>; Mon, 19 Apr 2021 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c8mJsm8GaeXtWDHzV27HcKcUv25VPqwek08DmDlzIxw=;
 b=tHoOzB6NaHlEnYW+ajgF3xH48ZC2DKpJILsLJje/ufBw5g/xvnw7rfP4Y5YWk0T4j1
 UCR1uq/+1q1Uwhls+qh56NxAwZnljZOkJeF5zpwnS+qs4nNhrsMh+uJx4bZhwjV2JVct
 Ix3SM05Ix2lSyjVPB/FAsXwG4WKjP1tQ4MlSvZdxfQCuGTKCCoqVgzMHQOaUYthoOV0k
 OnKQAc2RvOo9e91miON8GRGYH/F8vZ+RcyKt+2X7rBmBpDO155oY48udoPZU558zasB8
 X76Q0M/5pmr+iWdIF3hkwXG8zOYJVv9StXEPkBZZmHUXncYItNSgznJFcB+nHbrsuGE1
 GwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c8mJsm8GaeXtWDHzV27HcKcUv25VPqwek08DmDlzIxw=;
 b=Ld1daLpJxATE6Rv3ZPSvI6l8slcyN1htbutpw+23LrB7rRyN0D7OPsgPemT3kcX6Bb
 4R+WcpI2FgBFMFK+I4yFCx1+U7CPiC0QKSjdjXfOedZj/v/HKaZOYXtkyxKb+2tMQzPw
 sfnx2nhuSXOHpGltl6MIVt9Ti+JrWagFmeWZ2cGobxyoMpFB9e8UHLgA5eHgDwy3OVoh
 uk9l9f3r5xWdGD2+xI6KG361ors+bIGcwiswCcVOZ1MBC8c1f6V26+GBYtrIW/lQ7u/u
 Q465lMXTIVaYsdIe1ozNsasz28wNYQL0SgxVgr9Txl9Nm5vKpteTXjOCchmJmUqq0j54
 oUqA==
X-Gm-Message-State: AOAM531pEvOtThCMmwJWmzaTzug0PgzOReRsDzplwD8sRwMet/KGxNA4
 8o8bZXxHs0V31vrC6P/HsdWS9h+prnREfV4MY0Q=
X-Google-Smtp-Source: ABdhPJwiSsYcOu1Lx9fAJJrv8h2Q/uqtt7Xs+q/QkxqQvpEi7Z6UmihENIWXaFW3a5x8ZSLkSZ5c2hVoKPgNDGer0ng=
X-Received: by 2002:a2e:88c6:: with SMTP id a6mr9876907ljk.116.1618832888199; 
 Mon, 19 Apr 2021 04:48:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5DufVR=+EzCa1-MPUc+ZefZVTXb5Kgu3Wxms7cxw9GmGg@mail.gmail.com>
 <20210419083738.07a28a20@xps13>
In-Reply-To: <20210419083738.07a28a20@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Apr 2021 08:47:56 -0300
Message-ID: <CAOMZO5CpzojN1U9HfSA8Vi8uEzrn=0cqo4tMd_qi52F0Q6kObg@mail.gmail.com>
Subject: Re: imx27: No space left to write bad block table
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: Sascha Hauer <kernel@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_044811_129920_6E65B8BE 
X-CRM114-Status: GOOD (  24.15  )
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

Hi Miquel,

On Mon, Apr 19, 2021 at 3:37 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Fabio,
>
> Fabio Estevam <festevam@gmail.com> wrote on Sat, 17 Apr 2021 12:59:22
> -0300:
>
> > Hi,
> >
> > I noticed this error recently on a imx27-phytec-phycard-s-rdk reported
> > on kernelci:
> >
> > nand: device found, Manufacturer ID: 0x20, Chip ID: 0xa1
> > nand: ST Micro NAND01GR3B2CZA6
> > nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
> > Bad block table not found for chip 0
> > Bad block table not found for chip 0
> > Scanning device for bad blocks
> > random: fast init done
> > Bad eraseblock 329 at 0x000002920000
> > Bad eraseblock 330 at 0x000002940000
> > Bad eraseblock 331 at 0x000002960000
> > Bad eraseblock 332 at 0x000002980000
> > Bad eraseblock 333 at 0x0000029a0000
> > Bad eraseblock 334 at 0x0000029c0000
> > Bad eraseblock 335 at 0x0000029e0000
> > Bad eraseblock 336 at 0x000002a00000
> > Bad eraseblock 337 at 0x000002a20000
> > Bad eraseblock 338 at 0x000002a40000
> > Bad eraseblock 339 at 0x000002a60000
> > Bad eraseblock 340 at 0x000002a80000
> > Bad eraseblock 341 at 0x000002aa0000
> > Bad eraseblock 342 at 0x000002ac0000
> > Bad eraseblock 343 at 0x000002ae0000
> > Bad eraseblock 344 at 0x000002b00000
> > Bad eraseblock 345 at 0x000002b20000
> > Bad eraseblock 1020 at 0x000007f80000
> > Bad eraseblock 1021 at 0x000007fa0000
> > Bad eraseblock 1022 at 0x000007fc0000
> > Bad eraseblock 1023 at 0x000007fe0000
> > No space left to write bad block table
> > nand_bbt: error while writing bad block table -28
> > mxc_nand: probe of d8000000.nand-controller failed with error -28
> >
> > Full log:
> > https://storage.kernelci.org/next/master/next-20210416/arm/imx_v4_v5_defconfig/gcc-8/lab-pengutronix/baseline-imx27-phytec-phycard-s-rdk.html
> >
> > I don't have access to this board but just wanted to report it.
>
> Thanks for the report!
>
> Indeed that's a misbehavior, this happens when *something* is not
> happening correctly and the board boots over and over, each time
> decrementing the block supposed to contain the BBT until there are none
> available anymore. However I'm not sure this has been caused by a
> recent issue as there have not been major changes in the core nor in
> this driver since your last fix. Maybe this is a leftover of the
> previous situation. Would this be possible? Do you have a mean to find
> out the day/kernel version which started failing?

I know it does not happen on master, only on linux-next.

The oldest linux-next log I see listed for the
imx27-phytec-phycard-s-rdk board that I see on kernelci is 20210401,
which is also affected.

Adding Guillaume in case kernelci could help to find the commit that
causes the "No space left to write bad block table" message to appear.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
