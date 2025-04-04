Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3582FC3600C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Apr 2025 02:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4v1MdzL7YW97aYbUovhMpwuR8iI4z7OqbJINQQoGmpc=; b=IqKWwX6MZimIZA
	770yE0r4PWGUfh0E2MzzuaNtsQ0bB7EdhbS7/OxPBsGkdgN7JSdIf2X4eeGh2zlcY6tYpcNOQyGv8
	Yxq3Wiwj0lg0g9yLtAjwTasNhMXAVTZ1FYYa69ESOwJb8g6hrEGqhfe86PoZyS29EGHlgzvTGSdqY
	waFLYG8v2ChB4nFz1XypI0CRwpO3zYqHZJV7BxutqviOZzWYi8mD6EScknEyRSGKljV5/mnZXTVsL
	h10MA4yeDkdgDi0ILgPe0VhexWfO6iE2nLAFivJ6PQ0dGyK/5OtKYRemKFJ9WsF7pXzSlBncQl7lW
	6VVnxm47/Dz5cIi6xAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XAH-0000000AcTu-4BoY;
	Fri, 04 Apr 2025 02:52:18 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0XAF-0000000AcTS-0M6h
	for linux-mtd@lists.infradead.org;
	Fri, 04 Apr 2025 02:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1743735129;
	bh=bD316i6CC1/1PO6OVutB+NKMwcDuOGm8uB+gBAMy1aY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cECX35JOUju7Gk7KN9dGvxDxapcSnbwiA6dOiSg+vBhsG/elnQAFs/XdV5+g6WWt6
	 SLCnm/Ucw8BBGVyk5Ijw+fksySSB6WceeM1CY3gFBmJT9wI6tsBebEb6+o92tkuHS5
	 W86JYzh62/EpgW4D48keOw4sg7Ga/HdeNdrRLxuxYO34VtQbiLDviSnDbvtFpckqcj
	 TGdMnQGS1Jnjggap/FvXRhM0sVlGzBGbEYD9iWoiIUwTri9g8KO5FCGJ0q8N8pRRps
	 Oit9X8P5fuYFOcEsQWRIudq6HVF68PYjzIGIF6CP6n5FfeUTK/dStmQfFMHikk8lv2
	 VEX5mekmjKhpA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZTNRc5mVdz4wyh;
	Fri,  4 Apr 2025 13:51:56 +1100 (AEDT)
Message-ID: <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
From: Jeremy Kerr <jk@ozlabs.org>
To: Yury Norov <yury.norov@gmail.com>, Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, David Laight
 <david.laight.linux@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 akpm@linux-foundation.org,  alistair@popple.id.au, andrew+netdev@lunn.ch,
 andrzej.hajda@intel.com,  arend.vanspriel@broadcom.com,
 awalls@md.metrocast.net, bp@alien8.de,  bpf@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com,  brcm80211@lists.linux.dev,
 dave.hansen@linux.intel.com, davem@davemloft.net, 
 dmitry.torokhov@gmail.com, dri-devel@lists.freedesktop.org, 
 eajames@linux.ibm.com, edumazet@google.com, eleanor15x@gmail.com, 
 gregkh@linuxfoundation.org, hverkuil@xs4all.nl, jernej.skrabec@gmail.com, 
 jirislaby@kernel.org, joel@jms.id.au, johannes@sipsolutions.net,
 jonas@kwiboo.se,  jserv@ccns.ncku.edu.tw, kuba@kernel.org,
 linux-fsi@lists.ozlabs.org,  linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org,  linux-serial@vger.kernel.org,
 linux-wireless@vger.kernel.org,  linux@rasmusvillemoes.dk,
 louis.peens@corigine.com,  maarten.lankhorst@linux.intel.com,
 mchehab@kernel.org, mingo@redhat.com,  miquel.raynal@bootlin.com,
 mripard@kernel.org, neil.armstrong@linaro.org,  netdev@vger.kernel.org,
 oss-drivers@corigine.com, pabeni@redhat.com, 
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at, 
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com, 
 x86@kernel.org
Date: Fri, 04 Apr 2025 10:51:55 +0800
In-Reply-To: <Z-6zzP2O-Q7zvTLt@thinkpad>
References: <EB85C3C1-8A0D-4CB9-B501-BFEABDF3E977@zytor.com>
	 <Z824SgB9Dt5zdWYc@visitorckw-System-Product-Name>
	 <Z9CyuowYsZyez36c@thinkpad>
	 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
	 <Z9GtcNJie8TRKywZ@thinkpad>
	 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
	 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
	 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
	 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
	 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
	 <Z-6zzP2O-Q7zvTLt@thinkpad>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_195215_584301_DCCA92AE 
X-CRM114-Status: UNSURE (   8.21  )
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

Hi Yuri & Kuan-Wei:

> Thank you for sharing your opinion on this fixed parity(). Your
> arguments may or may not be important, depending on what existing
> users actually need. Unfortunately, Kuan-Wei didn't collect
> performance numbers and opinions from those proposed users.

For the fsi-i2c side: this isn't a performance-critical path, and any
reasonable common approach would likely perform better that the current
per-bit implementation.

Our common targets for this driver would be arm and powerpc64le. In case
it's useful as a reference, using the kernel compilers I have to hand, a
__builtin_parity() is a library call on the former, and a two-instruction
sequence for the latter.

Cheers,


Jeremy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
