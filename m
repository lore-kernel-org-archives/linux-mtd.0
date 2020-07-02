Return-Path: <SRS0=vsLb=AN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89649C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 15:10:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B0F5206B7
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jul 2020 15:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKrVspJR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux4nFWdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B0F5206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=guX/tyqC/NyHX6QIoXRESXKUPNAfSNxKsJN5ZaalIck=; b=UKrVspJRgpb90WlJfijhu9f6z
	AXPvCoG3wKJA5Xi5Rnushg6LVquuFXDiROXO0OfyprTrEYUbIUaHOoONXSw+yBXc7fKfw9miJugIe
	NE/Sbc8UbcZnm/N734VLPmuu/Cs8x6TZxe5OgtxABHMyK6ypo+0b8ho3blDto4uYL7scyCCdOsbpU
	zph5O1lJdsMoChj2XEpTOnqYvVcwrgBNBcIvBMCpnMCUyeIRbhvaEhXipREK4Fi5E8yQUxch5PH4r
	Un3WulyBAap4E5H438mJzv6xJ0xYSDaCeyN8K5VEWqxHF8nncpBl/nhAwl1TDofV0FMQ+EoZ5TuR6
	fLjKg4O8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr0ql-0001Tn-3w; Thu, 02 Jul 2020 15:10:07 +0000
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr0qf-0001Q6-M3
 for linux-mtd@lists.infradead.org; Thu, 02 Jul 2020 15:10:04 +0000
Received: by mail-qt1-x843.google.com with SMTP id d27so21488846qtg.4
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jul 2020 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NR6NPDNU4//rnzLFn69MGk8PVo2U7QF7TU8NITv1GOY=;
 b=Ux4nFWdzSbOl2jx0BTxJgxO4oMB3q1pfNn3h2eGF5PtVj5+vfGawU3gxURfLZAeXnZ
 sdsoI8A7p74wx+OKc65rxabkJOk8hrQijtDWGwH9fUuD6c5it09rnXfZIdI7asUlfpIa
 sPOfJRdYKgZcnC3TZnhZSBzAZ0hxLjrVc0ElOYOHJXVD0yStX4ljADbv9UMMahtoV7Iy
 PTz6o2mY4Ppgcm1tBS7m1HDyYF7DpzymVoapUgMd2T4C9w2YZwnDrQ4c6JImjEMepu7v
 aaBa1p670tC8r1waSCdfWjQr45Jzhh1LmiKOktaV6BjIp8W6AOYnVcHUtrTmdr+cF+Es
 nIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NR6NPDNU4//rnzLFn69MGk8PVo2U7QF7TU8NITv1GOY=;
 b=bXVb5azWcCmi55PDRbLh5yHu0wCx29dVYuWKJlIEU5fWy9BxOuABP6ue0pd+O75Y3z
 Aq2O0qBXDKFV7MneXBWNok4/QufidTrjw5rkaiym8iCIjtYcDMBqA+40gtW0N1nQiS0Y
 E/N7H+icpfykuxz60gZM7pi6ecHZtcx5LFJTLiJ2/dqMIcfn2/7QBtWx4vh4DzMMxHSl
 7J1om8FRezNFP5kGXkeHMmv0AtPO90twlOgZrX9H1RTLnzPWz5oTN1uNOtk5+X/4Bew4
 935FkedV6eMElTJQcK8/A+9czqW+HlX6Hpdyevs2IxhnHQ11B/XRKVDvEDQFGajy9wBn
 CEEw==
X-Gm-Message-State: AOAM532Oy8HCr60lEtEMnqGCeToJhH6Zg7dd1a+LzQXaGlapXUzkXB8k
 hVN3/h1a+Ss/XArBnPg2tX5gL5Q+K43lbEu4aEQSUGfD
X-Google-Smtp-Source: ABdhPJx5YGjGrJUq91uoxTX2Z8Ue1Anvjct9+JBFVM6cj5m0FP4Qp3LyGLByPkF/zJ3WxhwFNG+bQkZiBahkQ0lgsl0=
X-Received: by 2002:ac8:408c:: with SMTP id p12mr31049310qtl.332.1593702598061; 
 Thu, 02 Jul 2020 08:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <e31c36b5-5860-b547-81cb-74135eb5823a@koalo.de>
 <223404ba200c110f464b9c1e78eaa26e9efb347f.camel@infradead.org>
 <CABDT8WwS=gmS6r9ihV342hywvUZH-uXj-f7cdyh-n06QjObRYQ@mail.gmail.com>
In-Reply-To: <CABDT8WwS=gmS6r9ihV342hywvUZH-uXj-f7cdyh-n06QjObRYQ@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 2 Jul 2020 17:09:46 +0200
Message-ID: <CAFLxGvyuQ011RNjLYch-c0zhwPME214whiQZ=eMwodQ1SVafyw@mail.gmail.com>
Subject: Re: lists.infradead.org restored from backup, git.infradead.org down.
To: Florian Kauer <florian.kauer@koalo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_111001_794301_D03B4E53 
X-CRM114-Status: UNSURE (   7.57  )
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
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 2, 2020 at 1:46 PM Florian Kauer <florian.kauer@koalo.de> wrote:
>
> Thanks for the fast response!
> The only one I am aware of is https://github.com/sigma-star/mtd-utils

Another mirror:
https://git.infraroot.at/mtd-utils.git/

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
