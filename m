Return-Path: <SRS0=iZys=BM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50FEC433E0
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 21:02:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE5220738
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Aug 2020 21:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2SdXSQ/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8eqM5/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE5220738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Bi/rDN93GmujFmKgmlMUPg8jkyakRbZZjsV9nnMx+Q0=; b=i2SdXSQ/8JD0ZcK1BwTNjRuT2
	/i8xASq5GBSswadcFDFEBzYHBu5/ZRUz4MHHiQKhrB0Ez7utC3+LL0lGuXD6x+CSWWMRSa86Cdxaz
	kfMRXH0hzh2zt58nKL5zSs0vn/XKRX7rIuK2td+GkQU/jLs+RISWj07/KopFgD5WPf+pBMAg/SiUn
	4/d0mC6cnTQgwIQvt3ZxYymBHYzDvVRwSgP1/BVYRS2ndbQbWyra38MfAtw2j1O3g3AHfOpwPReit
	OHtGq81cjBF1hnFmlWLBFMlssbzdqC8boGbGxJSu3hjqABWWDXMIBxMRc415RezfMB26xYiyl17VI
	qRvc2CJ8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2L7N-0002VG-Lh; Sun, 02 Aug 2020 21:02:05 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2L7K-0002U7-Lf
 for linux-mtd@lists.infradead.org; Sun, 02 Aug 2020 21:02:03 +0000
Received: by mail-qt1-x844.google.com with SMTP id t23so23780123qto.3
 for <linux-mtd@lists.infradead.org>; Sun, 02 Aug 2020 14:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bzYzoaIUwT8rgDkx5dGq6re7hM/XmMRk4/fJO3pnsgo=;
 b=b8eqM5/l7VBGoFIufYZLynFItbPvw1ZibLa1rccXyQRR8npgWu2glJSNAnLH/mcMEg
 z3R0EnTyUytLO83xvrF2GyFSgELCfxyexnEI4FDLJ3BfxpuyGAsiOuGZwa7w8+n68NVI
 R2ZvtgTH1BkX0g63PnBvuNvA9GJ4dPSk9ASKxCHcO+IrD7ygtbcG5Zd6jv3qo1cUZmCz
 tXuu6P2yQeIXIyXjo3S5wG1c9iPJp4H69QGN23XIV8zXjjIOstI65X+oTdHlTbOV6aUj
 QhiWo+1TVENPSsynRc7qlpxcNWkSHsmeYBITuVppo6F5YNP8MSkFGGPgeSbyIH8jPV1t
 vPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bzYzoaIUwT8rgDkx5dGq6re7hM/XmMRk4/fJO3pnsgo=;
 b=fbxjY71aURJyUE4t+vR0uns3N9MjPcijCGq0r2B9qpSUySJqQANGa+/zsYqWfjzQVg
 wr4g6HgZElA7dN3Vx3txmfAKmqaPY0oseB4cZcqVKH/R+B01Rlt1IAyLmLtLeBzSS6wy
 orvK1nqQR50TWmbHwqroN7QZnCVd3deXhjTchQMwEt6GLeXiLyd3/ebd3DZ5Um+CwJyH
 6VSJkzXSD620t64QQgTYBQRSdXHNxereMkpoPqCf/ihelZtdJlzFkDY6+lUDLwaIfG2+
 pBrcwDYg/NMQEpRQ2BLIsjExwzZsgnT8+oX4QDTmzjbHzkJ1Lftq5vNEQOR0ru06TLDa
 G5OQ==
X-Gm-Message-State: AOAM532l90DkKFaANRyS+ooqnPJtltYcM0eA39u1RvCu8gG9MpklUXrl
 LaKJ7vWtE4MsOhBEdW6tgHvqzrqvr2SgmE8VJOc5fw==
X-Google-Smtp-Source: ABdhPJzUtfPxR4VHmetkBGgWot/RDpn/DTt/HFmHxZ47CKslwdouhRRlRjunN3hVOPupmYnVBpxHu5liDjXJf1rf6J8=
X-Received: by 2002:ac8:6a07:: with SMTP id t7mr13747833qtr.1.1596402121057;
 Sun, 02 Aug 2020 14:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200719003208.21200-1-rdunlap@infradead.org>
In-Reply-To: <20200719003208.21200-1-rdunlap@infradead.org>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 2 Aug 2020 23:01:49 +0200
Message-ID: <CAFLxGvxZYMv0nnAah4-TdnOy69Q=QyX6oLXismg_qtxUEoDUtg@mail.gmail.com>
Subject: Re: [PATCH] MTD: mtd-abi.h: drop a duplicated word
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200802_170202_814635_8A1A0E4C 
X-CRM114-Status: GOOD (  12.55  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Jul 19, 2020 at 2:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Drop the repeated word "mode" in a comment.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: linux-mtd@lists.infradead.org
> ---
>  include/uapi/mtd/mtd-abi.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both mtd patches applied, thanks!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
