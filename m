Return-Path: <SRS0=ozsj=FN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD4CC4361B
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 14:40:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72B5E227C3
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Dec 2020 14:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72B5E227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V3kki7ls4/QGCw+T2esfjNfUCcYEZrlVRDsy8TFs60g=; b=3BiwlxdT8rdq7CPslkB0gdH9EH
	RQwpVSvUue8B44NMRZsOh7RYDdaoimDIRuCJ/9WLDi5AK8QNlBmC94HkZXXkQ3qsAdWyA2ZUI2abq
	D/erodRTTiCWDrqoKRdMyG2uPCQ40V9PFy5f4KdGbtU+UzRV4tvH93HvoEZf9hRverqHTog+2B7XM
	u6/lrLypgrppeiUpvAvNDgVluTX6CR9sFLcblEcUpc7T6LhfFrs+4vn6JODVEUv4fh7Dd3rCAGaox
	BTdsDhYSQHx5TimIoOVQvEJk4GeDwS45E5mFP+JdNS02G5rJKEe/y02mAywKAUGBF464ap/vDD5H3
	ivBKo7Pg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn0cn-0006Cr-BH; Wed, 09 Dec 2020 14:39:25 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn0cj-0006Bc-Et
 for linux-mtd@lists.infradead.org; Wed, 09 Dec 2020 14:39:23 +0000
Received: by mail-oi1-x235.google.com with SMTP id d27so1942268oic.0
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2020 06:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uXiBeTOot2thzmD6KKXKi/NvdQ/5muATYkdIEDEKGuY=;
 b=eZ2ADwmcrMNHuLVFtaRVqCrD7zfMH68kNPlJ1HqKnJOvFf7F2RedO8BRXUYa3Uwiym
 H9A/+nQa65/l0tWPen95JQYYChnW95tjA8PKfedUUmnlBXC9FZ6YAKTdvEF4FSjC7YI6
 pRe95uNm3Esw7JH5B2Oeub6M1KNJ/WCXPnCHmokcVQ7nu03wMzSEDZ7w0SzrBaRTnYzj
 VFz3bEc7okG9oa8p87vzjOvD7tKJKPiW4qf34P9bQa1R+uPgXlQ9RllErFtdJeM09Q0p
 YTcHB3gYwTIpzi3UTpLbHhi5Lfy6ov/HeTULKBmHWaZUcISjq3rAGHyT1q53TKpGr3ch
 di0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uXiBeTOot2thzmD6KKXKi/NvdQ/5muATYkdIEDEKGuY=;
 b=a9c2k1KcXUQTlLDzr1ZpVAsvzcHgNaWQjS0bRnCkXvFe17DsFGmgQifl0VYuT1E6hs
 kfc3tPws+4XhwPHtLs3VLlEM47ZHitxXGiZdnpgtZud/jDkq8JOG6TqIyXUtmxnk1WT4
 elFpN4zEqxmQ2yLeAQNio2ohQhyLbhoHM5zKaNBAAjmWoMjPtH2tegy5+cpKmr2x4Ttw
 qPYnUlJsbVdIihgxE2OznHd/4SJCu+B1+mmzU8MIwXB/7HFzBNCJZoKakjC3Sd4ptgMY
 j9vJSrNJ6NjtWYOlsfG37UPR7n0f4yvrcm8Cxo+URideXZ+Jnko7Z7cBDup+90XguJqP
 cKQQ==
X-Gm-Message-State: AOAM530OZ/x4247RL4S6YM+DrFf4kHBcat4kR/Et4S0s1D6SR4PH786W
 8TUkUwNUbNDIbvFPOIU/PmAkDvjyxtAG9ko16afAOFxlCVM=
X-Google-Smtp-Source: ABdhPJwBFYLcULQZgnh9QbP0D8wM5WtrjzOvPPu3+YqODns6QCdk6NwDKabfwBx94pwsBewsAREb560ptYDH1uu1fRk=
X-Received: by 2002:aca:ab8c:: with SMTP id u134mr2005742oie.15.1607524757798; 
 Wed, 09 Dec 2020 06:39:17 -0800 (PST)
MIME-Version: 1.0
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Wed, 9 Dec 2020 15:39:06 +0100
Message-ID: <CAO1O6semtZ0kYKoAdQWSKeLuLfg-_40erK_UrG5Mcx71znzFCw@mail.gmail.com>
Subject: SPI NAND bitflip threshold?
To: linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_093921_508853_5D575903 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi. I'm using UBI together with a Toshiba SPI NAND (TC58CVG1S3HRAIJ to
be specific). I'm looking into at which bitflip threshold UBI
will/should move the page. As it is now, if I read the code correctly,
it seems mtd/spi/core.c doesn't set bitflip_threshold to any specific
value so mtdcore.c sets it to ecc_strength in add_mtd_device, which to
me seems a bit high, considering my flash can correct 8 bits.

Per some discussions a long time ago
(http://lists.infradead.org/pipermail/linux-mtd/2015-January/057334.html),
raw nand currently uses 3/4 * ecc_strength as default, which seems
more reasonable.

In my flash datasheet, I can see that the default there for "ECC Bit
Flip Count Detection" is 4 bits (out of 8), which is even lower.

So my question is if the current solution should be changed to either
3/4 (or some other good default) or maybe be read from the flash
configuration registers (if supported)?

/Emil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
