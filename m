Return-Path: <SRS0=otIu=KI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9572CC433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 13 May 2021 02:12:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D4C61108
	for <linux-mtd@archiver.kernel.org>; Thu, 13 May 2021 02:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D4C61108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:Cc:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9tMQAXQUCjQqbSx+fvKaQOYKqhoHbrdoYWauLj/E904=; b=cP6ojk0LjAS+REWCul9aeFUZD
	3ht9GPzulFCl0QLq155SHgFAjnJjlWutzP/CCB2UNJDYS6jHQkcru2Ajb+YIzyq2Znjxs/QQRG8X/
	+qcK5/JwNDEMwnoMlSQmOh3uva9rgxJAPiBD9x10kaQVNPcZGDE9Uct6dEAQT94gaYvRVH09V3OlH
	hR5QDwcD96uHCSprROXg+g/BOkhZwwZ2Q4QBoiCzU8N6+a9fAu7oZsvPPWeH2MGKYa10qSgb3NUeO
	bbARyXFGgzmvus1T97lhLpoHLxBkfeML0DPRJabBkJQa4PCYIWOd0h631rbuRKaWpobudu8xZzgOA
	TWwD/AWrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh0p0-004SmY-FQ; Thu, 13 May 2021 02:11:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0ox-004SmD-DV
 for linux-mtd@desiato.infradead.org; Thu, 13 May 2021 02:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Date:From:Message-ID:MIME-Version:Subject:Cc:To:References:
 In-Reply-To:Sender:Reply-To:Content-ID:Content-Description;
 bh=bZs6h0J+I/mrKZ0U8NQrj2fn2ppkCk/5PWw5ubfYTGM=; b=ngF7ur8Yt6+8DeNIyOX5B8X4QH
 jb1la0qI7auA1ourC2jXRZpktPfU50iEVv1c9jAt5bgtmqSIEfdBXUUyMRV5lArwL5MOeddPp50hd
 +Q6QNuFXpuP1qyZdPL/HAsoVfRsRsdjKSXh6ruXDxbbDO/hVtv3qG50tGjZVnmAYxRSZcIsGPMMSN
 m5wyAwPi1uVejX9rqkR7JIHBtN54/xy5MzPceX0i2qHmY8wDyQvMUjKJYTbIoQALivZcjPZeHts4Z
 w97Te3B2b6qoBLcjIUa8S5R8T9oAgSjUcUzOQwMdsmEoyjolHvtu11lLsGXjbO0+EJgJUdYx0+7XV
 ex72hL/w==;
Received: from twhmllg4.macronix.com ([211.75.127.132])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0ot-00Axz9-7m
 for linux-mtd@lists.infradead.org; Thu, 13 May 2021 02:11:24 +0000
Received: from twhfm1p2.macronix.com (twhfmlp2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 14D2B2YG014974;
 Thu, 13 May 2021 10:11:02 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id E8A4283D3192A84A1029;
 Thu, 13 May 2021 10:11:02 +0800 (CST)
In-Reply-To: <20210511105319.0c077fd5@xps13>
References: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>
 <20210511105319.0c077fd5@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH 0/2] Fix double counting of S/W ECC engines' ECC stat
MIME-Version: 1.0
X-KeepSent: AD6CC9BD:1F0CDB53-482586D4:000A51D2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OFAD6CC9BD.1F0CDB53-ON482586D4.000A51D2-482586D4.000BFF66@mxic.com.tw>
From: ycllin@mxic.com.tw
Date: Thu, 13 May 2021 10:11:02 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/05/13 AM 10:11:02,
 Serialize complete at 2021/05/13 AM 10:11:02
X-MAIL: TWHMLLG4.macronix.com 14D2B2YG014974
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_191123_570930_0BD4D50C 
X-CRM114-Status: UNSURE (   3.18  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


> "Miquel Raynal" <miquel.raynal@bootlin.com> =

<deleted>
> =

> Good catch!
> =

> However I don't think the current fix is valid because these engines
> are meant to be used by the raw NAND core as well, I propose something
> like the below, can you please tell me if it works as expected? (not
> even build tested)
> =

> Thanks,
> Miqu=E8l
> =

> =

<deleted>

Thanks for your work.

I tested the two patches(yours and mine) separately in our environment: =

1) MXIC NFC(&raw NAND),2) MXIC SPI host(&SPI-NAND) with S/W BCH engine. =

Both patches are valid(using nandtest/nandbiterrs, values of ecc_stats are =

normal).

This seems to be because the function(nand_ecc_sw_bch_finish_io_req() =

in ecc-sw-bch.c) that would increase the ecc_stats counter is not used =

in the raw NAND world. Am I misunderstanding or is it platform dependency?

BTW, I think your modification should be more in line with the design =

spirit =

of generic ECC engine framework.

Thanks,
YouChing

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information =

and/or personal data, which is protected by applicable laws. Please be =

reminded that duplication, disclosure, distribution, or use of this e-mail =

(and/or its attachments) or any part thereof is prohibited. If you receive =

this e-mail in error, please notify us immediately and delete this mail as =

well as its attachment(s) from your system. In addition, please be =

informed that collection, processing, and/or use of personal data is =

prohibited unless expressly permitted by personal data protection laws. =

Thank you for your attention and cooperation.

Macronix International Co., Ltd.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

CONFIDENTIALITY NOTE:

This e-mail and any attachments may contain confidential information and/or=
 personal data, which is protected by applicable laws. Please be reminded t=
hat duplication, disclosure, distribution, or use of this e-mail (and/or it=
s attachments) or any part thereof is prohibited. If you receive this e-mai=
l in error, please notify us immediately and delete this mail as well as it=
s attachment(s) from your system. In addition, please be informed that coll=
ection, processing, and/or use of personal data is prohibited unless expres=
sly permitted by personal data protection laws. Thank you for your attentio=
n and cooperation.

Macronix International Co., Ltd.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
