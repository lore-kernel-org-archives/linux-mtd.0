Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC644C001DB
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Aug 2023 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GhXwibNqdAM+iVSaH+MgcT9LYYgoh1Z9gy/WHj71pIU=; b=CP0VxQRzjT4G+g
	raQlzNh6K6f873IHlHJRB/P5ATGQTOR8sCaWLYnxxCehNzN22ggAcqk+gPMqqZdQpIn1QZ4g0SB/U
	qQ5EIKhCTsCbwBTgWQNNbaus0DxNSk2WGFtJW+qMo1ikD8AsMXPyTO1kggoWw2BZBTnpA9+eaRfUy
	rYdSMBRkCu/ymI1n8QqWp1geDJt/TpRVk2uMBB3HO+yySTvfQ+qSLAEee5uEf15B1nunVAdIsQP+S
	ZyZFPZfz/jGXjuABxw5kRPyZpR22NdmJAeXccH+05mm0UUxYhTkctHz+q7e9dQRNh6knrdYR1bg5V
	oBj0hHYJiBxSY07DvqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKS1-002QeW-2K;
	Tue, 08 Aug 2023 11:00:33 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTKRx-002QdY-2q
	for linux-mtd@lists.infradead.org;
	Tue, 08 Aug 2023 11:00:31 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bd0afbd616so133801a34.0
        for <linux-mtd@lists.infradead.org>; Tue, 08 Aug 2023 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691492428; x=1692097228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Klg6b7rTmA3/2CEHhPBL9kFFomypTM/SqIrAORONAmA=;
        b=D22YIgpp/2H4eBXOOz8Y5rmtHfHEuwtkAzjbthwRKTGtZLfKiSCTfu9JQlNKW6pH7f
         hVrB/n9zgtXR29b9Z2gV+GLnXaTZn/wOifCYkKpGjJtZV/wYKM9FtrrJm+MMKpt48Tok
         YV2c7FoNwBFR6xJy5KCf8mVjiH66r6r/LPrXfawWmp2zKmaVxTLwZdyt9cNzzcQ49HW7
         6P2qVeTnjn16lhsXemJ+DOEDf38jg66A8bPcgBMCVLXErGd8IZFhcta73eSBZ8VblcGl
         2OuR3ucayKRA/AFKjCarY6gjc3LQb4l3Dqa2wgxhDYUy31DERQVgDL+hIFAIGcJu20aj
         39cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691492428; x=1692097228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Klg6b7rTmA3/2CEHhPBL9kFFomypTM/SqIrAORONAmA=;
        b=A3I813+dQleLWFTPscXuorI+fby7yyWRTMOg+XEXTMcmNqda/SjJCeh8z6U2q2BFWc
         zHs+VJYv570Eb7Y+MNuJRK5bDdXVqKxft+JtW3ANZF9snBwYpJ3ti3PBn7zNYnLqxKKB
         g1WNCnuX8c8v4pnPhrSQ+JZGg2BgHV+HwFPOlkQYuFV360cH9GfK/Ppy6sKDpSJF6ds6
         Qv9QaH9u9uYPGi8cDFaTozp0rWXXD4vTbE8PVuSZKrLa7N6Kqlr6PMV2g5uJyPySNtqW
         Fjyo+iVPnKqHJIIvSFJR5v2tULrS02xLMHbK9bDQcrvFZOausa4wg4XsL9BJdwpoAg6j
         E9qg==
X-Gm-Message-State: AOJu0YxjylseNYcgbwVhDo9Pzr5uBthG7wzBbih5+1pfhA1bhr6AtmRz
	NjOwFCItSSeCy5bOluleaDaGQVqcf8pTFBghG3mlcA==
X-Google-Smtp-Source: AGHT+IFyFm7A28IM+G0on9OcPQxQMVC4tFTmtVJz+gYpID8XubCbPflmb8sfgiBS79hEh9WW2BWOpIws/LS1JffnNds=
X-Received: by 2002:a05:6358:419b:b0:134:ca8a:7486 with SMTP id
 w27-20020a056358419b00b00134ca8a7486mr11887238rwc.28.1691492428398; Tue, 08
 Aug 2023 04:00:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1689802933.git.daniel@makrotopia.org> <1ce5f56df546cec25ef741f381286f1d7c33d000.1689802933.git.daniel@makrotopia.org>
 <CAPDyKFqhZtCHVmCNnm_Qm7X+=GtJY8uNJOWOgZXuTTVEw0msNA@mail.gmail.com> <ZNGULFxXpLT7zn35@makrotopia.org>
In-Reply-To: <ZNGULFxXpLT7zn35@makrotopia.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Aug 2023 12:59:52 +0200
Message-ID: <CAPDyKFrpWgA=e-FSoKfYhWSOq5m5_pHjxgzaGeOFHFhU_mcmNw@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] mmc: block: set fwnode of disk devices
To: Daniel Golle <daniel@makrotopia.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Dave Chinner <dchinner@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Jan Kara <jack@suse.cz>, Damien Le Moal <dlemoal@kernel.org>, Ming Lei <ming.lei@redhat.com>, 
	Min Li <min15.li@samsung.com>, Christian Loehle <CLoehle@hyperstone.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Hannes Reinecke <hare@suse.de>, Jack Wang <jinpu.wang@ionos.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Yeqi Fu <asuk4.q@gmail.com>, 
	Avri Altman <avri.altman@wdc.com>, Hans de Goede <hdegoede@redhat.com>, Ye Bin <yebin10@huawei.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_040029_920142_AAF21786 
X-CRM114-Status: GOOD (  28.15  )
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

On Tue, 8 Aug 2023 at 03:02, Daniel Golle <daniel@makrotopia.org> wrote:
>
> Hi Ulf,
>
> thank you for reviewing and suggesting ways to improve this series!
>
> On Mon, Aug 07, 2023 at 03:48:31PM +0200, Ulf Hansson wrote:
> > On Thu, 20 Jul 2023 at 00:02, Daniel Golle <daniel@makrotopia.org> wrote:
> > >
> > > Set fwnode of disk devices to 'block', 'boot0' and 'boot1' subnodes of
> > > the mmc-card. This is done in preparation for having the eMMC act as
> > > NVMEM provider.
> >
> > Sorry, but I don't quite understand what you are trying to do here.
> > Maybe you should re-order the patches in the series so it becomes
> > clear why this is needed?
> >
> > Moreover, I don't see any DT docs being updated as a part of the
> > series, which looks like it is needed too. That would also help to
> > understand what you are proposing, I think.
>
> I've prepared a tree on Github which now also includes commits adding
> dt-bindings for block devices and partitions, so they can be referenced
> as nvmem-cells provider.
>
> The dt-schema addition supposedly explaining this specific patch:
>
> https://github.com/dangowrt/linux/commit/b399a758f0e1c444ae9443dc80902a30de54af09
>
> The whole tree:
>
> https://github.com/dangowrt/linux/commits/for-nvmem-next

Thanks for sharing. However, allow people to review, I suggest you
post a new version with the updated DT bindings included.

The point is, we really need confirmation from the DT maintainers -
otherwise this is simply a no go.

>
> Most comments have been addressed, however, I still depend on using
> either a class_interface *or* adding calls to add/remove the NVMEM
> representation of a block device to block/genhd.c as well as
> block/partitions/core.c, simply because afaik there isn't any better
> way for in-kernel users of block devices to be notified about the
> creation or removal of a block device.

Okay, so that needs further discussions then. I will try to chim in.

[...]

Kind regards
Uffe

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
