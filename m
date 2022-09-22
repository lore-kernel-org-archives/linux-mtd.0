Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0855DC6FA82
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 15:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bYP93f6J4i+1gOMAkrRSreG/kM3/teAFCiy0LEmE5ew=; b=DS/9Y1drvAhr9L
	Czxfyjy9qdprrBl9z3A5TNb1HgOAf3L85F/+Fsf8pL333nzopppSfNWAoPrL6zFv7mdvfcXuxzoFD
	iTh8B4daAUUl5i889JJXZX1Twv7FTGZtVV3+g+et0JoXrzrra0DyXs6/akN0/1cDzrQMa9+r/M8pm
	oZyfkYQ/S9+a3pFt/dilycnDYpIHBsQKFd+DcAzPua5mfVafQUsrqfYPMnJNJSh4BRJ0ZGuRPR9Ge
	svaXNLQmvNuxErU4i6F27ynkm64boIsoVpswUhE19lGfbDkHUzFLYU9mdtfD6k5eZdXvr+/Nfkioy
	IWkLs73QJnWZG9Yyh32Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOYz-00GZc8-M9; Thu, 22 Sep 2022 15:56:33 +0000
Received: from mail.z3ntu.xyz ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOYx-00GZYn-77
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 15:56:32 +0000
Received: from g550jk.localnet (212095005231.public.telering.at [212.95.5.231])
	by mail.z3ntu.xyz (Postfix) with ESMTPSA id D693FC70AA;
	Thu, 22 Sep 2022 15:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
	t=1663862152; bh=L4u42A2MdIb6IOpiw4kgQECCBrdDUIe5QgeQlZVIk1I=;
	h=From:To:Cc:Subject:Date;
	b=MeNv0kPE4jXr4Q/6wQHA9ZoexlAczUU/N1ZdE0cIEEpbqTR4CkTces7kzNe69a8lE
	 vLohaORwCkVwcNkySa/utpCqXof2JtJ64NmhG0hjC9Mu/DyfPsaSi8DFQFxPr8qjlU
	 AZDuXlnY60oiWIi7jPyHQx0xzpnhABFayO9o4XSY=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-arm-msm@vger.kernel.org
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: Boot fail with UBIFS_FS=y on Qualcomm msm8974/msm8226
Date: Thu, 22 Sep 2022 17:55:51 +0200
Message-ID: <2845511.e9J7NaK4W3@g550jk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_085631_470101_F98980CD 
X-CRM114-Status: GOOD (  10.37  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hey all,

sometime last year (June 2021?) I first noticed that with arm32 qcom_defconfig 
under some circumstances I get weird boot failures on msm8974-fairphone-fp2, 
and lately also seeing similar with apq8026-lg-lenok.

In short, with CONFIG_UBIFS_FS=y there's nothing from serial console, nothing 
from earlycon, just nothing on serial at all. As soon as I disable this config 
option and rebuild it boots up fine again.

At some point I also got this from fp2 logs, after I changed something in the 
boot procedure (maybe fastboot boot instead of fastboot flash? I don't recall)

> Error: invalid dtb and unrecognized/unsupported machine ID
>   r1=0x00000000, r2=0x00000000
> Available machine support:
> 
> ID (hex)        NAME
> ffffffff        Generic DT based system
> 
> Please check your kernel config and/or bootloader.

With CONFIG_UBIFS_FS=m and loading the module at runtime seems to work fine (at 
least nothing visibly broke) although I didn't try mounting anything with that 
file system.

Does anyone maybe have an idea what might cause this and/or how to debug this? 
While just disabling UBIFS_FS in my config solves the issue I feel like this 
should be resolved, because I also sometimes forget that I have to disable 
this from qcom_defconfig and then wonder why my boards aren't booting.

Regards
Luca



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
