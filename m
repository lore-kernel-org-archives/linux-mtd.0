Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08587C369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 18:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6rTW+pzq+4t8Szc4jhPyokVA/HKuDO/njLfnxheOM0=; b=faIeOSUghCbRI8
	2T/2tCbLeGLi4HCY8AftbEaWRdZFACt/smgS8Sr3yduTZs64oYQ7yJoyCPCqcyIbMBYgxm1jXG66O
	L9ZSt1QLC96nIYh2HzKl6nkUStmiWbNpcHY0TNQf3dwfrFwhMypLkDqnhkQ4ePq/KL847W8rDj3fX
	LpN0Gsj1A+f9nG4wt5LoJtWqSXOCBAS2tmXg43OT4jmJs3Ne7EajlARyPfvMX8v6domY2PRJZq8Do
	9n0PSXv5/HV8YtVQKOpQosWxYFQC4bwNaLs2HmuxB26QoqOhpNNRSsM2ND87OmG7b7klDxWs2JzHl
	mn3+kZmIUGh/X7m7+pCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2abX-00000008Eur-3Fcv;
	Wed, 09 Apr 2025 18:56:55 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2abV-00000008EtH-07Qt;
	Wed, 09 Apr 2025 18:56:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-af59c920d32so52968a12.0;
        Wed, 09 Apr 2025 11:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744225012; x=1744829812; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H44gXeIcAME6+J3Fln1VrlgyA4FgneecNdZbE5MtilQ=;
        b=SztAh1C4NCZclmkVnPM0Xq1bIFSS+CsACrctO5+LDqG0wk1hTYU0gvkOQY66dPwuhm
         VCjIWMwGTWEwSTCN3DWnuDtCoiH2VdQ9+27+HJ2HFr/HQsqGzUnySHCpL0L8KD0o7Gvj
         79ZweoWuCJJDtGPgBDqimxSL1gnzxGEPMRwhbE1s6opSQqgRM6YWj7tsWysaHAqersrT
         iWqaKz0zkKlblozA0cSswArK02jSqVbg1MqXhL0jdECs3b3ijS+Y+FRfIBeiLxSSKWH6
         Mu5XYvZXw48YySrsf6oQR4wK8NLCuRtI8Bge8wJP3j+ip7bcPso2Pv7HaEP++O5w3wYe
         bRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744225012; x=1744829812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H44gXeIcAME6+J3Fln1VrlgyA4FgneecNdZbE5MtilQ=;
        b=GKahlZk8z9gJbRV7fm/A6Y00P0QEwtb36G4PJEbwMEtbKWU8qZKMXUapf2Xj6P2vXB
         aoi1uvhMcyhGwa0fttQo7nF/1uwmKrJN7Ds5Q5T0SRIpGEHF1LaZt7TKiuBwYQrN/1Wd
         jsnaK8SsQ2OTAWEvqCAtKUvMDXKpD0TskLllDupa2L4QLWEjtv2a76D5Mtzqi5i0ZY6K
         Hobe2iIP95OW0ebV+iqhQxLeW3bl3ByCSaqgM/soC1SQmtluk9i2kUFRQ0aUuNAiwBeA
         C1GIL24a+TdWlfV41gUTwEaGtTJAlYIHTvXqC6tLtofjXJmsUI1Jnn83D8Sqwt7b+CZY
         iFEg==
X-Forwarded-Encrypted: i=1; AJvYcCUjvXUk0vHqkUpmhQNCV8N3PaPeziFYUi6CkMzDW4/PA8Q+V+w3S5Qu6IQXn39Iq9DDm0CPb7YP9P8B@lists.infradead.org, AJvYcCV7Edh4YjjbCwB8pPDSpr5dWlV7Ejircx4ZLPkzEB590wTX4gzD7jcm7kkSPeFBwmCcSDfF/dbX5sM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaMM91MMMD9tOl1qO1lFVuUKP75J+7tIXR4J2dihGRijDlj3aX
	c4UWG8zp4FO4K1VzOLVugqQoqwYq3SJtglY2+N9j32HACwCSufcr
