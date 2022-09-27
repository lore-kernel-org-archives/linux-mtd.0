Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C095DC54EE9
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Sep 2022 23:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9rMFSi5UR6aoRYq3N8VD47fHkDmD2bP9ZN925ntt2cg=; b=LuuO90uIRxJ/Gj
	KCLqdJqm3Fu6vd8/Wxbwb7OKbzrUIEDXSMBG9fBfjHxaZ5KMo7KgxHctywNBiV0qQbPr1ehStzQnP
	9CGjfd231DMVB75HmJVU0MsRg+FccjX7Ug/1DjGpzMRRlb987PGD6yxkV8hGkzUOrUDm/Y3g6Rk95
	cSR6YR0FZwFOwU6jxUCEt0do5d25Bc+x8jK2MNSdO/oN6cxw81uykd5yNn1yKLk4OFL+EReBTo+a2
	+OOrlEjQ4hTV0vMbRz7vbidi5lAMhsipMpDJFIluDKbWONdEnmO76B/oYXlz5jEe/EgcV2co29kxJ
	MX2pvNmHFYvwRPwFC5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odK3W-00D9Q2-Hh; Tue, 27 Sep 2022 23:32:02 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odK3O-00D9Po-9y; Tue, 27 Sep 2022 23:31:54 +0000
Date: Tue, 27 Sep 2022 16:31:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Kai Vehmanen <kai.vehmanen@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v6 0/4] Let userspace know when snd-hda-intel needs i915
Message-ID: <YzOH6oV6B6UKb7DF@bombadil.infradead.org>
References: <cover.1652113087.git.mchehab@kernel.org>
 <Ynl7xGy+a9MYjXi1@bombadil.infradead.org>
 <20220920072454.4cf91f24@maurocar-mobl2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220920072454.4cf91f24@maurocar-mobl2>
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

On Tue, Sep 20, 2022 at 07:24:54AM +0200, Mauro Carvalho Chehab wrote:
> Hi Luis,
> 
> On Mon, 9 May 2022 13:38:28 -0700
> Luis Chamberlain <mcgrof@kernel.org> wrote:
> 
> > On Mon, May 09, 2022 at 06:23:35PM +0200, Mauro Carvalho Chehab wrote:
> > > Currently, kernel/module annotates module dependencies when
> > > request_symbol is used, but it doesn't cover more complex inter-driver
> > > dependencies that are subsystem and/or driver-specific.
> > >   
> > 
> > At this pount v5.18-rc7 is out and so it is too late to soak this
> > in for the proper level of testing I'd like to see for modules-next.
> > So I can review this after the next merge window. I'd want to beat
> > the hell out of this and if possible I'd like to see if we can have
> > some test coverage for the intended goal and how to break it.
> 
> Any news with regards to this patch series?

0-day had a rant about a bug with it, it would be wonderful if you can
fix that bug and rebase. Yet again we're now on v6.0-rc7 but it doesn't
mean we can't start testing all this on linux-next. I can just get this
merged to linux-next as soon as this is ready for a new spin, but we
certainly will have to wait until 6.2 as we haven't yet gotten proper
coverage for this on v6.1.

Is there any testing situations you can think of using which can demo
this a bit more separately from existing drivers, perhaps a new
selftests or something?

  Luis

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
