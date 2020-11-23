Return-Path: <SRS0=aMQG=E5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2CDC2D0E4
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 15:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34AD9206B6
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2020 15:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gd1ahOWC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34AD9206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=amhOgOJxXfiEeIpprqwdMmtJJox9ChMCItlDEyYymwM=; b=Gd1ahOWCWWN/KDrKVnauMVRnZ
	ofEuZiIlbymd+gXPNw9gQSg+lCQMIOojQtOgyXVSaKXRdCmBDHF8H5Pb72Zw2q4YLGRal/QNKH8nJ
	D54d3XbZKHXuo3WljdMDPdEriA5C95v+mTsayth9k1RKJgKjOsmlFRN+LSuRfWRh3t6v3C/LN2TkY
	zp24+MNkecUG5lJgdXmmnRUC5r+ob6qopSGE56EQCoOGmrmuvCygLSMG3nbsXyP1z0LpnX9mklmUM
	BrxWTHgOqiTbIM+ySz7AGllevezW/J7kP0KpHrD3V/zPluZeH+nEGh9TE5Ie7Sx3J5LZnb2dUG1U8
	NYNlYehSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khE8v-00010X-S3; Mon, 23 Nov 2020 15:52:41 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khE8t-0000zB-PN
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2020 15:52:40 +0000
IronPort-SDR: 9aNS+RoE/ReGgx6IM1FpF38ci4+JddyO4aga930CewIF6x+biPe6q0FQ96Ss1UNYYaRXw/Vctx
 hme9ONfy87+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="169224210"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="169224210"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:52:35 -0800
IronPort-SDR: o6LRPZSLFHblJ72nLIxI7QtuEJsSPQd11jVZTPC9b01xjBsR6V5ML2IOh4GsWUUm1pKbyVJ0KQ
 V9qBxJqg/0zw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="546463497"
Received: from suygunge-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.40.108])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 07:52:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>, trix@redhat.com,
 joe@perches.com, clang-built-linux@googlegroups.com
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
In-Reply-To: <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20201121165058.1644182-1-trix@redhat.com>
 <5843ef910b0e86c00d9c0143dec20f93823b016b.camel@HansenPartnership.com>
Date: Mon, 23 Nov 2020 17:52:20 +0200
Message-ID: <87y2ism5or.fsf@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_105240_004739_87B1D4E4 
X-CRM114-Status: GOOD (  14.90  )
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

On Sat, 21 Nov 2020, James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
>> A difficult part of automating commits is composing the subsystem
>> preamble in the commit log.  For the ongoing effort of a fixer
>> producing
>> one or two fixes a release the use of 'treewide:' does not seem
>> appropriate.
>> 
>> It would be better if the normal prefix was used.  Unfortunately
>> normal is
>> not consistent across the tree.
>> 
>> 
>> 	D: Commit subsystem prefix
>> 
>> ex/ for FPGA DFL DRIVERS
>> 
>> 	D: fpga: dfl:
>> 
>
> I've got to bet this is going to cause more issues than it solves.

Agreed.

> SCSI uses scsi: <driver>: for drivers but not every driver has a
> MAINTAINERS entry.  We use either scsi: or scsi: core: for mid layer
> things, but we're not consistent.  Block uses blk-<something>: for all
> of it's stuff but almost no <somtehing>s have a MAINTAINERS entry.  So
> the next thing you're going to cause is an explosion of suggested
> MAINTAINERs entries.

On the one hand, adoption of new MAINTAINERS entries has been really
slow. Look at B, C, or P, for instance. On the other hand, if this were
to get adopted, you'll potentially get conflicting prefixes for patches
touching multiple files. Then what?

I'm guessing a script looking at git log could come up with better
suggestions for prefixes via popularity contest than manually maintained
MAINTAINERS entries. It might not always get it right, but then human
outsiders aren't going to always get it right either.

Now you'll only need Someone(tm) to write the script. ;)

Something quick like this:

git log --since={1year} --pretty=format:%s -- <FILES> |\
	grep -v "^\(Merge\|Revert\)" |\
        sed 's/:[^:]*$//' |\
        sort | uniq -c | sort -rn | head -5

already gives me results that really aren't worse than some of the
prefixes invented by drive-by contributors.

> Has anyone actually complained about treewide:?

As Joe said, I'd feel silly applying patches to drivers with that
prefix. If it gets applied by someone else higher up, literally
treewide, then no complaints.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
