Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC49FC35FF4
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srm/hqVqzfNIR4sgr5th7gYbNk1bWRpMSYhRCs1m7dA=; b=mNSET9t0jTG8HH
	r2J3T8JxOuH5T29HxUGPvS5oDa1vzsgych3JWHbhypq/yQhhyuUuS4bdMwPvTJtBjBomkDBKUhnsm
	wFlMlqjKfcUjcVGI7dEYVFpbhoKYZplztZiZ0lKv4mgyErG+5fNeT+V8ta7dRo53s2ntb7O1hRm4/
	ORBiWkykHI+c+YdIgI+ocGwSlobHZT3GAx7gWIa49ptJ4v0eZyg1dq6ZPK6Zoncb8M6lGygT8ii+P
	mPULh4Ca/26Oj72XBHa14IeCPa4i+jQPKYcC4VsaFoXjopopuDPsyGKTdF73u1VLFg/kj1FPjjnco
	c06jw/xcnvoCirbeoSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8t-0000000BxQ1-3yfz;
	Thu, 13 Mar 2025 17:14:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslMQ-0000000BowG-31JT
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 16:24:44 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-219f8263ae0so22876865ad.0
        for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 09:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741883082; x=1742487882; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gfjeDfcFtBUkNo/zS3F1TWi9ohbnRv2k3DpKMTE74P8=;
        b=LhOorGJtLc5+/K0pdAkgU/X6aRgq925PEC5SRR6jrRCkiLT7yNZZzT8DNamwJ/3uv6
         KjtdBeuhJ741HrpHvwmaFon8Aq+wCNlQnXQRaZumQmlLs+2r9L61QmCQZgGhJ2HaL661
         QK30gpyOff9Fo3FZiCKbiLnGQZNigy9Dl5L5Jzb06lxtTI21Vgnp0N8dMJjJmLfA/orb
         hbICZakvioAdI1STzILO/kQAPn52sUWtit42JzmEQpvoOc7MoI2xqUCiS/ViJet4MRSF
         tYjp2RRZhCkZCFasVxyF4OEWtWvsWQ4FzR5mvcPWyhWFNV196mnw6jMWqluPvfn4rKco
         8cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883082; x=1742487882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gfjeDfcFtBUkNo/zS3F1TWi9ohbnRv2k3DpKMTE74P8=;
        b=PqgAJLhhAy83f384QaP7HrHuM5R32XiDaLj1FEtduGR+GDKsP+6ylQ/bmM7gWRPKLr
         rI4s54E8S+vLZkP7YFNXkY3ZEHwnzs2kbY8EHRX1ukUHT1uboyrqPN4NoSdOaGqL1ukr
         ed/IMh3nTB/swPX2W1v4VadBoJroiUCNoBKK4n26IuyJ/eW+tmrmDgVV/9n6qRF7togW
         +52PSM2Pf5SLvAM7APcr6HCLkVIrewQDrFL0r1/DSKWciPp99z7o0xznFVWTT7TgfqQf
         yXZ2ri0pmqIOjVn8kW1JMtaj3U4Vhty+UwLGuBNN40GH2hQm7RW3NT0EuBAsYnRg4BvW
         rMrA==
X-Forwarded-Encrypted: i=1; AJvYcCWLXFm710qcqdhYGGY+S4Nbdpp/OuI3tYgHf/yhwH+lgCeEdhjR8ooe6K4G3cNHGa89Htaw8uUXxto=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvM4TIzH5V0N844H5XyM6ECwd7Augrir4HlqxZGNQIxVa7sIma
	sH7rJ+oCLnvcOOvYxZOPrvSwjUjfSCOILffe0AGnvc0Olx0v250L
X-Gm-Gg: ASbGncvN1u0Q8vQrz74Oi7SJ0tG60u3djOCLj1FtqxytL2in1TJaf57fofHcpbHnnyh
	30tTSsSq03Rbaf1Oc68qxrw8Eo91U24PceXTmIONi5ETn61cpgAukXQWYrbct2kBqfe2Dd/OjgG
	0xrE93v0vpD6WNseujqy563dQQLd0q8GNwOsXgLS2lfjzpfW62jmFTV+AzaZ5McMBfSAQEnS4ws
	GX/wvzdBluzFF363ssGI3EhFCYsUYKY/dYWffqPp2deUaSvGBrC4+aer3lY07Njy6L2ZKmkgw6E
	L1QDkxbYHaw9Ask9D+AMpaqb34MkwXUMQxEoPJdl0umYdIi0VGYLgDU=
X-Google-Smtp-Source: AGHT+IEhm2UlrxnESPtEwBvMI/fgf4613dWJojNHjH0dA0YyQIoHXBBX22mwSMAlbcl6B7SrptBmaw==
X-Received: by 2002:a17:902:f552:b0:224:216e:332f with SMTP id d9443c01a7336-225931ad2bemr163943215ad.48.1741883081419;
        Thu, 13 Mar 2025 09:24:41 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbcba7sm15241975ad.173.2025.03.13.09.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:24:40 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:24:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Jacob Keller <jacob.e.keller@intel.com>,
	David Laight <david.laight.linux@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@kernel.org>,
	Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
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
	parthiban.veerasooran@microchip.com, arend.vanspriel@broadcom.com,
	johannes@sipsolutions.net, gregkh@linuxfoundation.org,
	akpm@linux-foundation.org, alistair@popple.id.au,
	linux@rasmusvillemoes.dk, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z9MGxknjluvbX19w@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <20250307193643.28065d2d@pumpkin>
 <cbb26a91-807b-4227-be81-8114e9ea72cb@intel.com>
 <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0F794C6F-32A9-4F34-9516-CEE24EA4BC49@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_092442_760188_A507794A 
X-CRM114-Status: GOOD (  15.21  )
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

On Wed, Mar 12, 2025 at 05:09:16PM -0700, H. Peter Anvin wrote:
> On March 12, 2025 4:56:31 PM PDT, Jacob Keller <jacob.e.keller@intel.com> wrote:

[...]

> >This is really a question of whether you expect odd or even parity as
> >the "true" value. I think that would depend on context, and we may not
> >reach a good consensus.
> >
> >I do agree that my brain would jump to "true is even, false is odd".
> >However, I also agree returning the value as 0 for even and 1 for odd
> >kind of made sense before, and updating this to be a bool and then
> >requiring to switch all the callers is a bit obnoxious...
> 
> Odd = 1 = true is the only same definition. It is a bitwise XOR, or sum mod 1.

The x86 implementation will be "popcnt(val) & 1", right? So if we
choose to go with odd == false, we'll have to add an extra negation.
So because it's a purely conventional thing, let's just pick a simpler
one?

Compiler's builtin parity() returns 1 for odd.

Thanks,
Yury

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