X-Gm-Gg: ASbGncuxxqfd7qkSjRzp80wgyzxd7L+2Y6kSoT0GZM7aLGx7T6wbhZhV2JuyrmF5KLo
	sCKipIV5Kyc9B8hbbFv+SHt8ftne2oBKqnmXKohSZvfAkjOsD4ei4GZbVPfxoVlbE2dCGWJkT7f
	7Ap5G4l+o4PeaENogRgb7RgpWa86hYv48JRl7taYgbFoVT9d3m9k4n7ksrgq9/QoFmxrb5bLljN
	r8klsahHQIEbmEhhYmakmd/Jh/4ZU0kIt5Yww/zhLJaZ9GDPgoMSOoUk5qEMqCVjXf5M50BTaCr
	9j3lPCq5WLzp3kx00XTjDaoRPAv1Hj0HLR5k5Yw0A8qr2XZtqCt2Ok2rzs3FqpHIQMDdfDbGeky
	adsE=
X-Google-Smtp-Source: AGHT+IEU+9HbHaJYQfODCw2wi9ncyjloO96dCdgihc1EFdOo4Cq2cGK7FSRZJO7xATXKowJYXeayuQ==
X-Received: by 2002:a17:90b:53c8:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30718b83034mr84933a91.20.1744225011817;
        Wed, 09 Apr 2025 11:56:51 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd12b4d5sm2218595a91.25.2025.04.09.11.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:56:51 -0700 (PDT)
Date: Thu, 10 Apr 2025 02:56:41 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
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
Message-ID: <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
 <Z_a_PzmNnvC2z7se@yury>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z_a_PzmNnvC2z7se@yury>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_115653_066061_1126B1E8 
X-CRM114-Status: GOOD (  26.01  )
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

On Wed, Apr 09, 2025 at 02:41:03PM -0400, Yury Norov wrote:
> On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> > On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:
> > > > Refactor parity calculations to use the standard parity_odd() helper.
> > > > This change eliminates redundant implementations.
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >  drivers/media/test-drivers/vivid/vivid-vbi-gen.c | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > index 70a4024d461e..5e1b7b1742e4 100644
> > > > --- a/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > +++ b/drivers/media/test-drivers/vivid/vivid-vbi-gen.c
> > > > @@ -5,6 +5,7 @@
> > > >   * Copyright 2014 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> > > >   */
> > > >  
> > > > +#include <linux/bitops.h>
> > > >  #include <linux/errno.h>
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/ktime.h>
> > > > @@ -165,12 +166,7 @@ static const u8 vivid_cc_sequence2[30] = {
> > > >  
> > > >  static u8 calc_parity(u8 val)
> > > >  {
> > > > -	unsigned i;
> > > > -	unsigned tot = 0;
> > > > -
> > > > -	for (i = 0; i < 7; i++)
> > > > -		tot += (val & (1 << i)) ? 1 : 0;
> > > > -	return val | ((tot & 1) ? 0 : 0x80);
> > > > +	return val | (parity_odd(val) ? 0 : 0x80);
> > > 
> > > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > > simplified just to:
> > >         return parity(val) ? 0 : 0x80;
> > > Or I miss something?
> > >
> > If val == 0x01, the return value of calc_parity() will remain 0x01.
> > If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> > be changed to 0x00.
> 
> Sorry, I meant
>         return val ? 0 : 0x80;
> 
> This 'val | (parity_odd(val)' is only false when val == 0, right?
> When val != 0, compiler will return true immediately, not even calling
> parity().
>
I'm still confused.

Maybe you're interpreting the code as:

	(val | parity(val)) ? 0 : 0x80

But what we're trying to do is:

	val | (parity(val) ? 0 : 0x80)

So, for example, if val == 0x06, the return value will be 0x86.
Only returning 0 or 0x80 seems wrong to me.
Or did I misunderstand something?

Regards,
Kuan-Wei

> I think we need a comment from authors.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
