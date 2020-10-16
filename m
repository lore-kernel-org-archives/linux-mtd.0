Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9737DC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 19:19:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD90207DE
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 19:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VzDfXXuL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvKavVvF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD90207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oVq1Yz/FU7/l56MPATRZ2kVre/old5/ToN4ON7cpOXo=; b=VzDfXXuLL2PJPeM0nZ8OJwmX4
	KYzQlwsnQFgiurdTpI8YTI0wF0wLLzHlgL6SR/Zwy2DCY6Ew82pVBujq7Z7GCrn6nBHcenonPGJXz
	PlthxfuJJ5HK5WccKpeZrzjSPZzleVndCue78Z11M1AL/8mAC8VCw/U2gWnPKqEprKKDQ5dFD/uJE
	W8QYPxkpfEplvF1oTRVHihhvIf2o3iQm3mJyc1y9+Ep6GVk39uphyN0x6sCbNspiwt74XtAr9gGNh
	vtePx6+XFRzAYx+1XqRcvLTZ4gd9j67ba+Tm2B/CtwdSktTDYzvqlyqC6T44L7j9jixMyErcW7RbQ
	lp2EMJkYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTVFH-0005He-4u; Fri, 16 Oct 2020 19:18:31 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTVFE-0005Ew-RD
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 19:18:29 +0000
Received: by mail-lj1-x242.google.com with SMTP id m16so3663353ljo.6
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cLZG8uh8rNwsSaom/TBIgS7ChAFQu+p/fRXJwO606AM=;
 b=OvKavVvFM/wmuoON0bDgPm/2FMWMUSJ5AASkRItx0FysXis12CE4dDB4gmxzF6WCdl
 nJuX1/RzPYB2jNACEHsUUCThJVRNGV+cnlWDoJhBrQSrN4/Pf/O3wtuKwyhiqIqlvHwT
 z3+qaViDHhQjZ6evg9NrMQL3FfySViWX4gClVrONd4PdgkXKL2uo8JBGE55+n6mL8YPZ
 X4+cJmJRL2tb/K4yO92gI7OymUkk0tpZAGNz7/wiTcuPkMBOCn8j0AWyhM/W8rHhxf7B
 aqJzz1uF2ef8ORke8LmSppUKwYJ5t4vzs0p25hkKuiejK9WUchgxcUSWBAUbRxsjBqj/
 LC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cLZG8uh8rNwsSaom/TBIgS7ChAFQu+p/fRXJwO606AM=;
 b=dE2TfdrIB6zrTp/+XxHjeWt5pnGg9L6MBTMP8rUF5tJNTBrmVR+uusBVN1+YVwsdsL
 7/yj5NFCMYsBOv/3ustQi6cUnhERbkkWlV1SDp1rp7WsjYTrgwuAoNAWaJMfZsc5WA2t
 /X2FbsQiJ9OhbSEdKDIt9MuK60YyAsO2tOXvGvGBIM+/Bo/7MEyVxz5z2tu0t22n36vm
 fNH3CpFaexc45+V4JjPTY3SoyIhCRy9MyNpOoMBR9WGWVCGOmr7nBxQp39E0S2HjQ+RQ
 JqIFVv48g/8d3hV5ZuMm/iwx7uawIKBn4XZ95Ma6jPP1Bw6NSAN/F/zve+9W1BzAxj2S
 v4Cw==
X-Gm-Message-State: AOAM530WMawy2AExrKsbNi+Z+tmInJxTU41wFAhLsoPS/xdJzvphDJI0
 BfuYYYCnA3aJPpuEdJ3CbRLwRacD+RsHAkb+lSQ3Ef3U91GqQQ==
X-Google-Smtp-Source: ABdhPJxbmqe96MSLCEufBQ8DP8I1gqX5HthmXpIZhVO0sPEBIzgTiCSoa2gTnpNxbRwOWa0+RNv0VI1MUiKHdSTPAqU=
X-Received: by 2002:a2e:99ca:: with SMTP id l10mr2073815ljj.218.1602875907081; 
 Fri, 16 Oct 2020 12:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <20201016135351.GL13710@pengutronix.de> <20201016190149.55a3d62f@xps13>
In-Reply-To: <20201016190149.55a3d62f@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Oct 2020 16:18:15 -0300
Message-ID: <CAOMZO5B4kC5ooE2Pmp4XaHq2xD51JSH35nF7_Ge8-xzp4piqKg@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_151828_927901_462697D5 
X-CRM114-Status: UNSURE (   8.56  )
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
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Fri, Oct 16, 2020 at 2:01 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Software ECC is used, is it expected?

I noticed the issue with your patch: host->pdata.hw_ecc cannot be
called within attach() because pdata is not initialized at this point.

Instead of using pdata, we can retrieve the "nand-ecc-mode" string
from the device tree.

I will submit the correct fix.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
