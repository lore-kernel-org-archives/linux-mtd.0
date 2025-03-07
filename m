Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62E7C282DE
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 11:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ve1yvaRLglXnSv/lXOSG+Uvb6NTYPHOmGZUf4CAaRYg=; b=pl4QKafRKwKMgp
	d5NukMSvbSndyy0YFhucTduxMjpK9M+KV7VyaHVzcJBIIZVLPpgYE7gos2W/b7drBv+H3BLsQRxAT
	k1j1bz5xyjvR3FQTaVKm4tUsCPr8zDl7A+ZVk5hUp6qzwP7bWCPQZBje6qX2QTylhsAwhMl24rq8D
	6NLDeNveBfDomES0dkD4gPk23l8LpSUeoR1wjwerylJ1xEf7QyTO6Vg+rUjWhQtdX47AxkrPYSxUN
	cagI0S+e5RpT/liGg0jQFP/cfDJDv6qoxMyecBr50FbuA961laYVvr5ClaLrQ72gueXEsoa+OPEKu
	XtSQAgI8paJMgBo1PUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqW66-0000000E56X-1GyX;
	Fri, 07 Mar 2025 11:42:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqW2s-0000000E4hp-2jSA
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 11:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA05FA4572F;
	Fri,  7 Mar 2025 11:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED54C4CED1;
	Fri,  7 Mar 2025 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741347552;
	bh=3/sdXJVj7KtnSE85cKxaG8wUs9rqjrFuOU79jRxJq1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLmlxbVxqEup0anPAlcb+dTa8FE8yj+y8ZZ0PST3YP2elqVhKYbGBRuANPKgYm1pV
	 NGn7rb39E++lc1xbYoS5OhozY8nndia47/v8Sa5rqGO0Bu8MCd8jDX4s/rl8jnc9KS
	 /Zw1dAykvcP3jA1LZJezkeY71xfpNocgXG5ZY1+5Iclozb/CN7EK86u7FruZPbQxgj
	 O/EL7tcNhW8jLL10yopA5JzxQSg3yqC7XySzB7uBdYZaoLo+uDBWnCmh/MI/mDyW7C
	 DnKxEvglJ/VC5FCGBR5poufWGtRL6VWA6EpoY09yZ3F8omD0L+wJBxziuE5Y36X3fT
	 t3EHCJ+yuPtdQ==
Date: Fri, 7 Mar 2025 12:38:58 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
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
	yury.norov@gmail.com, akpm@linux-foundation.org, hpa@zytor.com,
	alistair@popple.id.au, linux@rasmusvillemoes.dk,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	oss-drivers@corigine.com, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-serial@vger.kernel.org,
	bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH v3 01/16] bitops: Change parity8() return type to bool
Message-ID: <Z8ra0s9uRoS35brb@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_033914_862433_0D1995E8 
X-CRM114-Status: GOOD (  17.13  )
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


* Jiri Slaby <jirislaby@kernel.org> wrote:

> On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > Change return type to bool for better clarity. Update the kernel doc
> > comment accordingly, including fixing "@value" to "@val" and adjusting
> > examples. Also mark the function with __attribute_const__ to allow
> > potential compiler optimizations.
> > 
> > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > ---
> >   include/linux/bitops.h | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > index c1cb53cf2f0f..44e5765b8bec 100644
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> >   /**
> >    * parity8 - get the parity of an u8 value
> > - * @value: the value to be examined
> > + * @val: the value to be examined
> >    *
> >    * Determine the parity of the u8 argument.
> >    *
> >    * Returns:
> > - * 0 for even parity, 1 for odd parity
> > + * false for even parity, true for odd parity
> 
> This occurs somehow inverted to me. When something is in parity means that
> it has equal number of 1s and 0s. I.e. return true for even distribution.
> Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> bool is returned? Then you'd return true for odd.

OTOH:

 - '0' is an even number and is returned for even parity,
 - '1' is an odd  number and is returned for odd  parity.

Thanks,

	Ingo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
