Return-Path: <SRS0=5Vwq=RS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC02DC4360F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 13:59:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A4C1217F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Mar 2019 13:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WO3RTAYO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A4C1217F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmrgi9GH8G3go02JMhAcmElAlveU/Clq48TgmR1JtwY=; b=WO3RTAYOU0B27g
	OPp7OP2bI+w0v7kogyzdjOOqOH2uanGgsDoUSo+aiTsN7PL91ic7YY4j/tTFQ/Y4UFiIYduzmJxBX
	lpVe04shwD5FvvPHISFpDW3Vik9MHPelfrUwNm191dVa6bm1gypmj2K+sh3zgMcOtJVrJSK0J3qVq
	b0vl3uFp7wpl6vNVHQGVQJBDXzFQFSHAbjRQxrLgSzXvjWybw6crpJp8tUsx7dsZKCFiC8C7haEgJ
	isjYVyWgXTK6lfDdTfc9ewZD2hVht5hn0Ty7gmJvf4E8iL921wghENgOeT1GP9PZkGd3rl3jjIVkd
	hcL1brlg3xEdNV4En/rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4nN0-0008FI-4m; Fri, 15 Mar 2019 13:59:34 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4nMw-0008Eu-Li
 for linux-mtd@lists.infradead.org; Fri, 15 Mar 2019 13:59:32 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4C192608A397;
 Fri, 15 Mar 2019 14:59:28 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id F8QMm3UBWQjW; Fri, 15 Mar 2019 14:59:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id EECF760B62A7;
 Fri, 15 Mar 2019 14:59:27 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EhW9eD3_Ku6b; Fri, 15 Mar 2019 14:59:27 +0100 (CET)
Received: from blindfold.localnet (089144193070.atnat0002.highway.a1.net
 [89.144.193.70])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id 147D6608A397;
 Fri, 15 Mar 2019 14:59:27 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Theodore Ts'o <tytso@mit.edu>
Subject: Re: [PATCH 4/4] ubifs: Implement new mount option,
 fscrypt_key_required
Date: Fri, 15 Mar 2019 14:59:26 +0100
Message-ID: <11194150.36rPM0hNvo@blindfold>
In-Reply-To: <20190315135128.GL11334@mit.edu>
References: <CAJfpegvX4ANfso-Jn1zaB+m4Q_0eK9i-+MCJ+sTH5QzD3PZFMQ@mail.gmail.com>
 <3651600.xvQHXhhOD0@blindfold> <20190315135128.GL11334@mit.edu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_065930_860634_047DF40A 
X-CRM114-Status: GOOD (  18.86  )
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
Cc: paullawrence@google.com, miklos@szeredi.hu, amir73il@gmail.com,
 linux-unionfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, James.Bottomley@hansenpartnership.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ted,

Am Freitag, 15. M=E4rz 2019, 14:51:28 CET schrieb Theodore Ts'o:
> On Fri, Mar 15, 2019 at 08:48:10AM +0100, Richard Weinberger wrote:
> > Ted,
> > =

> > Am Freitag, 15. M=E4rz 2019, 00:07:02 CET schrieb Theodore Ts'o:
> > > Richard --- stepping back for a moment, in your use case, are you
> > > assuming that the encryption key is always going to be present while
> > > the system is running?
> > =

> > it is not a hard requirement, it is something what is common on embedded
> > systems that utilize UBIFS and fscrypt.
> > =

> > Well, fscrypt was chosen as UBIFS encryption backend because per-file e=
ncryption
> > with derived keys makes a lot of sense.
> > Also the implementation was not super hard, David and I weren't keen to=
 reinvent
> > dm-crypt f=FCr UBI/MTD.
> > =

> > That said, I'm happy with fscrypt, it works well in production.
> =

> OK, but please note that fscrypt leaks i_size and timestamp
> information; dm-crypt doesn't.  An enterprising attacker could very
> easily be able to do something interesting with that information, so
> be sure you've thought through what the threat model for users of
> ubifs is going to be.

No need to worry, I'm fully aware of all this.
 =

> If you need per-user keying, and you need to be able to mount the file
> system and access some of the files without having any keys, and if
> it's useful for an admin to be able to delete files without having the
> key, then fscrypt is a great fit.
> =

> You are proposing changes that (optionally) eliminate that last
> advantage of fscrypt.  So I just wanted to sanity check whether or not
> the other advantages are useful to you, and worth the security
> tradeoffs that are inherent in such a choice.  If it's worth it, then
> great.  But if it isn't, I'd much rather that you appropriately
> protect your users and your customers rather than be an additional
> user of fscrypt.  :-)

Like I said, this patch series is an RFC, the mount option was suggested
by Amir and Miklos, so I assumed showing some code is a good base for furth=
er
discussion.
For most of *my* use-cases it works but having general support for fscrypt+=
overlayfs
would be the ultimate goal.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
