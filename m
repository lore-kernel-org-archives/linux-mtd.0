Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0469FC6379D
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:20:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92743206FA
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 08:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1RBM3/pZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="go00I6YE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92743206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6Xv50IzZM/DW821LMiXq4WNyfvNrr0+SKvkakFrclVY=; b=1RBM3/pZLrcKWgjhzkqJEE8sD
	wtygZrMUbyEGWplfNLiEAH7LhuU1GYI3oE5H5jlr5Q0q51j4EdBK3lPBnPQK5Kf8FNNeFa0yWqi8t
	qrl9UUcisHduqj0rwwgV9Fz1Zsz9enh5JssFOA349JUm98gsNsZ8cI9J/IluoLUiEy/XfprOGWsDU
	JfUUrUW9Jml57SOz+k1zuvdX4tWUDXfAe46Ujk96sz5t+vWxUGqAJWZv7RdG7nCxhi/D2ERDKMGI8
	AGXHcyKoRSPKDbndSPQq3/imHqHjZ4k/zb4leDs411Mjf9wl44nVaoTjPbGvZGojrQ613cAScH9ib
	dBO2gzHAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kh745-0007OE-Uo; Mon, 23 Nov 2020 08:19:14 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kh743-0007N5-2y
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 08:19:11 +0000
Received: by mail-qt1-x844.google.com with SMTP id f93so12771143qtb.10
 for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2020 00:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d34JGaM1ueBD2F2F6axmebzq/GoYrIAB04I9Xtt5E5U=;
 b=go00I6YEpq3e+ILhuooBc9PUESyoBmrGkYrh5//GgDgf3S0f1U/GgL1B2gVdu9ojLn
 /wdaBETB0WoAdvqlGWDm4Z4eq+5z0s/qOUdHB5k1n/hU0Cmo0M2q0MSjCwyUYtEFNMUB
 A2CCYutGMK2Ip31HSUaP/xpxuzHQYXiDGDrxqSSMQD8gh+7/Is6gcMBHiI4oXrXET4G7
 MLm0twQjgZr08AvRKyPk1CxTrMQBK9t9EBJoocvFJNx9sy4QL13xznjfTXEp5hm/ILRt
 DDli0y72PXV+6jbPJIyz/qTcDuUpdwPczYewhDIj0oiE3zcTE5TlLuohWN8J5hmESDFS
 zw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d34JGaM1ueBD2F2F6axmebzq/GoYrIAB04I9Xtt5E5U=;
 b=UnPwPfHkzzmhGdpK/4AZsm1KkuCQzW/ZvMMihqucD7dMudYTTOIsNVFi/4qs5RpCUS
 2QoY76woC1Dx+2akBSKzOFzuBmlBuO4CODLN11KWC1CtbkkDaWizqhCvKYvmvoABSLkb
 XI2gZRaMBtzneIiPh8rKirc+7ivpRuZVcJ0UacGAVzdYrOflOEHbes1VqX/7P8BuYqzI
 NKb3ANke4+jpKe2/fD4zPrltEyWHvsKwQhUYgTjPW/Qe7EEAwN7DLySGS56haCeHD2JA
 giuHBTxWFjUrK+u2AtZiZVnYnYW3rSbzyjggOrBVPCGdHeLu9ygiEeC1gEamJl9Csf1e
 ySRQ==
X-Gm-Message-State: AOAM530XOgv+IQ5HvXBcwt8F3f6FLfunJCiLwJ1inzO8110eAgEW3BTf
 cBki3Uuj87o4wNfs9zGKvEWWrXu+Ida62vJnIS0=
X-Google-Smtp-Source: ABdhPJwALaFQo0lBpGaC93Fwp9tKYrp5lWlwAtXbXrPN9LXwJT979t8mW9Zcnmy/UeGZQx/m6GgvHMwtgvpej5P7LFY=
X-Received: by 2002:ac8:6c49:: with SMTP id z9mr9209534qtu.82.1606119545439;
 Mon, 23 Nov 2020 00:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20201014065443.18512-2-lizhe67@huawei.com>
 <20201119025050.38472-1-lizhe67@huawei.com>
In-Reply-To: <20201119025050.38472-1-lizhe67@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 23 Nov 2020 09:18:53 +0100
Message-ID: <CAFLxGvzkzM770a+YufAw_o6viY47x7aB3unmHVWfjCd797LubA@mail.gmail.com>
Subject: Re: [PATCH 2/2] jffs2: fix can't set rp_size to zero during remounting
To: Zhe Li <lizhe67@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_031911_170690_D9D42A78 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: wangfangpeng1@huawei.com, Richard Weinberger <richard@nod.at>,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 qiuxi1@huawei.com, zhongjubin@huawei.com,
 David Woodhouse <dwmw2@infradead.org>, chenjie6@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 3:59 AM Zhe Li <lizhe67@huawei.com> wrote:
>
> Maintainer ping?

Didn't I reply to this series?
/me double checks sent folder.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
