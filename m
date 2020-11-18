Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58935C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 06:23:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C85D024655
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 06:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IhWKqBBi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="s/0gcm/n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C85D024655
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+iYPFcxASB0CxUAAS65n4F15x4+wJH4nPG58g8eERc4=; b=IhWKqBBivLwMzcPhNiW0mmjgx
	FTXCKmVI/em4pjOOkJsxug6rMoZPRkfqEgMa9PY8sIj0cP/ELORCknjkqRhyyRYWKRQg6HFnea5uo
	fcP0KGP8igfoZB2Rxdu4hq+IpnpxTQOwMR5cyaRTmyTl0waXZ7muYxhY//XYvl/04yU/PFkI3WaXL
	htbLZy+JxOS3WlWN6ilG0fAYFr9TPfvB2ycR8Z55PcctlLDkbzaUPeIykIkaNKWd7TMGpRGSl+ro0
	bb0+PmlXhblxFVzKBVtrhNoT+zu2oimX3TlXtud9uFqF5hh669PduYlvXEV25nUglsXixeZJigomM
	9aJrX9AwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfGrc-0000So-Ug; Wed, 18 Nov 2020 06:22:44 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfGra-0000S4-EJ
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 06:22:43 +0000
Received: by mail-ot1-x343.google.com with SMTP id h16so705060otq.9
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 22:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YtbFnHLC0F4iSC34KfXMYG3W+T/7MuJJbJ93crg4rYY=;
 b=s/0gcm/nu0ykiimxR8WdTqn9/oRW/XbyL4w3MNEAnCfzuYkMI3OFhwyBJe63/t0URk
 MF/eQSENFOP4uuanpMx/bVQmSBCMt9205j/XRDkg2inxeNJhKoi7iACS4a6LKhzYyyPq
 qa4dNN1q0jLGZrs5Lrn7jSqxzCJiOKKH3hQaT5DpJF7rkZje9PEQmxHX/SUM+QIQdrko
 eTsEfmyf6ZOcB2cirE8P2cFHN4xZybxLcNtsGeHE28KzS3mQ7JEffWMaUWI2FOczvsSz
 zEPr9p1knwW2aa2cMoNyVRYTr6BAKJgMrSjOb12HfcwQQj2g7+qML5P4PBXcJLFoIouH
 gSng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YtbFnHLC0F4iSC34KfXMYG3W+T/7MuJJbJ93crg4rYY=;
 b=KY/O+bB4YDUH+h+RzWWAEOsvznDOAeCaXVmY+vFck3xOp+Cz8mW8YgFgjNW0WexF/f
 WWYD/ylGaUlxSq+9DUjJlo7GAhbX8BF/oAeiK7+2bbkHH5MDvAJtGcPsERS/3R04oRFo
 KydkIPYvs5yDQku1lJumz40g8FnN+M/5wsgwiad7zaFXT9PgaoFe2+WBb+87WTWb6tyO
 kQF6WdJx5javL3iN0a/U+Btxla8ybnTyOPyczJ2W/y9R+E6gfa9lDdf+5DDmR3NYK5Fx
 Zr3cC+wml2xIzEPL2uuUTnlabSdaVCtX6AwgFZfctkjM5DbpDf4aSOLWCM3lj+P5Cnsr
 IxIw==
X-Gm-Message-State: AOAM533PR5zpsM0Ykmwvo0y5PnEumsckNss5kAeS5xDeT3N+cfiQUsWj
 WAO8zga15yUnHdf0GbWuNNsT2bKI84uJMT2ZBxlDMA==
X-Google-Smtp-Source: ABdhPJwWgllZCVW/lRnluvAChVjMF1TDf/msIQVY0NfyaYFdNqL1Ed/ZnJAgja+VBlqEUAJ7Jx61VEi4QbR1tg0v1Z0=
X-Received: by 2002:a9d:8ee:: with SMTP id 101mr5606894otf.93.1605680559385;
 Tue, 17 Nov 2020 22:22:39 -0800 (PST)
MIME-Version: 1.0
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-4-drosen@google.com>
 <X7QbX9Q4xzhg+5UU@sol.localdomain>
In-Reply-To: <X7QbX9Q4xzhg+5UU@sol.localdomain>
From: Daniel Rosenberg <drosen@google.com>
Date: Tue, 17 Nov 2020 22:22:28 -0800
Message-ID: <CA+PiJmRQGJP5uHf-yXs=efo++JE+SUmjRizwzH-RGG92RdAxyw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] f2fs: Handle casefolding with Encryption
To: Eric Biggers <ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_012242_515346_7C77083E 
X-CRM114-Status: GOOD (  20.97  )
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 10:50 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
>
> What is the assignment to dentry_page supposed to be accomplishing?  It looks
> like it's meant to pass up errors from f2fs_find_target_dentry(), but it doesn't
> do that.

Woops. Fixed that for the next version.

>
> > @@ -222,14 +250,20 @@ static bool f2fs_match_ci_name(const struct inode *dir, const struct qstr *name,
> >                * fall back to treating them as opaque byte sequences.
> >                */
> >               if (sb_has_strict_encoding(sb) || name->len != entry.len)
> > -                     return false;
> > -             return !memcmp(name->name, entry.name, name->len);
> > +                     res = 0;
> > +             else
> > +                     res = memcmp(name->name, entry.name, name->len) == 0;
> > +     } else {
> > +             /* utf8_strncasecmp_folded returns 0 on match */
> > +             res = (res == 0);
> >       }
>
> The following might be easier to understand:
>
>         /*
>          * In strict mode, ignore invalid names.  In non-strict mode, fall back
>          * to treating them as opaque byte sequences.
>          */
>         if (res < 0 && !sb_has_strict_encoding(sb)) {
>                 res = name->len == entry.len &&
>                       memcmp(name->name, entry.name, name->len) == 0;
>         } else {
>                 /* utf8_strncasecmp_folded returns 0 on match */
>                 res = (res == 0);
>         }
>
Thanks, that is a fair bit nicer.

> > @@ -273,10 +308,14 @@ struct f2fs_dir_entry *f2fs_find_target_dentry(const struct f2fs_dentry_ptr *d,
> >                       continue;
> >               }
> >
> > -             if (de->hash_code == fname->hash &&
> > -                 f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > -                                 le16_to_cpu(de->name_len)))
> > -                     goto found;
> > +             if (de->hash_code == fname->hash) {
> > +                     res = f2fs_match_name(d->inode, fname, d->filename[bit_pos],
> > +                                 le16_to_cpu(de->name_len));
> > +                     if (res < 0)
> > +                             return ERR_PTR(res);
> > +                     else if (res)
> > +                             goto found;
> > +             }
>
> Overly long line here.  Also 'else if' is unnecessary, just use 'if'.
>
> - Eric
The 0 case is important, since that reflects that the name was not found.
-Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
