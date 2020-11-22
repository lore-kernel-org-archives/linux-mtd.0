Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF61CC388F9
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 03:25:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3685B20782
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 03:25:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cWw+PUNn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BCb+FFzp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3685B20782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hyqNxTXYSXpk6Sm1Pca1lY+aJo0PTZBA9N99iPU3q3M=; b=cWw+PUNnSiML6hD0l+1Eav5HQ
	tKtn4XVU1K9fZ0IDKvo6sBDxAHKpg4yYZrmbpRKrL0Xi101Aq/gF+yiRdgrT5QHO3bbiPkWWSXYrD
	q/p61b9vzq5Gw20SKw/r6iUmPjP0xj1Z3K9BhSGD21GhIbVOQLXZvk9eEq5G/cmQFfy5bMxEop9f/
	c/E0NNgQNyrP143buXQ9x2WEVShNIT17gRD1lyMrFKHZNQ72O+4vrRvpsbMiswGOlY+oQUkO8Q0+K
	6nIAujJgI8XPunBursGk4TgsKwfCfbEMUOMNydlmvoYc6TxgBgIvIsQOWEnvMvBLtawtDqXoK1ghi
	ZehN4LHhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgfyL-0008RM-5W; Sun, 22 Nov 2020 03:23:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgfyH-0008RC-5m
 for linux-mtd@merlin.infradead.org; Sun, 22 Nov 2020 03:23:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=t7P1qjxLtvKyLv5lupmc5Zc5j0L3lqaoBXMlGIL9vWk=; b=BCb+FFzpwYCsAL5/GuZs0qQqU7
 2wigu715rAloO1MXfHFDjsI/DCCkjrJ0RLz4Myz+wD98+zNWw6243kPWNzvqzMn6Tn8JVpmOuQv+x
 7EKe3xartwVOhq4ran1ZhW92oaIukRN20h1OI3pPMusUrtae1AY4TqDUCPUPtiDgxz6eQOoVcrvcz
 Ara6lCihfF7KrYMxKPcv522GOw1XE7kmR9pLBWd69WCJIf1380JdPIessAMMrwuE8sqCmQUL7YEHL
 BXN0W+EBw/mKx6JrVL7roopk6K2PnHDj+T1EiV35semdke1klNMJQXZf1Gvzraa/TLsC310jvDxAq
 zJ5cWKdw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kgfxw-0001fc-2G; Sun, 22 Nov 2020 03:23:04 +0000
Date: Sun, 22 Nov 2020 03:23:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: trix@redhat.com
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
Message-ID: <20201122032304.GE4327@casper.infradead.org>
References: <20201121165058.1644182-1-trix@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201121165058.1644182-1-trix@redhat.com>
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

On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
> The fixer review is
> https://reviews.llvm.org/D91789
> 
> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
> The false positives are caused by macros passed to other macros and by
> some macro expansions that did not have an extra semicolon.
> 
> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
> warnings in linux-next.

Are any of them not false-positives?  It's all very well to enable
stricter warnings, but if they don't fix any bugs, they're just churn.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
