Return-Path: <SRS0=sICc=D2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199F0C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 15:53:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB8922283
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2020 15:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R8s2Ruka";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFhoI3UG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB8922283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MZyVPjeLUX6BDjeiL7GYj+pmWXR14BSgl1H6zf8KPBU=; b=R8s2RukaVZGZgkqhr6hnr02aG
	RjA64nGSQ3b5BujNfTaH3d5RD9wCPJ3K0KUdpDBpOJGCh8F+I1W81KpBpMpDocsPwyuKbl9aSkTFr
	Xa5TwctlH4Cv9bDdRcGdXuYVyYeN26ejVTdfny+3amZIiQ0Vzchk22Gco+OUh0vwOTfzUDIE8IFC0
	K1kJt1iQXKmSjhIWzfN56DFXyTR6PDgmcK67cjqGnyzJZeDUniECSw8DVPOLXhbLZhP263HVe8YQL
	HIDGKdCVOnuuxPEWc+IvbpABqq5L0QGT4E8E693qGdUa7ewt2QWeu0I7TQH/Hkn+1C7p4E9pnIkPa
	HsbmhLaog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUXS0-0006b3-LJ; Mon, 19 Oct 2020 15:51:56 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUXRw-0006aE-TP
 for linux-mtd@lists.infradead.org; Mon, 19 Oct 2020 15:51:53 +0000
Received: by mail-il1-x142.google.com with SMTP id j17so646246ilr.2
 for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2020 08:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NbIxgaQQaKMARsPhd1Z+URUNDpbaA4SECJEEBSAB50I=;
 b=FFhoI3UGt4eCV6ciwnrJJ+a5e2NhsBTdZbi5PKLyHxHXTgDJTqhLdb8ys1brZtcT90
 omqbzyFPfp1GrLtxmw3aAvMCEK1xf8BI9xcwmRm7P5ODhzFxCrUaeYBpAdl4JBKV9aK4
 xJ/d763yBBC99Giy5m7ZNhTW/ahtakhlpv744094CiYodDhqFGdgs0gw7KA20sxowo11
 vxAkeHO3iDC48YEADc886VCY+HvARCAPJuqVMN7w5catjNsGSPE+W6VQd8XviENzvc3U
 xrzqPgFM2+2IzU75GfdsCaA0aSB1eD190xDy/NrEtlc9bvvSULDJ+tFrV9RN0RFHKPbQ
 EFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NbIxgaQQaKMARsPhd1Z+URUNDpbaA4SECJEEBSAB50I=;
 b=QFH+O+FZp9yBC+Z9OU/8NPleSCMHb8yObUdAfIsQmNaBlgtbuj59nH8hXIqKoGZqm5
 ngV62H2AdNbmxKnN4hpjjnqWkBL6g73kD4tJ1lKhirvkmu1FpdzwYP/JNXZfISg9ao4K
 maXl2gyObbOo1owIBk4gdz7bgZznT85pVLS5ZwAbwjE/ilukmbqxTqxmM1QMfkvSspLU
 OqmJgfO0IFUORONUcY2dYplaKGQiFnDfDLBGVtjPV9Aa/vrJnc/hDreCy4e0YxI8WNS+
 Hj+52Emig/FQIF7T85hM80cdqyU/DoVSx/D6K5RBuLSZ+HO3JjyP8bAk0DnMlqAITtrC
 SJ/Q==
X-Gm-Message-State: AOAM531mtFozOKEYrWMMtHAKnJkSIVm3reoZ8lgTr/ME3mcYqy2sMXaB
 wOteBtz8duwLRFFDZLGdzLtVsVRDqIFeZkx+VYTubC8l
X-Google-Smtp-Source: ABdhPJxo4Uu4WCfyLKr48tefLao77xKRy70HjePfRTVUPwdxjmWsyZsQeHjlUxyxG5DlbKcQyhrYSAsM5nbz7jbk2V8=
X-Received: by 2002:a92:ddcb:: with SMTP id d11mr541576ilr.228.1603122709803; 
 Mon, 19 Oct 2020 08:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
 <20201015092502.2ea2a7fc@xps13>
 <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
 <20201016191424.2a41b632@xps13>
 <CA+EcR20Lm2m-bkECKWC5RvB8wb1C_s7uH2PENzLK0iD14oAGUg@mail.gmail.com>
 <CAOMZO5DXJ=V0xvyEFWkwCEzwsiv6Gt4Gb+4BjmHfTTOBkDdvsA@mail.gmail.com>
In-Reply-To: <CAOMZO5DXJ=V0xvyEFWkwCEzwsiv6Gt4Gb+4BjmHfTTOBkDdvsA@mail.gmail.com>
From: Han Xu <xhnjupt@gmail.com>
Date: Mon, 19 Oct 2020 10:51:38 -0500
Message-ID: <CA+EcR21w_0jYhovUs7siqWQdq6+kPiv9mxgLBWE6JHoraYiR2g@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Fabio Estevam <festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_115152_975592_BFA8843E 
X-CRM114-Status: GOOD (  13.72  )
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

On Fri, Oct 16, 2020 at 4:04 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Han Xu,
>
> On Fri, Oct 16, 2020 at 2:51 PM Han Xu <xhnjupt@gmail.com> wrote:
>
> > If I am correct, the patch "mtd: rawnand: Fix wrongful fallthrough
> > NAND_ECC_SOFT" is the fix. But I didn't see it in the next branch,
> > only the other two patches in the patch set applied.
>
> Could you please try the patch below against today's linux-next?
> http://lists.infradead.org/pipermail/linux-mtd/2020-October/083123.html

Tested on ls1043ardb board, the issue can be fixed. Thanks.

-- 
Sincerely,

Han XU

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
