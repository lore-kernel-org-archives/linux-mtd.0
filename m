Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35008C63697
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 02:09:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B26DD20732
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 02:09:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ajAhihQU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SJijZ7Ez"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B26DD20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7jLh7yS0KeLV93j13EB7DDBPnT+4erBo4rL+4XexmM0=; b=ajAhihQUTURkHWkfe5fdPELxu
	rcdZu21CSPclnxpCqViaE0ySdlMoHQEnRXt++wTvzZZP2BO/deY2gf2pGdGtNlaYP8fde0eHE0UV1
	uOiZhIQXTkhtaxaJJQzgdggKllNuUcnUwHBuoNNqz8a7/LR1R2JHHrKNfEPve5q+5g970X8ZiV542
	kUvFFGOlOwB9YenlTPo9GBx98wq1WmJ40RKfbR5Au1ScWJqKs55rSi5rzrulzBkPm2oUsZ+vY1dum
	rIMLVxNqjjqU+IaBfUs787o5wiDxiw7M3itHj0BfbTQHHdcyBKxIrHtYicOUahVGon/5IMVt0mA5L
	34IG+Cefg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khNlA-0003or-4S; Tue, 24 Nov 2020 02:08:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khNl6-0003l6-3R
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 02:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606183722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WP+31OsU+5g/aMu0W36G+ShW7+TjC+8Wfm0ANAD2BDg=;
 b=SJijZ7EzXcr1BWrAHhxtUQ6N0w7uorsqNwlhJd6WG9m9i9Fl0uWvBemFHwG9aZIWwzf4ea
 wfUmZlhmeJtZxtJuRx3oRO/rtg3OzzqAQJkmSiTCqcClZKPQ3T74oV/VAwQ8OmPlldFJLw
 8bdZK1daCfE6cljhREd/OVn2TzQSKSw=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-58_-JPwgMKqfmjyOSrCklQ-1; Mon, 23 Nov 2020 21:08:40 -0500
X-MC-Unique: 58_-JPwgMKqfmjyOSrCklQ-1
Received: by mail-pg1-f198.google.com with SMTP id i67so13944294pgc.3
 for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2020 18:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WP+31OsU+5g/aMu0W36G+ShW7+TjC+8Wfm0ANAD2BDg=;
 b=U+7IDk1jL0eV5i3UM9iP5opTJWktCcmE5pnhNjQ9wYriXzCfv6KFlZZ/91pFEBFy/F
 pXeIcGKmAo0bbspENCwSVSvAMM1MwC6GQfQ/KhPd8k5upE4mPA/Hq8/3c9mWTRSADnEz
 KMVXuRrRbZnYAKWbympP91OnXxbjCWpoLB73bHWLJtiScZTfDa3/e1KJQW9SSaa2pPWV
 /DD0NKYmK7hXxnPfh8HZnv+U0ou5F6sFKVRJBQPjPxwA2il+nNw5jsk1z2J6iL2civv4
 EPCBKcUT06+6C6H/4gtLCtMfBJ7iWuWgXzeXKNpdhoTLz/1FA74GyKnNYMQoUVRHTM9x
 CELQ==
X-Gm-Message-State: AOAM533P00AmStHm0K5X7ZGwgBUxygayDKHaeC0wPH1SNRLpBoUXMIJK
 DXLtzmhDIJpDXE/ccuMulQxsIsOebwkHPdp6aj4pT2iiR8rE6juTPMf2e2Gx6vYjZaYmpHy2q4l
 Cu83jmj/S5JQFq1vsAu7CKHJyEA==
X-Received: by 2002:a17:902:6b08:b029:d6:c471:8b5b with SMTP id
 o8-20020a1709026b08b02900d6c4718b5bmr1986828plk.78.1606183718983; 
 Mon, 23 Nov 2020 18:08:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5+igtPET/Dt98T/kKfa/91YJzxneE9zETKp3qe+D1ZXJ/z5cODpK8Yh/f0wMZsyQSBVZxXw==
X-Received: by 2002:a17:902:6b08:b029:d6:c471:8b5b with SMTP id
 o8-20020a1709026b08b02900d6c4718b5bmr1986811plk.78.1606183718720; 
 Mon, 23 Nov 2020 18:08:38 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id y3sm723148pjb.18.2020.11.23.18.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 18:08:38 -0800 (PST)
