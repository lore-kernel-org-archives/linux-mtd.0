Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7337C19F32
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Mar 2025 12:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPMPDLXWs2OhLt5/zyQq85zwcbAcSHLQ0+mzKSkoNZ0=; b=1ocw+s0qsR4DM8
	8ggWgxvO4xyYK+NI5A1V+mkeOAMIN6V7fa2DQxs7tjLM6RHT120HvMndTZ1ZUdYt4R2PfmxFAAQOT
	XFB00dHRUp5ty4GrAmspZkVwOTXo39l9jtCs6/M+MCUU1ji32kRmfmliCq3+fIQTRwur+8sNaO7bl
	H3UjDPOKXUMrHO11cwkYwqLRc24r7wsJaG4ANYK79ek+kqUWGIpG7q9aP4FSlTEyM7GHr47XkHDFw
	UwH0tmpqCqi3tM3fwhqgcCTy5GSAzgJCfiQ2llDcXluwVHeX9CQTrNy1F4pg8l3p3L9PY9zMsGKug
	xKIs+NC6DljAYaI1zv2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWbn-0000000E9bS-0JmC;
	Fri, 07 Mar 2025 12:15:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqWaE-0000000E9GU-2yLR
	for linux-mtd@lists.infradead.org;
	Fri, 07 Mar 2025 12:13:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1661AA45753;
	Fri,  7 Mar 2025 12:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C604C4CED1;
	Fri,  7 Mar 2025 12:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741349621;
	bh=A0iB+YCb+UVBZshzVwjPGcV1KlpUOFw1SPgFL2eBkpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fAAKNVwXTNgwLiB5yUVEtuwsAVGV/QIJuDWb7igtxd0P9qswD1E8OeErlDEuR/e4A
	 KzLmqjaEJZEEl8hSt3qCO5bduwmqj7FwIXcOT4tSNTVGxBcAdBk7AWN4yLRQ/mH/Ta
	 NH7IKeh8DSsI6ZQyf5gMsWXFqhAVxHXQBYrvIhW0+UfaCBXrOUm7UjEXrPkF7B1TOK
	 SMzEej6Y5vdB6J5u6wKBSSsXn2sden45AL2Ml53BlqVAWJg8Ls711zuQtM6RIh95+n
	 mN2kfDztpe5dbxCy74QPpzR2QMb4IHiGzh8wu9JEohDHUW7xPD0W/hDCgkdkVGFdrr
	 aEDVYiNNNjX8A==
Date: Fri, 7 Mar 2025 13:13:26 +0100
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
Message-ID: <Z8ri5h-nvNXNp6NB@gmail.com>
References: <20250306162541.2633025-1-visitorckw@gmail.com>
 <20250306162541.2633025-2-visitorckw@gmail.com>
 <9d4b77da-18c5-4551-ae94-a2b9fe78489a@kernel.org>
 <Z8ra0s9uRoS35brb@gmail.com>
 <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4040c78-8765-425e-a44e-c374dfc02a9c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_041342_913609_B6CE1D61 
X-CRM114-Status: GOOD (  22.02  )
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

> On 07. 03. 25, 12:38, Ingo Molnar wrote:
> > 
> > * Jiri Slaby <jirislaby@kernel.org> wrote:
> > 
> > > On 06. 03. 25, 17:25, Kuan-Wei Chiu wrote:
> > > > Change return type to bool for better clarity. Update the kernel doc
> > > > comment accordingly, including fixing "@value" to "@val" and adjusting
> > > > examples. Also mark the function with __attribute_const__ to allow
> > > > potential compiler optimizations.
> > > > 
> > > > Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
> > > > Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> > > > ---
> > > >    include/linux/bitops.h | 10 +++++-----
> > > >    1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/include/linux/bitops.h b/include/linux/bitops.h
> > > > index c1cb53cf2f0f..44e5765b8bec 100644
> > > > --- a/include/linux/bitops.h
> > > > +++ b/include/linux/bitops.h
> > > > @@ -231,26 +231,26 @@ static inline int get_count_order_long(unsigned long l)
> > > >    /**
> > > >     * parity8 - get the parity of an u8 value
> > > > - * @value: the value to be examined
> > > > + * @val: the value to be examined
> > > >     *
> > > >     * Determine the parity of the u8 argument.
> > > >     *
> > > >     * Returns:
> > > > - * 0 for even parity, 1 for odd parity
> > > > + * false for even parity, true for odd parity
> > > 
> > > This occurs somehow inverted to me. When something is in parity means that
> > > it has equal number of 1s and 0s. I.e. return true for even distribution.
> > > Dunno what others think? Or perhaps this should be dubbed odd_parity() when
> > > bool is returned? Then you'd return true for odd.
> > 
> > OTOH:
> > 
> >   - '0' is an even number and is returned for even parity,
> >   - '1' is an odd  number and is returned for odd  parity.
> 
> Yes, that used to make sense for me. For bool/true/false, it no longer does.
> But as I wrote, it might be only me...

No strong opinion on this from me either, I'd guess existing practice 
with other parity functions should probably control. (If a coherent 
praxis exists.).

Thanks,

	Ingo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
