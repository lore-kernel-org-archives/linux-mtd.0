Return-Path: <SRS0=IJUr=MZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2980EC4338F
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Aug 2021 17:49:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF2026101D
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Aug 2021 17:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF2026101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yLX7XaUoxSK2/kl2d3sbalATNJCuofYKG8rDrntKO3Q=; b=taK
	MECigkkoKaJHLcy7PUA1dxALDfBEjUE6fv6CDS0ewo9tvmeeJR5QgCuWPMx4FbaVcMmYCDserzVDQ
	yQRpOBpToVcl+HQrUMvWECYZt6VxydZdwYrnUgTrOtE883/+Kh3yHGNM06DL0ExGVRhFWiQc5Q8MX
	0FKAkD0OcwbMomGONkewK6/Mm5cxZANRzlNC4GSho990p5/1ccm3Ij6iNhMVuFauRBLDyRXaDvV3i
	ZNe206ex7mrjVeiOEwYpg+Uhh3Nf0spq12flfKC95c3pUSSOY+F+/Qh5JPXW4EY7JeyFV6oG6gfjM
	z5l8aqgGhbY9dHZnjxSaAav6CIgfZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAc3a-00HOAq-5W; Mon, 02 Aug 2021 17:48:54 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAc3X-00HOAF-Be
 for linux-mtd@lists.infradead.org; Mon, 02 Aug 2021 17:48:52 +0000
Received: by mail-io1-xd2b.google.com with SMTP id l18so21217532ioh.11
 for <linux-mtd@lists.infradead.org>; Mon, 02 Aug 2021 10:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5MJn56fudfmpKwDZBly8arBOphb08PJeO+qMGO818cw=;
 b=frSSN12MUKhNym0LUqtIPQ9FwrTzAnIm4yHGce/Z+pJoPNJWKC570FUODLI99IbChz
 TieBzEAy/tsAfroeH+izNnuOSX1ER2VrGNhLv0mhkKy8LPkKis+FK1JwqEGNhBziBKcK
 s95azvxXbC03wy2Zpa05slKsh+bwfGK5tFeandcybXvr5u4jyR9EHzz3QTEx0PFYd/fI
 x5RUwExJoiSfuIiXn+4jzFlbV16qKHg9VT8R5MNKHpkcmissktkZK/Mxj1yR5sFmmMAN
 ZxLSCCS+w12ZmoZOf4ZTtqiXrgLs41v6xOtfydoDQ24ej1CRA+W6HpaZWjxD5hZKKG6b
 MtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5MJn56fudfmpKwDZBly8arBOphb08PJeO+qMGO818cw=;
 b=ZBd5kkQ1UF2FZvYg9PkxlIpUXge7YCV5YT5QEX8v14/1SyfTjAD1HhiTsYZUvxhyu3
 aEGsh4+v3yq9az9dlhAY2BV2zuPQwJyPf3ZHy4m3UrNdDL2bUjz/yCV+hS7VoLDppHzf
 Pi8Unv3gsZKGB0kzt7hSKOC9OPKknC+cdG1P3E8xrV1m8SBzPiBuTfcS5J7Z9B7IWGTd
 qi7IDwnm5hll7jJz929pqwTyhsYKVRZPztv57yiBinPUYHoKkLjdejwq7+tA2oUymzcm
 i9Qri+a39vdVCYQVLdclNIwEsgA9vabdrEqwD6soURHG7+5LvIyrv/XmT/jjUAdXJrh0
 CaqA==
X-Gm-Message-State: AOAM532lyTYTML3VN7WIQe6t+P4+pm9MPi6aPVJa3Hl4ZudJEzAj1bHD
 H/tssTAhylpvq0OCq0fXG41/QKuKitqqXqgvs5DLUssG
X-Google-Smtp-Source: ABdhPJwi097rcrW04naGCiqyV592XVMwpXRxaeJFn+NPzmtQgPkz6GpT1ehQJEw501FeYlwLNoGPa5xndtUcR+nCYVI=
X-Received: by 2002:a05:6638:410e:: with SMTP id
 ay14mr2486766jab.76.1627926529360; 
 Mon, 02 Aug 2021 10:48:49 -0700 (PDT)
MIME-Version: 1.0
From: Steven Clark <davolfman@gmail.com>
Date: Mon, 2 Aug 2021 10:48:37 -0700
Message-ID: <CAOCvsSkwppH5DGMWJCSLiQLU-Yb=uSXha9sR9q0FzcLnP5zmzQ@mail.gmail.com>
Subject: Files read as corrupt when migrating from old kernel (3.0.x) to new
 kernel (5.2.x).
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_104851_454387_3525B2C3 
X-CRM114-Status: GOOD (  12.86  )
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

Hello,

I know posts involving older implementations aren't liked, but I'm not
looking for support to stay on my old kernel.  We're in the process of
upgrading a deployed fleet of ARM embedded systems from an ad-hoc
home-brew-distro with NAND flash based on a 3.0 kernel to a new
Yocto-based distro with a 5.2 kernel.  And we're doing this upgrade
over-the-wire.  The result is we need to perform our upgrade using
only the MTD flash with JFFS2 present on the device.  Despite all odds
we've gotten this to work mostly.

What we've noticed is sometimes files written with the old kernel will
be corrupt or absent when mounted with the new kernel. Usually we can
tweak our procedures to work around this but we haven't been able to
characterize which operations give this problem and which don't other
than jffs2 images written with the old kernel seem to be valid if
unmodified.  We suspect there may have been a change in bad block
recording behavior but we don't know why this would affect reads from
the FS.

Does anyone know any workarounds or hints about the cause that might
help?  Is there a good rule of thumb like switching the kernel as
early as possible?  Is there a userspace tool that might do a
conversion?  We'd like to not have to port forward the old
implementation in an unmaintanable mess if we don't have to.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
