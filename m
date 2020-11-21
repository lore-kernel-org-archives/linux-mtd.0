Return-Path: <SRS0=xNak=E3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD494C5519F
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8804920575
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2020 23:42:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DxX3PaG/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="raqllcum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8804920575
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+A9TufI9Ies+tnGz0ejCDnQ2WghM7NF0f/dspoeVP+8=; b=DxX3PaG/DU2MjeF/EPRJEN3HC
	PX2FkcaoZX7niezMw0/a+Fy/xWy6cOqU45lK7WjisZIiO1Xw6QThPtdY4Epmjsd48YTX2Ih/bIkbM
	VWpgHZP0O0xvdR9lzNi24gYh6RupSZm19iehCELM99RFkII4ySvZWamdeGh/GIcJDltBkC8jO9O5P
	7Lzvs+efAHtyr+i7Bkj2v5n/PnYCdtuvfL+wkmQMuB8yEl5LhEyyDyCbanXbLASBuFEEMu7NuflRS
	S9i6Htnr7YNJXdb2eZA3YYGLvozTiW/Vc5XUn8UYf+8ygmBwrxmAzZXKE8k4/QuSu1Qi/cJp9vCBF
	MxpA6yD0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcW0-000652-4t; Sat, 21 Nov 2020 23:42:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcVx-000646-PX
 for linux-mtd@merlin.infradead.org; Sat, 21 Nov 2020 23:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=j1pFkX66fFsn8IIQc2vdz+yDmIVMLcw8/Oh/TOVKpOw=; b=raqllcumwZvQ4hMtmOtnlaliw9
 1puuSNKm7LLvoCSp84tA0RTJb0xvwuxsguHT2Ny7FcW0js+CdIzl0RzivSVq6Xn58m5Y4q1ZWyrJG
 opVv6RGdsMGPN2QDDCpSOIPfrWgp0RAwwxJvbfdVPKONoWa1UijV9NdRj2clPczDr4vZYNjuY3AGi
 9Qkw+tJhw6VazwvrX2Fph0yFR4kr+iTY0JF15ZQRTcR4llSfbHxpM7t/iN5+q8Zub4Ska/jTg0Yrv
 i6CzjXG/nDODGngDGvQYYTIRWDqS4erl/D6t+PcWWmuYSzME4MSZNC0zD4bWPR7CG3CfGtzqA31DB
 zF+/VIvw==;
Received: from smtprelay0076.hostedemail.com ([216.40.44.76]
 helo=smtprelay.hostedemail.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgWP0-0003kA-1H
 for linux-mtd@lists.infradead.org; Sat, 21 Nov 2020 17:10:25 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id C09E2837F24A;
 Sat, 21 Nov 2020 17:10:14 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: crook72_110ffeb27355
X-Filterd-Recvd-Size: 4090
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sat, 21 Nov 2020 17:10:09 +0000 (UTC)
Message-ID: <2105f0c05e9eae8bee8e17dcc5314474b3c0bc73.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: trix@redhat.com, clang-built-linux@googlegroups.com
Date: Sat, 21 Nov 2020 09:10:08 -0800
In-Reply-To: <20201121165058.1644182-1-trix@redhat.com>
References: <20201121165058.1644182-1-trix@redhat.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_171022_620626_C228E398 
X-CRM114-Status: GOOD (  15.61  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, 2020-11-21 at 08:50 -0800, trix@redhat.com wrote:
> A difficult part of automating commits is composing the subsystem
> preamble in the commit log.  For the ongoing effort of a fixer producing
> one or two fixes a release the use of 'treewide:' does not seem appropria=
te.
> =

> It would be better if the normal prefix was used.  Unfortunately normal is
> not consistent across the tree.
> =

> So I am looking for comments for adding a new tag to the MAINTAINERS file
> =

> 	D: Commit subsystem prefix
> =

> ex/ for FPGA DFL DRIVERS
> =

> 	D: fpga: dfl:

I'm all for it.  Good luck with the effort.  It's not completely trivial.

From a decade ago:

https://lore.kernel.org/lkml/1289919077.28741.50.camel@Joe-Laptop/

(and that thread started with extra semicolon patches too)

> Continuing with cleaning up clang's -Wextra-semi-stmt

> diff --git a/Makefile b/Makefile
[]
> @@ -1567,20 +1567,21 @@ help:
> =A0	 echo  ''
> =A0	@echo  'Static analysers:'
> =A0	@echo  '  checkstack      - Generate a list of stack hogs'
> =A0	@echo  '  versioncheck    - Sanity check on version.h usage'
> =A0	@echo  '  includecheck    - Check for duplicate included header files'
> =A0	@echo  '  export_report   - List the usages of all exported symbols'
> =A0	@echo  '  headerdep       - Detect inclusion cycles in headers'
> =A0	@echo  '  coccicheck      - Check with Coccinelle'
> =A0	@echo  '  clang-analyzer  - Check with clang static analyzer'
> =A0	@echo  '  clang-tidy      - Check with clang-tidy'
> +	@echo  '  clang-tidy-fix  - Check and fix with clang-tidy'

A pity the ordering of the code below isn't the same as the above.

> -PHONY +=3D clang-tidy clang-analyzer
> +PHONY +=3D clang-tidy-fix clang-tidy clang-analyzer
[]
> -clang-tidy clang-analyzer: $(extmod-prefix)compile_commands.json
> +clang-tidy-fix clang-tidy clang-analyzer: $(extmod-prefix)compile_comman=
ds.json
> =A0	$(call cmd,clang_tools)
> =A0else
> -clang-tidy clang-analyzer:
> +clang-tidy-fix clang-tidy clang-analyzer:

[]

> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools=
/run-clang-tools.py
[]
> @@ -22,43 +22,57 @@ def parse_arguments():
[]
> =A0=A0=A0=A0=A0parser.add_argument("type",
> -                        choices=3D["clang-tidy", "clang-analyzer"],
> +                        choices=3D["clang-tidy-fix", "clang-tidy", "clan=
g-analyzer"],

etc...


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
