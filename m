Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE75DC021B3
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Feb 2025 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdDCNdNv3D86ZLZmbl8PBRuZDE0J8jxojZelzljGPVs=; b=wJ+98TYw3DiAB4
	YEFLvFCumUquh1GoBSpSNVgnUAIy/VNkWpdg+hw66Sj++zBdJ7+T5iokz9SMJ0yFL3TV8zEAdyL2F
	+zEYFkHtECwlS19/2hMPynqdCY3ga7TRTlfVbgnGWnpJzwzHxtF2QMElP5CUbY7zPwAJmRyhQVVOM
	+TQXpM7o/er0bznz65JDrIYh5s2iX+lsswz8RuCtLkve0c53pDein2DELxqqxeioJFDHH/n18M60M
	pW5lothr8wnvATsmM75jOMj8E3QMHDktEOep2nd0mPNyhV7FghuA2KVyVIevEd1sFzeU/QbEX8ypG
	8cnFjhdEX45PZ3DA/brQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTMy-0000000Cbz5-2FPo;
	Mon, 24 Feb 2025 07:59:16 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmTMw-0000000Cbyd-0zli
	for linux-mtd@lists.infradead.org;
	Mon, 24 Feb 2025 07:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1740383950;
	bh=KH7gHdSS1itQHQoP3z+uj401oB/rX1ncYfhBdSQWuUg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=ims34gfQA1vb1TN04LB3UWi8oHvR4gxRnPiIctjK103CyZjimW58U3jEvwGUiodUv
	 Za6iGn3q5AdLIxYyGTz781CdTkRRuzvuzvB+jqoRCFNgqP3roPHIeinGtWFwJEKkks
	 APqv1lGjpK23uVFnzo7nVVS6b3xXCg06P8jTIx1RlPQEEsIl6RAASM53YXWxfxgCPT
	 YuWYvczKQgqWnAIi87XjLoll+9D2dsL+De6hgIcZaT1OeN4O1e1mvYID5Q0/x192AI
	 cIKrTswlatGOS2XEjLU/PxGrM3nDGtjSOtqs2L52iQ/z9EMvUaOHQjKU3ndigQC8xz
	 42ZoJR/u2NoBg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z1Y5l5GVTz4wby;
	Mon, 24 Feb 2025 18:58:51 +1100 (AEDT)
Message-ID: <1cebfebb9c205a1ebc5722ca7e3b87339ceb3c79.camel@ozlabs.org>
Subject: Re: [PATCH 00/17] Introduce and use generic parity32/64 helper
From: Jeremy Kerr <jk@ozlabs.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>, tglx@linutronix.de,
 mingo@redhat.com,  bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, joel@jms.id.au,  eajames@linux.ibm.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org,  rfoss@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.torokhov@gmail.com,  mchehab@kernel.org, awalls@md.metrocast.net,
 hverkuil@xs4all.nl,  miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com,  louis.peens@corigine.com, andrew+netdev@lunn.ch,
 davem@davemloft.net,  edumazet@google.com, pabeni@redhat.com,
 parthiban.veerasooran@microchip.com,  arend.vanspriel@broadcom.com,
 johannes@sipsolutions.net,  gregkh@linuxfoundation.org,
 jirislaby@kernel.org, yury.norov@gmail.com,  akpm@linux-foundation.org
Cc: hpa@zytor.com, alistair@popple.id.au, linux@rasmusvillemoes.dk, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com,  kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsi@lists.ozlabs.org,  dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-mtd@lists.infradead.org,  oss-drivers@corigine.com,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
 linux-serial@vger.kernel.org, bpf@vger.kernel.org, jserv@ccns.ncku.edu.tw, 
 Yu-Chun Lin <eleanor15x@gmail.com>
Date: Mon, 24 Feb 2025 15:58:49 +0800
In-Reply-To: <20250223164217.2139331-1-visitorckw@gmail.com>
References: <20250223164217.2139331-1-visitorckw@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_235914_502404_6FCD814A 
X-CRM114-Status: UNSURE (   6.25  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS3Vhbi1XZWksCgo+IFNldmVyYWwgcGFydHMgb2YgdGhlIGtlcm5lbCBjb250YWluIHJlZHVu
ZGFudCBpbXBsZW1lbnRhdGlvbnMgb2YgcGFyaXR5Cj4gY2FsY3VsYXRpb25zIGZvciAzMi1iaXQg
YW5kIDY0LWJpdCB2YWx1ZXMuIEludHJvZHVjZXMgZ2VuZXJpYwo+IHBhcml0eTMyKCkgYW5kIHBh
cml0eTY0KCkgaGVscGVycyBpbiBiaXRvcHMuaCwgcHJvdmlkaW5nIGEgc3RhbmRhcmRpemVkCj4g
YW5kIG9wdGltaXplZCBpbXBsZW1lbnRhdGlvbi7CoCAKCk1vcmUgc28gdGhhbiBfX2J1aWx0aW5f
cGFyaXR5KCkgPwoKSSdtIGFsbCBmb3IgcmVkdWNpbmcgdGhlIGR1cGxpY2F0aW9uLCBidXQgdGhl
IGNvbXBpbGVyIG1heSB3ZWxsIGhhdmUgYQpiZXR0ZXIgcGFyaXR5IGFwcHJvYWNoIHRoYW4gdGhl
IHhvci1mb2xkaW5nIGltcGxlbWVudGF0aW9uIGhlcmUuIExvb2tzCmxpa2Ugd2UgY2FuIGdldCB0
aGlzIHRvIHR3byBpbnN0cnVjdGlvbnMgb24gcG93ZXJwYzY0LCBmb3IgZXhhbXBsZS4KCkNoZWVy
cywKCgpKZXJlbXkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
