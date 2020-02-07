Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B7BC04EB5
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 15:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07E8422314
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 15:26:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NS9om9BQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07E8422314
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shaiton.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ll9AzFSfCG0ydGGtpfHAdjQnjjP18pCLuF4eq8gOA8=; b=NS9om9BQS46AzK
	xtPIGVe1qRjTAbMxBx2W4I8Asx63WWdMlWfEVts2WK+DmRf8Wo86x0/TaqsGQXaKGzxUquLf78Zpk
	MqmcDsQfBEiwcsuk/GzQTOpcXvbUJVyw898A7ILQvYnKSdmlNebqOC14p34qECCedIgJplW7erkqi
	vKnLPFomcFbt3d0csLb2zWme5lrzqe1WyR+2y4q3njVkxQxSU2HeuQE5A2w2h0wvgSfumk0Nd/yh3
	Ki6uwBNhO4CEkXzgyOKpL0oRGOODBbOspxuvlDi7wYkjxCnpcYNH80MeH2x3Flg4e8WCruHmP5FuX
	w+UNv3OJflz9gOPYIXgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j05We-00013A-CV; Fri, 07 Feb 2020 15:26:36 +0000
Received: from 3.mo2.mail-out.ovh.net ([46.105.58.226])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j05WZ-00011a-Np
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 15:26:34 +0000
Received: from player157.ha.ovh.net (unknown [10.108.42.66])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id 1B97D1C941A
 for <linux-mtd@lists.infradead.org>; Fri,  7 Feb 2020 16:26:12 +0100 (CET)
Received: from shaiton.org (mail-vk1-f169.google.com [209.85.221.169])
 (Authenticated sender: postmaster@shaiton.org)
 by player157.ha.ovh.net (Postfix) with ESMTPSA id 71843F22A2AF
 for <linux-mtd@lists.infradead.org>; Fri,  7 Feb 2020 15:26:10 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id c129so690175vkh.7
 for <linux-mtd@lists.infradead.org>; Fri, 07 Feb 2020 07:26:10 -0800 (PST)
X-Gm-Message-State: APjAAAVWMzFV+3DR1ixnSR1a1PSkdu1buF85pN9xJ0nZigwx147l9hSL
 JVB2L0ICMquIDZmf+X09TItah0GJKPVHj5Kn4uU=
X-Google-Smtp-Source: APXvYqzerBI3iKKwKdjxIZv8oU2wvS8VWe68gJZEhs4bxXbfkcmX1onp7aqqEoviimWyvo3yOkDjvXjiDxDN732zZu8=
X-Received: by 2002:a05:6122:48c:: with SMTP id
 o12mr4934878vkn.35.1581089169654; 
 Fri, 07 Feb 2020 07:26:09 -0800 (PST)
MIME-Version: 1.0
References: <20190806104928.1224-1-s.hauer@pengutronix.de>
In-Reply-To: <20190806104928.1224-1-s.hauer@pengutronix.de>
From: Kevin Raymond <kr@shaiton.org>
Date: Fri, 7 Feb 2020 16:25:58 +0100
X-Gmail-Original-Message-ID: <CAPwc7DMK7RKDUW4Kx4eKVXVJ7y9pmYwCBA+OevN_RdrJvhXb3g@mail.gmail.com>
Message-ID: <CAPwc7DMK7RKDUW4Kx4eKVXVJ7y9pmYwCBA+OevN_RdrJvhXb3g@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd-utils: mkfs.ubifs: Add signing support for UBIFS
 images
