Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14954C36010
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Apr 2025 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fi93eGHhGSvsvBygQqRMKRbqP2ypomA7/L6CUsXWlTs=; b=La8e67rfCUJDad
	9U1mgAvq3DeNgk+qdwLXZyxDB5EBqtT+DoWnrOsNnMrIU6GWLcP5RsBeoZyo7Mhtrmt1JwUuKt2sr
	mq4L4eTlqCuF9syI9Ir7HETBvAbDWJjNkSUM/7AVwVToHAKfS6HZ2JDAr9jpaRUzBy1A9Yt3kUh7c
	E9ajJaFa3mEl3oldyhQB9fRYiEYqUIATsy65YH9nuivfkmStiSk6IsJtrZ2KqDwTMBd71rSql+QPY
	RcuhDB139OyQfjIcKBhg+YIxNrwp3vrU4xOmj90q35f1FKSesGeARTn4Db0Ye7lZPptEyp5B62l3B
	HzkQ28SZtnHX2ylCGrGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cwZ-0000000BE0u-24eo;
	Fri, 04 Apr 2025 09:02:31 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0cvT-0000000BDp4-2ZBI
	for linux-mtd@lists.infradead.org;
	Fri, 04 Apr 2025 09:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1743757280;
	bh=rh/0DiLc06njMesCXvy0xrm4fBBepKP0I72Ww69sE8A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=POc5E/b+AglzAkY37sDRa/BDBtwIOb5JtEf38ItfllacsvyAoJ6qEG+ptCBMH85cU
	 exN1qESJmMuVAaqeYVEx0Zx+5FSea+pTuEuHFAAVrNYXpzibQhqLh1DsPBGvSciGjA
	 RyKNNchWJOxVOiut7+Pkir7mGi+N2faVLqorOR0+4ELgC3jA8tGF2M2MziFNRNXmyN
	 7p3NKStjr+0nrOSMqn2yWu7rZpEK4jSVxfwhLron6DRu5V5j+4YTYwoVWzQOSqBL9D
	 MmV81L2OARI4NP/P9sMvY1YvHear7fw9ve2Cg4VgwbPsXHfQlRY1dULsVO5Igk2Q+p
	 Pbd3oPliPLCzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZTXdf2VVvz4x8w;
	Fri,  4 Apr 2025 20:01:10 +1100 (AEDT)
Message-ID: <811962e9c4964dd06eddb2fffab284946878df4e.camel@ozlabs.org>
Subject: Re: [PATCH v3 00/16] Introduce and use generic parity16/32/64 helper
From: Jeremy Kerr <jk@ozlabs.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 David Laight <david.laight.linux@gmail.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Laurent.pinchart@ideasonboard.com,
 airlied@gmail.com, akpm@linux-foundation.org,  alistair@popple.id.au,
 andrew+netdev@lunn.ch, andrzej.hajda@intel.com, 
 arend.vanspriel@broadcom.com, awalls@md.metrocast.net, bp@alien8.de, 
 bpf@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
 brcm80211@lists.linux.dev, dave.hansen@linux.intel.com,
 davem@davemloft.net,  dmitry.torokhov@gmail.com,
 dri-devel@lists.freedesktop.org,  eajames@linux.ibm.com,
 edumazet@google.com, eleanor15x@gmail.com,  gregkh@linuxfoundation.org,
 hverkuil@xs4all.nl, jernej.skrabec@gmail.com,  jirislaby@kernel.org,
 joel@jms.id.au, johannes@sipsolutions.net, jonas@kwiboo.se, 
 jserv@ccns.ncku.edu.tw, kuba@kernel.org, linux-fsi@lists.ozlabs.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux@rasmusvillemoes.dk, louis.peens@corigine.com, 
 maarten.lankhorst@linux.intel.com, mchehab@kernel.org, mingo@redhat.com, 
 miquel.raynal@bootlin.com, mripard@kernel.org, neil.armstrong@linaro.org, 
 netdev@vger.kernel.org, oss-drivers@corigine.com, pabeni@redhat.com, 
 parthiban.veerasooran@microchip.com, rfoss@kernel.org, richard@nod.at, 
 simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, vigneshr@ti.com, 
 x86@kernel.org
Date: Fri, 04 Apr 2025 17:01:09 +0800
In-Reply-To: <Z++cbTTp8leOJ5O+@visitorckw-System-Product-Name>
References: <Z9CyuowYsZyez36c@thinkpad>
	 <80771542-476C-493E-858A-D2AF6A355CC1@zytor.com>
	 <Z9GtcNJie8TRKywZ@thinkpad>
	 <Z9G2Tyypb3iLoBjn@visitorckw-System-Product-Name>
	 <Z9KMKwnZXA2mkD2s@visitorckw-System-Product-Name>
	 <Z+AlyB461xwMxMtG@visitorckw-System-Product-Name>
	 <eec0dfd7-5e4f-4a08-928c-b7714dbc4a17@zytor.com>
	 <Z+6dh1ZVIKWWOKaP@visitorckw-System-Product-Name>
	 <Z-6zzP2O-Q7zvTLt@thinkpad>
	 <3ebd280e6697790da55f88a5e9e87b4cab407253.camel@ozlabs.org>
	 <Z++cbTTp8leOJ5O+@visitorckw-System-Product-Name>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_020124_020042_FE8CB2ED 
X-CRM114-Status: UNSURE (   8.23  )
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

Hi Kuan-Wei,

> Thanks for your feedback.

No problem!

> IIUC, from the fsi-i2c perspective, parity efficiency isn't a major
> concern,

Yes

> but you still prefer optimizing with methods like __builtin_parity().

No, it's not really about optimisation. In the case of this driver, my
preference would be more directed to using common code (either in the
form of these changes, or __builtin_parity) rather than any performance
considerations.

The implementation details I gave was more a note about the platforms
that are applicable for the driver.

Cheers,


Jeremy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
