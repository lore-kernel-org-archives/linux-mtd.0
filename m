Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C5CC36002
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Apr 2025 22:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6r1DPZzJNhni7XcqbKQ/15ALoyd0tXRe0M3Nbhg4AOI=; b=jMkJrBbTdePF9X
	hmzXfj9Ml6Hz4zYzSQn8d13aOYzuKnTzvNJckRezgjfTDA4JLDAX1FcfG0UBMNff2qBhttn3iUI7+
	7TDxPU53aadZc9O9M5e8PjUD4Gg5084JUL/kAqzaUj6TwI8O01vL4V+7NLd0T7mbM2aYP7rZM6V5k
	F5kqUovTgNrCSzpEgoOSqMxwKFx7y923VA36VeU4IX4ZR7pMz2cALHGzQ622sX++4JqrlYkIa0UHV
	XzfnbvanD0LgomllfYbi32WWSYwKCvPc7j5RBjT3Ivx3lyE7Yh+EM0qOGYZ3a8NgvLEL2fm2ahNJU
	j59B6lRfSVF3gNxsFI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dgh-00000008gD7-2a5T;
	Wed, 09 Apr 2025 22:14:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2dZh-00000008faJ-2zwd;
	Wed, 09 Apr 2025 22:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MXaJb6rqjO6k6hC8GGRd9Nz5/YI2plyuUrbJ5reUjDs=; b=LpxXlpsCIMq2nAHy8a2IHAYNCm
	hmP+hzDmQn1RJk8a8bNAm4umjJTbI99AQZXtYOCmscALPCyg9wwOPIjGwxIF9s1ZRfKxx2yHHp1mj
	UA6J/ENQt784cSvYFbn2r7JhEnyp2hY24wl7WzFGERHWeEnHc/e7Z7RhwSzHSx+9rstEW0Y5p2DvA
	rVLjrrfwvdynKa6fSNQKcKJMNMHbLEuFq5caapbbYVFgwRKeEvOdK7xh8V/8LInG7Eci+0S4mTQFJ
	8qqpu2G78r7ONaFPY0Npt0cdLHjz37CgCvjwKjQhPE6NeXSr/GkAxTMDdawRszY/u026nXeEy/+H5
	qDWXzSjQ==;
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2dZR-00000008hTv-1arT;
	Wed, 09 Apr 2025 22:06:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=MXaJb6rqjO6k6hC8GGRd9Nz5/YI2plyuUrbJ5reUjDs=;
	t=1744236415; x=1745446015; b=dirgm2yP0mgXTaCaS42xak/BZf/03aa+i+97Bc2KISEi5Yq
	3DYrg5wKBzEvunGnY9o4Ag/MO+5CnNRcf2ZaGcL1iCNZIC/kLmUlkjUBpq3fQGxyKuHwjgm5IrawQ
	51SoALdyfrufRSui1hX17YFrEYwvINRqYD4O817kUGucUNpWrQD6nyeoV98dSlTWi6HS/sKOUw9Rv
	x4rovNwKSkVtGQT710Z3gtKzQy/lXPGSCq33f1f+HEuI9loh/exD2xc2kDqMPAwuBlK4Vb9LcYL39
	rbDBCktZrE/vr+fji0nyl+HgB98i10BMb8JeH0mDqeZ+z17DPREn7aetRbWNslVA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1)
	(envelope-from <johannes@sipsolutions.net>)
	id 1u2dYb-00000005Jap-0lrk;
	Thu, 10 Apr 2025 00:06:05 +0200
Message-ID: <740c7de894d39249665c6333aa3175762cfb13c6.camel@sipsolutions.net>
Subject: Re: [PATCH v4 03/13] media: pci: cx18-av-vbi: Replace open-coded
 parity calculation with parity_odd()
From: Johannes Berg <johannes@sipsolutions.net>
To: Arend van Spriel <arend.vanspriel@broadcom.com>, Kuan-Wei Chiu	
 <visitorckw@gmail.com>, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 	dave.hansen@linux.intel.com, x86@kernel.org, jk@ozlabs.org,
 joel@jms.id.au, 	eajames@linux.ibm.com, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 	rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com, 	mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl, 	miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, 	louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, 	edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com, 	gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com, 	akpm@linux-foundation.org,
 jdelvare@suse.com, linux@roeck-us.net, 	alexandre.belloni@bootlin.com,
 pgaj@cadence.com
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 	kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org, 	dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, 	linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org, 	oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
	Frank.Li@nxp.com, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, 	david.laight.linux@gmail.com,
 andrew.cooper3@citrix.com, Yu-Chun Lin	 <eleanor15x@gmail.com>
Date: Thu, 10 Apr 2025 00:06:03 +0200
In-Reply-To: <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
References: <20250409154356.423512-1-visitorckw@gmail.com>
	 <20250409154356.423512-4-visitorckw@gmail.com>
	 <25b7888d-f704-493b-a2d7-c5e8fff9cfb4@broadcom.com>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_230657_603852_EE07CFFB 
X-CRM114-Status: UNSURE (   6.33  )
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

On Wed, 2025-04-09 at 20:43 +0200, Arend van Spriel wrote:
> 
> This is orthogonal to the change to parity_odd() though. More specific 
> to the new parity_odd() you can now do following as parity_odd() 
> argument is u64:
> 
> 		err = !parity_odd(*(u16 *)p);
> 

Can it though? Need to be careful with alignment with that, I'd think.

johannes

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
