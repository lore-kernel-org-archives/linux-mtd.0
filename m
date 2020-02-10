Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD46FC3F68F
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 17:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F252080C
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 17:07:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6OdTIm9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F252080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shaiton.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZ2VvYLR/HGEU9yDOk0DsenUzSMHIsXGGtdFhzeQxtc=; b=T6OdTIm91IwgXa
	btm8IfXUdCCudEy1XRkE6xORvSp+7YY6ekmyC+LttdZy1CQxvnktRpqnTAfRtkkQgaGCCbkSWxFkc
	35nbfH+lsTJM+68P0+2zFNheYaI4o1RjI8480b2Vxw10W6elkjUeuhbGU2mXqL6c6OGpi1SflOTtj
	ZF/v//DI0SSclf6F9g/3lQBexjJfF+AKTkm/3KhhcCNYf1TqcJSRAyOn1QV9qnIuG6VMnj4YEymlB
	F0TUKtvmyw+UYdizIn9Zev6gKJyoxfelUtRK/6fosKIQtdWyXNYtcto1tYT14akL3XoUkjN1sQ6yD
	aA8ngcVI0HFoVKBXRZyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1CWO-0000fq-SZ; Mon, 10 Feb 2020 17:06:56 +0000
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1CWK-0000eJ-Cm
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 17:06:55 +0000
Received: from player691.ha.ovh.net (unknown [10.108.57.245])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id D83B612F05A
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2020 18:06:45 +0100 (CET)
Received: from shaiton.org (mail-vk1-f180.google.com [209.85.221.180])
 (Authenticated sender: postmaster@shaiton.org)
 by player691.ha.ovh.net (Postfix) with ESMTPSA id 2CDA0F4AC5CB
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2020 17:06:44 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id t129so1984941vkg.6
 for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2020 09:06:44 -0800 (PST)
X-Gm-Message-State: APjAAAUJut6YFbBKZUdDkl+dPm4GrfwmLc6cwLJSC1d/ffeDaWQY8GqD
 Gbb4XUbe0pVhQu6Dyy76qWbb1PxIy56manIdpv8=
X-Google-Smtp-Source: APXvYqxz0n/QLat1dz7+faxPXsA15qRGl7j4g3+5fV4zHNtWTLc0j5DSaUK4jqdAHKbHW3WJm/71T4uTWOHUZpdt0rQ=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr1347898vkn.0.1581354399898;
 Mon, 10 Feb 2020 09:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20190806104928.1224-1-s.hauer@pengutronix.de>
 <CAPwc7DMK7RKDUW4Kx4eKVXVJ7y9pmYwCBA+OevN_RdrJvhXb3g@mail.gmail.com>
 <20200207155128.ouow363tvbg2whqk@pengutronix.de>
 <CAPwc7DOa-HzeEv7RsA6OrAwFjUnEOPQvP4bwn2B2vkC_95=n_g@mail.gmail.com>
 <20200210075736.qbf4mo7ut5jrjo7n@pengutronix.de>
In-Reply-To: <20200210075736.qbf4mo7ut5jrjo7n@pengutronix.de>
From: Kevin Raymond <kr@shaiton.org>
Date: Mon, 10 Feb 2020 18:06:28 +0100
X-Gmail-Original-Message-ID: <CAPwc7DM0MeNKaofr+0X3kvNVWUmWV=-9VinDyT-g26VHmWjUsw@mail.gmail.com>
Message-ID: <CAPwc7DM0MeNKaofr+0X3kvNVWUmWV=-9VinDyT-g26VHmWjUsw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd-utils: mkfs.ubifs: Add signing support for UBIFS
 images
To: Sascha Hauer <s.hauer@pengutronix.de>
X-Ovh-Tracer-Id: 10206564131503057331
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedriedugdekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjhfffkffuvfgtsehttdertddttdejnecuhfhrohhmpefmvghvihhnucftrgihmhhonhguuceokhhrsehshhgrihhtohhnrdhorhhgqeenucffohhmrghinhepphgvnhhguhhtrhhonhhigidruggvnecukfhppedtrddtrddtrddtpddvtdelrdekhedrvddvuddrudektdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledurdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepkhhrsehshhgrihhtohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_090652_723744_7A2B08E3 
X-CRM114-Status: GOOD (  36.70  )
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

