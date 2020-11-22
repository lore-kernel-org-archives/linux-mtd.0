Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5F3C5519F
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 22:34:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35FCF2075A
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 22:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NoSeAC3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35FCF2075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telegraphics.com.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DeAUVwkg4jxLshz5Y5CD457yoS21zax3HuoF4aHp8M0=; b=NoSeAC3zBEXOJ/Wvz1KN9wQyV
	SDDPFoh3yhFUbtHu7AjXaML2sdjEgvYzGNRRkqkNzLJJPPP/GCK23otjDsLoHr5KfKEWT6q0Zxfaj
	CZgexY3Ltb7FgoWtfVgdx2LiXdrTJTU7qxv7TNZII1BZNk9KUKaOct6vcZmH4UMiwWXGSNvFeVLiv
	3qGSyQm+Xxdpf4Zz04EtwrqmkA/uaDpVFW2rdmxKvuWS/gqFdlmgRBW7lID7B4/RkTZgXyj9fbCqc
	L9qThCoEzRgHclT8hW7JYLWiqSLB7KzlnqE3VcklWAlaJlw7y7KQAUltOX5OYcwNe4XsNHMtLLX/x
	EznyffDRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgxvs-0002gX-1A; Sun, 22 Nov 2020 22:34:08 +0000
Received: from kvm5.telegraphics.com.au ([98.124.60.144])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgxvp-0002fJ-4H
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 22:34:06 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by kvm5.telegraphics.com.au (Postfix) with ESMTP id A588721F21;
 Sun, 22 Nov 2020 17:33:55 -0500 (EST)
Date: Mon, 23 Nov 2020 09:33:55 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Joe Perches <joe@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
In-Reply-To: <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
Message-ID: <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
 <20201122145635.GG4327@casper.infradead.org>
 <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
 <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
 <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_173405_207246_8C28CC75 
X-CRM114-Status: GOOD (  15.20  )
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
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, Matthew Wilcox <willy@infradead.org>,
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-omap@vger.kernel.org, devel@acpica.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On Sun, 22 Nov 2020, Joe Perches wrote:

> On Sun, 2020-11-22 at 08:49 -0800, James Bottomley wrote:
> > We can enforce sysfs_emit going forwards
> > using tools like checkpatch
> 
> It's not really possible for checkpatch to find or warn about
> sysfs uses of sprintf. checkpatch is really just a trivial
> line-by-line parser and it has no concept of code intent.
> 

Checkpatch does suffer from the limitations of regular expressions. But 
that doesn't stop people from using it. Besides, Coccinelle can do 
analyses that can't be done with regular expressions, so it's moot.

> It just can't warn on every use of the sprintf family.
> There are just too many perfectly valid uses.
> 
> > but there's no benefit and a lot of harm to
> > be done by trying to churn the entire tree
> 
> Single uses of sprintf for sysfs is not really any problem.
> 
> But likely there are still several possible overrun sprintf/snprintf
> paths in sysfs.  Some of them are very obscure and unlikely to be
> found by a robot as the logic for sysfs buf uses can be fairly twisty.
> 

Logic errors of this kind are susceptible to fuzzing, formal methods, 
symbolic execution etc. No doubt there are other techniques that I don't 
know about.

> But provably correct conversions IMO _should_ be done and IMO churn 
> considerations should generally have less importance.
> 

Provably equivalent conversions are provably churn. So apparently you're 
advocating changes that are not provably equivalent.

These are patches for code not that's not been shown to be buggy. Code 
which, after patching, can be shown to be free of a specific kind of 
theoretical bug. Hardly "provably correct".

The problem is, the class of theoretical bugs that can be avoided in this 
way is probably limitless, as is the review cost and the risk of 
accidental regressions. And the payoff is entirely theoretical.

Moreover, the patch review workload for skilled humans is being generated 
by the automation, which is completely backwards: the machine is supposed 
to be helping.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
