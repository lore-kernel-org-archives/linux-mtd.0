Return-Path: <SRS0=xNak=E3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2A6C56202
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 260A120A8B
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o5Nc87zC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rP1fIMBo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 260A120A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Nn47Y6N8UIxS7yyHx+tHs2kbPbN/u9appcIumFPf6+o=; b=o5Nc87zCvd4ipI4GXOhB9DFWE
	adr1FboBFBaL9lQ6aMqG37kdjQS6xUZx/rjeUnc1ScE0YoB0BwZQ0ovrS7EX21pfqUSur4KlQkMwY
	oKlOk2jiaNaGaREjp885i23Hb0KtN0l1uDkxhVwiWSv4AfzJ5kMjMZQEn0m4GJDQ5UVfV/qZFvJ+M
	n451O0P/vgE0mOitO/biaIA15PVJakPhqNhwoMUoAJxhLXZya7UAKwPqYoWZQPo9z6H+7k/OJizkD
	4rYcTFA5uM55Bwa0nP8Etjs2nCpn17FwIeQXZKnTY2gvCbFlp91pcG+DD0qluo9uttYAn1Vhh6zNV
	vgQSOpLxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcfQ-00086O-O4; Sat, 21 Nov 2020 23:51:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcfO-000869-LP
 for linux-mtd@merlin.infradead.org; Sat, 21 Nov 2020 23:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=5O8JFyMK46NSPgfn3GxIXhJNNeZ/UyVGbwYB8FZeTTM=; b=rP1fIMBow2/PE6o59FIML/udnn
 OOujc8TKf6/urgE+nLlq6vcSs/0dPscLy6cZuIqyKqFgEZYeUuCeu+Oxxyo5VJf3FwW9ddNQsBL2g
 COfBrlzoqIjg8nSpe8xP1085HoojZPDIT4/cQ5FQvAodFgatMpmsRljLRGzA+/TbLwxtEOY4GGo2c
 nf9l2GwCibuojHKRpOpJWmn1nvpaST+TmTpqDAYu1nYtNdv7P98otKiXxdE2YI1YxoPrLZZfa1C/r
 DYKDCnN3ZtZHnbyD5JITPDOJ4JXxaH/cqtamaHLjgkTIoIlHGWbD8k7Tzx7lEc2acajGCQPaFuFEv
 NVju0Nzw==;
Received: from smtprelay0156.hostedemail.com ([216.40.44.156]
 helo=smtprelay.hostedemail.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgXDP-0006Db-5H
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2020 18:02:30 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id AF7D7181D3025;
 Sat, 21 Nov 2020 18:02:23 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: uncle36_3402e8c27356
X-Filterd-Recvd-Size: 3937
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf04.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Nov 2020 18:02:18 +0000 (UTC)
Message-ID: <f7643c9cb0a896f3ead65e86084b7c143e21ef43.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 trix@redhat.com,  clang-built-linux@googlegroups.com
Date: Sat, 21 Nov 2020 10:02:17 -0800
In-Reply-To: <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
References: <20201121165058.1644182-1-trix@redhat.com>
 <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_180227_589884_C02F1A94 
X-CRM114-Status: GOOD (  18.91  )
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
 linux-scsi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
 tboot-devel@lists.sourceforge.net, coreteam@netfilter.org,
 xen-devel@lists.xenproject.org, MPT-FusionLinux.pdl@broadcom.com,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org,
 intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
 linux-omap@vger.kernel.org, devel@acpica.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2020-11-21 at 09:18 -0800, James Bottomley wrote:
> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> > A difficult part of automating commits is composing the subsystem
> > preamble in the commit log.  For the ongoing effort of a fixer
> > producing one or two fixes a release the use of 'treewide:' does
> > not seem appropriate.
> > 
> > It would be better if the normal prefix was used.  Unfortunately
> > normal is not consistent across the tree.
> > 
> > 	D: Commit subsystem prefix
> > 
> > ex/ for FPGA DFL DRIVERS
> > 
> > 	D: fpga: dfl:
> 
> I've got to bet this is going to cause more issues than it solves. 
> SCSI uses scsi: <driver>: for drivers but not every driver has a
> MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> things, but we're not consistent.  Block uses blk-<something>: for all
> of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> the next thing you're going to cause is an explosion of suggested
> MAINTAINERs entries.

As well as some changes require simultaneous changes across
multiple subsystems.

> Has anyone actually complained about treewide:?

It depends on what you mean by treewide:

If a treewide: patch is applied by some "higher level" maintainer,
then generally, no.

If the treewide patch is also cc'd to many individual maintainers,
then yes, many many times.

Mostly because patches cause what is in their view churn or that
changes are not specific to their subsystem grounds.

The treewide patch is sometimes dropped, sometimes broken up and
generally not completely applied.

What would be useful in many cases like this is for a pre and post
application of the treewide patch to be compiled and the object
code verified for lack of any logic change.

Unfortunately, gcc does not guarantee deterministic compilation so
this isn't feasible with at least gcc.  Does clang guarantee this?

I'm not sure it's possible:
https://blog.llvm.org/2019/11/deterministic-builds-with-clang-and-lld.html



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
