Return-Path: <SRS0=Mr3t=B5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A85CC433E1
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 08:45:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D116F20639
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Aug 2020 08:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ThCSEseU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D116F20639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UmaziE1FjlNX+/piZ2VWtfY4Crn+unKN91Udo/Rpt4w=; b=ThCSEseUbhXHSF7HKLND1OFVp
	FsNajrvKnuqf66cfkepLoU6OcbxG2nqve5XaQHq1GF4kqLOZC9VM0UszbIa1S5AF59t8Wv+WOcIIm
	Ii/O6eNyCAwIVZmmoV89h55q1k05tFDAbpk0vk/Keiu2CQZ9UXHcijPk5iUgGoFcpu4dxMnb4B5cX
	cbbstuvtLLBb2ludPy6ub65blvjaQ5H9UC25fFEV7CMj0VrLO6zBVXz69E9HnGtTa7a+CYqsLz4dX
	M0HmxS2MlIt7mBEj8BwGjWfEHl40uRYSSSjWHW7AT19W0FoN1+LsYHpdXAQtqJE7WPFyYXDve7ZZL
	32hUM0S9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Jhg-0004xA-Sq; Wed, 19 Aug 2020 08:44:16 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Jhe-0004wS-LB
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2020 08:44:15 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MGiF0-1jveG31TiU-00DovP for <linux-mtd@lists.infradead.org>; Wed, 19 Aug
 2020 10:44:09 +0200
Received: by mail-qk1-f175.google.com with SMTP id m7so20863221qki.12
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2020 01:44:08 -0700 (PDT)
X-Gm-Message-State: AOAM531ibDZqBEjGJPJPbCEDhUkzRXV9OwfR5hQo7/05Iilhapzmye1w
 Bewi0dQzhR3GAXGU1SokdZyO8WzMrfPNdL8DXb8=
X-Google-Smtp-Source: ABdhPJwfWJY4YQv36la+/0MD+QHocBF/Le7H2+CMgwAczLK9eQqrKeWrsZvvuug6OVTaAgPSIwj0wUbFD1Lx3Gr0TQ8=
X-Received: by 2002:a37:385:: with SMTP id 127mr19827899qkd.3.1597826321598;
 Wed, 19 Aug 2020 01:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0_fJ0BfD5Qvxdo0s7CbjPWaGA8QTgYhbXR=omafOHH4Q@mail.gmail.com>
 <CAFmMkTHEm8k+5GZkVJbDZMEhMwpsqVKRb-hGskSpBstdLRuFyA@mail.gmail.com>
 <CAK8P3a27bTYyn3N+tX=i_6f4KrQkOmkUA1zUQfvCW7qw6smSkQ@mail.gmail.com>
 <CAFmMkTF9eVm0tpOKEy2rzdX=Scr3RwqHDFy_i24R3F5ok-4=eA@mail.gmail.com>
 <CAK8P3a3mf8_Y4DWe3WuBO-Xo0N4Jj=-rrtFzD6w0TriGZPu1_g@mail.gmail.com>
 <CAFmMkTFzmC=aY0gR6urLu-8Oq8aeHBUWi-TodG8XhXKCcC057A@mail.gmail.com>
 <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
