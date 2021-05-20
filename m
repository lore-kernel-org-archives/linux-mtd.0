Return-Path: <SRS0=TxUZ=KP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D72C433ED
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 10:58:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF2FF610A1
	for <linux-mtd@archiver.kernel.org>; Thu, 20 May 2021 10:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF2FF610A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:Subject:Cc:To:
	References:In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBCnJUnnHpZ9li4mvia/es3uaPQOSwScsJ54Y4NnBRQ=; b=rffiWN/j8bb7WgIHgGF5DC+AqF
	cdzIjmX9hXeZmU4HBMg36VG++VQuP+0fqORYAAtN4buZpVTRVx1hQ6uX7nuJbATUHO9gBm190tWa8
	oavQhDOcdcrA0jLu1wYgST4n1MyGTnKjkm9NAMTmUqHgtAWViPaAq+3MMQ9nNpC8FeXvUTLhWNhVF
	v7dhmodmFcSNKR/S8mzzSbacbnP+WRMY9nEbfpWEuv9MV2nYrYizbsRp5Sfnti1gjrTQZ0g/RtmLp
	+0F3wBXbDPHb+pmKQteejMdFUPz2vO4bywwoxf0mNfOj++vKGvPvtz5/jUoAsduk/9XRJmjzojsV2
	hQcC7dXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljgMm-000I3B-19; Thu, 20 May 2021 10:57:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljgMi-000I25-Jj
 for linux-mtd@desiato.infradead.org; Thu, 20 May 2021 10:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Date:From:Message-ID:MIME-Version:Subject:Cc:To:References:
 In-Reply-To:Sender:Reply-To:Content-ID:Content-Description;
 bh=Xp+HQ3QyUBu82GlxQdMOIW1QjabkLPf7FRAQvZJkDkU=; b=o+8CHlA8ShJqumxJpinVicPMzV
 yT5UhlCS5qX+GLpXNsGton+s2TJP8bLE/A1ia3bVxfx4pcC5P2oeQ27hO+rvtqyPfpikfFtmxnkPZ
 q1wQgxWwurXG8vEE5N+Y8pIrUchvxpapifjrk0b6KBdygO6+/8h/9PZHhECVDP2M45aWw76r4l7gg
 ts9qSqSQPL83RJMOflGz11VEnrWnqQdZEDvwADrey6hC1CXA1p4MJ8R7txypqogmQIV7bqESpXcFe
 mYOtwx2qQOKy3VMGv0lUuh+TtbCXB4Kk56SZpaNVVtd55ReHfu5HU+p+I4NN2RyLzHBknPHHmAUVs
 lJgZPWRg==;
Received: from [122.147.135.201] (helo=TWHMLLG3.macronix.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljgMe-00GCla-3g
 for linux-mtd@lists.infradead.org; Thu, 20 May 2021 10:57:17 +0000
Received: from twhfmlp1.macronix.com (twhfmlp1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id 14KAurMl003795;
 Thu, 20 May 2021 18:56:53 +0800 (GMT-8)
 (envelope-from ycllin@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.macronix.com [172.17.14.55])
 by Forcepoint Email with ESMTP id 8F2DFEB31973D2233DFB;
 Thu, 20 May 2021 18:56:54 +0800 (CST)
In-Reply-To: <20210513084523.41d1cdd6@xps13>
References: <1620697235-7829-1-git-send-email-ycllin@mxic.com.tw>	<20210511105319.0c077fd5@xps13>
 <OFAD6CC9BD.1F0CDB53-ON482586D4.000A51D2-482586D4.000BFF66@mxic.com.tw>
 <20210513084523.41d1cdd6@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: juliensu@mxic.com.tw, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, richard@nod.at,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, vigneshr@ti.com
Subject: Re: [PATCH 0/2] Fix double counting of S/W ECC engines' ECC stat
MIME-Version: 1.0
X-KeepSent: 12EB0BE9:7879DE49-482586DB:0039FC49;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP6 SHF907 April 26, 2018
Message-ID: <OF12EB0BE9.7879DE49-ON482586DB.0039FC49-482586DB.003C2449@mxic.com.tw>
From: ycllin@mxic.com.tw
Date: Thu, 20 May 2021 18:56:54 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2021/05/20 PM 06:56:54,
 Serialize complete at 2021/05/20 PM 06:56:54
X-MAIL: TWHMLLG3.macronix.com 14KAurMl003795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_035716_479485_F5926AEB 
X-CRM114-Status: UNSURE (   3.56  )
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


Hi Miqu=E8l,

> "Miquel Raynal" <miquel.raynal@bootlin.com> =

> Re: [PATCH 0/2] Fix double counting of S/W ECC engines' ECC stat
> =

> Hi YouChing,
> =

> ycllin@mxic.com.tw wrote on Thu, 13 May 2021 10:11:02 +0800:
> =

> > > "Miquel Raynal" <miquel.raynal@bootlin.com> =

> > <deleted>
> > > =

> > > Good catch!
> > > =

> > > However I don't think the current fix is valid because these engines
> > > are meant to be used by the raw NAND core as well, I propose =

something
> > > like the below, can you please tell me if it works as expected? (not
> > > even build tested)
> > > =

> > > Thanks,
> > > Miqu=E8l
> > > =

> > > =

> > <deleted>
> > =

> > Thanks for your work.
> > =

> > I tested the two patches(yours and mine) separately in our =

environment: =

> > 1) MXIC NFC(&raw NAND),2) MXIC SPI host(&SPI-NAND) with S/W BCH =

engine. =

> > Both patches are valid(using nandtest/nandbiterrs, values of ecc_stats =

are =

> > normal).
> > =

> > This seems to be because the function(nand_ecc_sw_bch_finish_io_req() =

> > in ecc-sw-bch.c) that would increase the ecc_stats counter is not used =


> > in the raw NAND world. Am I misunderstanding or is it platform =

dependency?
> =

> I don't think it can be called a platform dependency, it's more like
> legacy from the raw NAND world which makes the use of the generic ECC
> framework hard and thus is limited to a given set of functions.
> =

> > BTW, I think your modification should be more in line with the design =

> > spirit =

> > of generic ECC engine framework.
> =

> Yes, ideally raw NAND should fully comply to this framework but this
> would require a hundred days of work and dozens of available boards to
> test. During the past 20 years people assumed NAND controller and ECC
> engine were a single entity which makes the use of the generic ECC
> framework hard to implemented in the raw NAND. So I decided not to put
> all my energy there in order to first get this framework available to
> SPI-NAND devices.

Thanks for your detailed explanation. =

I agree with your change and it works fine in SPI-NAND world =

(with on-die or S/W ECC engines) and raw NAND world(with S/W ECC engines).

Tested-by: YouChing Lin <ycllin@mxic.com.tw>


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
