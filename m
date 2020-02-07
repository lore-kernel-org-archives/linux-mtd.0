Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBEDC04EB5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 15:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EADE214AF
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 15:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hekOLHhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EADE214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a9mXRAdz0g2XL7ZFGGAu06PIM3h26hybF97FMbaylDE=; b=hekOLHhLtwamQ/
	fNf5XpfWnXlB2aWLAC3IP/XDou3/lQsI8+qiycgQfKCbwy6QqkN4qPtQQxAHtLuZBA3VmXWBiGayW
	Hz9TfeEe8RneTfPonsO/AFukQRy9n82XOTPnp3Q46BtWytzVAj9O+pwH9wzG6RGTbnNcqwGZb2Kt1
	6rkv5/daOivY5f+Td0+YAVTxnsXYVnEBmv5OdFwHqb9TQ8Vr1jus6+ZG2wQZyPB3JMUBU9Hx/Bkmo
	8dHzB6mz2vzmjR8sFDkPcD7Xv4uHGnfM+DP+VSLZrBvAIDbTOF/scPtPf7MAIhDRW0tUNXGsaSVFB
	ibkwyLPYoahYYHbgcFbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j05up-0001Xb-N2; Fri, 07 Feb 2020 15:51:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j05un-0001Wr-68
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 15:51:34 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1j05uk-0008Kt-15; Fri, 07 Feb 2020 16:51:30 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1j05uj-00043p-2B; Fri, 07 Feb 2020 16:51:29 +0100
Date: Fri, 7 Feb 2020 16:51:29 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Kevin Raymond <kr@shaiton.org>
Subject: Re: [PATCH 0/2] mtd-utils: mkfs.ubifs: Add signing support for UBIFS
 images
Message-ID: <20200207155128.ouow363tvbg2whqk@pengutronix.de>
References: <20190806104928.1224-1-s.hauer@pengutronix.de>
 <CAPwc7DMK7RKDUW4Kx4eKVXVJ7y9pmYwCBA+OevN_RdrJvhXb3g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPwc7DMK7RKDUW4Kx4eKVXVJ7y9pmYwCBA+OevN_RdrJvhXb3g@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 16:35:40 up 214 days, 21:45, 93 users,  load average: 0.75, 0.37,
 0.32
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_075133_235156_D13C4F65 
X-CRM114-Status: GOOD (  18.60  )
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

Hi Kevin,

On Fri, Feb 07, 2020 at 04:25:58PM +0100, Kevin Raymond wrote:
> Hi there,
> 
> I am testing ubifs authentication for my new board, however I can't
> git it to work.
> I am not able to have keyctl add my key to the kernel keyring.
> 
> This is by far the most easier documentation I found about ubifs authentication.
> 
> I've got my kernel generating the asymmetric key, I can do the offline
> signing with mkfs.ubifs but am not able to mount the ubifs partition.
> I always get the following error:
>     mount: mounting /dev/ubi0_8 on /mnt failed: Required key not available
> 
> I am really not sure about the "keyctl add" part.
> From the Sascha example, should we change 'mysecret' by
> 'signing_key.pem' ? Should we change its format?

There are two different keys involved. One is an asymmetric
private/public key pair needed for authenticating offline signed images.
That's the one you compile the Kernel with and which you provide to
mkfs.ubifs. This key is only used during first mount.

The other one is a symmetric key which is used during runtime and that's
the one you add with:

cat mysecret | keyctl padd logon ubifs:root @s

Note that "cat mysecret" is only an example. It obviously doesn't help
authenticating having a key stored world readable on the device. The
i.MX6 offers ways to generate secrets with the CAAM unit. However,
for testing purposes some "echo foobarbaz | keyctl padd logon ubifs:root
@s" does it.

You are trying offline signed images, but maybe you should start without
an image and do runtime authentication only. For this create an empty
UBI volume and just mount it like this (after doing the keyctl padd as
above):

mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=sha256,auth_key=ubifs:root

I am not sure if the kernel can read the key if you put it into the
session keyring. Systemd for example influences this and I don't know
exactly how. You might have to replace "@s" with "@u".

Hope that helps.

Regards
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