In-Reply-To: <20200819065721.GA1375436@lahna.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 19 Aug 2020 10:38:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
Message-ID: <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-Provags-ID: V03:K1:6rIMlbWIHGLGuAp+UrHMgE4wu244A8tQJyKBDeNP2P9hxrQW8u5
 GOJ0i6DIcvz2d0zmfHRbtFQOijhnsK3OKZ+vbkaCpl0wUmWwhh/YIervwGjudR4yrRrMUzB
 2Mq62foo1I6dGEMoqpqHCjUNnYhNfWFPEKb1qyJVzrnvCiRTqZ4y/4CqAOXDEYtfodanrn5
 i/R69lYAC6EwvkC+uifKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/SpSUZFrzUc=:j3b7la3h/xmlu26KLba6xp
 Z7slfmOu7rgF5tgueOex/6+scbAjupu2cR/rLWEer+25TAKnknBoZEFXwKQ6v4jFSvA2KP42b
 a47ORppxw7cd/QlYDNABMrxxmUKk8uikapgnkJm56BFuOacBfi5RXLzFzxIjsQITwYw+m4aff
 CIycnirZGsgnHqxXt96xr3OA8T22VBi5fDqjyDyPqGEDN5tDioBHVLQWLeOEXozl6G9sgOGIZ
 mWUTSXIZ7SLttp8r3DbGzLeuOxIxdGbGROgfSk0GKG7ALOB2hQhLlLXu/25tG/6lvB0fFA6gC
 +DVRfKkta6O5RuU6iWTTtrFl0g5gaqmHPNZztlwUQwJpddUFkcZp+FW+7c3xpNayxG4wV8wdQ
 js0+T+R7WwVsa7iYYVc7dcQ+bQzyDctFzYEDCKw2JrLCpiRb9WtgZsnto6MC4PYuHeLjC3C0M
 oqlbPYRpqx7LOpR4SgdXZJ6ep82VUdZYeQxPccmd2vKEZOcLebzYvxn/5a2G06xMfSm2ayE0K
 oa9uhGxIQp7uRYeUm92GcYfmIj1tE5jhhh91TbxqDZALU4Zb1s1WzhFkDMyaZgrCCsE8oxZXq
 FcOhZ2jvXwytercNmFKHwed5ppNYwUqSLHNSKIBh3PbQvEKaWlE+tyyE4QLz/VR4ds7gfghUh
 Ozl3AQaFMY4Db0TQXT6cwmvko+JFDiiV97Bqe6r+9C+g4U2oSwpgETdIqFjD517bOFp2KAa4H
 YfATz8ecMHAZLeEsCgZ/nvJTrGsWQFJDEgZXWJKVfK1i4nXijv2Tjz22H0l4g1/EVHmqMejCx
 Vok3HBnDe5UxiF8eFQUEk46U8soNvEs8d7hZ51R14dM9fFh7YiJZ7yNNAgIts0ICHe4+ShmkW
 CUV0uVmvaGhwkLXqq+ZcBBNMD0N3xFC6k/H2zJ9G9EjuT3FBhcjnD6+Mngfk78DREY/HIlJfo
 YBkQNGO2mbffmT8h+PKO53I5w6uDYY4H0b2kpvakgIiEXhQzCZPB/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_044414_914256_5404EE4D 
X-CRM114-Status: GOOD (  30.56  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Hughes <hughsient@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Daniel Gutson <daniel@eclypsium.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Alex Bazhaniuk <alex@eclypsium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Aug 19, 2020 at 8:57 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Tue, Aug 18, 2020 at 12:55:59PM -0300, Daniel Gutson wrote:
> > > If you care about other (malicious) code writing to the driver, please explain
> > > what the specific attack scenario is that you are worried about, and
> > > why you think
> > > this is not sufficient. What code would be able to write to the device
> > > if not the
> > > device driver itself?
> >
> > Maybe Mika can answer this better, but what I'm trying to do is to
> > limit the possibility of
> > damage, as explained in the Kconfig:
> > "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
> > "Say N here unless you know what you are doing. Overwriting the
> >   SPI flash may render the system unbootable."
>
> Right, the PCI part of the driver unconditionally (and wrongly) tried to
> set the chip writeable.
>
> What this whole thing tries to protect is that the user does not
> accidentally write to the flash chip. It contains BIOS and other
> important firmware so touching it (if it is not locked in the BIOS side)
> may potentially brick the system. That's why we also require that
> command line parameter so the user who knows what he or she is doing can
> enable it for writing.

The same thing can happen with the platform driver if you load it
once with 'writeable=1' and then unload, leaving the chip in writeable
state. If you load it a second time without the module parameter, it
will be in the same state as the PCI driver: the hardware bit allows
writing, but the MTD layer prevents writes from being issued to the
device.

> Actually thinking about this bit more, to make PCI and the platform
> parts consistent we can make the "writeable" control this for the PCI
> part as well. So what if we add a callback to struct intel_spi_boardinfo
> that the PCI driver populates and then the "core" driver uses to enable
> writing when "writeable" is set to 1.

If you are really worried about the write protection being bypassed by
a different driver or code injection, the best way would seem to be to
only enable writing in the mtd write callback and disable it immediately
after the write is complete. I still don't see why this hardware would
be more susceptible to this kind of attack than other drivers though,
as it already has the safeguard against writing through the MTD layer
without the module parameter.

       Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
