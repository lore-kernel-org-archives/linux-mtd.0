Return-Path: <SRS0=9tRn=TP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B470C04E53
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 21:06:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE4BF20881
	for <linux-mtd@archiver.kernel.org>; Wed, 15 May 2019 21:06:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HcbTNiJW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1oRFTFB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE4BF20881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uKjKWfv7OKam2ame92Tv84t4NSEd9V+yDHzXpMX2AG0=; b=HcbTNiJWTa2QCV
	Jejrud9oM2Oh/gFNfXxTKcuvNK7EMP/Xxvr68kKsl/OSV/2zustuTfLHbuwqd9LXCXfiO7Oo5Eypw
	QVHwfBHtgtunqFXY3F9xUc5tABYDe0Tq+IS4HN/XfGaEg3D9LIJoxLPtIAiYo1SO2hF/e7DVfZCF/
	4awqkiMghViJKz9JidCd+OmOg04mgqw3de7hKS59X+TIPbNWHrfrMHB1NwTL10WMPW5Ll/C670uks
	5rELk4vv0bAwzP9vn331+OyzWJppqgd8u96A/OD0ThqD2SdVxPqT47sVO6euTMCptWDPn+FF4OkN5
	q/exduCE0QxaZuz3UTxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hR16P-0006IW-VU; Wed, 15 May 2019 21:06:17 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hR16N-0006I5-1G
 for linux-mtd@lists.infradead.org; Wed, 15 May 2019 21:06:16 +0000
Received: by mail-wr1-x443.google.com with SMTP id d18so996370wrs.5
 for <linux-mtd@lists.infradead.org>; Wed, 15 May 2019 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KN7Op8lE6XgA0shW6xktX/J0QHQnjwUaX3FOZZZptkU=;
 b=W1oRFTFB+24xB+dtaPBmivucI2kyqv7HBmqrRT6TiBIAZepFI8cpCTuHRSujHsiFFw
 kF1ynOa5KxIzHoc+FiWvomXszb3JbiTBHQWj/ASpd7QsZetKDscojrxmGgpLSLu7+SvX
 my4zgYux7+/Q1Jz0SvTVb33f6s7XPup0ZI9KzAb9jrvWtjZsFjH7gVrkHSTj4b6eXpaZ
 DLZAnMbwXMsnfIeKJg5zC3I+0Wo0Vy93w8ujem1zPrXmjrMxSUzmLym3MgpXgBjGEAgX
 bqjstVLBAQ+0iCAaUpB2nsSI8AhEoDAYYQN3NxM5hAJNdwv0jhivgUUqLGfSj8oZjWTv
 0uKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KN7Op8lE6XgA0shW6xktX/J0QHQnjwUaX3FOZZZptkU=;
 b=RUtkzoMlxE+Bwaed5LctJg7v3QKk93Og8XpcF/N47roZ6qAwFq73zcXW8OQC5lS31c
 Aej4AbZmYNthVliPhkLaSyeldjieLCYeuPMsvK6BB5CuXPXWNJCZQCuPm5t63rfybn7P
 l3/ni4STwIk/WvF7UoefXwuCk3xCL9tNmWyCZHm4SkQ5TKhT+dgf7pnrhpEZ7RELiO4s
 YjIB9aZbrNBPCYq7CWzoOcsrDKvHQ03HH4lLpvsGejE7Hv6ZwwCdq1jcBt3RoXqYqs6f
 OqB0zobyd8MfIszWKwfJaLDchw+jWlqDTZ9uQTYGyJOIkvMiNfEGFKWEl+TDJ3DBE8ZP
 Ax1Q==
X-Gm-Message-State: APjAAAVP2wf1d0BIJRTx1KhyRULNai4sxfGo8+6h8uCnRR51LuL28RVo
 dAanyl4nAgXxGfvItrn3N5MG2qutOw2awvaFvh5bHLfR
X-Google-Smtp-Source: APXvYqwAMzD0Lt4RMl1/MNnHtLMYf029HK7zHQSyGiKTKart3sXQ5sO9KRXCgQBrjKViszRocXAsqK+ObAN9qtsIUVE=
X-Received: by 2002:adf:eb91:: with SMTP id t17mr9729539wrn.203.1557954373482; 
 Wed, 15 May 2019 14:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190506212327.6480-1-bnvandana@gmail.com>
In-Reply-To: <20190506212327.6480-1-bnvandana@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 15 May 2019 23:06:02 +0200
Message-ID: <CAFLxGvzW=Z3Lk==NXS159DF4WUJqzAELS_E++ruKDVio_hfo4A@mail.gmail.com>
Subject: Re: [PATCH] fs: ubifs: Resolve sparse warning for using plain integer
 as NULL pointer
To: Vandana BN <bnvandana@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190515_140615_101345_FB6A604D 
X-CRM114-Status: GOOD (  14.85  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, May 6, 2019 at 11:24 PM Vandana BN <bnvandana@gmail.com> wrote:
>
> fs/ubifs/xattr.c:615:58: warning: Using plain integer as NULL pointer
>
> Signed-off-by: Vandana BN <bnvandana@gmail.com>
> ---
>  fs/ubifs/xattr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> index f5ad1ede7990..066a5666c50f 100644
> --- a/fs/ubifs/xattr.c
> +++ b/fs/ubifs/xattr.c
> @@ -612,7 +612,7 @@ int ubifs_init_security(struct inode *dentry, struct inode *inode,
>         int err;
>
>         err = security_inode_init_security(inode, dentry, qstr,
> -                                          &init_xattrs, 0);
> +                                          &init_xattrs, NULL);
>         if (err) {
>                 struct ubifs_info *c = dentry->i_sb->s_fs_info;
>                 ubifs_err(c, "cannot initialize security for inode %lu, error %d",
> --
> 2.17.1

Applied.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
