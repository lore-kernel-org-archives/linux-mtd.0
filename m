Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66670C2D0E4
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:33:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 175982151B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 00:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="czgVLU9B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYdo15DH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 175982151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O3h5kAIb4Y2h7FjRoRQu9+zboE82RsTQpyJOhTbW4A0=; b=czgVLU9Bwz7KjPO9/E+THALGh
	SKK2sWCeD6kyXnv9ctSSByGK8eZiGJ1W6eBRchfBQptdz3eGAXxaJJEMqzbeLdRZEl1c5XhSpG+pt
	Fmx5HgOefrovx7LLZQuOtw3lWgnILfuBMa/BRbDOrfq04T65R+OJlRK0KGhaly6QiqUKxUcvc694Y
	F5JHmb87xgIc8uI9IeLV+wUeAoyA5+VmeFSuH+Dx4OU5v55CNTWJqIKjdAN/vgabkOAI1bJSWp8zH
	8yMOI7+OLgVg3VGL0yluN82h7ufnJokL/dXbyp3WDfLWPLZcm+CwZHHTehVRFsCa85QOdY7nkEvCp
	YJzNB4tow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khijd-0003tq-0z; Wed, 25 Nov 2020 00:32:37 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khijW-0003rb-Cx; Wed, 25 Nov 2020 00:32:31 +0000
Received: by mail-qk1-x741.google.com with SMTP id b144so1289460qkc.13;
 Tue, 24 Nov 2020 16:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QqqubA90NyDjnD5SH+OxnZbso0TzlLiuZ5gzRUm0zsY=;
 b=DYdo15DH5n4eMCA51W2vXZfybVLPbTpwO6CR+j1CET94cx9FmUQEkAzz4OadVdmrht
 /5QscdfYh1sAKLvu6dkrheNjvEoR4Mdvvl3diWkBzFiGJNP9BCqxLhr4zTkKEaaVMxi5
 qUA6kNkUTJzI9KEPxIujLpbBVVOhJKSQSAf+FeTM6jY84RGcXl9jGks4AfD2ojo1GxQQ
 uEwHm9wuAxdOf70IRL+AXs8sujZOQd+kSEI1eU2QAsFia5W6QaIddZOITngYX9DSKM5R
 mNvBJUTqyzODtQONxErP8O8dRkCcVm25oDOfEuyrse782pSy0gFJjFFgzHOgMIi8mZem
 jSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QqqubA90NyDjnD5SH+OxnZbso0TzlLiuZ5gzRUm0zsY=;
 b=DAsvKkYU/AXgBiuKqT4cPuiFfjAIsrmUzeG/jFVsLhPJymjbGtisDNECatHYClryJK
 w7KDzJWw/l60YO1kgWy2CUWamJxlvH1yu4/M682fxdqVAbjc8BW+57UTDo3+LdrAPGis
 xV43JdOWkg7DSXFy+vc+1iKKQl0Kmn7crDbtIkt28xPEhz+wRYqVY5RJGuugIEFyFIbq
 v8pIgryqY8g7Y1BYlNWKZvzomIfzwywxiMMC4STgdexZiQZVW3oluV3sN7UdMR1ptl4O
 cyZdqCFC7RagdLsHAnyXK+uU+4Ghx2U59cNF4wNHDFoFd3S+9xJZ2NqybB/e9vYFC16r
 bQyw==
X-Gm-Message-State: AOAM533b2xRm55uDUuYmz9CEwZ6p/U7Y2toorJrs0qotPG+VYB9v+Nwg
 y8YGz7cb0SQlNIxzBsIxH+28PefAZoHQIj78nFg=
X-Google-Smtp-Source: ABdhPJwwVKQFQuxzNO/2Mi/lJ3RUII3vPq9FIwhq+sZ6y3vyBbFPDKm/uCaEGwo9LU3j1fjBVCpYTO563lD14rGXSok=
X-Received: by 2002:a25:5f0f:: with SMTP id t15mr779915ybb.26.1606264348932;
 Tue, 24 Nov 2020 16:32:28 -0800 (PST)
MIME-Version: 1.0
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
 <CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
 <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
In-Reply-To: <4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 01:32:17 +0100
Message-ID: <CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
To: James Bottomley <James.Bottomley@hansenpartnership.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_193230_496574_CD7C6423 
X-CRM114-Status: GOOD (  16.30  )
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

On Mon, Nov 23, 2020 at 9:38 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> So you think a one line patch should take one minute to produce ... I
> really don't think that's grounded in reality.

No, I have not said that. Please don't put words in my mouth (again).

I have said *authoring* lines of *this* kind takes a minute per line.
Specifically: lines fixing the fallthrough warning mechanically and
repeatedly where the compiler tells you to, and doing so full-time for
a month.

For instance, take the following one from Gustavo. Are you really
saying it takes 12 minutes (your number) to write that `break;`?

diff --git a/drivers/gpu/drm/via/via_irq.c b/drivers/gpu/drm/via/via_irq.c
index 24cc445169e2..a3e0fb5b8671 100644
--- a/drivers/gpu/drm/via/via_irq.c
+++ b/drivers/gpu/drm/via/via_irq.c
@@ -364,6 +364,7 @@ int via_wait_irq(struct drm_device *dev, void
*data, struct drm_file *file_priv)
                irqwait->request.sequence +=
                        atomic_read(&cur_irq->irq_received);
                irqwait->request.type &= ~_DRM_VBLANK_RELATIVE;
+               break;
        case VIA_IRQ_ABSOLUTE:
                break;
        default:

>  I suppose a one line
> patch only takes a minute to merge with b4 if no-one reviews or tests
> it, but that's not really desirable.

I have not said that either. I said reviewing and merging those are
noise compared to any complex patch. Testing should be done by the
author comparing codegen.

> Part of what I'm trying to measure is the "and useful" bit because
> that's not a given.

It is useful since it makes intent clear. It also catches actual bugs,
which is even more valuable.

> Well, you know, subsystems are very different in terms of the amount of
> patches a maintainer has to process per release cycle of the kernel.
> If a maintainer is close to capacity, additional patches, however
> trivial, become a problem.  If a maintainer has spare cycles, trivial
> patches may look easy.

First of all, voluntary maintainers choose their own workload.
Furthermore, we already measure capacity in the `MAINTAINERS` file:
maintainers can state they can only handle a few patches. Finally, if
someone does not have time for a trivial patch, they are very unlikely
to have any time to review big ones.

> You seem to be saying that because you find it easy to merge trivial
> patches, everyone should.

Again, I have not said anything of the sort.

Cheers,
Miguel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
