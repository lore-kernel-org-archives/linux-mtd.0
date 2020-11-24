Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B065C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 01:01:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69902073C
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 01:01:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mfCLNsBw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C69902073C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+xS4w7jFjVftRAUcAGN1hLrLoS7MjeUNqiz9AXbmJcY=; b=mfCLNsBwkcgL9AkZrQgsyIwgv
	3n0uPIwCV8HhfPYT4LzsNdE7aYn7Wk1nFTG9LWNiOqlsgD0Qoe/da4CJPjBkUvhvYfnY26CSDe7YF
	r5AAt3sxNg8hSLzDg8qx12i6R+IGBCZEnCwsoYJe/W71ZYgQKrln0akVokAPO0U+lPMkKY1xWUTmL
	BWlDD634Ck2LRPGR0bqm8DUaXIEMiA/tkizVfeEGtm7MJ/YKNsP9H6+WdjxIEGjQ5vq93xtu6/SER
	UMaoYZYHf+BYzCUcU6F+2whySIWwdi9LRDK9LaL63xHkTLDoJJJ2OUh7kW0e3ZLjzAmMDN9c3dHaD
	NxKX2NoCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khMfY-0004wa-8c; Tue, 24 Nov 2020 00:58:56 +0000
Received: from kvm5.telegraphics.com.au ([98.124.60.144])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khMfO-0004uH-Hs; Tue, 24 Nov 2020 00:58:47 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id 0EF842A8E0;
 Mon, 23 Nov 2020 19:58:39 -0500 (EST)
Date: Tue, 24 Nov 2020 11:58:37 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
In-Reply-To: <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
 <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_195846_722086_ED051A37 
X-CRM114-Status: GOOD (  25.82  )
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
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
 reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-wireless <linux-wireless@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, GR-everest-linux-l2@marvell.com,
 wcn36xx@lists.infradead.org, samba-technical@lists.samba.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-afs@lists.infradead.org, usb-storage@lists.one-eyed-alien.net,
 drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-scsi@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>, linux-rdma@vger.kernel.org,
 oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
 linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, coreteam@netfilter.org,
 intel-wired-lan@lists.osuosl.org, linux-input <linux-input@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
 xen-devel@lists.xenproject.org, nouveau@lists.freedesktop.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-nfs@vger.kernel.org,
 GR-Linux-NIC-Dev@marvell.com, tipc-discussion@lists.sourceforge.net,
 Linux-MM <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On Mon, 23 Nov 2020, Miguel Ojeda wrote:

> On Mon, 23 Nov 2020, Finn Thain wrote:
> 
> > On Sun, 22 Nov 2020, Miguel Ojeda wrote:
> > 
> > > 
> > > It isn't that much effort, isn't it? Plus we need to take into 
> > > account the future mistakes that it might prevent, too.
> > 
> > We should also take into account optimisim about future improvements 
> > in tooling.
> > 
> Not sure what you mean here. There is no reliable way to guess what the 
> intention was with a missing fallthrough, even if you parsed whitespace 
> and indentation.
> 

What I meant was that you've used pessimism as if it was fact.

For example, "There is no way to guess what the effect would be if the 
compiler trained programmers to add a knee-jerk 'break' statement to avoid 
a warning".

Moreover, what I meant was that preventing programmer mistakes is a 
problem to be solved by development tools. The idea that retro-fitting new 
language constructs onto mature code is somehow necessary to "prevent 
future mistakes" is entirely questionable.

> > > So even if there were zero problems found so far, it is still a 
> > > positive change.
> > > 
> > 
> > It is if you want to spin it that way.
> > 
> How is that a "spin"? It is a fact that we won't get *implicit* 
> fallthrough mistakes anymore (in particular if we make it a hard error).
> 

Perhaps "handwaving" is a better term?

> > > I would agree if these changes were high risk, though; but they are 
> > > almost trivial.
> > > 
> > 
> > This is trivial:
> > 
> >  case 1:
> >         this();
> > +       fallthrough;
> >  case 2:
> >         that();
> > 
> > But what we inevitably get is changes like this:
> > 
> >  case 3:
> >         this();
> > +       break;
> >  case 4:
> >         hmmm();
> > 
> > Why? Mainly to silence the compiler. Also because the patch author 
> > argued successfully that they had found a theoretical bug, often in 
> > mature code.
> > 
> If someone changes control flow, that is on them. Every kernel developer 
> knows what `break` does.
> 

Sure. And if you put -Wimplicit-fallthrough into the Makefile and if that 
leads to well-intentioned patches that cause regressions, it is partly on 
you.

Have you ever considered the overall cost of the countless 
-Wpresume-incompetence flags?

Perhaps you pay the power bill for a build farm that produces logs that 
no-one reads? Perhaps you've run git bisect, knowing that the compiler 
messages are not interesting? Or compiled software in using a language 
that generates impenetrable messages? If so, here's a tip:

# grep CFLAGS /etc/portage/make.conf 
CFLAGS="... -Wno-all -Wno-extra ..."
CXXFLAGS="${CFLAGS}"

Now allow me some pessimism: the hardware upgrades, gigawatt hours and 
wait time attributable to obligatory static analyses are a net loss.

> > But is anyone keeping score of the regressions? If unreported bugs 
> > count, what about unreported regressions?
> > 
> Introducing `fallthrough` does not change semantics. If you are really 
> keen, you can always compare the objects because the generated code 
> shouldn't change.
> 

No, it's not for me to prove that such patches don't affect code 
generation. That's for the patch author and (unfortunately) for reviewers.

> Cheers,
> Miguel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
