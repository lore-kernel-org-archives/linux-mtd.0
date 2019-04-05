Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D8EFC4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 13:19:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BFA421850
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 13:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JlsCMh/X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bofh-nu.20150623.gappssmtp.com header.i=@bofh-nu.20150623.gappssmtp.com header.b="XsE5RguL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BFA421850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bofh.nu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esHIVSE/CIdZUx9UU1YSOXwqVhF2txDTG3P+KpTCUew=; b=JlsCMh/XYHcpDI
	2NyYo/oNubjrbZ9xa/0hRAegRRhChYOz8VJtX8bxFmfWCly0ixy+PS3tCUoT8bBk2VdU8EPjgdcdJ
	c+qh2iG0hbA50Ahw31QTaX4gcq9/isAua/JKc/VLXQ7kZ+84FgYbk8wSNrxD/Lo7fXCDMtDe8a1L1
	QMvtmEBE/24tkrMGXaF7WfS0ryPgeA6YmYmbfpSf9c8qeKKTf6qtLnwVDAEVcfSTR2IjSvTjZS/Ab
	neJoPDtvHPDiGRGOCjeb4UprOhILpTTwWARwiSsczUUfJ7Poz+Q2nvpb0/1FXr0iK9ZkTkO8m6R0r
	NBaePC9YvomweIu+txLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCOl1-0006ln-5o; Fri, 05 Apr 2019 13:19:47 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCOky-0006lP-6t
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 13:19:45 +0000
Received: by mail-ot1-x335.google.com with SMTP id d24so5551990otl.11
 for <linux-mtd@lists.infradead.org>; Fri, 05 Apr 2019 06:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bofh-nu.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+93dAMSXptyk8iHkWmhGj92Jsd/37E1yNGsluQxtkf4=;
 b=XsE5RguLaD3tQxmR2DzyXynAbsTAOJtkT9JRm/RG+v7NcuAKAI6feW2e0ly3vaYw7J
 bgR47Zbmu8GUAKYjrPj52ME0tGjAcfHStVs9J08cW0638niujUXw40/zMAnjoDnEEQEl
 7evNPn009KHFbThS3F1vl7u6QI75nnN3lOfsCVQ+VVgMRQUvIumUIhS02/etmgeITjnJ
 bXs6z7PKy7weK+PlbFaaW/V7mHojGcJ/etYQfC8MZrtXoSCxgyxVmQLOMKP7UjYznU5B
 goSgLisrT/MeErxrFUhhsk9UXJ8nsuanYjrrK2lu1A41GrNkT13EYkBxeAf5HeEjUS6c
 LEnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+93dAMSXptyk8iHkWmhGj92Jsd/37E1yNGsluQxtkf4=;
 b=c8JbjM+TFNeM2BJsZZY+L2eyCWq2dsgFnpVHILcmmMjo0IYu/3Fben2+/47rXhFxfr
 Aedqnf1es3/A6QvUbV/wR5MTY67XBk11aCGC0BfGfNH+h1lRWafmGce5uejkA+hKIYPD
 biYHzFrr16DZ6mOkZC46u8CgLjo1Wu76zqyDhG4Vc1r7QBJYyrXWNB7P2o2L2ByZnCsR
 lWNZ3jTaD75FTSRqwtfaC/Uf1U5aXgFCQ2lmD3qVvn0rji91CrWhKsxGD+8KbKQE/HWH
 95n2eXZQzsINYkE+FQ3Lgo9VcT3zkKwNzOq07WF2VSxoC186Q9N9vw7AwYrQU27y8Mgd
 mBBw==
X-Gm-Message-State: APjAAAWVlXUFme29fA9bLOxo/kpEk75R5YDvZgWmLIE/v3cTJIHqN64m
 nChIQ0TRjPwZA3hPue2SRSJD2qohLOw38RMqridbFzBz
X-Google-Smtp-Source: APXvYqyiB+djfa7Ohj1UkUidhNPJpBXOOVr2CvJvi8DAlkXLgjwSQEHcBvIoF3uzshWXsHE7oCAGJVTP3QndWfk9sdg=
X-Received: by 2002:a05:6830:1107:: with SMTP id
 w7mr8764478otq.14.1554470382304; 
 Fri, 05 Apr 2019 06:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <CAFLxGvye+F5hB+1DUUhDzjaHB5ajC_M+W3fyt5x840sO68RgUQ@mail.gmail.com>
 <CADnJP=so8PSqJ4NgqSyqSk5UEtO2wzSC_LG0Seo0+Yuf45oefA@mail.gmail.com>
 <1586391.XHllXIAzYb@blindfold>
In-Reply-To: <1586391.XHllXIAzYb@blindfold>
From: Lars Persson <lists@bofh.nu>
Date: Fri, 5 Apr 2019 15:19:31 +0200
Message-ID: <CADnJP=usEgBQH5tL2k79kFhraDvir6Byt5j7n1FHfT8z84ET+A@mail.gmail.com>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
To: Richard Weinberger <richard@sigma-star.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_061944_294869_D79CDDF0 
X-CRM114-Status: GOOD (  12.32  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Apr 4, 2019 at 11:53 PM Richard Weinberger
<richard@sigma-star.at> wrote:
> Can you please run your tests again with this patch applied?
> It needs further optimization, but we are on the right track.
>
> diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
> index 2f1618f300fb..c15e484f73a4 100644
> --- a/fs/ubifs/orphan.c
> +++ b/fs/ubifs/orphan.c
> @@ -691,8 +691,21 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
>                 n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
>                 for (i = 0; i < n; i++) {
>                         union ubifs_key key1, key2;
> +                       struct ubifs_ino_node *ino;
> +
> +                       ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
> +                       if (!ino)
> +                               return -ENOMEM;
>
>                         inum = le64_to_cpu(orph->inos[i]);
> +                       ino_key_init(c, &key1, inum);
> +                       err = ubifs_tnc_lookup(c, &key1, ino);
> +                       if (!err && ino->nlink) {
> +                               kfree(ino);
> +                               continue;
> +                       }
> +                       kfree(ino);
> +
>                         dbg_rcvry("deleting orphaned inode %lu",
>                                   (unsigned long)inum);
>

Thanks Richard. The power-cut test is OK now with this change. I run
it with chk_fs=1 and it passes every time.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