To: linux-mtd@lists.infradead.org
X-Ovh-Tracer-Id: 9337087928441219507
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheehgdejiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfhgjhfffkffuvfgtsehttdertddttdejnecuhfhrohhmpefmvghvihhnucftrgihmhhonhguuceokhhrsehshhgrihhtohhnrdhorhhgqeenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkpheptddrtddrtddrtddpvddtledrkeehrddvvddurdduieelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehkrhesshhhrghithhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_072631_923684_A6374C65 
X-CRM114-Status: GOOD (  21.92  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 david.oberhollenzer@sigma-star.at
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi there,

I am testing ubifs authentication for my new board, however I can't
git it to work.
I am not able to have keyctl add my key to the kernel keyring.

This is by far the most easier documentation I found about ubifs authentication.

I've got my kernel generating the asymmetric key, I can do the offline
signing with mkfs.ubifs but am not able to mount the ubifs partition.
I always get the following error:
    mount: mounting /dev/ubi0_8 on /mnt failed: Required key not available

I am really not sure about the "keyctl add" part.
From the Sascha example, should we change 'mysecret' by
'signing_key.pem' ? Should we change its format?
keyctl return me an identifier who does not appear to exist.
I don't have any new entry with the keyctl show command.

I am using Linux kernel 5.4.18, and mtd-utils from master (revision
95633c4dfe9).

I have the x509 certificate entry in /proc/keys (as asymmetri Build
time autogenerated kernel key)

My kernel config has the following entries:
CONFIG_UBIFS_FS_AUTHENTICATION=y
CONFIG_CRYPTO_AUTHENC=m
CONFIG_KEYS=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_SHA256=y
CONFIG_MODULE_SIG_HASH="sha256"
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"

Thanks for your help, I am not sure if ubifs authentication is widely used yet.




On Tue, Aug 6, 2019 at 12:49 PM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> This series adds the userspace part to mkfs.ubifs to generate signed UBIFS
> images. With this a UBIFS image can be cryptographically signed in PKCS
> #7 CMS format which is then authenticated in the Kernel before mounting
> it. The necessary Kernel bits have been merged with 817aa094842d
> ("ubifs: support offline signed images").
>
> Here is a quick walkthrough for generating and mounting a signed UBIFS image
> using the kernel provided keys used for module signing:
>
> - configure kernel with CONFIG_UBIFS_FS_AUTHENTICATION, CONFIG_MODULE_SIG and
>   CONFIG_INTEGRITY_ASYMMETRIC_KEYS enabled (assumed to be in ~/linux/ in
>   this example)
> - build kernel, ~/linux/certs/signing_key.x509 and ~/linux/certs/signing_key.pem
>   will be generated
> - generate ubifs image:
>
>   mkfs.ubifs --hash-algo=sha256 --auth-cert=~/linux/certs/signing_key.x509 \
>         -d root -e  126976 -o ~/signed.ubifs -c 1024 -m 2048 \
>         --auth-key=~/linux/certs/signing_key.pem
>
> - flash UBIFS image onto target and mount:
>
>   ubimkvol -N root -s 64MiB /dev/ubi0
>   ubiupdatevol /dev/ubi0_0 signed.ubifs
>   cat mysecret | keyctl padd logon ubifs:root @s
>   mount -t ubifs /dev/ubi0_0 /mnt/ -o auth_hash_name=sha256,auth_key=ubifs:root
>
>
> Sascha Hauer (2):
>   ubifs-media: Update to Linux-5.3-rc3
>   mkfs.ubifs: Add authentication support
>
>  include/mtd/ubifs-media.h           |  75 ++++-
>  ubifs-utils/Makemodule.am           |   3 +-
>  ubifs-utils/mkfs.ubifs/lpt.c        |  12 +
>  ubifs-utils/mkfs.ubifs/mkfs.ubifs.c | 172 +++++++++---
>  ubifs-utils/mkfs.ubifs/mkfs.ubifs.h |   1 +
>  ubifs-utils/mkfs.ubifs/sign.c       | 409 ++++++++++++++++++++++++++++
>  ubifs-utils/mkfs.ubifs/sign.h       |  80 ++++++
>  ubifs-utils/mkfs.ubifs/ubifs.h      |  22 +-
>  8 files changed, 730 insertions(+), 44 deletions(-)
>  create mode 100644 ubifs-utils/mkfs.ubifs/sign.c
>  create mode 100644 ubifs-utils/mkfs.ubifs/sign.h
>
> --
> 2.20.1
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