On Mon, Feb 10, 2020 at 8:57 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> On Fri, Feb 07, 2020 at 06:20:57PM +0100, Kevin Raymond wrote:
> > On Fri, Feb 7, 2020 at 4:51 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > >
> > > Hi Kevin,
> > >
> > > On Fri, Feb 07, 2020 at 04:25:58PM +0100, Kevin Raymond wrote:
> > > > Hi there,
> > > >
> > > > I am testing ubifs authentication for my new board, however I can't
> > > > git it to work.
> > > > I am not able to have keyctl add my key to the kernel keyring.
> > > >
> > > > This is by far the most easier documentation I found about ubifs authentication.
> > > >
> > > > I've got my kernel generating the asymmetric key, I can do the offline
> > > > signing with mkfs.ubifs but am not able to mount the ubifs partition.
> > > > I always get the following error:
> > > >     mount: mounting /dev/ubi0_8 on /mnt failed: Required key not available
> > > >
> > > > I am really not sure about the "keyctl add" part.
> > > > From the Sascha example, should we change 'mysecret' by
> > > > 'signing_key.pem' ? Should we change its format?
> > >
> > > There are two different keys involved. One is an asymmetric
> > > private/public key pair needed for authenticating offline signed images.
> > > That's the one you compile the Kernel with and which you provide to
> > > mkfs.ubifs. This key is only used during first mount.
> > >
> > > The other one is a symmetric key which is used during runtime and that's
> > > the one you add with:
> > >
> > > cat mysecret | keyctl padd logon ubifs:root @s
> > >
> > > Note that "cat mysecret" is only an example. It obviously doesn't help
> > > authenticating having a key stored world readable on the device. The
> > > i.MX6 offers ways to generate secrets with the CAAM unit. However,
> > > for testing purposes some "echo foobarbaz | keyctl padd logon ubifs:root
> > > @s" does it.
> >
> > Alright I get it, the offline signing key is not the same as the one used at
> > runtime (which is definitly a good thing).
> >
> > >
> > > You are trying offline signed images, but maybe you should start without
> > > an image and do runtime authentication only. For this create an empty
> > > UBI volume and just mount it like this (after doing the keyctl padd as
> > > above):
> > >
> > > mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=sha256,auth_key=ubifs:root
> > >
> > > I am not sure if the kernel can read the key if you put it into the
> > > session keyring. Systemd for example influences this and I don't know
> > > exactly how. You might have to replace "@s" with "@u".
> >
> > Ok, using user session keyring is better in my example I can successfully define
> > a new symmetric key in order to mount a newly created partition.
> > I am not using systemd here, a simple busybox and sysV init.
> >
> > However if I get the whole idea, If I use ubiupdatevol to update my partition,
> > I need the public key used while signing the ubifs at the first mount time
> > and then an other symmetric one ("mysecret" identified as 'ubifs:root' in this
> > exemple) in order to keep signing the partition.
>
> Yes. You could do without the symmetric key in a readonly environment.
>
> >
> > This public key is already present (available to the mount command?) but
> > I don't have a way to tell which one to use.
>
> You don't have to, the Kernel will pick the right one automatically.
>
> >
> > mount -t ubifs /dev/ubi0_8 -o auth_key=ubifs:root,auth_hash_name=sha256 /mnt/
> > mount: mounting /dev/ubi0_8 on /mnt/ failed: Invalid argument
> >
> > auth_key is the new symmetric key
> > my public key used when creating the offline signature is in /proc/keys
> >
> > 3b1ecf1d I------     1 perm 1f030000     0     0 asymmetri Build time
> > autogenerated kernel key: a21494c43b8859eceedf1c3d6727fd26f51b1bea:
> > X509.rsa f51b1bea []
> >
> > I am not sure what I am missing about the first mount of a signed ubifs.
>
> Me neither currently. I could play it through with a current
> Linux/mtd-utils tomorrow to see if there's anything not working.


Ok, thanks a lot for your help.
I tried from scratch (auto generated kernel certificate/key, offline
signing using this key+certificate) and I still get the following:

    # mount -t ubifs /dev/ubi0_6 -o ro /mnt
    mount: mounting /dev/ubi0_6 on /mnt failed: Invalid argument
    [ 7961.936787] UBIFS error (ubi0:6 pid 1025):
ubifs_read_superblock: authenticated FS found, but no key given

Apparently I need the symmetric key, as the following is working now
(with or without the read-only option)

    mount -t ubifs /dev/ubi0_6 -o
ro,auth_key=ubifs:rootf,auth_hash_name=sha256  /mnt
    [ 8390.028045] UBIFS (ubi0:6): Mounting in authenticated mode
    [ 8618.586641] UBIFS (ubi0:6): background thread "ubifs_bgt0_6" stops
    [ 8630.039989] UBIFS (ubi0:6): Mounting in authenticated mode
    [ 8630.098767] UBIFS (ubi0:6): Successfully verified super block signature
    [ 8630.151322] UBIFS (ubi0:6): UBIFS: mounted UBI device 0, volume
6, name "root", R/O mode
    [ 8630.159482] UBIFS (ubi0:6): LEB size: 126976 bytes (124 KiB),
min./max. I/O unit sizes: 2048 bytes/2048 bytes
    [ 8630.169370] UBIFS (ubi0:6): FS size: 33267712 bytes (31 MiB,
262 LEBs), journal size 9023488 bytes (8 MiB, 72 LEBs)
    [ 8630.179784] UBIFS (ubi0:6): reserved for root: 0 bytes (0 KiB)
    [ 8630.185546] UBIFS (ubi0:6): media format: w4/r0 (latest is
w5/r0), UUID 33053EA9-B76E-47A1-BC0B-BB8B97E7F593, small LPT model

I don't know what was wrong last Friday, it might be the symmetric key
inserted with keyctl in an invalid format. This time a tried with a
simple ascii string.
I now have a working example, which is enough for me to dig further
into the ubifs authentication feature.

Thanks a lot for your work and your help.

>
> Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
