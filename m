Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69262C352A4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 07:58:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A71B20733
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 07:58:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GeF9Y79A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A71B20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJ4mn19xwDwZSMn2LZMjiMkLc55RJLrUo/m2Jmb4fkk=; b=GeF9Y79Agqnl+c
	fQIuBhi+c1c2e0QJjrjN8aisjgb3qodxR/DANcE0LC3H2uMaWTGgTBFgjq06K5XEgcTbYS8moUdpA
	Kohvpm5mUV/KS/mPZqwj8IqweWe7MAzLAt1HSMPcFP0I3g10i6dzUlGsdxzlNMBPDY1stq1Y3+l5N
	66W4FZYiDgaxn2MaibWhaK0wsLmVr1cpDjgq7p8ndDFpGUKOKb5+gaPEBwIRIsVazowrmZymRhp+u
	oxbwbz2VslZAMpA6V2udaV8At1BS5mphq1HzIwKm37JYTWFxQqTCw4Mfr6dZMPfmt2Cs+VuQWGlTW
	N3iCfG9E1dBYPlNKh38A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j13wv-0003XO-Sw; Mon, 10 Feb 2020 07:57:45 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j13wr-0003Wo-OJ
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 07:57:43 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1j13wn-0003G0-LJ; Mon, 10 Feb 2020 08:57:37 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1j13wm-0001Es-NS; Mon, 10 Feb 2020 08:57:36 +0100
Date: Mon, 10 Feb 2020 08:57:36 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Kevin Raymond <kr@shaiton.org>
Subject: Re: [PATCH 0/2] mtd-utils: mkfs.ubifs: Add signing support for UBIFS
 images
Message-ID: <20200210075736.qbf4mo7ut5jrjo7n@pengutronix.de>
References: <20190806104928.1224-1-s.hauer@pengutronix.de>
 <CAPwc7DMK7RKDUW4Kx4eKVXVJ7y9pmYwCBA+OevN_RdrJvhXb3g@mail.gmail.com>
 <20200207155128.ouow363tvbg2whqk@pengutronix.de>
 <CAPwc7DOa-HzeEv7RsA6OrAwFjUnEOPQvP4bwn2B2vkC_95=n_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPwc7DOa-HzeEv7RsA6OrAwFjUnEOPQvP4bwn2B2vkC_95=n_g@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:09:10 up 217 days, 13:19, 69 users,  load average: 0.08, 0.23,
 0.23
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_235741_791396_EDABE9C6 
X-CRM114-Status: GOOD (  31.90  )
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

On Fri, Feb 07, 2020 at 06:20:57PM +0100, Kevin Raymond wrote:
> On Fri, Feb 7, 2020 at 4:51 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >
> > Hi Kevin,
> >
> > On Fri, Feb 07, 2020 at 04:25:58PM +0100, Kevin Raymond wrote:
> > > Hi there,
> > >
> > > I am testing ubifs authentication for my new board, however I can't
> > > git it to work.
> > > I am not able to have keyctl add my key to the kernel keyring.
> > >
> > > This is by far the most easier documentation I found about ubifs authentication.
> > >
> > > I've got my kernel generating the asymmetric key, I can do the offline
> > > signing with mkfs.ubifs but am not able to mount the ubifs partition.
> > > I always get the following error:
> > >     mount: mounting /dev/ubi0_8 on /mnt failed: Required key not available
> > >
> > > I am really not sure about the "keyctl add" part.
> > > From the Sascha example, should we change 'mysecret' by
> > > 'signing_key.pem' ? Should we change its format?
> >
> > There are two different keys involved. One is an asymmetric
> > private/public key pair needed for authenticating offline signed images.
> > That's the one you compile the Kernel with and which you provide to
> > mkfs.ubifs. This key is only used during first mount.
> >
> > The other one is a symmetric key which is used during runtime and that's
> > the one you add with:
> >
> > cat mysecret | keyctl padd logon ubifs:root @s
> >
> > Note that "cat mysecret" is only an example. It obviously doesn't help
> > authenticating having a key stored world readable on the device. The
> > i.MX6 offers ways to generate secrets with the CAAM unit. However,
> > for testing purposes some "echo foobarbaz | keyctl padd logon ubifs:root
> > @s" does it.
> 
> Alright I get it, the offline signing key is not the same as the one used at
> runtime (which is definitly a good thing).
> 
> >
> > You are trying offline signed images, but maybe you should start without
> > an image and do runtime authentication only. For this create an empty
> > UBI volume and just mount it like this (after doing the keyctl padd as
> > above):
> >
> > mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=sha256,auth_key=ubifs:root
> >
> > I am not sure if the kernel can read the key if you put it into the
> > session keyring. Systemd for example influences this and I don't know
> > exactly how. You might have to replace "@s" with "@u".
> 
> Ok, using user session keyring is better in my example I can successfully define
> a new symmetric key in order to mount a newly created partition.
> I am not using systemd here, a simple busybox and sysV init.
> 
> However if I get the whole idea, If I use ubiupdatevol to update my partition,
> I need the public key used while signing the ubifs at the first mount time
> and then an other symmetric one ("mysecret" identified as 'ubifs:root' in this
> exemple) in order to keep signing the partition.

Yes. You could do without the symmetric key in a readonly environment.

> 
> This public key is already present (available to the mount command?) but
> I don't have a way to tell which one to use.

You don't have to, the Kernel will pick the right one automatically.

> 
> mount -t ubifs /dev/ubi0_8 -o auth_key=ubifs:root,auth_hash_name=sha256 /mnt/
> mount: mounting /dev/ubi0_8 on /mnt/ failed: Invalid argument
> 
> auth_key is the new symmetric key
> my public key used when creating the offline signature is in /proc/keys
> 
> 3b1ecf1d I------     1 perm 1f030000     0     0 asymmetri Build time
> autogenerated kernel key: a21494c43b8859eceedf1c3d6727fd26f51b1bea:
> X509.rsa f51b1bea []
> 
> I am not sure what I am missing about the first mount of a signed ubifs.

Me neither currently. I could play it through with a current
Linux/mtd-utils tomorrow to see if there's anything not working.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
