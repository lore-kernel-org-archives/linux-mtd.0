Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636FEC433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:33:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 312B0206F0
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:33:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VBtOsMWf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 312B0206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=opgpKVlLSE9c29CiwS2SllbGbja+vtodplDAknAPRvY=; b=VBtOsMWfs+nCYU92VtK3FrwoP
	4/Ln4HmxO22YFsQiO/NZjb+4NjopoBPcyjxXUe2xIFlHhTHnu/IB1daOkjV0ujbshHNR8/s6JjzPp
	OBz0Y7yjjlQxZSta7yO8PBjsC+Cd/EyXyfnGRvvi1JQF1rfl7RyBH0Ovw1hi6SUvbIUIhPY2ESJz1
	ZHxDQRNK4Gc0kUQPnUley2xss6vtA/RfZIPCD2MdJJ1EbHS+S2P981S6UTCXLjyhl9pKpsE17WNkM
	Vg1ZZR5WTEGN2Zgnr/iIr0kDewayHSGg1TmDlFe7jVFCriufMt/+YWcy0sgHdyz1tdAEPK2ldRgCr
	HlpP4LezA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA8ph-0003W7-2C; Mon, 24 Aug 2020 09:32:05 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA8pe-0003VU-6r
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2020 09:32:03 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MybX9-1kZ6no16mj-00yxc8 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug
 2020 11:31:57 +0200
Received: by mail-qk1-f169.google.com with SMTP id g26so6786170qka.3
 for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2020 02:31:57 -0700 (PDT)
X-Gm-Message-State: AOAM533xlzHOQZfB6kwwH+GiiUkfCoP5CXE/R9GtLMv/uvdHzgbm2vSM
 WUBMzMubdt2Gh0/4/bBGwWr6oKiQeSK9L8qCHIw=
X-Google-Smtp-Source: ABdhPJystfMSTfuUPFEBNm3xdo71/RSSgQxQfaXlBeE+UqaTU58CsAkPxILy9i4UtLKyOuYGBI8PdeyLKTEES0M2Zo4=
X-Received: by 2002:a37:6351:: with SMTP id x78mr3784606qkb.394.1598261516064; 
 Mon, 24 Aug 2020 02:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a13N_wNORz_3cYHTN8t29pPrY+dJ+g+1Ga_MmG1TmrUQw@mail.gmail.com>
 <CAFmMkTGm3pMsBzEenYOsRbhOZKFhbHiZ5LxPyVmTdYTTRpKzVQ@mail.gmail.com>
 <CAK8P3a2_RV33kiJ0c34aopZ4iG7LYBR-u=-+BbC+Upyjh1T0Eg@mail.gmail.com>
 <CAFmMkTHqQO1Gj7VeXr4Y_Umb1KzZc2Pf=1pDQvPPpb_XeAFPqQ@mail.gmail.com>
 <20200819065721.GA1375436@lahna.fi.intel.com>
 <CAK8P3a0Bq-ucgC4Xue+B_HV97pTX8YRr4hYh1gfrfGBV_H1EUQ@mail.gmail.com>
 <20200819091123.GE1375436@lahna.fi.intel.com>
 <CAK8P3a19MLfQARXEWzCD-ySq4t9nsyryB+con33HsQ193+muMw@mail.gmail.com>
 <20200824082227.GU1375436@lahna.fi.intel.com>
 <CAK8P3a0==cZDHwZfqvCuvUg9jfjBOBG+AAomE9eqJ2xm-xNLvQ@mail.gmail.com>
 <20200824091542.GC1375436@lahna.fi.intel.com>
In-Reply-To: <20200824091542.GC1375436@lahna.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 24 Aug 2020 11:31:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ipcVLOzZ5jsDSmWkm=rsE7UQ8rgTU-o6me+vX+gVa9g@mail.gmail.com>
Message-ID: <CAK8P3a2ipcVLOzZ5jsDSmWkm=rsE7UQ8rgTU-o6me+vX+gVa9g@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Do not try to make the SPI flash
 chip writable
