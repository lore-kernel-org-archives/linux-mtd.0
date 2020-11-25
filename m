Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68A1C56201
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 09:02:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F93206F9
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 09:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUIYc2Xu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mess.org header.i=@mess.org header.b="SJYLrwiK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F93206F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AWogX0x0E766O7D6GJuU1h+OxN9sOPsoQLKezNmtvz0=; b=MUIYc2Xuw5OEWGMkoVQQ2LS4v
	KkA+8a0jnFhfeHxqMz246nnxoszEvAs6myvyVj4zNOakckl1hznfnYBJmo8arZW8Ud97J4R3wqu4+
	k/F+GmF2Y6jAC3gmoeWaI7uDjV4gUgFKmWZFR7gS3P26m4DbCO1lDowCqCB8lezYFbXOQ5yCr1EcU
	OCxAYglmMROERsHzSl0sDYLJSg3vQD92NfnVuQ4cMO7cjt5IO+9ky1RWM5T1+mlWJTpAmkMq2TV71
	1qAPCp92jrP8Rmv6HpGtIOYtN1lsuuJJQhm54DxqknlrCBPgEUeg20oxROKhwmzHgR49aj48F5nMp
	xhwtX4Ltw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khqg2-0006tH-JF; Wed, 25 Nov 2020 09:01:26 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khqfw-0006r3-3s; Wed, 25 Nov 2020 09:01:21 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id C2D44C63FB; Wed, 25 Nov 2020 09:01:14 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
 t=1606294874; bh=KH9dzgywMXfGPGDwmO8Qm6o//zr8KQDL4nO6EawRuDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SJYLrwiKZrmMRjkeBYo7cqsbs6xljPuQypU3vE6W0mhxhiBNmXN2bqL5RV07d2awA
 Wb5Oa7L0TiIxfU/vxoLt2vFycI3gN8Kh1qdOF59uK2dEnqITAnDV+wsiQw/exDF78D
 hoTz22IC76edW7bl4Xm8hYrqoRAlLOCNTSbizDTKI7x8BBnutJW03OyPsTxurVqfdC
 T9t8y4uSMzXA9L5TYoAbkkzEdR07qHfBTYdhaiYGGYuE1E1bdzLhtRTU2iYu251NBa
 zqIr2827TZMk9I1fNh/951tgkmCQWewUCt5nrmXnkgqHhLp9nxDE6gWAGCUXG6XCXv
 3mw8Hv064saVQ==
Date: Wed, 25 Nov 2020 09:01:14 +0000
From: Sean Young <sean@mess.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201125090114.GA24274@gofer.mess.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
 <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
 <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
 <CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
 <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_040120_405194_6275BD6F 
X-CRM114-Status: GOOD (  24.11  )
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
 dri-devel@lists.freedesktop.org, linux-kernel <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 GR-everest-linux-l2@marvell.com, wcn36xx@lists.infradead.org,
 samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
 linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
 usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
 linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-sctp@vger.kernel.org,
 linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
 linux-integrity@vger.kernel.org, target-devel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 23, 2020 at 07:58:06AM -0800, James Bottomley wrote:
> On Mon, 2020-11-23 at 15:19 +0100, Miguel Ojeda wrote:
> > On Sun, Nov 22, 2020 at 11:36 PM James Bottomley
> > <James.Bottomley@hansenpartnership.com> wrote:
> > > It's not about the risk of the changes it's about the cost of
> > > implementing them.  Even if you discount the producer time (which
> > > someone gets to pay for, and if I were the engineering manager, I'd
> > > be unhappy about), the review/merge/rework time is pretty
> > > significant in exchange for six minor bug fixes.  Fine, when a new
> > > compiler warning comes along it's certainly reasonable to see if we
> > > can benefit from it and the fact that the compiler people think
> > > it's worthwhile is enough evidence to assume this initially.  But
> > > at some point you have to ask whether that assumption is supported
> > > by the evidence we've accumulated over the time we've been using
> > > it.  And if the evidence doesn't support it perhaps it is time to
> > > stop the experiment.
> > 
> > Maintainers routinely review 1-line trivial patches, not to mention
> > internal API changes, etc.
> 
> We're also complaining about the inability to recruit maintainers:
> 
> https://www.theregister.com/2020/06/30/hard_to_find_linux_maintainers_says_torvalds/
> 
> And burn out:
> 
> http://antirez.com/news/129
> 
> The whole crux of your argument seems to be maintainers' time isn't
> important so we should accept all trivial patches ... I'm pushing back
> on that assumption in two places, firstly the valulessness of the time
> and secondly that all trivial patches are valuable.

You're assuming burn out or recruitment problems is due to patch workload
or too many "trivial" patches.

In my experience, "other maintainers" is by far the biggest cause of
burn out for my kernel maintenance work.

Certainly arguing with a maintainer about some obviously-correct patch
series must be a good example of this.


Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
