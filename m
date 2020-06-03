Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEC0C433E1
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 07:22:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5448A20679
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 07:22:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mkmw+T6O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DEoNdMcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5448A20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9Xuid7pY7Pa8kjyvHV2FxzelnNm9HDQMlC2QK+37nQ=; b=Mkmw+T6O4b8dKo
	YGjInrSvQjuLlbYwYcMrQadPSsTVjIRPXNA5eCGT6HqU09PFaub+YxQ+BQYrsKRzmQuHkxhfHk5GW
	qR62t5axhBsNG+B/BCVQv+JDCu0/B2AvqLGZe40oa3xD58FeFTnuVX9HxVF6LWhInsY4BI8M+Z5LF
	Zt7Q1ixmPIPGj5hvmzniJmNUukpF6N2j57iA7QywK9F9hqFyqsAFdj6HVghPVMUhJt34x43Zdm4/m
	iSoOE880cTcdg9QmDpphguCj78WUt4AfJ0l0R/7eRx138MldmGldIXFrsNKXr9J9vja1SPoVPLg7g
	XouO2JJ9893BtOOlSECg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgNjY-0000wp-CX; Wed, 03 Jun 2020 07:22:44 +0000
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgNjW-0000vj-41
 for linux-mtd@lists.infradead.org; Wed, 03 Jun 2020 07:22:43 +0000
Received: by mail-qv1-xf44.google.com with SMTP id z9so618855qvi.12
 for <linux-mtd@lists.infradead.org>; Wed, 03 Jun 2020 00:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XoiYXJkek0c3A8esVLx7SdwYl6yKj/PVmsxOwdt0epI=;
 b=DEoNdMcU84rpO6lkIlssXBT26oWIs4y+fw1Fe62vqYLGn8i0WKL2hKt9NfqStyWU27
 tNKEmDLw5pTxQ993YbnmwphJeiMfvOlwg4usZf/UB84ZSFi1JzZ/n1/NSVL+tokE8tZH
 YB/5qQ8JUaagO+9LC0SIHIurAzwAsAotH5ue8yQ8Upi8mNjdLxJG1w5P6yC7ERdGnALE
 286itD1xEYK1xblerWHu1VQoDKcRQdJV42aAz+tKqiSn7pf2pTqVUfrogO3MOsOBSvtc
 0HTrVnIluv8UdCUbQC0z6R0lam+oMSoprSXo0R/bfjBtlQSTYlX7zsmQmZeSS4nfOXcq
 HvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoiYXJkek0c3A8esVLx7SdwYl6yKj/PVmsxOwdt0epI=;
 b=sGx3WqQ2C+3LBq39DCblKnMSI0xXpVSbq13jpRsxlZW/+h5koTpA9RnOwbUGDbWlxB
 s1zY8wQ0gKyt/8sleW5Ltx1F8X2SOG0F/ct0BnHlf+dU6Pw6g78KqDkBpvZwQV2fgc4Z
 ucI/AJ0WVo9c0GfZkOndqjXdOaBGA8vt+7NTN4nlTri5SkNBEx302h8yBF7jf3LCln4u
 znaRec4x4X17og02Qyq6BCJs9dZCiF7Qc/r9kUU6WuvyMsuVpZ3wfZcyl4CYwi01/8+M
 j2WqU1l5meLCZld/VDm9WzqZ/ElfPHVG0GcxAE1K4lOcnLkiJD+7R8HbbKyMYGmfJcUL
 EtnQ==
X-Gm-Message-State: AOAM530MJNSuxSPHlIeoO47HeiNLeFAtgy2W4ZUmqzzzyWe95sRtQWt+
 Higq62neoRZ/STNu9OhwfgF0I95XfioBxiDw1YE=
X-Google-Smtp-Source: ABdhPJzyz36QLi9vN9rSax2aBoknuyMn9XZu2vk+osnhwzvTmcGQz3yZHD5w41wl2gBsjcrM6iMpqSt89OH5XZTvQIc=
X-Received: by 2002:ad4:4b25:: with SMTP id s5mr14385161qvw.212.1591168961050; 
 Wed, 03 Jun 2020 00:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <e9009e03-f1ee-57db-0b1f-6678fd4f499f@ti.com>
In-Reply-To: <e9009e03-f1ee-57db-0b1f-6678fd4f499f@ti.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 3 Jun 2020 09:22:30 +0200
Message-ID: <CAFLxGvynZou7=ijFEoV=PWG1o=Rgt4YcUbGHgD3WTcr5PdFoLw@mail.gmail.com>
Subject: Re: [GIT PULL] CFI and HyperFlash changes for v5.8-rc1
To: Vignesh Raghavendra <vigneshr@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_002242_165644_30417C49 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 26, 2020 at 11:06 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
> Hi  Miquel, Richard,
>
> Here is the CFI and HyperFlash related PR for v5.8-rc1
>
> Regards
> Vignesh
>
>
> The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:
>
>   Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/mtd/linux.git tags/cfi/for-5.8
>
> for you to fetch changes up to 11399346ac39a26ade2a90303d38ad318163c665:
>
>   mtd: Replace zero-length array with flexible-array (2020-05-26 13:30:06 +0530)
>
> ----------------------------------------------------------------
> CFI changes:
>
> * Support the absence of protection registers for Intel CFI flashes
> * Replace zero-length array with flexible-arrays
>
> ----------------------------------------------------------------
> Gustavo A. R. Silva (1):
>       mtd: Replace zero-length array with flexible-array
>
> Jean-Philippe Brucker (1):
>       mtd: cfi_cmdset_0001: Support the absence of protection registers
>
>  drivers/mtd/chips/cfi_cmdset_0001.c | 13 ++++++----
>  include/linux/mtd/cfi.h             |  6 ++---
>  include/linux/mtd/qinfo.h           |  2 +-
>  3 files changed, 12 insertions(+), 9 deletions(-)

Pulled, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