Date: Tue, 24 Nov 2020 10:08:24 +0800
From: Gao Xiang <hsiangkao@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v4 2/3] fscrypt: Have filesystems handle their d_ops
Message-ID: <20201124020824.GA3156301@xiangao.remote.csb>
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-3-drosen@google.com>
 <20201122051218.GA2717478@xiangao.remote.csb>
 <X7w9AO0x8vG85JQU@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <X7w9AO0x8vG85JQU@sol.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hsiangkao@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_210844_578845_B3D7E97E 
X-CRM114-Status: GOOD (  31.59  )
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
 Daniel Rosenberg <drosen@google.com>, Richard Weinberger <richard@nod.at>,
 Chao Yu <chao@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 02:51:44PM -0800, Eric Biggers wrote:
> On Sun, Nov 22, 2020 at 01:12:18PM +0800, Gao Xiang wrote:
> > Hi all,
> > 
> > On Thu, Nov 19, 2020 at 06:09:03AM +0000, Daniel Rosenberg wrote:
> > > This shifts the responsibility of setting up dentry operations from
> > > fscrypt to the individual filesystems, allowing them to have their own
> > > operations while still setting fscrypt's d_revalidate as appropriate.
> > > 
> > > Most filesystems can just use generic_set_encrypted_ci_d_ops, unless
> > > they have their own specific dentry operations as well. That operation
> > > will set the minimal d_ops required under the circumstances.
> > > 
> > > Since the fscrypt d_ops are set later on, we must set all d_ops there,
> > > since we cannot adjust those later on. This should not result in any
> > > change in behavior.
> > > 
> > > Signed-off-by: Daniel Rosenberg <drosen@google.com>
> > > Acked-by: Eric Biggers <ebiggers@google.com>
> > > ---
> > 
> > ...
> > 
> > >  extern const struct file_operations ext4_dir_operations;
> > >  
> > > -#ifdef CONFIG_UNICODE
> > > -extern const struct dentry_operations ext4_dentry_ops;
> > > -#endif
> > > -
> > >  /* file.c */
> > >  extern const struct inode_operations ext4_file_inode_operations;
> > >  extern const struct file_operations ext4_file_operations;
> > > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> > > index 33509266f5a0..12a417ff5648 100644
> > > --- a/fs/ext4/namei.c
> > > +++ b/fs/ext4/namei.c
> > > @@ -1614,6 +1614,7 @@ static struct buffer_head *ext4_lookup_entry(struct inode *dir,
> > >  	struct buffer_head *bh;
> > >  
> > >  	err = ext4_fname_prepare_lookup(dir, dentry, &fname);
> > > +	generic_set_encrypted_ci_d_ops(dentry);
> > 
> > One thing might be worth noticing is that currently overlayfs might
> > not work properly when dentry->d_sb->s_encoding is set even only some
> > subdirs are CI-enabled but the others not, see generic_set_encrypted_ci_d_ops(),
> > ovl_mount_dir_noesc => ovl_dentry_weird()
> > 
> > For more details, see:
> > https://android-review.googlesource.com/c/device/linaro/hikey/+/1483316/2#message-2e1f6ab0010a3e35e7d8effea73f60341f84ee4d
> > 
> > Just found it by chance (and not sure if it's vital for now), and
> > a kind reminder about this.
> > 
> 
> Yes, overlayfs doesn't work on ext4 or f2fs filesystems that have the casefold
> feature enabled, regardless of which directories are actually using casefolding.
> This is an existing limitation which was previously discussed, e.g. at
> https://lkml.kernel.org/linux-ext4/CAOQ4uxgPXBazE-g2v=T_vOvnr_f0ZHyKYZ4wvn7A3ePatZrhnQ@mail.gmail.com/T/#u
> and
> https://lkml.kernel.org/linux-ext4/20191203051049.44573-1-drosen@google.com/T/#u.
> 
> Gabriel and Daniel, is one of you still looking into fixing this?  IIUC, the
> current thinking is that when the casefolding flag is set on a directory, it's
> too late to assign dentry_operations at that point.  But what if all child
> dentries (which must be negative) are invalidated first, and also the filesystem
> forbids setting the casefold flag on encrypted directories that are accessed via
> a no-key name (so that fscrypt_d_revalidate isn't needed -- i.e. the directory
> would only go from "no d_ops" to "generic_ci_dentry_ops", not from
> "generic_encrypted_dentry_ops" to "generic_encrypted_ci_dentry_ops")?

From my limited knowledge about VFS, I think that is practical as well, since
we don't have sub-sub-dirs since all sub-dirs are negative dentries for empty dirs.
And if casefold ioctl is "dir inode locked", I think that would be fine (?)
I don't check the code though.

Thanks,
Gao Xiang

> 
> - Eric
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
