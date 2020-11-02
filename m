Return-Path: <SRS0=MFHV=EI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B441C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 01:03:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAA9321D91
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Nov 2020 01:03:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xJ5YC/ld";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1p2vaFi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAA9321D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BnPkfGpXGpw0sL4a7eXGfrkJqGueAqBowzJKRHc+fpQ=; b=xJ5YC/ld4aChaF5bz2MNYApojO
	fpLMZJxpNuXJjIrDP9nKmii9Zp6hQFiqP/B5e7kfR8CVSTRvjRL62k6Ww6n4FrmQftGBg53DiZoSW
	MtdWO3/4wi+8mno7s2EqUoTAuhh/9UnT+q6Vc2Ulr79BpPzkgyb3+DOOG7E55TIwN7DYQFQrHi84V
	/0ZuGwKE6vdoFugsLgdxVnfOwLKKfE3R1TQW+IIBn/83r/ctjLmnhypG3HRtPL/OW1sdAmIDtQxlu
	WLVckGR9+pvrHHTW2+jiA5jDjsQvXgHBRwzHCvalp2IOqxFrGcQ1kJ7lr3LaB/xNtw5CFY6Uxd4wT
	UpMsaOZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZOFI-0007eL-17; Mon, 02 Nov 2020 01:02:52 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZOFF-0007dg-4z
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2020 01:02:50 +0000
Received: by mail-yb1-xb33.google.com with SMTP id m188so10349488ybf.2
 for <linux-mtd@lists.infradead.org>; Sun, 01 Nov 2020 17:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=5YaHZ9JlMK9LbuIMTIg56f7ZSBuY2tM5VRHI57pJnFo=;
 b=J1p2vaFiOeTbJSi9abdPAMkEIQqVW0Tq+4xyKbBfe5veOS1i0YuJrI0wpJTt/44c4j
 FTSz9i5OQgpr4EnIAJ6gU1kgw9xWeRHkwad3oZDoVhCMtQhOuh6XmFNNr/AKUELgp6Ry
 DdfvmjdqdoRAUDY4C45Ei3CYJLtziQi0zcXXMFYZdZiQifdlTi8NptZlwFswYq5Il11q
 kb3kOVuWF+yse29X4tAZi0nDK3KTk2+XDcPRDV26XFKNb3Af4XEFZ6T/zatLW+l5fZRP
 9NUi+sAUlNA2AAZh41F7DHaVA0rI8l8F7oaY5TLBh1e7Wh+xnUhwaZpE/7FF1SIPUTHL
 kgiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=5YaHZ9JlMK9LbuIMTIg56f7ZSBuY2tM5VRHI57pJnFo=;
 b=qt37GfPEukGUwtzLInnckmWWLITqoxxpct+GVFxiUJpdjj763W/d8wFsFomfJrrxCd
 QZ8yAcN7F+kdoYPUzUcURJuRnBqDgyuSArMf1ZeHNw4QAfcbBn9bvfq6URiXTWNcobLB
 NC7d6DUEn6hRlc3GuWpQmXtpPkyO2uv9PSJr+9JjuzVc8f8g9kDcGyzfpMxXFruW5cC7
 vvphbYLrVEIYW1DnoYOJr4JBPhw8SJKtkx/+KFaozYJk+1z08Rgjka6HOellMZj2QD6t
 fRfPWwYdGA7fojJxwa0DDZYMhHoEDROtc9GAh6jTEXYDKQDdnlCxzzA7YR3G/lN1KrtA
 X3Hg==
X-Gm-Message-State: AOAM532IKGxTWIqAIZCXlrHREaWcAC3C6Uz8572xKhLTxtcGYm4Dp9jK
 Dob6ih5v8eSH5yAOivAoCfxHM7Ck8OK6R+CtrFUEW4XYc9Y=
X-Google-Smtp-Source: ABdhPJyH5NVjH/m/CCLCTlAberOMyLOfrF3S16jJeMN7zZdBImHu9Z7aQBearyUUddDqmxdBkYzfnz6ldE2LFCtdVwk=
X-Received: by 2002:a25:5089:: with SMTP id e131mr19125973ybb.74.1604278965569; 
 Sun, 01 Nov 2020 17:02:45 -0800 (PST)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Mon, 2 Nov 2020 12:02:09 +1100
Message-ID: <CAA=hcWQnJ1yRTwPF+9kubSt6FQPxwCRYFwXcYR8RnVLs4LMb7A@mail.gmail.com>
Subject: Install Yocto image and backup
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_200249_257356_027ADA88 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: Yocto discussion list <yocto@yoctoproject.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Apology if it is an off topic, I could not find proper mailing lists
to ask questions.

I built Yocto Linux kernel and installed Yocto image to MTD NAND
storage in an iMAX6 device, because we designed RO for the kernel and
root file system, RW for applications, we can update applications OTA
but we cannot update kernel and root file system OTA. My supervisor
asked if we need to have a dual NAND storage to backup the kernel and
root file image, if the NAND bad sector occurred in the primary image,
it can be booted from the secondary backup image. I understand where
the concerns come from, but I am not clear if it is necessary or if it
is a common practice to perform NAND backup storage, appreciate your
insight advice.

Thank you very much.

Kind regards,

- jupiter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
