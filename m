Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737BDC33CB1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 07:55:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 462AA2073A
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 07:55:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlQtpKrQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 462AA2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-ID:MIME-Version:
	Subject:To:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1SDpueRwhJ8cKXJfmHhqgKFL9KexNQ0hH02qhOi4DUY=; b=DlQtpKrQY2HVLM
	/kInruwYYX5h52s5IcgxoNep+RHnono6linChIZFaHyV3n1G/MVThhy3tAygu1sNUl+C35gVYSshA
	A8ftlZNCxjH7As2yZ9ukJFj5OLFNn6L0eB6ywLoQPJ0V+hh/1doZ013GK5j1DxAGQedhEiHhDZbyO
	22iPlH53N64T81pM36Z65/f7XKzBIR3MAlBscWS8w7dAKU2CX6UaxEPPzezPaghsPyTSRj8d1S9UZ
	E1ZuoBQR3qqbn/e3oHO1TEwEdNSbixhYoMuodWCx4g3u0bYP6KzRAMRcQUY1kQvpUxjO4QfcoVBeC
	qs43NR3lg9clo6GLmbHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isMTW-0004tk-Ol; Fri, 17 Jan 2020 07:55:26 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isMTQ-0004ss-7O
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 07:55:25 +0000
Received: from twhfm1p2.macronix.com (twhfm1p2.macronix.com [172.17.20.92])
 by TWHMLLG4.macronix.com with ESMTP id 00H7sWnD089113;
 Fri, 17 Jan 2020 15:54:32 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
Received: from MXML06C.mxic.com.tw (mxml06c.mxic.com.tw [172.17.14.55])
 by Forcepoint Email with ESMTP id 09849F090BB977A1CEE9;
 Fri, 17 Jan 2020 15:54:33 +0800 (CST)
In-Reply-To: <20200109172816.6c1d7be7@xps13>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>	<1571902807-10388-2-git-send-email-masonccyang@mxic.com.tw>
 <20200109172816.6c1d7be7@xps13>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 1/2] mtd: rawnand: Add support for Macronix NAND
 randomizer
MIME-Version: 1.0
X-KeepSent: ECBDB130:03AD44B7-482584F2:002B40F2;
 type=4; name=$KeepSent
X-Mailer: Lotus Notes Release 8.5.3FP4 SHF90 June 10, 2013
Message-ID: <OFECBDB130.03AD44B7-ON482584F2.002B40F2-482584F2.002B720F@mxic.com.tw>
From: masonccyang@mxic.com.tw
Date: Fri, 17 Jan 2020 15:54:33 +0800
X-MIMETrack: Serialize by Router on MXML06C/TAIWAN/MXIC(Release 9.0.1FP10
 HF265|July 25, 2018) at 2020/01/17 PM 03:54:33,
 Serialize complete at 2020/01/17 PM 03:54:33
X-MAIL: TWHMLLG4.macronix.com 00H7sWnD089113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_235520_546469_A45C3590 
X-CRM114-Status: UNSURE (   4.71  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 bbrezillon@kernel.org, juliensu@mxic.com.tw, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

 =

> > +static int macronix_nand_randomizer_check_enable(struct nand_chip =

*chip)
> > +{
> > +   u8 feature[ONFI_SUBFEATURE_PARAM_LEN];
> > +   int ret;
> > +
> > +   ret =3D nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (ret < 0)
> > +      return ret;
> > +
> > +   if (feature[0])
> > +      return feature[0];
> > +
> > +   feature[0] =3D MACRONIX_RANDOMIZER_MODE_ENTER;
> > +   ret =3D nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (ret < 0)
> > +      return ret;
> > +
> > +   /* RANDEN and RANDOPT OTP bits are programmed */
> > +   feature[0] =3D 0x0;
> > +   ret =3D nand_prog_page_op(chip, 0, 0, feature, 1);
> > +   if (ret < 0)
> > +      return ret;
> > +
> > +   ret =3D nand_get_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (ret < 0)
> > +      return ret;
> > +
> > +   feature[0] &=3D MACRONIX_RANDOMIZER_MODE_EXIT;
> > +   ret =3D nand_set_features(chip, ONFI_FEATURE_ADDR_MXIC_RANDOMIZER,
> > +            feature);
> > +   if (ret < 0)
> > +      return ret;
> > +
> > +   return feature[0];
> =

> Can feature[0] be !=3D 0 ? I don't think so, in this case I prefer a:
> return 0;
> =


okay, will fix it.

> > +}
> > +
> >  static void macronix_nand_onfi_init(struct nand_chip *chip)
> >  {
> >     struct nand_parameters *p =3D &chip->parameters;
> >     struct nand_onfi_vendor_macronix *mxic;
> > +   struct device_node *dn =3D nand_get_flash_node(chip);
> > +   int rand_otp =3D 0;
> > +   int ret;
> > =

> >     if (!p->onfi)
> >        return;
> > =

> > +   if (of_find_property(dn, "mxic,enable-randomizer-otp", NULL))
> > +      rand_otp =3D 1;
> > +
> >     mxic =3D (struct nand_onfi_vendor_macronix *)p->onfi->vendor;
> > +   /* Subpage write is prohibited in randomizer operatoin */
> =

>                                        with          operation
> =

> > +   if (rand_otp && chip->options & NAND_NO_SUBPAGE_WRITE &&
> > +       mxic->reliability_func & MACRONIX_RANDOMIZER_BIT) {
> > +      if (p->supports_set_get_features) {
> > +         bitmap_set(p->set_feature_list,
> > +               ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
> > +         bitmap_set(p->get_feature_list,
> > +               ONFI_FEATURE_ADDR_MXIC_RANDOMIZER, 1);
> > +         ret =3D macronix_nand_randomizer_check_enable(chip);
> > +         if (ret < 0)
> > +            pr_info("Macronix NAND randomizer failed\n");
> > +         else
> > +            pr_info("Macronix NAND randomizer enabled\n");
> =

> Maybe we should update the bitmaps only if it succeeds?

okay, will drop pr_info();

> =

> > +      }
> > +   }
> > +
> >     if ((mxic->reliability_func & MACRONIX_READ_RETRY_BIT) =3D=3D 0)
> >        return;
> > =

> =

> With the above fixed,
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> =

> Thanks,
> Miqu=E8l

thanks for your time & comments.
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
