Return-Path: <SRS0=la4X=XL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66387C49ED7
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 16:37:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3887821852
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Sep 2019 16:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLwG4xVV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wjcwn0bY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3887821852
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhyVERh5tfPrSfCMi6Sj394uZ0RWfpnunOy7iWU7JsE=; b=dLwG4xVV6DKBKR
	WKIVwOjsjZrTaySW500i0qAmplayV+reAgtlRLBPqZ3rMwl70uXP89bOMh7SW5n48jWjbQlnXSp4G
	rdO92jHId24Os9pHSUKmpw15nrENIrUoGKDc5Cc9ukR7Zhf/KRJ/h4gHFn+MYF7U8DfDbiN0jwAXU
	jqPUiXnKpzKSPzoX6fxP3gkH8V/iFpQL6CnVspd/4FSljPiWfQXLkRt9UzXADTPD6Cv++cKLHZg/v
	F9reIYpPVr+s8yxCbOkyX3PC7DlmB/I2d8PZDe7KQjRLii6K1se6PWcs/xv5LRX6zip95V7OVHyRU
	1vz+ZYvRHUwKE4E5bisQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9u0M-0007Pt-1I; Mon, 16 Sep 2019 16:37:34 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9u0G-0007Ow-S6
 for linux-mtd@lists.infradead.org; Mon, 16 Sep 2019 16:37:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id v17so57872wml.4
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2019 09:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5GSLRtaWXP5trJhqVOplw/3NUbMs67XKaj1GvOZOB7Y=;
 b=Wjcwn0bYH1NkN6RT5L8bAJuVTizoUSFL2YFRKqCKCmSD5HiQoZTg+VC9QMz2gRCp7+
 1UNydDzMTvaoUs8OU7IMPPcuchD1IhtJhnCY2eDt+96Bum4e5Rd1IRBbQsTNE1tvMV1q
 FTUlb9lbj4JWDlKAc5vf/SEpJCPsweWcQpCmShH1Kb+xkCp3KKcZhgw89WAyYfq7/CQx
 W6xgPUrGbY0r0D7hhskHA8GqNv/EtHcugI6HfQ7tEAUmwxQjuRgvZxz5DUGZkg8VxhJM
 ER61Iu6ZYtIS4i2kp+H4EtbvoggSB9SIGJurXd85S9eaDLT/2fSzHqZlgbYk39jZbbJP
 fzJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5GSLRtaWXP5trJhqVOplw/3NUbMs67XKaj1GvOZOB7Y=;
 b=RTaxPeUcmmTufrnaWtsxiUcxIDDfgKN7v4OFpoimM7jokzprUSzHjrWcbUuHdWwooY
 Bri4g72artwXssHiwzLIMRXgCRlDPRGT4grHkZlX7Q+G+LQ8EDZtx6JeJ96P3O/+tyqM
 OUwqX/gHEMteBM3zw44SVealddi2eofEJmx5MJq2RyIoK5Z0Gj+1KebdiZbwPnv3Vdzg
 /W/RfeXFjSvMnvZqiGs3Yrg0zgBRquJhn5mowNe6vPairrD6aA9aFmcr5FE1n2pD8iiC
 bqxmsIjmWCzbrl5L3TkMuzhcPmOIpACum8EAMzI1OjvJfSbJ1buOoF9jDKn6HQ5AN7py
 O2Mg==
X-Gm-Message-State: APjAAAWuwVDDrpzro6WF41jEXE6/+MN0DiY3XVB7yTwKSe6Bt346Ms1i
 QoqzVifW+xa7R1AkYOibyxnVInnFPu/3LB5tI1s=
X-Google-Smtp-Source: APXvYqzA+3qCVXj4SPQHZUzSNPHIKuJNpnJe+OL9j20Ou/1YJskceQAFv7l87MBB9gRCRvkGgnlPsye9L1/vGj+W0cc=
X-Received: by 2002:a1c:1d4:: with SMTP id 203mr73764wmb.104.1568651846964;
 Mon, 16 Sep 2019 09:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190916134029.GF4352@sirena.co.uk>
In-Reply-To: <20190916134029.GF4352@sirena.co.uk>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Sep 2019 18:37:15 +0200
Message-ID: <CAFLxGvwZPBg7834aq4rqJyxMNCkNThPa2hGuwuuzpxYkHiQN7Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the ubifs tree
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_093728_937157_5A3FCEFE 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 16, 2019 at 3:40 PM Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the vfs tree got a conflict in:
>
>   fs/ubifs/super.c
>
> between commit:
>
>   9163e0184bd7d5f ("ubifs: Fix memory leak bug in alloc_ubifs_info() error path")
>
> from the ubifs tree and commit:
>
>   50d7aad57710e2b ("vfs: Convert ubifs to use the new mount API")
>
> from the vfs tree.
>
> I fixed it up dropping the ubifs change and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks a lot for letting me know!

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
