Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF131C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:36:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B6A420791
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 10:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s30Ow7hM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jz5cBibT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B6A420791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cO+XOkKnGPN59sH7AZYp8GHy6/3UH7pcumGgppFBMwg=; b=s30Ow7hM5rstU0tVUpH75nyiW
	MYm8pFs4IBhmZJ94QR4TF2KqknbxI7y1MkQpQGCbDrvskmkZLzFnND/D1xUw0oSEwh4QDZsBo5Idy
	LHyGwoiBp74VyCeYFCkHUUir+bq5+v3D20LasFJ0eCoADA9ewMspdw3lfRJhdJ+kBav1gLr2tH1J7
	mjq1fdLUHKdtsiyWGbs7ZN8NTWYdqQpew7ggzwpt97pLrcppN+0UZLrWCOTpnoVifdIrE1kNeXK6J
	TVdh1fRtIh7999Jgw9Niham9OchPjbNw8DyFq8Dgioejd1gMNF3ikn68qaTC5fl955DUSlN1ik/nt
	/pUgY5faQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY5I2-0002bQ-4N; Thu, 29 Oct 2020 10:36:18 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY5Hz-0002at-W5
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 10:36:17 +0000
Received: by mail-io1-xd34.google.com with SMTP id z17so2749551iog.11
 for <linux-mtd@lists.infradead.org>; Thu, 29 Oct 2020 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iktHb3UP/LMrEYtEZ+Ez8BpekM8KQ4nl59qYILRgRyk=;
 b=jz5cBibTRn46TZ5dCypuAkqXwWUHPFV78hZL7G5acofdTxZoicNKDf5gL8JAppWVoE
 YeV6r5msDD2xoQckKBNELOZKzuqChA5bvNoDpTP3ZpLTLiaOetnpYSGTS+2l56dNV8Ov
 M27XGQJL5htcRE7GTZDEKlOcViMPUWWeaKyQa5qgkHryNZM1XXlW3ykMx33QXy1LaOSB
 /MUcWeXfrsKxC7W81uXPM6dgXVhMcA4BLCHkaFfdbrUgpgMV+uiPePT1AJU9E8fNoGjl
 6lNqBqi7100bUNcZhzBNh75fgRs0FGzelKnnHU2eQ6z6MLMsyMGBHl5FGkDtW02ywqjE
 1ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iktHb3UP/LMrEYtEZ+Ez8BpekM8KQ4nl59qYILRgRyk=;
 b=EQCXA5r1GWm5CEyQJ2VBoXsJ2ICZLQDaq6PdlUFLj+6wGjHkpRJSiRsJmf6ESueurp
 FkXRWd32h+/Tw1aBEXvnXdT40ZqmM3SiMKqZwMKNl0vOBQCx9+kOm8RYnMz3z2mIDbn8
 GVgRFMSZkBBy23IaSph6EihkSrnau9ds7toUEhLfwEPIrY9nCTJH2lRie7PwnqyfMb6Z
 D2aMWL6MaDshmrFL2zj1+m6FEClbGneTAXqelwPHnDSWy2CWbo6/XIaOix4REuA/1HzF
 7z5M0h3eyty1w75/1oyNhXgvv3sudUPc5GgGgKtcEswcosCoAF0oQ02cfuY2RAjL6n2Y
 8hyg==
X-Gm-Message-State: AOAM532XqDfveE+yLrFkKcH4vMu7rcdvMchJdCq5SeGjezuTGIYNOzXc
 gYie0GYRQr27osrfNTjyJRXwaflDKM7qGKVNhTt/fV1loTbIbg==
X-Google-Smtp-Source: ABdhPJy+YsIfeoO8aOibiCpZdtCszaT10HhdPErsPxac+mmbzE2ZaHfzG3vdDn+UCcDzfP60hwkQD2TopLX2v4IV+9s=
X-Received: by 2002:a02:cb0c:: with SMTP id j12mr2907247jap.54.1603967774434; 
 Thu, 29 Oct 2020 03:36:14 -0700 (PDT)
MIME-Version: 1.0
References: <a60546366eb049698c7a0b5426361833@adva.com>
In-Reply-To: <a60546366eb049698c7a0b5426361833@adva.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 29 Oct 2020 11:36:02 +0100
Message-ID: <CAFLxGvyZUBgXyNkj0EO5pWntjfn7jObqU7XKZXxvjsQ=RN9WKw@mail.gmail.com>
Subject: Re: UBIFS corruption in empty space during mount
To: Barak Adam <BAdam@adva.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_063616_053797_1090D8EA 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Barak,

On Thu, Oct 29, 2020 at 5:54 AM Barak Adam <BAdam@adva.com> wrote:
> ubi_leb_read calls lower layer nand driver functions but finally returns with -EBADMSG error code indicating that the MTD driver has detected a data integrity problem (unrecoverable ECC checksum mismatch in case of NAND).

So, your driver is facing ECC errors while reading empty space?
This is something UBIFS does not expect.

If this is really the case, please double check, you can try to
backport the patches you've listed.
Or change the driver. In any case UBIFS does not want to see ECC
errors when reading eased pages.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
