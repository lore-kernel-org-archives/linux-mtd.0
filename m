Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96691C3601E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hu85aSBUr2ACKIR7zAoxCK8WUAeMsGxwhmzmD6LMsLA=; b=drVbuIceV3Y2hh
	20trlQOF0vggxOD55UOG38H385cUw1QH8KcvJrevPanS5d9I0YoEbMKR7FLCUQ/BUUT8aBcFA0cks
	+21KWGqoab7UIqp+njXlgia8PC5n8dGKsfmOeOvLa4/sK/S4e8qqGFxpCz8wUGEiEn75lzFj31vXK
	eKRnybMrIWlBDcxwHfkGlhUXzhSYpRMrETeG8zXeW7G3aJyphTShH+npZzMfPBeNZ+Qt2DpDjrNcK
	psOhm1k/L1dAPHni6zCkBGG2CusxBKD3+KnJIl8bbt20gVas97/5qWRPa+0OyLy2g6B9Hj+IAKRwb
	Xlotvrxm3qPdEooh7GMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2uIE-0000000B6nV-1biL;
	Thu, 10 Apr 2025 15:58:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tV7-0000000AxNs-45WG;
	Thu, 10 Apr 2025 15:07:35 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-739525d4e12so883193b3a.3;
        Thu, 10 Apr 2025 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744297653; x=1744902453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3D5EegHjNXWtRqs7oVUZyDcWwG0k9rfQtFHn9dOK4Lo=;
        b=OS2smRRs4N6oY2G7T+jjX233pyK8J37166ymLgQC3SoT5its8/SYtbkwe3ne1FXjDw
         XXDp7DffeqHcdIwSfRT1+A+q65hY9Kmd3jJL/NL8MPxTdm6QtXtINEMzmm+qTvuE+NJq
         3ZJ7s/ckLRHDBla0cJ+1s8QRP7hpHyTmlypWnAvLpKP3UWqQc7ePaJkeWKGu6pVxl/lL
         YQIEafNlzL/5Gu8nTyEA/ka1HRASNsK6nrc504xl87bWRve2+6s1CwKBJniaDSvVCo0F
         vBygLSf5zzGXK4vY1sUVbevb0KS1P85oJjDD+nz2jngZt1gZoBG26ni4Mxqq3DHyQOul
         tbUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744297653; x=1744902453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D5EegHjNXWtRqs7oVUZyDcWwG0k9rfQtFHn9dOK4Lo=;
        b=nJcbCFQrK0I5a3t0mqGqFMwB7tnWlmiurFnEk4LlDeefEYfbZB91/Ex7I2Q9QoPNBm
         k5sJaLwx2Xn5aBXCBh1RqzK58e4a/bRuNU6+HhGwue70Qgk0IPsSC0dFWxkke2cK1Lrc
         LVPrcs8BcRWP+ho0aIUH2Umz3N50/ZczS7ICpBXGUQ3Iir8Q7xR5vKqT76lPE/8v5DGL
         JqFe3acUEkSIIkwboK1QAQHY+WiXExkOnE4iUnf22jCcG3ZnBcItX7NuyQwR8AHOU5oS
         SIQuGPjj3/5iVPQ3W97FzVANGkUVEd+9CXiZUwyRdgqb/LuFh++kzioevpONmxjjl78I
         IF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3xk3vAMv1HeGYXHRCgN0LOgs/3Rh4N9/sfxqNw7d3a1suDqYxS2TZsuxTzWw/S3SgQEK6VRxKJpM=@lists.infradead.org, AJvYcCWWOW0BCEp+Y3JKKy4RdmEEUhtchwCP7juwVh7YwTLLDdprXcxdWdfmJISihD0ABOaxMCXeMBBPtfIt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyia9EXT5mbMzOwwYPg+xKJMKPJAX3/gjonyRp++ijEcyztNm6s
	l1xtkr2Hhb8g7xUpDL1ZfB5Fm6ob9kgrpZ0f+odwzLXXtyln265K
X-Gm-Gg: ASbGncvNOQTtTzBOLU4Y+J1AztQ31NPKfhUoHoG12NEqEc+LxC13fX8KTgmrJvTuV5L
	8HNlCqAiEzrQZQKVOGEtxd3n0Zu7rMv6/4ugjMDk9QLDDJb5LzAH30bYSlvQtNuvIrQl5eHmcoh
	FRKe67uYrD89hP3woauym3e/pGLjUkVGnA7RjooEoiKrTctj0UUp4kvLT/njzgBeT8jVGa//hJp
	oB6ILfTjrMcjznpVRbkaPiy3qgoP+rxKvcmvZmWTBZtIpb3rCYNDshVPo7P9rOKx64i+Vvzh1QH
	fqTKd62z4q4yvWNpbIOpGcmOo+zGLnSobxAVw9A6
X-Google-Smtp-Source: AGHT+IFy1ewRYIQi2QM4ZSLkQhokapTj0gR7Ltj5GpPkDsZlOlyCTjP19Ec1IKFhcZrwo1l74Iw4rg==
X-Received: by 2002:a05:6a00:240a:b0:736:ab1d:83c4 with SMTP id d2e1a72fcca58-73bbec49f99mr4365817b3a.0.1744297652831;
        Thu, 10 Apr 2025 08:07:32 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e51f1csm3501019b3a.145.2025.04.10.08.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 08:07:31 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:07:29 -0400
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
Message-ID: <Z_fesYbCnSjAo-K4@yury>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-3-visitorckw@gmail.com>
 <Z_aobrK3t7zdwZRK@yury>
 <Z/a7DecDljuLtKeS@visitorckw-System-Product-Name>
 <Z_a_PzmNnvC2z7se@yury>
 <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z/bC6cygo0hem5IO@visitorckw-System-Product-Name>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_080734_018065_2C7A391F 
X-CRM114-Status: GOOD (  17.87  )
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

On Thu, Apr 10, 2025 at 02:56:41AM +0800, Kuan-Wei Chiu wrote:
> On Wed, Apr 09, 2025 at 02:41:03PM -0400, Yury Norov wrote:
> > On Thu, Apr 10, 2025 at 02:23:09AM +0800, Kuan-Wei Chiu wrote:
> > > On Wed, Apr 09, 2025 at 01:03:42PM -0400, Yury Norov wrote:
> > > > On Wed, Apr 09, 2025 at 11:43:45PM +0800, Kuan-Wei Chiu wrote:

> > > > So, if val == 0 than parity_odd(val) is also 0, and this can be
> > > > simplified just to:
> > > >         return parity(val) ? 0 : 0x80;
> > > > Or I miss something?
> > > >
> > > If val == 0x01, the return value of calc_parity() will remain 0x01.
> > > If changed to return parity_odd(val) ? 0 : 0x80;, the return value will
> > > be changed to 0x00.
> > 
> > Sorry, I meant
> >         return val ? 0 : 0x80;
> > 
> > This 'val | (parity_odd(val)' is only false when val == 0, right?
> > When val != 0, compiler will return true immediately, not even calling
> > parity().
> >
> I'm still confused.
> 
> Maybe you're interpreting the code as:
> 
> 	(val | parity(val)) ? 0 : 0x80
> 
> But what we're trying to do is:
> 
> 	val | (parity(val) ? 0 : 0x80)
> 
> So, for example, if val == 0x06, the return value will be 0x86.
> Only returning 0 or 0x80 seems wrong to me.
> Or did I misunderstand something?

I misread the whole construction. Sorry, you're right. Scratch this.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
