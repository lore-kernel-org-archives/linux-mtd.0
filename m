Return-Path: <SRS0=t7GP=TY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DD9C072B5
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2019 07:41:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB573217F9
	for <linux-mtd@archiver.kernel.org>; Fri, 24 May 2019 07:41:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="La89ZMXs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB573217F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1dzUjKdWp3yUqKvaGjuajAD8BM/pFHCCHRFUVF0ipqA=; b=La89ZMXs6L0GRl
	pJ1dZSkOa5Qg7u0hCPQBoTqmpEyOWRZMUNQ22Y9arCx36XZHHj1MiK20z/IkZmIvpBf/LdjFlaXST
	2Ouf5ji8xicmGFc2i+M4Tuv1Lr2nsgZ96u0LrxJrUM/U6SzL73Rpq8cTIiWYsPuezpsLRiAQGR+SQ
	p7pBhWZXfyCt2H4UBmLpVMQ/6juv9LlIbhSaIBXGbcbpyxnayMspT/yD++NN5y0lDSHTG2kJYwUUQ
	UHG8olr8aqdOEhqpdkqrtvINg38RtQ1WOKUPye3PsTjCrbqGiE2spR6EkkwjbYxdfPkTzTNfSpiBZ
	XWvOd2fOQGtQtb9oNMtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hU4pg-0004rQ-O1; Fri, 24 May 2019 07:41:40 +0000
Received: from twhmllg3.macronix.com ([122.147.135.201])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU4pa-0004qy-Fl
 for linux-mtd@lists.infradead.org; Fri, 24 May 2019 07:41:36 +0000
Received: from twhfmlp1.macronix.com (twhfm1p1.macronix.com [172.17.20.91])
 by TWHMLLG3.macronix.com with ESMTP id x4O7euXb008092;
 Fri, 24 May 2019 15:40:56 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 2CB04E329FEC00A82B3B;
 Fri, 24 May 2019 15:40:57 +0800 (CST)
In-Reply-To: <20190521104713.4b3a7769@xps13>
References: <1558076001-29579-1-git-send-email-masonccyang@mxic.com.tw>	<20190520143438.46248bfc@xps13>
 <OFDCB9EA90.C6F8EA4C-ON48258401.000981AF-48258401.000ED713@mxic.com.tw>
 <20190521104713.4b3a7769@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: rawnand: Add Macronix NAND read retry support
MIME-Version: 1.0
X-KeepSent: 2FAE9766:C611328F-48258404:0029BF19;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OF2FAE9766.C611328F-ON48258404.0029BF19-48258404.002A337A@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 24 May 2019 15:40:57 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2019/05/24 PM 03:40:57,
 Serialize complete at 2019/05/24 PM 03:40:57
X-MAIL: TWHMLLG3.macronix.com x4O7euXb008092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_004134_813759_9ACA0FDF 
X-CRM114-Status: UNSURE (   4.13  )
X-CRM114-Notice: Please train this message.
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, frieder.schrempf@kontron.de,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,


> > > =

> > > > +
> > > > +      ret =3D  nand_get_features(chip, feature_addr, feature);
> > > > +      if (ret || feature[0] !=3D mode)
> > > > +         pr_err("Failed to verify read retry moded:%d(%d)\n",
> > > > +                mode, feature[0]); =

> > > =

> > > if ret =3D=3D 0 but feature[0] !=3D mode, shouldn't you return an err=
or? =

> > =

> > okay, will fix.
> > =

> > > =

> > > > +   }
> > > > +
> > > > +   return ret; =

> > > =

> > > This will produce a Warning at compile time (ret may be used
> > > uninitialized). Have you tested it? =

> > =

> > Tool chain I used is "gcc-arm-linux-gnueabi" and no Warning at compile =


> > time.
> =

> What's the output of:
> gcc-arm-linux-gnueabi -v
> ?
> =


Oops, it's gcc 4.8.3 20131111 and kind of obsolete.
That's why no Warning at compile time.

> > =

> > Patch it to:
> > =

---------------------------------------------------------------------------=
--> =

 =

> >  static int macronix_nand_setup_read_retry(struct nand_chip *chip, int =


> > mode)
> >  {
> >          u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
> >          int ret, feature_addr =3D ONFI_FEATURE_ADDR_READ_RETRY;
> > =

> >          if (chip->parameters.supports_set_get_features &&
> >              test_bit(feature_addr, chip->parameters.set_feature_list) =

&&
> >              test_bit(feature_addr, =

chip->parameters.get_feature_list)) {
> > =

> >                  feature[0] =3D mode;
> >                  ret =3D  nand_set_features(chip, feature_addr, =

feature);
> =

>                          ^ extra space, please be careful with the
>                          typos, and run checkpatch.pl --strict before
>                          sending patches.
> =

> >                  if (ret) {
> >                          pr_err("Failed to set read retry moded:%d\n", =


> > mode);
> >                          goto err_out;
> >                  }
> > =

> >                  ret =3D  nand_get_features(chip, feature_addr, =

feature);
> >                  if (ret) {
> >                          pr_err("Failed to get read retry moded:%d\n", =


> > mode);
> >                          goto err_out;
> >                  } else if (feature[0] !=3D mode) {
> >                          pr_err("Failed to verify read retry =

> > moded:%d(%d)\n",
> >                                  mode, feature[0]);
> >                          return -EIO;
> =

> That's not what I meant. You can keep the former condition but if !ret
> then ret =3D -EIO for instance.
> =

> >                  }
> >          }
> > =

> >  err_out:
> >          return ret;
> =

> Again, do not jump to a single return call, directly do the return from
> the point where you want to quit the function.
> =

> The problem should be that ret may be used uninitialized, the compiler
> should tell you that.

got it and thanks for your review.

> =

> Thanks,
> Miqu=E8l

best regards,
Mason

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
