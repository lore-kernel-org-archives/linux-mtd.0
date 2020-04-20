Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE37CC3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:45:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7979A208E4
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:45:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lq7b799S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qk9faXpZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7979A208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eyhYdQQg9iq7NfdYepAxaZxw9jzkIh3C0E+0l/rPeqM=; b=Lq7b799SuW637l
	EAxIyZGvn8CDTK6KqqUXwozmSrFSzhxXOJSJmjPYGlvpwlP47N6KPmz8dh670QXVvDdDUTIFec1kW
	HQOZ0+roF386eqiIWGEK8833Cobn+cDA8vf2BD993Vnf4BZOrQq/8Sx0rqchOpeIRqKyPxYy03KAK
	pznYtn7G8oRvekRmm6WC0EsMa6+O4g/28T3VAYx86X6P29/5qASnnfJW6hI0J+fv3T0qEgDhifqv4
	kdjp3WhLBH02frRt5tfJEHS4IePnifyRwQ45mtkBG78KtenptlQ9/ZfwfyMd69nzWZVbjxtFhc1eP
	QGrRipUo51HRlF+7cHuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQSzE-00029l-Rr; Mon, 20 Apr 2020 09:45:08 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQSzC-0000qd-1l
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 09:45:07 +0000
Received: by mail-pl1-x641.google.com with SMTP id t4so3738693plq.12
 for <linux-mtd@lists.infradead.org>; Mon, 20 Apr 2020 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F+XcpZEsWmJmu2jfdAwkWGI+jCZB3DGbfi1Ga2IHxyw=;
 b=qk9faXpZk6XzibVEOfRwfbql5CkYatmcsjpMfy17YSRMgeX3bsV3d2wgOfAfpn0qaO
 +WBgB26ZaTXwc/7dURZ/bzbWGQWG5fhoiOIek0NChA7C7S1Kfj3LtRywiYIRlGUhJgQc
 mlq2GgSqxDURI2sRh9xoWJHJwCZGtpUFDEfULO071x4l3IHQFRO6ecthNnD/kJppcVh2
 4c5famVIPqEKQPz+nzL2hWZ2Q2ajrLwfKTL48d4E8fjD1I8XMjvSDL7UaTJqNTLG2AfE
 8BHx5wlo3NsAKjGOLwBYq6QVC3nLlh2qSUXkKQ8jhDHViItBU2Zgj0c9adzu8r7HE1lO
 L1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F+XcpZEsWmJmu2jfdAwkWGI+jCZB3DGbfi1Ga2IHxyw=;
 b=hT0u/aKbfLHPfpioMQEFCdUOaz9fZGuPiHD7Ij5fcSKcj6nieYaWGGtLPQG5UEqOyB
 gDfo7j+UB3tNrHyxQk2yNamVl85goFv0r4Mc8dldFYtJrA/byTv4WZCGU1iY2Nt8x+4a
 QSdP66RYP7GfKPeu2wO26vT1GUQwgSS2qyTwojbyTvHo5fRT0lbtm0UCxL/sVhZny/Qz
 t/m3tqv+2UbV5YtThswrlayBsYyy/Wob8oYxj01pmbU64j+trY6u1LkXlKKQH3AYsOv2
 TeWtVedoS4p+BIZg7Uqvmx4lrO0WdBR6JUOjih4X3wPFS7bzeotnQbCBRWNAlOod+eem
 +Q3w==
X-Gm-Message-State: AGi0PubYY6L7fIHYxVUb78VWvbvSPhbTpjqvnTzEMmFuk4n/KdXuEDw9
 HQ2oIOyzAfAZvqHXl2qybkYM4kmlOTYmam9Ouyg=
X-Google-Smtp-Source: APiQypKR5OqIb6o/nxyC3oiRNXPMjBFOmxp17fC3wElumd+N26CQvbwy/RWCvQ4QNO5kpA2YngvLzkAWC7YTfQznbM8=
X-Received: by 2002:a17:902:9306:: with SMTP id
 bc6mr15802376plb.255.1587375902969; 
 Mon, 20 Apr 2020 02:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <20200419222040.GJ185537@smile.fi.intel.com>
 <20200420111754.5863324b@collabora.com>
In-Reply-To: <20200420111754.5863324b@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 20 Apr 2020 12:44:51 +0300
Message-ID: <CAHp75VeOH+DC362tsEo13gr9fJpeCHXok=7O19B3njbxCOzd2A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_024506_122904_F67BEEC6 
X-CRM114-Status: GOOD (  15.98  )
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
Cc: cheol.yong.kim@intel.com, devicetree <devicetree@vger.kernel.org>,
 qi-ming.wu@intel.com, Anders Roxell <anders.roxell@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 "hauke.mehrtens" <hauke.mehrtens@intel.com>,
 Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>, masonccyang@mxic.com.tw,
 piotrs@cadence.com, Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Apr 20, 2020 at 12:21 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> On Mon, 20 Apr 2020 01:20:40 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> > On Sat, Apr 18, 2020 at 10:55:33AM +0200, Boris Brezillon wrote:
> > > On Fri, 17 Apr 2020 16:21:47 +0800
> > > "Ramuthevar,Vadivel MuruganX"
> > > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > >
> > > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> >
> > > > +static const struct of_device_id lgm_nand_match[] = {
> > > > + { .compatible = "intel,lgm-nand", },
> > > > + {}
> > > > +};
> > > > +MODULE_DEVICE_TABLE(of, lgm_nand_match);
> > >
> > > You probably have a missing "depends on OF" in your Kconfig.
> >
> > Since it's using device property API, dependency is not needed.
> >
>
> There's no compile-time dependency, but this driver will be pretty
> useless if all its users have the NAND controller node defined in their
> DT and CONFIG_OF is not enabled.

No, it's not.
See [1] for the details how ACPI may utilize this table.

[1]: https://www.kernel.org/doc/html/latest/firmware-guide/acpi/enumeration.html#device-tree-namespace-link-device-id

> I guess the OF option is selected by
> arches, so explicitly depending on OF is only relevant if you change
> the dependency rules as suggested in my other reply.

-- 
With Best Regards,
Andy Shevchenko

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
