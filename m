Return-Path: <SRS0=hzeh=CS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FE4C43461
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 22:48:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1399920C09
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 22:48:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g68Qh+4U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1399920C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jYFg3BGWwFbeN11g+qbdATESfxDjy59WopJNn+uplEk=; b=g68Qh+4U9aiiUhdOCwXBPCWmB
	MMqdf3n4quxsizwp/puQOYvhmZSDp3LnjYdm7psb83jO/WUAzCBO3kf1zF0Qh00PvCJlsvBC0NEV3
	ulXHiQ+nACzRutxNsOI/GBmEd5tkp7RrYXbypFlj9eO1ZZOdTZ6lA/oDKTDvOxZZv0nwTrakmVG79
	JRLDl5zf9O+ufr4OJXpuq5lt9mIUO3bf8o7DmOj8mLSC+RMPe5NzwKDEkhMfXaxDLbucO+Q2SYTpu
	VOq3ShWrMOSMJ6stZ8/BKmMKYARx6u/ULnq5BC/Rq9njtP4S7RUEUKsJWiYzKe0lNZU6Kwu5CJN6s
	0Wzx0FAmQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG8sQ-0007kp-4w; Wed, 09 Sep 2020 22:47:42 +0000
Received: from smtprelay0179.hostedemail.com ([216.40.44.179]
 helo=smtprelay.hostedemail.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG8sK-0007iy-Ai; Wed, 09 Sep 2020 22:47:37 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id A42B7181D337B;
 Wed,  9 Sep 2020 22:47:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: sort28_6003546270e1
X-Filterd-Recvd-Size: 3292
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf20.hostedemail.com (Postfix) with ESMTPA;
 Wed,  9 Sep 2020 22:47:25 +0000 (UTC)
Message-ID: <b3d6f71aea87f4bb88554f1a3fdaee0b2feb158c.camel@perches.com>
Subject: Re: [trivial PATCH] treewide: Convert switch/case fallthrough; to
 break;
From: Joe Perches <joe@perches.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Date: Wed, 09 Sep 2020 15:47:24 -0700
In-Reply-To: <20200909223602.GJ87483@ziepe.ca>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
 <20200909223602.GJ87483@ziepe.ca>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_184736_500010_D2954D5A 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
 oss-drivers@netronome.com, nouveau@lists.freedesktop.org,
 alsa-devel <alsa-devel@alsa-project.org>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-ide@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 sparclinux@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, dccp@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, linux-afs@lists.infradead.org,
 coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, Kees Cook <kees.cook@canonical.com>,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-nvme@lists.infradead.org,
 storagedev@microchip.com, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Jiri Kosina <trivial@kernel.org>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-09 at 19:36 -0300, Jason Gunthorpe wrote:
> On Wed, Sep 09, 2020 at 01:06:39PM -0700, Joe Perches wrote:
> > fallthrough to a separate case/default label break; isn't very readable.
> > 
> > Convert pseudo-keyword fallthrough; statements to a simple break; when
> > the next label is case or default and the only statement in the next
> > label block is break;
> > 
> > Found using:
> > 
> > $ grep-2.5.4 -rP --include=*.[ch] -n "fallthrough;(\s*(case\s+\w+|default)\s*:\s*){1,7}break;" *
> > 
> > Miscellanea:
> > 
> > o Move or coalesce a couple label blocks above a default: block.
> > 
> > Signed-off-by: Joe Perches <joe@perches.com>
> > ---
> > 
> > Compiled allyesconfig x86-64 only.
> > A few files for other arches were not compiled.
> 
> IB part looks OK, I prefer it like this
> 
> You could do the same for continue as well, I saw a few of those..

I saw some continue uses as well but wasn't sure
and didn't look to see if the switch/case with
continue was in a for/while loop.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
