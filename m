Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D270C369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 18:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRTDi1p6zq/6Cw/2W731drNXxLiNl6kxoyR1i9pIG+Q=; b=lAiJpfRoeQQYoF
	j3Pg4fkrBX2/7LxdJzTsmJt9Wa8u42H/2naTQLwHTaasANicYNtfBAQCywsZG0uKp6AqkFZibbqmX
	8Q1pJEDnpF7H+0daacAyJo89GBQSxiavVCATDpkKA2slEHFTXKvguqVD9uahrqF7jKoFPTMbOLpor
	B44zJxCvAn5m7DWP719HeRCh6BMOOOFG4s6REYHfjR++41LG2XtdW5fdU5Pg1RFmdEgNIxpjhuT4h
	vNUxsTTpmRDyi1kddsVhuKSevx8fLeZvFP0c2g4bDLHGHDdTvxen+xsGSxHYfHCKMY27cGA3rN8nn
	hPCN+X6n+ZwKMtBRAwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aMH-00000008Cuh-11CJ;
	Wed, 09 Apr 2025 18:41:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2aMF-00000008Ctm-1FGZ;
	Wed, 09 Apr 2025 18:41:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-736c1138ae5so7076264b3a.3;
        Wed, 09 Apr 2025 11:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744224066; x=1744828866; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y9MRs+OpXV0ogJQHvE9axw548ilRfDN2nGQrTik2VzY=;
        b=WsHSMPFydf4vovqatt2TKLxFRSrlThRd28LcdJD/ZaWQUpCNP2cRDsJk1oR91Xi5mJ
         RDSs/LvEl6wy6IsBD4ZoWopdmJ1WnLtBy3hfAmMvbRLooB1N3Qs6rv952h+fmyGRV6m6
         /8xZVRe3bySpo8tNSV7Enon3jBkTbP8MgJa9+HnbDkTfSZZmBHHrbl+u0rLdCg2PXIAi
         yCKC5ItCiGO0yzZoBiZdUBvJ6ab/fMqqOVYy7mZtYnz5AA9zlMrFxnwWwQuvru1GVLob
         K4bIGJVM+yvCutGl7nD517RZhpuMqKSDYsCElNJVg7h8CLGrUzqd+PKSCjS6d/j/AvbC
         C7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224066; x=1744828866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9MRs+OpXV0ogJQHvE9axw548ilRfDN2nGQrTik2VzY=;
        b=Kb0PGH381qFIRZq9JHLg6XTkLxqMncNxL7+0wAZtrWTkIgicZ8i4VAco24Oj8XLc7/
         KbNXc0ZZ27D9nRRRKU6ecFV6e4Opl0gDWObQSYxR3sSLaOAWda45424N24YA81Kj+Z4T
         3hWSafFiYkKOQBTkaRStzVBRJNHjuKmhvq9EZYxQSc8yJ+XMpSK2cXI9tYJlCUYzg1eu
         8b6C9Rx6H/Sr6Kuefr3zNdk55LWOzmMXsrr+R/91wbl/H5J+tjNRDn6wpeBqppTMr21v
         k9qaWfVN099o6u5D0dmRI8xQrS+wrldgS4QttwcpBYcprPoP/mOLPXWwj2lSo7OgjwYX
         D3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkU9BceTtBqFpwSNOKa7dvMo54VtENGNr/vwBhxvByH5937EDxx+NhC4JQokff9a/Qic+LLp4kl6xt@lists.infradead.org, AJvYcCVr9dt3uivZli41+ipFRB2cPQQ/CcPWHPX+cojfcY2MkN9rMHUELorr4fuiiPwpw0CiLu0b4ESPSXQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfs5DnOmp60+TK7G7XD4aIPZqUgHlhoAgso3EBdKzeQ24SvLVf
	fbTOiPqpGHR3H5Mftnd3yG2p5e/SNibNsCts/cv8E0LtMCuiGi/k
X-Gm-Gg: ASbGncuw3efBe9sPLRlyjwIlUvJFkuD3G6C9ZkqOOHAMnvPxM5wJnrYLIHFWayfXpOT
	jIshGXNR8/KWak2o6N2N2nZi24U5DCIFJUDQuBGdSFXwofoJdQgEH3m03cg8Z7M8f+gAEp06TXl
	npHTNTKU4NwC13YM49jpdaFsjGbSq6ORDW4SZ6wUXHVA4QN5JuifLdDv+9glH4ylnRqLSlL8c8a
	X7jD22YY8fJgCsJO/z0dkaVH7FPZfbkWfHGfxY6zCUpEM3DZ0+r+3OQ7VfYLj3WjgF7ty2sLofg
	q66pVySo2rHQ6QwB2c0f7AZFJHOOn89P8yi7fSoY0pcSPTQxlnc=
X-Google-Smtp-Source: AGHT+IFBplIB7lbzzonBtacivuTbdfAuDOBFrLzj0CEeoRBndpxGhIacjgtf4O10nP956h0EjBOoEg==
X-Received: by 2002:a05:6a00:22c2:b0:736:5545:5b84 with SMTP id d2e1a72fcca58-73bafbbae8dmr4546648b3a.3.1744224066191;
        Wed, 09 Apr 2025 11:41:06 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e4f768sm1739807b3a.142.2025.04.09.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:41:05 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:41:03 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
	joel@jms.id.au, eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, akpm@linux-foundation.org, jdelvare@suse.com,
	linux@roeck-us.net, alexandre.belloni@bootlin.com, pgaj@cadence.com,
	hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	david.laight.linux@gmail.com, andrew.cooper3@citrix.com,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 02/13] media: media/test_drivers: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z_a_PzmNnvC2z7se@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_114107_334998_8678CDA6 
X-CRM114-Status: GOOD (  22.57  )
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

On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > > Refactor parity calculations to use the standard parity_odd() helper.
> > > This change eliminates redundant implementations.
> > > 
> > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > ---
> > >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > index 70a4024d461e..5e1b7b1742e4 100644
> > > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > @@ -5,6 +5,7 @@
> > >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > >   */
> > >  
> > > +#include <linux/bitops.h>
> > >  #include <linux/errno.h>
> > >  #include <linux/kernel.h>
> > >  #include <linux/ktime.h>
> > > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> > >  
> > >  static u8 calc_parity(u8 val)
> > >  {
> > > -	unsigned i;
> > > -	unsigned tot = 0;
> > > -
> > > -	for (i = 0; i < 7; i++)
> > > -		tot += (val & (1 << i)) ? 1 : 0;
> > > -	return val | ((tot & 1) ? 0 : 0x80);
> > > +	return val | (parity_odd(val) ? 0 : 0x80);
> > 
> > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > simplified just to:
> >         return parity(val) ? 0 : 0x80;
> > Or I miss something?
> >
> If val == 0x01, the return value of calc_parity() will remain 0x01.
> If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> be changed to 0x00.

Sorry, I meant
        return val ? 0 : 0x80;

This 'val | (parity_odd(val)' is only false when val == 0, right?
When val != 0, compiler will return true immediately, not even calling
parity().

I think we need a comment from authors.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
