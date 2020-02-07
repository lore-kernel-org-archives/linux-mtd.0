Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3826FC2BA83
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 17:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD482082E
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 17:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f/lWtidu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD482082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shaiton.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2a1KFo81rSjzDi+jEFwLMjlsJWoPDIXcQ9u3P+OKj+Y=; b=f/lWtiduhr0B1I
	e/ERp2HP/9N3AIXOAlhxEdbHo4KHQB2WMLQlOVeSAYgVpbb/wFxwBiaMI5hlupG6HI6QmJVYgBn51
	18us5k5h0b+FN/MAhSK9427s3W7JedzC+qhvuLS7ycXxm2dfIPoAJcsUN5/01kUWzquBLhkWpO/Mh
	xMIbKgU2Xzw1qOE3DQt1uzx05aeWRCQXXVE99z9tKQ0EKxnZ8MdU0e+4yenTywBWUx9ZYQifMlIBL
	a7fjVU1FU2rJ94MQPnO0yjV6cG83LUUimD9NX1jIYPeJK0WfK0GytcEjhoN3ZOA5+ulvOzcGRo0FE
	IcsU035JxNDMAmE4Dwsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j07Jj-0000DL-JV; Fri, 07 Feb 2020 17:21:23 +0000
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j07Jf-0000Ch-Nw
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 17:21:22 +0000
Received: from player750.ha.ovh.net (unknown [10.108.35.122])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 74CA015959B
 for <linux-mtd@lists.infradead.org>; Fri,  7 Feb 2020 18:21:15 +0100 (CET)
Received: from shaiton.org (mail-ua1-f51.google.com [209.85.222.51])
 (Authenticated sender: postmaster@shaiton.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 626C4F17C2FA
 for <linux-mtd@lists.infradead.org>; Fri,  7 Feb 2020 17:21:12 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id y23so127805ual.2
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 09:21:09 -0800 (PST)
X-Gm-Message-State: APjAAAVpbdRg6Rxl6diqtFT4ZiWMoUG/Y7Xa/TXLdpw6Zq05Ns8O0LKU
 fNkJBdi/aR+xLuLXKj3R//Ih3j6qCYibFrVbplA=
X-Google-Smtp-Source: APXvYqy+z0eDlSF59Syw9Pox5FStdMxEQjp9RcpEDTuvA2Pj0n6HsXHKGfU2lQLqhveJcfbJiftUCYahRvWccGAKhK4=
X-Received: by 2002:a9f:36ca:: with SMTP id p68mr5559303uap.112.1581096068689; 
 Fri, 07 Feb 2020 09:21:08 -0800 (PST)
MIME-Version: 1.0
References: <20190806104928.1224-1-s.hauer@pengutronix.de>
 <CAPwc7DMK7RKDUW4Kx4eKVXVJ7y9pmYwCBA+OevN_RdrJvhXb3g@mail.gmail.com>
 <20200207155128.ouow363tvbg2whqk@pengutronix.de>
In-Reply-To: <20200207155128.ouow363tvbg2whqk@pengutronix.de>
From: Kevin Raymond <kr@shaiton.org>
Date: Fri, 7 Feb 2020 18:20:57 +0100
X-Gmail-Original-Message-ID: <CAPwc7DOa-HzeEv7RsA6OrAwFjUnEOPQvP4bwn2B2vkC_95=n_g@mail.gmail.com>
Message-ID: <CAPwc7DOa-HzeEv7RsA6OrAwFjUnEOPQvP4bwn2B2vkC_95=n_g@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd-utils: mkfs.ubifs: Add signing support for UBIFS
 images
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Ovh-Tracer-Id: 11279265267617606067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheehgddutddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepgghfjgfhfffkuffvtgesthdtredttddtjeenucfhrhhomhepmfgvvhhinhcutfgrhihmohhnugcuoehkrhesshhhrghithhonhdrohhrgheqnecuffhomhgrihhnpehpvghnghhuthhrohhnihigrdguvgenucfkpheptddrtddrtddrtddpvddtledrkeehrddvvddvrdehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejhedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepkhhrsehshhgrihhtohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_092119_931034_BBFDC411 
X-CRM114-Status: GOOD (  27.01  )
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
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Feb 7, 2020 at 4:51 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> Hi Kevin,
>
> On Fri, Feb 07, 2020 at 04:25:58PM +0100, Kevin Raymond wrote:
> > Hi there,
> >
> > I am testing ubifs authentication for my new board, however I can't
> > git it to work.
> > I am not able to have keyctl add my key to the kernel keyring.
> >
> > This is by far the most easier documentation I found about ubifs authentication.
> >
> > I've got my kernel generating the asymmetric key, I can do the offline
> > signing with mkfs.ubifs but am not able to mount the ubifs partition.
> > I always get the following error:
> >     mount: mounting /dev/ubi0_8 on /mnt failed: Required key not available
> >
> > I am really not sure about the "keyctl add" part.
> > From the Sascha example, should we change 'mysecret' by
> > 'signing_key.pem' ? Should we change its format?
>
> There are two different keys involved. One is an asymmetric
> private/public key pair needed for authenticating offline signed images.
> That's the one you compile the Kernel with and which you provide to
> mkfs.ubifs. This key is only used during first mount.
>
> The other one is a symmetric key which is used during runtime and that's
> the one you add with:
>
> cat mysecret | keyctl padd logon ubifs:root @s
>
> Note that "cat mysecret" is only an example. It obviously doesn't help
> authenticating having a key stored world readable on the device. The
> i.MX6 offers ways to generate secrets with the CAAM unit. However,
> for testing purposes some "echo foobarbaz | keyctl padd logon ubifs:root
> @s" does it.

Alright I get it, the offline signing key is not the same as the one used at
runtime (which is definitly a good thing).

>
> You are trying offline signed images, but maybe you should start without
> an image and do runtime authentication only. For this create an empty
> UBI volume and just mount it like this (after doing the keyctl padd as
> above):
>
> mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=sha256,auth_key=ubifs:root
>
> I am not sure if the kernel can read the key if you put it into the
> session keyring. Systemd for example influences this and I don't know
> exactly how. You might have to replace "@s" with "@u".

Ok, using user session keyring is better in my example I can successfully define
a new symmetric key in order to mount a newly created partition.
I am not using systemd here, a simple busybox and sysV init.

However if I get the whole idea, If I use ubiupdatevol to update my partition,
I need the public key used while signing the ubifs at the first mount time
and then an other symmetric one ("mysecret" identified as 'ubifs:root' in this
exemple) in order to keep signing the partition.

This public key is already present (available to the mount command?) but
I don't have a way to tell which one to use.

mount -t ubifs /dev/ubi0_8 -o auth_key=ubifs:root,auth_hash_name=sha256 /mnt/
mount: mounting /dev/ubi0_8 on /mnt/ failed: Invalid argument

auth_key is the new symmetric key
my public key used when creating the offline signature is in /proc/keys

3b1ecf1d I------     1 perm 1f030000     0     0 asymmetri Build time
autogenerated kernel key: a21494c43b8859eceedf1c3d6727fd26f51b1bea:
X509.rsa f51b1bea []

I am not sure what I am missing about the first mount of a signed ubifs.

>
> Hope that helps.

Yes I get most of it now, thanks

>
> Regards
>  Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