To: Mika Westerberg <mika.westerberg@linux.intel.com>
X-Provags-ID: V03:K1:eqWnd2a0q5cNk24VDMUYqFcb0QR8bCBJR5rdXLmpiQMIMtCHlcO
 SAL7a8qG24Bfw/B9lvN6gzmijRe3MhteOqnChBhNuYOg0CSn0NV1PiuuHi/9b/MJ172BtDI
 ETux0t2vi7qs584JuQShQXRKmUFSiAoLNgacU8y0ZNvB95dxZthgDijajMrQ6JfRav2cZgx
 u3EMlpSNgX0dSDlXjLfwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ko6cobt119Q=:exB5QtrsQDhT3D4j97oOcr
 zHXYXqzSQGF4my6cf/5lhTqCvvR1BvZfvQKpBCpRXKMT8/ClI7vLfLPfsilqGPq1XxbomrEbV
 gpiVLsg7TlDyHgBrGYAeSFBcrTXZnH+nzIRSXrTJMPEkvuwrN+08YDpQL+cdL4KwpaRKkQ4eP
 cYuIKhpXpJA+XEgFeVCarNS5TX+JJl8ZEYsPjYSXs/YUkIjHrn1GUifNdua4QhWbWJe/zp3Kf
 +UHYs1TYcTeCSucjtuY4cYENOtXpxMMd5HeDbkWbwTOuGdCdYY+ULSbUsc2pdJ9etv6leNYLi
 76F4uHJs/w5vPExDuo/DlEu5+UAj//bFKR+mFwwDHOO2klGDr2k0d2LHIW7Z2Zo6C7th/PIyp
 HF6fKczOGQFx8Ps3H7UXfNS/E0SH6fy3Ajt+S3stkXM/KNgZO7vBNxYeMPtPFP+p94hR0+78E
 6OaJ6qdbm3Iwj6VHRZBL9bzs9uLoz6TDxbwgrGn1+5qvkvgPjJk2cbmbvDrdmQ4cXtXRO1XAQ
 i13X1ETRshlS9qDvGwslrHvA1pdzRRXNMln6Z7CrvtaEo105EQuWpWl6F5EOw1wJufJgkmTEZ
 CG8b3IAX5p/BPzFDD0ouSRWQv4e9XOISkx5ZyYh/5qA5LCVx42QYubepZuRWjWBGgzjuSxExv
 pQTed8IFLAHRkU1PITOW3RsbbRryahYYGW3FBZ1RRKx3wNpojP3GzkbbNAkSb0LmXJ5lsRXWg
 valGPWz8p2WGecYl80xfl9P/gRzx0gNXr3tyYCDv7eGB+QSsakkPUHBXq8Ik+5dYdRX1SHRhI
 ufcgPjoJayZ8I6fs6emug4Hg2oQ8v/pVUivpe2Cw3b4ecDnewss5eUbtojl6Xax0W6EyGiyGU
 kBzYmU53HRSDiljytNHacKbyZd1FLuQuxSc+CSsZLgf4ejQ7GpzoiDJ19GBvcPBJx66n8XVtB
 B3d4oJx30U0ir3etQBK9HEdnozQBX/SigTW823usAleCERCQg9D2C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_053202_557080_A534F364 
X-CRM114-Status: GOOD (  27.56  )
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

On Mon, Aug 24, 2020 at 11:15 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> On Mon, Aug 24, 2020 at 11:08:33AM +0200, Arnd Bergmann wrote:
> > On Mon, Aug 24, 2020 at 10:22 AM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > On Sat, Aug 22, 2020 at 06:06:03PM +0200, Arnd Bergmann wrote:
> > > > On Wed, Aug 19, 2020 at 11:11 AM Mika Westerberg
> > > >
> > > > The mtd core just checks both the permissions on the device node (which
> > > > default to 0600 without any special udev rules) and the MTD_WRITEABLE
> > > > on the underlying device that is controlled by the module parameter
> > > > in case of intel-spi{,-platform,-pci}.c.
> > >
> > > OK, thanks.
> > >
> > > Since we cannot really get rid of the module parameter (AFAIK there are
> > > users for it), I still think we should just make the "writeable" to
> > > apply to the PCI part as well. That should at least make it consistent,
> > > and it also solves Daniel's case.
> >
> > Can you explain Daniel's case then? I still don't understand what he
> > actually wants.
> >
> > As I keep repeating, the module parameter *does* apply to the pci
> > driver front-end since it determines whether the driver will disallow
> > writes to the mtd device without it. The only difference is that the pci
> > driver will attempt to set the hardware bit without checking the
> > module parameter first, while the platform driver does not. If the
> > module parameter is not set however, the state of the hardware
> > bit is never checked again.
>
> I think Daniel wants the PCI driver not to set the hardware bit by
> default (same as the platform driver).

Sure, but *why*?

    Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
