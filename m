Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA8AC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 23:17:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFB4F20856
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 23:17:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V9RNd9T/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dn+vjkGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFB4F20856
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNl0Stzl5XySXWdYm0N8KPjtLYYlsh8oLU8Tm89DVZM=; b=V9RNd9T/bN2lHX
	FIX3Qxse8LsZqn4PXTnT92H1siaA36hv69on4nFPKUFdxueCoMEInzGNhVVbuX0gqtwyK52usmt41
	kiACkvM8grkw/DVvauEEliEgPBLRpNqOixjRhKQCRpwA+IMK4iDSSesyYaCYBT+HdVZPVK0QUMMsW
	D794pE6ywDn7Gn8xfEyUEo6SFmoiKEZT8Gi8hISiIOPAWFgXXcOm4H3il4lj8wvN7RimExwLfRl2V
	AUx1+EZvWGxfTl8do3QfZ/PVvy8Q1az6KeiHWv4mK04vonTmpl1Y49l8hkIu8nlBLP643Wr7/Q14i
	AyBeL4uOkqlsHwOVy9yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB6B1-0004JQ-7T; Mon, 01 Apr 2019 23:17:15 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB6Ay-0004Ih-Bm
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 23:17:13 +0000
Received: by mail-qk1-x741.google.com with SMTP id c20so6773418qkc.10
 for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2019 16:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XnkeB0MmUv7FS2Y36GBVwO76rp5WThGO4+RpI96oa2o=;
 b=dn+vjkGbzNOb4u8Y+IARnaaMyKr7dJQrseo8caWU/MlYXvxVS6vuQdGj8cX5WNSKq6
 g3J5bEi3s8pSkEO110RXe3sUTGmnT3ZQkJJv60lTVu6pDREcOvxFEfpgM46ENo52thhJ
 oLfoZ2hbdFnDVQNT3nejGoBucMPxrKuOtg/pQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XnkeB0MmUv7FS2Y36GBVwO76rp5WThGO4+RpI96oa2o=;
 b=kYo7InI6l6pibkCUccW1ok5/igJ0pGr2/P7iqg9jm6rrf9XMtmZJuOREm4V8MiB0hf
 9Jc8tgdv+MXPCKECbR12t4VhLzachBtpIdE8B2tPLhCUZ28eba17MI6f7tLEH+qRaJEE
 jiBuLFNUNRrdQFC3coBrq7bRJy2bxV+LCx7rpazvCcWbjGkb4K6XeD52bL7dDE8K1OhU
 9gW6JhRluRdB0n+3FpSmi+YqOxmfbb4lJm4ygtB6gTt5tzsXWzKyp7cSj8Qd7VXpUBPn
 XcM/u++prvJjeDE+pICygguCFXNZ3yGQos2CdIlVZBnd170eygg6849FnLARmohQeSpC
 OkIw==
X-Gm-Message-State: APjAAAV6DCKt5XVJcqGAiAxqbe28Qk1kFbSpnAeJpTy8k3Y8Seq+nReE
 NLRh7xIJ1cCEP7QmVUthY/cq9KC2FAghNzXTzfbFHjyblGY0fg==
X-Google-Smtp-Source: APXvYqx5ijgl+w0GBnLUWD5KkzkW+7Gj2+GpS5nO9v9fYbmooKsuoHPbdJbXSYbAs0PjmgaJ1GnOBe5Y3YqcPGmFcoI=
X-Received: by 2002:a37:8bc7:: with SMTP id
 n190mr51197085qkd.108.1554160630332; 
 Mon, 01 Apr 2019 16:17:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGt4E5tYNVD5n7QmYOpCQs3SOG7w0qJrk9LikQ9NDR5G3QoyCQ@mail.gmail.com>
 <f6ee3da1-0f1a-fa36-c2b7-438c7f1b7d26@sigma-star.at>
In-Reply-To: <f6ee3da1-0f1a-fa36-c2b7-438c7f1b7d26@sigma-star.at>
From: Markus Mayer <mmayer@broadcom.com>
Date: Mon, 1 Apr 2019 16:16:59 -0700
Message-ID: <CAGt4E5svbm0otsjNfHeyEN-8OL7HzeP-EF0V2B5PY70RNPZq4g@mail.gmail.com>
Subject: Re: mkfs.ubifs issues with mtd-utils 2.1.0
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_161712_412461_101F2DFA 
X-CRM114-Status: GOOD (  19.85  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 31 Mar 2019 at 23:40, David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:

Hi David,

> This check was introduced in "a767dd30 mkfs.ubifs: Add encrypted symlink support".
>
> This commit is part of the fscrypt patch set. A few lines below, the extra data is
> encrypted with the path encryption functions if there is an fscrypt context.
>
> Given that having device files on disk outside an initramfs is a rather rare thing
> nowadays (devtmpfs), it appears we unfortunately didn't think of that case and
> tests subsequently didn't cover it either.

What can I say. We are special. ;-)

> > Since I am not entirely sure of the purpose of the check, I am also
> > unsure what solution to propose. Would
> >     if (S_ISREG(st->st_mode)) /* error here */
> > or
> >     if (S_ISREG(st->st_mode) || S_ISDIR(st->st_mode)) /* error here */
> > be sufficient? This would allow links, character & block devices, sockets, etc.
>
> A quick and dirty fix would be to move the check into the branch where the data
> is actually encrypted.

I can confirm that it works for me again when I do this:

$ git diff
diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
index e0c42f36db7f..4af5250db5e6 100644
--- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
@@ -1531,12 +1531,12 @@ static int add_inode(struct stat *st, ino_t
inum, void *data,
        ino->flags      = cpu_to_le32(use_flags);
        ino->compr_type = cpu_to_le16(c->default_compr);
        if (data_len) {
-               if (!S_ISLNK(st->st_mode))
-                       return err_msg("Expected symlink");
-
                if (!fctx) {
                        memcpy(&ino->data, data, data_len);
                } else {
+                       if (!S_ISLNK(st->st_mode))
+                               return err_msg("Expected symlink");
+
                        ret = encrypt_symlink(&ino->data, data, data_len, fctx);
                        if (ret < 0)
                                return ret;

> However, the question remains what the fscrypt branch should actually do with
> a device number in this case.

A good question. I'll have to leave the answer to those more versed
with UBIFS than me.

It may make sense to incorporate the above change for now, especially
if determining the proper behaviour for encrypting device files takes
some time. While the change doesn't fix the behaviour if it tries to
encrypt the file system, it also doesn't change the outcome. If
encryption is being used, it'll still bail, just as it does now. The
change does fix things for non-encrypted file systems, however.

Thanks,
-Markus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
