Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165B3C36010
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Apr 2025 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UihYzu5Th10vi3DpcTga3pLMKFP+hexYX0AQF84nGiY=; b=1PYOFv8eIN7VpJ
	8K//Xk5ZSs1hBlQ17B9ls1gIart+qbcP7Y1IHCQuxaysYZ5sReObMHclezXIeDsRsLKb1L7TBgqa6
	0ERtxCwhHJmKBvKdaCZQotDLgh9sFv2chHy1ABEMG9Vw8z/ZEopHJa73EuA46p8WYM5h+Stwkqkcc
	BoKscqa1n6aKWW6r2p7he/+hqMb2gaXjkYb6P/BgqzsPHfkKLpstveuBIZpN1mcy1IxHDarhuQ39Y
	mw56opMJFH66zkl0tS+UP2GAiFq8SFqcvdkdEbKLBcV+Xaafag1hfxEGHVm05pcb39oi5Sr7kqUQH
	6OkXiFTvh1r4w3EyxHZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HOF-0000000EOF4-0ba6;
	Fri, 11 Apr 2025 16:38:03 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HNn-0000000EO9N-0B8E;
	Fri, 11 Apr 2025 16:37:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-224341bbc1dso22347505ad.3;
        Fri, 11 Apr 2025 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744389454; x=1744994254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MjzA0YnYKabpFVnU6SCdVYbRaI+R9P9oLUcK7MMUODI=;
        b=dNKwDAXSQHRfw1sut9fbEnC15ilVLWRSzzbGkKEUMHDnGFf+rRLpfoBijiLneOdHO7
         aC7R7nzn4upS0Qwy2e3r+AWD8/+JqWgfH8bxg1Pt3VFT6RR11aFrS8QL56IkVqspJvkB
         7h2pdFPIcysy6BRsS1+duLPh6i29CTq5vRzRC/mBOoMAwA7wRKqwsxylljnjiZ+cxxqH
         PTF+cJXrknGqWUKp/sUFjLYAdt2kJWmpVRVSAvBbAKs7LHishOLtlyWks4nsyUOtVBJE
         dES+vjSSMQUZoP9SZcJF5lwfRdRT5HZvccoYA3KQ0u8V6BvbamTkwPjjBtLewgEFTuxx
         vxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744389454; x=1744994254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjzA0YnYKabpFVnU6SCdVYbRaI+R9P9oLUcK7MMUODI=;
        b=tUT+gRO0AygY3B0TYehQm/g7wfM99x6FMd1grAg9rh7RDhxFdEnMKPX0uhu5R2D+Aj
         326KSK1VsrInEriOuGUX/Yg3bdfIS37drThdec4zK5e8Q+rc+dikUSQsflOrZigicv8U
         81GWsMeGty4hXNWWbvsKvMznaADzMFRQaMrDsHvh1QCWwWj8YaluecPAhLSwSnc4YRBd
         18P+jQD9/OTpT6XacTaTptbRm8eVs7R7PDn1pZQHfE8zoYEqcAKJUlehl5F/8j00rOCi
         xNwJdLsVqajex/jXcPl6b6DF1Us8qeSl4lVvzxWmUAxhz/4sEpy5E8csYyFFDVqaGzKB
         tdxg==
X-Forwarded-Encrypted: i=1; AJvYcCUfH70OJzogShKjets3MZfGLGUy//TIIoR0jdB7CoFtP85lob8wiu4XqAKCnGck4U0xceYCbmzTtBmW@lists.infradead.org, AJvYcCXEZSwNPSognrKmNe3yXva05uevTi86J7pNhV3IyJEpndTWkiTBcuFcpWFU7/AMTnN6V+cHusH3nLE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlIz9pabUKLix+T8nbbaPVU4ckUQGNDhTrVInJKZ5M/my9cZ13
	BHNDhB8f05UR+cB5CVlp6NRvhJPA9xnI3QRheNpS9QOZY7/uSFDZ
X-Gm-Gg: ASbGncvNDtbPO1+HFUF770+2Cos/pBWTMbW7s5lN0IBro4enIKmm/4v7pu6jgvqRmqd
	SpfyRQXwurP/4U9110MtH9QEyK9HAcRA7Pd6BJY5HNalm+X0kSUG/HAtsnHjP6hjwEGm6oMLvYM
	nuFpfcCna6jtIsGMA44X58isbGgMW8mYz+rYCD2AOGMh0IojNoial3pQwdrqepepPfvY82XfULg
	+N8h7ZT2Bbh+B1wAfqUqtJj9jyKfw6IfgMbkGSD8JSMvyf8KNVgiCxMIvYjkjB929KRURaQazF/
	zb+fCRri0g3AveEvvG2ZWj7ll9zRCkx/JVt1SyUd3ozV35tFHjdnTDNvhjzqHD2eYQlF
X-Google-Smtp-Source: AGHT+IGlMlFJxwXfO1vN1lbAUVxQSfZJdWvCgXvyYRfzP61vo51gp8lcBZ4/5fk7RALG9+wgB3IUnA==
X-Received: by 2002:a17:902:d4d1:b0:223:42ca:10ef with SMTP id d9443c01a7336-22bea4fee72mr44963195ad.43.1744389454075;
        Fri, 11 Apr 2025 09:37:34 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c971fcsm51537235ad.111.2025.04.11.09.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 09:37:33 -0700 (PDT)
Date: Sat, 12 Apr 2025 00:37:23 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, jk@ozlabs.org, joel@jms.id.au,
	eajames@linux.ibm.com, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dmitry.torokhov@gmail.com, mchehab@kernel.org,
	awalls@md.metrocast.net, hverkuil@xs4all.nl,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	louis.peens@corigine.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	parthiban.veerasooran@microchip.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, yury.norov@gmail.com,
	akpm@linux-foundation.org, jdelvare@suse.com, linux@roeck-us.net,
	alexandre.belloni@bootlin.com, pgaj@cadence.com, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
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
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
Message-ID: <Z/lFQ85vhSQiFDBm@visitorckw-System-Product-Name>
References: <20250409154356.423512-1-visitorckw@gmail.com>
 <20250409154356.423512-4-visitorckw@gmail.com>
 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
 <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
 <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1961e19ee10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_093735_078978_5568753D 
X-CRM114-Status: GOOD (  12.29  )
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

On Thu, Apr 10, 2025 at 07:08:58AM +0200, Arend Van Spriel wrote:
> On April 10, 2025 12:06:52 AM Johannes Berg <johannes@sipsolutions.net> wrote:
> 
> > On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
> > > 
> > > This is orthogonal to the change to parity_odd() though. More specific
> > > to the new parity_odd() you can now do following as parity_odd()
> > > argument is u64:
> > > 
> > > err = !parity_odd(*(u16 *)p);
> > 
> > Can it though? Need to be careful with alignment with that, I'd think.
> 
> My bad. You are absolutely right.
> 
Then maybe we can still go with:

	err = !parity_odd(p[0] ^ p[1]);

I believe this should still be a fairly safe approach?

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
