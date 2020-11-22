Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC73C5519F
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 16:51:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2D4020781
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 16:50:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fd6E80gS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="DJQ3WuSC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="DJQ3WuSC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2D4020781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+OI4aKXVfIOw4dmZ5ZOb/IznUYIUZ5pxebsig3OkRTg=; b=Fd6E80gSjzrH4ieGm67y2twAp
	JLK2aoxzKwUI4zhqUr2P5HNKTBZcJYpVnVP4W5aaUHVd/85f/HWcY2+cxzByjKcSTvX2/i3bmcLf+
	rMXBhc+3CY9L8VfmAUIMbes8WBxH1ZCLEHnnR1wETrQqqnbL47KZe/0cNoZt2lhqtyRb0dotnO/8Y
	HIC5Fsk5GY24d6Ui7QwxMnbQ0eiLoNNsoGjEo+FRIuyrV3+lohWkMpMlcVZwCQzUGlZTKgx0bVQW2
	5P9RGiBrlaSVb9XY5PAgdudcrsaE7Gba5J1kaBIjjqwQ+WiErJ6X+q+zPkVZQgLUhlDQbIfTXmom8
	oMjlRfDpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgsYh-0000si-Kz; Sun, 22 Nov 2020 16:49:51 +0000
Received: from bedivere.hansenpartnership.com ([96.44.175.130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgsYe-0000rC-03
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 16:49:49 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id AB0CF1280302;
 Sun, 22 Nov 2020 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606063784;
 bh=17TrMRtvefoo+nGHR97pCnj/lxz5M0xWRk4mlB4j/j4=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=DJQ3WuSCh5ONJkQLvrRDKWjtqFtZT1TAPnAUYm6nnSis8bRSxmxTUdD1PrB7UWicY
 RxKUvvDgawnlhMMDvZIHrNHIQxzEk4H+L7edJ9WYAgYp3e2Z+uWjpWqDuwMfVruTvK
 GP/WMd/p5KAU/iZA/nGFhNVXHTmLoWjH8aSdKt9E=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id iwIwMm9lBMHQ; Sun, 22 Nov 2020 08:49:44 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
 [IPv6:2601:600:8280:66d1::527])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id CCD1012802EA;
 Sun, 22 Nov 2020 08:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=hansenpartnership.com; s=20151216; t=1606063784;
 bh=17TrMRtvefoo+nGHR97pCnj/lxz5M0xWRk4mlB4j/j4=;
 h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
 b=DJQ3WuSCh5ONJkQLvrRDKWjtqFtZT1TAPnAUYm6nnSis8bRSxmxTUdD1PrB7UWicY
 RxKUvvDgawnlhMMDvZIHrNHIQxzEk4H+L7edJ9WYAgYp3e2Z+uWjpWqDuwMfVruTvK
 GP/WMd/p5KAU/iZA/nGFhNVXHTmLoWjH8aSdKt9E=
Message-ID: <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Tom Rix <trix@redhat.com>, Matthew Wilcox <willy@infradead.org>
Date: Sun, 22 Nov 2020 08:49:41 -0800
In-Reply-To: <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
 <20201122145635.GG4327@casper.infradead.org>
 <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_114948_173767_30918CB2 
X-CRM114-Status: GOOD (  26.50  )
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com, joe@perches.com,
 bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 2020-11-22 at 08:10 -0800, Tom Rix wrote:
> On 11/22/20 6:56 AM, Matthew Wilcox wrote:
> > On Sun, Nov 22, 2020 at 06:46:46AM -0800, Tom Rix wrote:
> > > On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> > > > On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com
> > > > wrote:
> > > > > The fixer review is
> > > > > https://reviews.llvm.org/D91789
> > > > > 
> > > > > A run over allyesconfig for x86_64 finds 62 issues, 5 are
> > > > > false positives. The false positives are caused by macros
> > > > > passed to other macros and by some macro expansions that did
> > > > > not have an extra semicolon.
> > > > > 
> > > > > This cleans up about 1,000 of the current 10,000 -Wextra-
> > > > > semi-stmt warnings in linux-next.
> > > > Are any of them not false-positives?  It's all very well to
> > > > enable stricter warnings, but if they don't fix any bugs,
> > > > they're just churn.
> > > > 
> > > While enabling additional warnings may be a side effect of this
> > > effort
> > > 
> > > the primary goal is to set up a cleaning robot. After that a
> > > refactoring robot.
> > Why do we need such a thing?  Again, it sounds like more churn.
> > It's really annoying when I'm working on something important that
> > gets derailed by pointless churn.  Churn also makes it harder to
> > backport patches to earlier kernels.
> > 
> A refactoring example on moving to treewide, consistent use of a new
> api may help.
> 
> Consider
> 
> 2efc459d06f1630001e3984854848a5647086232
> 
> sysfs: Add sysfs_emit and sysfs_emit_at to format sysfs output
> 
> A new api for printing in the sysfs.  How do we use it treewide ?
> 
> Done manually, it would be a heroic effort requiring high level
> maintainers pushing and likely only get partially done.
> 
> If a refactoring programatic fixit is done and validated on a one
> subsystem, it can run on all the subsystems.
> 
> The effort is a couple of weeks to write and validate the fixer,
> hours to run over the tree.
> 
> It won't be perfect but will be better than doing it manually.

Here's a thought: perhaps we don't.  sysfs_emit isn't a "new api" its a
minor rewrap of existing best practice.  The damage caused by the churn
of forcing its use everywhere would far outweigh any actual benefit
because pretty much every bug in this area has already been caught and
killed by existing tools.  We can enforce sysfs_emit going forwards
using tools like checkpatch but there's no benefit and a lot of harm to
be done by trying to churn the entire tree retrofitting it (both in
terms of review time wasted as well as patch series derailed).

James



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
