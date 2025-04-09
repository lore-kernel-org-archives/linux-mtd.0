Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5218BC369A1
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 19:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDjBPuUItPHAkEfEV85IOOzaXFH+9HH3tjg7TkIAhKg=; b=3bAOEcy05CG9ZF
	7OgmRP7K8q46QqD6DrNvV+GEpBf6HcstTGLR5+tXK7/yUnEWK6aVVk86mIk8nOsVOVp1BMLTRKmWN
	XHtj08OstY1jy/MBbrxyhuuzPQn3pfsYr+F33c3fmU1D6jf5yVc2QrmBQoupEJGbCyBqqUdY8oXPs
	TauwQk3lqcJ9K+hODH7Dlfn+Mee3LhkibHr+bSlQ3BZL4SSO+GcYziP7hBm85h5Rf4e18wux8Z8j4
	2Q1CN9I0K3rvhhiTgXc7w7DWVXyqpAoWANTmzj66KBbxBntWSTkdeLU8s9l3KWKn5LdYy3p3Fxq1z
	FqqYluR1zl7jWcKjNkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b1G-00000008JDc-3Aws;
	Wed, 09 Apr 2025 19:23:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2b1E-00000008JCy-0X8e;
	Wed, 09 Apr 2025 19:23:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223f4c06e9fso764365ad.1;
        Wed, 09 Apr 2025 12:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744226607; x=1744831407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8RibaRu5VBtVELK4VwEix973B2UxxmX58KGstf9uOmk=;
        b=P7NEOHXSSnqg87kjdYGSK/DxFF8fFQT4QSOd+4VPdfAZm9hLkg+rTzuG+i1rtpuwPi
         xgP9qBwd92933eegp+TgRMk7RRwDfpwPMcIwo/cp64KR0DhS49OffGLjxpxOSjiRqsdk
         MPtYnyqWhwLcJ+nl1OnCiCrFAefq8Om6B9SWWc0fHLGyapvlpbdiqPQNWeS5Z4OZW8Fh
         KLtISPhhOToHuoX0V2thwHNxxTq9oSV4iFucHtFXZiux3k5wqUWsCQR+mswxtSDTcGD9
         vNi/NgBr53ii+aO9HWAaTySem7JM+gJgwIlaNc4nkK7H6KsxuXTxAZ55eqQx23+ITkuY
         NtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226607; x=1744831407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RibaRu5VBtVELK4VwEix973B2UxxmX58KGstf9uOmk=;
        b=b7YcirFQw783qQxdC6FM2df1zX7fq7YRJ56ASHOI3uVk9a2gq0iyXeRaW1hjluot+A
         g7E6RRoUV7GYkepuFy1bIPveSVk6xRAFogRffnuDVo5L74LUSBSnuF++ETiGwLuBljnq
         Xd7c+N49KqcjTHithvRhYsgb1pGli33KL6wCTRgdomVs8Lr1vTpUt3xsVOidcT2V/PJU
         6r9d6g0+1KcKunobkPFsT2rPpB+C5PSK+df6TDd0RKxGeBxAsuKAw/fZFYdkqp13y76q
         A4AfgSRjw75NY8mDC6Y/7gBrd2WmI7UmhE9aJn4CF8zt2LWkheogDyk9ZpSpDANItVoE
         MhmA==
X-Forwarded-Encrypted: i=1; AJvYcCUQtRyAigQj1Li+F75KiTkPKBfGtPlIYBCawk2Xx6vickKmr28dF5xPfNM7tRNqefzFxdzl6Ug6bFNa@lists.infradead.org, AJvYcCXs57Pr1OLJtxlgNHvy4sGzAaaLWDELMwpcpkPqaqNEeyj+q1y1deAA5fo0e3g4YDJiz48SHQclhgI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBPs5jXiuvM0CbxP1FOzORpy3SN289u8N33+NXU+kSSTS+w+0K
	xUcz4zWJP0lj+1WN+6FICQEKDv1YUIWyYKBgEt903hVO5lqqvC9S
X-Gm-Gg: ASbGnctRwp7MgOXikz2DnlNsJGPmzz3rAr7OywuvhY1zeb0uKFEuF3MhKkhyQaFLFHk
	bTmFhwJt2Z2635qq8DWm1qYmJiQXY/3rgiwwGmCeYrJ8nbYvPrrxUMTz1V6HELZaBDG+n4zh3Ag
	FUR5MN777S7h2U5UT/1jCM1GvxRVqd/7sg/vAKvqpyfOtrerioILhbAaebgviyIObE1V8ygtFjU
	+XG9Ddr9KHW0Aacyq13mWSWacNlhDd4gMrjben63OTc95PiCUK9xZp0S/OOszOhB700KEnNiuIM
	AsaQt7+vXJM7OSTWMKzxxXLQ8yyUKdlHlL32zNUP5g==
X-Google-Smtp-Source: AGHT+IFL3XhQxmETFJky3U8LpnPa3gTvoNA7bcU/WI3ailvxU34USadXflyfbHs0+s3uYjppXMMUHw==
X-Received: by 2002:a17:903:90d:b0:224:7a4:b31 with SMTP id d9443c01a7336-22acfe92581mr8187825ad.6.1744226606945;
        Wed, 09 Apr 2025 12:23:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:cff4:8871:54bb:4c97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cbdfe7sm15862175ad.207.2025.04.09.12.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:23:26 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:23:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org, joel@jms.id.au, 
	eajames@linux.ibm.com, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, mchehab@kernel.org, 
	awalls@md.metrocast.net, hverkuil@xs4all.nl, miquel.raynal@bootlin.com, richard@nod.at, 
	vigneshr@ti.com, louis.peens@corigine.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com, johannes@sipsolutions.net, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, yury.norov@gmail.com, 
	akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net, 
	alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com, alistair@popple.id.au, 
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsi@lists.ozlabs.org, dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, oss-drivers@corigine.com, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org, bpf@vger.kernel.org, 
	jserv@ccns.ncku.edu.tw, Frank.Li@nxp.com, linux-hwmon@vger.kernel.org, 
	linux-i3c@lists.infradead.org, david.laight.linux@gmail.com, andrew.cooper3@citrix.com, 
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v4 07/13] Input: joystick - Replace open-coded parity
 calculation with parity_odd()
Message-ID: <mustacwfqzgmrrtxj23apezwp2ieavnmfa4myylvnojnpf2alm@enruxjpzr46i>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-8-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409154356.423512-8-visitorckw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_122328_162424_37335700 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 09, 2025 at 11:43:50PM +0800, Kuan-Wei Chiu wrote:
> Refactor parity calculations to use the standard parity_odd() helper.
> This change eliminates redundant implementations.
> 
> Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
