Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8F1C35FF6
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TdcA1QRG9IV1w1FNHMi9fXLRFaR+OMomLyH6/klSGmY=; b=b2S1lOeR4NA3+s
	Bym8nbL/tAocfk1mOrwgbqBZaMQpJJCFRA3yXgpQQvloddANs/Xt+SJctEwEQE5GIhbhBODtQgs20
	hR2ndb9gBcghOYkpDAnEtPcHTFbGpeSwA+/GVH1dYsO/XAKRjs9i9DTCx7n5cV/EzDHIfceQFbrlP
	mgeFWA21z+pC/wGLvrPgXTIUV2HKIf8SCFolE6eivIFuEV6wQ7t32rdzj2cOhSTYxzNXpg98BbCC7
	+F81KZriFi18ckm28Z01w+OQ7FdznYiBWiMz9ss3uia8ux32g2ALC9m9QL7/vvRIOe/id8B/1yVt/
	In1tH9BsJ+otystM2Dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8w-0000000BxW1-07TE;
	Thu, 13 Mar 2025 17:14:50 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslOF-0000000BpLy-2kAZ
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 16:26:37 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2ff4a4f901fso2058942a91.2
        for <linux-mtd@lists.infradead.org>; Thu, 13 Mar 2025 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741883194; x=1742487994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Dj58qb5Fdu7jAiSs8njputJgR05+QajXZnrH30MR1c=;
        b=URTKY/RnsGlyxoynQOXfZgMI07heEdy7+HUWW9n4wsXqpalKb9KLWDgX7iUfd/QgMX
         xw/je8LZGxBdiZsUDV2Ha7mO8JYGhy2ishi38kR1t6jlqZ+R4OVLxPO/NVpgBazFVbIe
         p/y4Vm5qx8y40wgSvgfvFcmtEZr6CrGjodugPetcnwK7wZzoFTjLfDKO3Mv9gG0DPKRe
         u7rN3jyoAXPJY8xqd075K4+Zn5xbq+cA8f4cTjX4HcxtCA5QA5RHrZsEnkBolh89r1K8
         LxoutUbx6mb1sbvdamN0sqhopsbm1izvVUvyGsaFtOjV6QnENeUSpwQEE4EaKMIJ2BQf
         Brew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883194; x=1742487994;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Dj58qb5Fdu7jAiSs8njputJgR05+QajXZnrH30MR1c=;
        b=Pyb/KtI8QQAEPwdXkZ78DBRHxm8iPzzKmeKvSNnB+JWqNmeD65i8/lPUwGY2sRlErG
         HNPEghf16U7srykjDaHBXgigMHwfPls8xFgKfNLyt/rNGx+ob6Ahv8t/7Nfc39+vpl+f
         7D3mU2nxzUyArPnpS3kS1CGkC2j0gGLGrC0Z1tOa9BFBk/TfZ/SeozTMqbN7iqRxQzc9
         TzW4SPXVR2ert4GNKuCIvRhhfH4+uI0fwscwELRR7wmB+a/3mS7sAob1MceYSof3SvGT
         1zA0lFwEM0YeGT+yLa9dFDBh+kO9Js67pfviezMR2SBehaTIMEykRvF4sX9b54Mf0zeA
         XvBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD6/8MWFxj3MZXql7Fqx36ayxkt6aeqUb7X+IlE3/luzge9OEAaq6nP2Jx0igkbE9z2DXRpWBkOw8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyemWd/NTXeyGBSTv1QUFGJ1ku+kamvFMRzgAEqVjrMMFm1Qaj8
	R53R8ul9rVIFiEA1o+ruHDJfg8IZhf9LHSayGhW4Sm9ZCqRsSFAh
X-Gm-Gg: ASbGncvDILPI2hs2YRGVkh9zsGTEbW50qbfgz5INKOIcUqS66HaEcr5dqrQRKzEVsXc
	n/fFx+kreEjny4KNy8lV1/9p4U3eXEH8ZZY5/7coAxRGOvlyGM3tZVct2JxAFYrwk1xGAEYuYAH
	z96cMX/uZbGhc3b5RSfeefLwJGPLS0xuK+VfVQbNSz3wzphudvu/jNi/LAuPiizFSLbG96QYpI5
	R9VD0OUz+3ldHRRnYXUI90NU5iZEAVlA0vMcQKzSlnZtYNDawiTNwHs9rYo1hyl8oDHDZtXi6yQ
	ECwvAo2tFeLeSZysky844hNOT5vsoI2tG7PbQawcWbyM
X-Google-Smtp-Source: AGHT+IGQ1B1r23bHH1y7f1P01LiOEnbRiq9HK7MEAu/5nbXG5vCyYer48OQlR5RqnwzzsBUWrNiOAw==
X-Received: by 2002:a17:90b:3906:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-300ff0d6160mr17644409a91.14.1741883194498;
        Thu, 13 Mar 2025 09:26:34 -0700 (PDT)
Received: from localhost ([216.228.125.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888a02sm15453765ad.40.2025.03.13.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 09:26:33 -0700 (PDT)
Date: Thu, 13 Mar 2025 12:26:32 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
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
Message-ID: <Z9MHOOfnHnLsnhxu@thinkpad>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
 <Z8ri5h-nvNXNp6NB@gmail.com>
 <04AA7852-2D68-4B3F-9AA7-51AA57E3D23D@zytor.com>
 <Z8tJNt83uVBca0cj@thinkpad>
 <783456A8-67F9-47DD-AB15-914622A921CD@zytor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <783456A8-67F9-47DD-AB15-914622A921CD@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_092635_701489_05AE4DC6 
X-CRM114-Status: GOOD (  14.63  )
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

On Fri, Mar 07, 2025 at 11:33:40AM -0800, H. Peter Anvin wrote:
> On March 7, 2025 11:30:08 AM PST, Yury Norov <yury.norov@gmail.com> wrote:

[...]

> >> Instead of "bool" think of it as "bit" and it makes more sense
> >
> >So, to help people thinking that way we can introduce a corresponding
> >type:
> >        typedef unsigned _BitInt(1) u1;
> >
> >It already works for clang, and GCC is going to adopt it with std=c23.
> >We can make u1 an alias to bool for GCC for a while. If you guys like
> >it, I can send a patch.
> >
> >For clang it prints quite a nice overflow warning:
> >
> >tst.c:59:9: warning: implicit conversion from 'int' to 'u1' (aka 'unsigned _BitInt(1)') changes value from 2 to 0 [-Wconstant-conversion]
> >   59 |         u1 r = 2;
> >      |            ~   ^
> >
> >Thanks,
> >Yury
> 
> No, for a whole bunch of reasons.

Can you please elaborate?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
